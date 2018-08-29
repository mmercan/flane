using System;

namespace Flane.Web.Api.Product.Models.V1
{
    public class ProductInfoDtoV1
    {
        public int Id { get; set; }
        public string ProductCode { get; set; }
        public string Name { get; set; }
        public string ProductUrl { get; set; }
        public bool Active { get; set; }
        public string Html { get; set; }
        public string Duration { get; set; }
        public string DurationType { get; set; }

        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }

        public int TechnologyId { get; set; }
        public string TechnologyName { get; set; }
        public string TechnologyUrl { get; set; }

        public int VendorId { get; set; }
        public int VendorName { get; set; }
        public string VendorUrl { get; set; }

    }
}