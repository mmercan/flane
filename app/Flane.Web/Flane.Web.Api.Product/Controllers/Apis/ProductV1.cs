using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
// using Flane.Web.Model.Product;
using Flane.Web.Repos.Sql;
using Flane.Web.Repositories;
using Flane.Web.Api.Product.Models.V1;
using AutoMapper;
using Flane.Web.Model.Product;

namespace Flane.Web.Api.Product.Controllers
{
    [ApiVersion("1.0", Deprecated = true)]
    [Route("api/Product")]
    //[Route("api/v{version:apiVersion}/Product")]
    [ApiController]
    // [Authorize]
    public class ProductV1Controller : ControllerBase
    {

        ILogger<ProductV1Controller> logger;
        private readonly IMapper mapper;
        private ProductRepo productRepo;

        public ProductV1Controller(ILogger<ProductV1Controller> logger, ProductRepo productRepo, IMapper mapper)
        {
            this.logger = logger;
            this.productRepo = productRepo;
            this.mapper = mapper;
        }

        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                var repos = productRepo.GetAll().Select(mapper.Map<ProductInfo,ProductInfoDtoV1>);
                //var result = mapper.Map<List<ProductInfoDtoV1>>(repos);
                return Ok(repos);
            }
            catch (Exception ex)
            {
                logger.LogError("Failed to execute GET" + ex.Message);
                return BadRequest();
            }
        }

        [HttpPost]
        public IActionResult Post([FromBody] ProductInfoDtoV1 model)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest("Invalid format");
            }

            try
            {
                var result = mapper.Map<ProductInfo>(model);
                productRepo.Add(result);
                productRepo.SaveChanges();
                return Created("", null);
            }
            catch (Exception)
            {
                logger.LogError("Failed to execute POST");
                return BadRequest();
            }
        }

        [HttpPut]
        public IActionResult Put([FromBody] ProductInfoDtoV1 model)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest("Invalid format");
            }

            try
            {
               
                var result = mapper.Map<ProductInfo>(model);
                productRepo.Update(result);
                productRepo.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {
                logger.LogError("Failed to execute PUT");
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
                logger.LogError("Failed to execute DELETE");
                return BadRequest();
            }
        }

    }
}


