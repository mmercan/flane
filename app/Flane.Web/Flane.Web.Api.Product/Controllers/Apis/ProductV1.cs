using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Flane.Web.Model.Product;
using Flane.Web.Repos.Sql;
using Flane.Web.Repositories;

namespace Flane.Web.Api.Product.Controllers
{
    [ApiVersion("1.0", Deprecated = true)]
    [Route("api/Product")]
    //[Route("api/v{version:apiVersion}/Product")]
    [ApiController]
    // [Authorize]
    public class ProductV1Controller : ControllerBase
    {

        ILogger<ProductV1Controller> _logger;
        private ProductRepo productRepo;

        public ProductV1Controller(ILogger<ProductV1Controller> logger, ProductRepo productRepo)
        {
            _logger = logger;
            this.productRepo = productRepo;
        }

        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                return Ok(productRepo.GetAll());
            }
            catch (Exception ex)
            {
                _logger.LogError("Failed to execute GET" + ex.Message);
                return BadRequest();
            }
        }

        [HttpPost]
        public IActionResult Post([FromBody] ProductInfo model)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest("Invalid format");
            }

            try
            {
                productRepo.Add(model);
                productRepo.SaveChanges();
                return Created("", null);
            }
            catch (Exception)
            {
                _logger.LogError("Failed to execute POST");
                return BadRequest();
            }
        }

        [HttpPut]
        public IActionResult Put([FromBody] ProductInfo model)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest("Invalid format");
            }

            try
            {
                productRepo.Update(model);
                productRepo.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {
                _logger.LogError("Failed to execute PUT");
                return BadRequest();
            }
        }

        [HttpDelete]
        public IActionResult Delete(int id)
        {
            try
            {
                return Ok();
            }
            catch (Exception)
            {
                _logger.LogError("Failed to execute DELETE");
                return BadRequest();
            }
        }

    }
}


