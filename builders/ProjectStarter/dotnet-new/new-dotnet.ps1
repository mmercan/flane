Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip($zipfile, $outdir) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($zipfile)
    foreach ($entry in $archive.Entries) {
        $entryTargetFilePath = [System.IO.Path]::Combine($outdir, $entry.FullName)
        $entryDir = [System.IO.Path]::GetDirectoryName($entryTargetFilePath)
        
        #Ensure the directory of the archive entry exists
        if (!(Test-Path $entryDir )) {
            New-Item -ItemType Directory -Path $entryDir | Out-Null 
        }
        #If the entry is not a directory entry, then extract entry
        if (!$entryTargetFilePath.EndsWith("/")) {
            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $entryTargetFilePath, $true);
        }
    }
}


$folder = "AWWeb.Web.Sts"
$scriptpath = $MyInvocation.MyCommand.Path 
$dir = Split-Path $scriptpath

$appFolder = Join-Path -Path $dir -ChildPath ..\..\prototypes\identity\$folder
$appRootFolder = Join-Path -Path $dir -ChildPath ..\..\prototypes\identity
$appFolder

function new-dotnet {
    dotnet new mvc --auth  Individual --output $folder
    Set-Location -Path $appFolder

    $fileName = "./Properties/launchSettings.json"
    $launchSettings = Get-Content $fileName  -raw
    $launchSettings = $launchSettings.replace('"applicationUrl": "https://localhost:5001;http://localhost:5000"', '"applicationUrl": "http://localhost:5000"')
    $launchSettings | set-content  $fileName

}


function Add-PushNotificationController {
    $PushNotificationController = @' 
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using __projectname__.Models;
using WebPush;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace __projectname__.Controllers
{
    [Route("api/[controller]")]
    public class PushNotificationController : Controller
    {
        private readonly IConfiguration _config;
        private readonly ILogger<PushNotificationController> _logger;

        public PushNotificationController(IConfiguration configuration, ILogger<PushNotificationController> logger)
        {
            _config = configuration;
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            //TODO: Implement Realistic Implementation
            // return Content("Blahhh");
            // return Ok("Blah");
            
            return Content("Blah");
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = "azure")]
        public IActionResult Post([FromBody] PushNotificationModel model, [FromHeader]string Email)
        {
            _logger.LogDebug("Post Called");
            var iden = this.User.Identity;
            var email = this.User.Claims.FirstOrDefault(p => p.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier")?.Value;
            //TODO: Implement Realistic Implementation
            model.Email = Email;
            var payload = JsonConvert.SerializeObject(
              new
              {
                  Email = Email,
                  Message = "Welcome",
                  Link = "null"
              }
            );
            Debug.WriteLine(payload);

            NofityUser(model.Endpoint, model.Keys.P256dh, model.Keys.Auth, payload);
            return Created("", null);
        }


        private void NofityUser(string endpoint, string p256dh, string auth, string payload)
        {
            var vapidDetails = new VapidDetails(@"mailto:mmercan@outlook.com"
                , "BCbYNxjxYPOcv3Hn8xZH1bB2kJLFLeO9Fx68U0C2FOZ7wFmG_yxGdiiNIWrFRHY6X1NL6egRgzZGAC_A_6fcigA"
                , "r2HJzuoJiFD0uMDoQcKMQCGo8M80wag8kCoTMFf3S34"
              );
            var client = new WebPushClient();
            var subs = new PushSubscription(endpoint, p256dh, auth);

            var task = client.SendNotificationAsync(subs, payload, vapidDetails);
            task.Wait();
            var status = task.Status;
        }

        [HttpPost("Users")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "user")]
        public IActionResult JustforUsers([FromBody] PushNotificationModel model, [FromHeader]string Email)
        {
            return Content("Ok");
        }
    }
}
'@

    $PushNotificationController = $PushNotificationController.replace("__projectname__", $folder)
    $PushNotificationController | set-content  ".\Controllers\PushNotificationController.cs"

    $PushNotificationModel = @'
using System;

namespace __projectname__.Controllers
{
    public class PushNotificationModel
    {
        public string Email { get; set; }
        public string Endpoint { get; set; }
        public string ExpirationTime { get; set; }
        public KeyReference Keys { get; set; }
    }

    public class KeyReference
    {
        public string P256dh { get; set; }
        public string Auth { get; set; }

    }
}

'@
    $PushNotificationModel = $PushNotificationModel.replace("__projectname__", $folder)
    $PushNotificationModel | set-content  ".\Models\PushNotificationModel.cs"
}

function Add-TokenController {

    $TokenController = @' 
    using __projectname__.Models;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Identity;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.Logging;
    using Microsoft.IdentityModel.Tokens;
    using System;
    using System.Collections.Generic;
    using System.IdentityModel.Tokens.Jwt;
    using System.Linq;
    using System.Security.Claims;
    using System.Text;
    using System.Threading.Tasks;
    using Newtonsoft.Json;
    using Microsoft.AspNetCore.Authentication.JwtBearer;

    namespace __projectname__.Controllers
    {
        [Route("api/[controller]")]
    public class TokenController : Controller
    {
        private readonly IConfiguration _config;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly ILogger<TokenController> _logger;
        private readonly RoleManager<IdentityRole> _roleManager;
        public TokenController(IConfiguration configuration, UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager,
            ILogger<TokenController> logger,
           RoleManager<IdentityRole> roleManager
        )
        {
            _config = configuration;
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _roleManager = roleManager;
        }

        [HttpPost("")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] AuthRequest authUserRequest)
        {
            var user = await _userManager.FindByEmailAsync(authUserRequest.UserName);
            if (user != null)
            {
                var checkPwd = await _signInManager.CheckPasswordSignInAsync(user, authUserRequest.Password, false);
                var roles = await _userManager.GetRolesAsync(user);
                var roleString = JsonConvert.SerializeObject(roles);
                if (checkPwd.Succeeded)
                {
                    var claims = new List<Claim>
                        {
                            new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
                            new Claim(JwtRegisteredClaimNames.Jti, user.Id.ToString()),
                            new Claim(JwtRegisteredClaimNames.Email, user.UserName),
                            new Claim(ClaimTypes.Name,  user.UserName),
                        };

                    //var userClaims = await _userManager.GetClaimsAsync(user);
                    //claims.AddRange(userClaims);
                    var userRoles = await _userManager.GetRolesAsync(user);

                    foreach (var userRole in userRoles)
                    {
                        claims.Add(new Claim(ClaimTypes.Role, userRole));
                        var role = await _roleManager.FindByNameAsync(userRole);
                        if (role != null)
                        {
                            var roleClaims = await _roleManager.GetClaimsAsync(role);
                            foreach (Claim roleClaim in roleClaims)
                            {
                                claims.Add(roleClaim);
                            }
                        }
                    }
                    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Tokens:Key"]));
                    var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                    var token = new JwtSecurityToken(_config["Tokens:Issuer"],
                    _config["Tokens:Issuer"],
                    claims,
                    expires: DateTime.Now.AddMinutes(240),
                    signingCredentials: creds);
                    var expires = DateTime.Now.AddMinutes(240);


                    return Ok(new { token = new JwtSecurityTokenHandler().WriteToken(token), expires = expires, expiresMinutes = 240 });
                }
            }

            return BadRequest("Could not create token");
        }


        [Authorize]
        [HttpGet("claims")]
        public object Claims()
        {
            return User.Claims.Select(c =>
            new
            {
                Type = c.Type,
                Value = c.Value
            });
        }



        //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [Authorize(AuthenticationSchemes = "local")]
        [HttpGet("claimsjwt")]
        public object ClaimsJwt()
        {
            return User.Claims.Select(c =>
            new
            {
                Type = c.Type,
                Value = c.Value
            });
        }

        [Authorize(AuthenticationSchemes = "azure")]
        [HttpGet("claimsazure")]
        public object ClaimsAzure()
        {
            return User.Claims.Select(c =>
            new
            {
                Type = c.Type,
                Value = c.Value
            });
        }


        [Authorize(AuthenticationSchemes = "local")]
        [HttpPost("validateuser")]
        public async Task<object> Validate([FromBody]ValidateTokenRequest tokenRequest)
        {
            _logger.LogInformation("Email addess : " + tokenRequest.UserName);
            var user = await _userManager.FindByEmailAsync(tokenRequest.UserName);
            bool exists = user != null;
            if (!exists) return BadRequest("The user was not found.");
            string tokenUsername = ValidateToken(tokenRequest.Token);

            if (tokenRequest.UserName.Equals(tokenUsername))
                return Ok();
            return BadRequest();
        }

        [HttpGet()]
        public ClaimsPrincipal GetPrincipal(string token)
        {
            try
            {
                JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
                JwtSecurityToken jwtToken = (JwtSecurityToken)tokenHandler.ReadToken(token);
                if (jwtToken == null)
                    return null;
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Tokens:Key"]));
                TokenValidationParameters parameters = new TokenValidationParameters()
                {
                    RequireExpirationTime = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = key
                };
                SecurityToken securityToken;
                ClaimsPrincipal principal = tokenHandler.ValidateToken(token,
                      parameters, out securityToken);

                _logger.LogDebug("GetPrincipal Returned : " + principal.Identity.Name);
                return principal;
            }
            catch (Exception e)
            {
                _logger.LogError("Exception : " + e.Message);
                return null;
            }
        }


        private string ValidateToken(string token)
        {
            string username = null;
            ClaimsPrincipal principal = GetPrincipal(token);
            if (principal == null)
                return null;
            ClaimsIdentity identity = null;
            try
            {
                identity = (ClaimsIdentity)principal.Identity;
            }
            catch (NullReferenceException)
            {
                return null;
            }
            Claim usernameClaim = identity.FindFirst(ClaimTypes.Name);
            username = usernameClaim.Value;
            _logger.LogDebug("ValidateToken Returned : " + username);
            return username;
        }
    }
}
'@
    $TokenController = $TokenController.replace("__projectname__", $folder)
    $TokenController | set-content  ".\Controllers\TokenController.cs"


    $RequestResult = @'
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;

    namespace __projectname__.Models
    {
    public class RequestResult
    {
        public RequestState State { get; set; }
        public string Msg { get; set; }
        public Object Data { get; set; }
    }

    public enum RequestState
    {
        Failed = -1,
        NotAuth = 0,
        Success = 1
    }

    public class AuthRequest
    {
        public string UserName { get; set; }
        public string Password { get; set; }
    }

    public class ValidateTokenRequest
    {
        public string UserName { get; set; }
        public string Token { get; set; }
    }
    }
'@
    $RequestResult = $RequestResult.replace("__projectname__", $folder)
    $RequestResult | set-content  ".\Models\RequestResult.cs"


    $jobj = Get-Content '.\appsettings.json' -raw | ConvertFrom-Json

    $tokens = @"
    {
   "Key": "Rather_very_long_key",
   "Issuer": "Rather_very_long_key"
}
"@

    $AzureAd = @"
{
    "Instance": "https://login.microsoftonline.com/",
    "Domain": "mrtmrcn.onmicrosoft.com",
    "TenantId": "e1870496-eab8-42d0-8eb9-75fa94cfc3b8",
    "ClientId": "67d009b1-97fe-4963-84ff-3590b06df0da",
    "CallbackPath": "/signin-oidc"
  }

"@

    $jobj| add-member -Name "Tokens" -value (Convertfrom-Json $tokens) -MemberType NoteProperty
    $jobj| add-member -Name "AzureAd" -value (Convertfrom-Json $AzureAd) -MemberType NoteProperty
    $json = $jobj| ConvertTo-Json -Depth 5
    $json | set-content  '.\appsettings.json'
}

function Add-corsswagger-startupcs {

    $fileName = "$appFolder\Startup.cs"
    $startupobj = (Get-Content $fileName) | 
        Foreach-Object {
        $_ # send the current line to output
        if ($_ -match ".AddEntityFrameworkStores<ApplicationDbContext>()") {
            #Add Lines after the selected pattern 

            '         //  services.AddIdentity<IdentityUser, IdentityRole>()'
            '            .AddRoles<IdentityRole>()'
            '            .AddEntityFrameworkStores<ApplicationDbContext>()'
            '            .AddDefaultTokenProviders();'
            '            services.AddAuthentication(sharedOptions =>'
            '            {'
            '                sharedOptions.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;'
            '                sharedOptions.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;'
            '            })'
            '         //   .AddJwtBearer("local",cfg =>'
            '         //   {'
            '         //   cfg.RequireHttpsMetadata = false;'
            '         //   cfg.SaveToken = true;'
            '         //       cfg.TokenValidationParameters = new TokenValidationParameters()'
            '         //       {'
            '         //           ValidIssuer = Configuration["Tokens:Issuer"],'
            '         //           ValidAudience = Configuration["Tokens:Issuer"],'
            '         //           IssuerSigningKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(Configuration["Tokens:Key"])),'
            '         //           RoleClaimType = ClaimTypes.Role'
            '         //       };'
            '         //   })'
            '            .AddJwtBearer("azure",cfg =>'
            '            {'
            '                cfg.RequireHttpsMetadata = false;'
            '                cfg.SaveToken = true;'
            '                cfg.Authority = Configuration["AzureAd:Instance"] + "/" + Configuration["AzureAD:TenantId"];'
            '                cfg.Audience = Configuration["AzureAd:ClientId"];'
            '            });'
            ''
            '            //use both jwt schemas interchangeably  https://stackoverflow.com/questions/49694383/use-multiple-jwt-bearer-authentication'
            '            //    services.AddAuthorization(options =>{'
            '            //options.DefaultPolicy = new AuthorizationPolicyBuilder()'
            '            //    .RequireAuthenticatedUser()'
            '            //    .AddAuthenticationSchemes("azure", "Custom")'
            '            //    .Build();'
            '            //});'
            ''
            '            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>'
            '            {'
            '                builder.AllowAnyOrigin()'
            '                       .AllowAnyMethod()'
            '                       .AllowAnyHeader()'
            '                       .SetIsOriginAllowedToAllowWildcardSubdomains()'
            '                       .AllowCredentials();'
            '            }));'
            ''
            '            services.AddSwaggerGen(c =>'
            '            {'
            '              c.SwaggerDoc("v1", new Info { Title = "My API", Version = "v1" });'
            '            });'
        }

        if ($_ -match "using System;") {
            'using Swashbuckle.AspNetCore.Swagger;'
            'using Microsoft.IdentityModel.Tokens;'
            'using System.Security.Claims;'
            'using System.Reflection;'
            'using Microsoft.AspNetCore.Authentication.JwtBearer;'

        }
        if ($_ -match "UseStaticFiles") {
            '            // move  UseDefaultFiles to first line'       
            '            // app.UseFileServer();'
            '            app.UseDefaultFiles();'
            '            app.UseSwagger();'
            '            app.UseSwaggerUI(c =>'
            '            {'
            '              c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");'
            '            });'
            '             app.UseCors("MyPolicy");'
        }

    } 
    $startupobj = $startupobj.replace(".AddEntityFrameworkStores<ApplicationDbContext>();", "// .AddEntityFrameworkStores<ApplicationDbContext>();")
    $startupobj | set-content  $fileName
    
}

function Add-SignalR {
    dotnet add package Microsoft.AspNetCore.SignalR -v 1.0.0

    $charcs = @'
    using System;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Authentication.JwtBearer;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Builder;
    using System.Linq;
    using Microsoft.AspNetCore.SignalR;

    namespace __projectname__.Hubs
    {
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public class ChatHub : Hub
        {
            public Task Send(string message)
            {
                var user = Context.User;
                return Clients.All.SendAsync("Send", message);
            }

            public override async Task OnConnectedAsync()
            {
            // await Clients.Client(Context.ConnectionId).InvokeAsync("SetUsersOnline", await GetUsersOnline());
            // var iden = this.Context.User.Identity;
            await base.OnConnectedAsync();
            }
            public override Task OnDisconnectedAsync(Exception exception)
            {
            return base.OnDisconnectedAsync(exception);
            }
        }
        
        public static class extesions
        {        
            public static void UseSignalRJwtAuthentication(this IApplicationBuilder app)
            {
                app.Use(async (context, next) =>
                {
                    if (string.IsNullOrWhiteSpace(context.Request.Headers["Authorization"]))
                    {
                        if (context.Request.QueryString.HasValue)
                        {
                            var token = context.Request.QueryString.Value.Split('&').SingleOrDefault(x => x.Contains("authorization"))?.Split('=')[1];
                            if (!string.IsNullOrWhiteSpace(token))
                            {
                                context.Request.Headers.Add("Authorization", new[] { $"Bearer {token}" });
                            }
                        }
                    }
                    await next.Invoke();
                });
            }
        }
    }
'@
    $charcs = $charcs.replace("__projectname__", $folder)
    md Hubs
    $charcs | set-content  ".\Hubs\ChatHub.cs"
    $fileName = "$appFolder\Startup.cs"
    (Get-Content $fileName) | 
        Foreach-Object {
        $_ # send the current line to output
        if ($_ -match "AddMvc") {
            '           services.AddSignalR();'
        }
        if ($_ -match "using System;") {
            'using ' + $folder + '.Hubs;'
        }
        if ($_ -match "UseAuthentication") {
            '            app.UseSignalR(routes =>'
            '            {'
            '                routes.MapHub<ChatHub>("/hub/chat");'
            '            });'
        }
        if ($_ -match "UseStaticFiles") {
            '            app.UseSignalRJwtAuthentication();'
        }
    } | Set-Content $fileName
}


function Remove-project {
    Remove-Item -Path "$appFolder\*" -Recurse
    Set-Location -Path $dir
}

Set-Location -Path $appRootFolder
new-dotnet



dotnet add package "WebPush-netcore"
dotnet add package "Microsoft.AspNetCore.Identity" -v 2.1.0
dotnet add package "Microsoft.AspNetCore.Identity.UI" -v 2.1.0
dotnet add package "Microsoft.AspNetCore.Identity.EntityFrameworkCore" -v 2.1.0
dotnet add package "Swashbuckle.AspNetCore"
Add-PushNotificationController
Add-TokenController
Add-SignalR
dotnet restore
dotnet build
Add-corsswagger-startupcs


# dotnet add package IdentityServer4
# dotnet add package IdentityModel