using System;

namespace Flane.Web.Model.Sales
{
    public class PriceInfo
    {
        public int Id { get; set; }
        public int PriceListId { get; set; }
        public int ProductId { get; set; }
        public int UnitId { get; set; }
        public int CurrencyId { get; set; }
        public int ExchangeRate { get; set; }
        public double Price { get; set; }
        public double PriceBase { get; set; }
    }
}