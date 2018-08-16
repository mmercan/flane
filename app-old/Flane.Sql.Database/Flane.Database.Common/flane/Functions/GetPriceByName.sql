
CREATE FUNCTION flane.[GetPriceByName]
(	
@p0 uniqueidentifier,
@p1 nvarchar(50)
)
RETURNS TABLE 
AS
RETURN 
(SELECT     PL.Name, PP.Amount, PP.UnitName, PL.CurrenyName, PP.ProductPriceLevelID, PL.PriceListID, PP.ProductID, PP.AmountBase
FROM         ProductPriceLevel AS PP INNER JOIN
                      PriceList AS PL ON PP.PriceListID = PL.PriceListID
WHERE     (PL.Name = @p1) AND (PP.ProductID = @p0)
)