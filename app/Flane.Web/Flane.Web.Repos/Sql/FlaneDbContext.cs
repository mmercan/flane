using Flane.Web.Model.Product;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;


namespace Flane.Web.Repos.Sql
{
    public class FlaneDbContext : DbContext
    {

        ILogger<FlaneDbContext> logger;
        public DbSet<ProductInfo> ProductSet { get; set; }

        public FlaneDbContext(DbContextOptions options, ILogger<FlaneDbContext> logger) : base(options)
        {
            this.logger = logger;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // optionsBuilder.UseLoggerFactory()
            //  optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=MyDatabase;Trusted_Connection=True;");
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<ProductInfo>(e =>
            {
                e.HasKey(en => en.Id);//.HasIndex(en => en.Id);
                e.Property(p => p.Id).ValueGeneratedOnAdd();
            });//.HasIndex(e=>e.Id).IsUnique();
            base.OnModelCreating(builder);



        }
    }
}

