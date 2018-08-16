    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;

    namespace Flane.Web.Api.Product.Controllers
    {
        [ApiVersion("1.0", Deprecated = true)]
        [Route("api/Product")]
        //[Route("api/v{version:apiVersion}/Product")]
        [ApiController]
        public class ProductV1Controller : ControllerBase
        {
            [HttpGet]
            [Authorize]
            public string Get() => "Hello world v1!";
        }
    }
