using System;
using Mercan.Common.Repos;
using Flane.Web.Model.Product;
using Flane.Web.Repos.Sql;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Flane.Web.Repositories
{
    public class ProductRepo : EFRepository<ProductInfo>
    {

        public ProductRepo(FlaneDbContext db, ILogger logger = null) : base(db, p => p.Id, logger)
        {

        }
    }
}
