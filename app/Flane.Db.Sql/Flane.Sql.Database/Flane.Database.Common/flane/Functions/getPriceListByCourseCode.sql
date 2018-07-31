



CREATE FUNCTION [flane].[getPriceListByCourseCode]
(	
	@Code NVARCHAR(50) = ''
)
RETURNS TABLE 
AS
RETURN 
(
	--SELECT PP.Amount, PL.CurrenyName AS CurrenyName, PP.PriceListName,PL.Description, PP.UnitName FROM Product AS PR 
	--INNER JOIN ProductPriceLevel AS PP ON PR.ProductID = PP.ProductID 
	--INNER JOIN PriceList AS PL ON PP.PriceListID = PL.PriceListID WHERE(PR.ProductNumber = @Code) AND PP.Amount IS NOT NULL



	SELECT Prices.Price as Amount, Cur.Name as CurrenyName, PL.NAme as PriceListName,PL.Description, unit.Name as UnitName 
	from crm.Prices as Prices 
	INNER JOIN crm.Products AS PR ON PR.ID = Prices.ProductID 
	INNER JOIN crm.PriceLists AS PL ON prices.PriceListID = PL.ID 
	INNER JOIN crm.Currencies as Cur on Prices.CurrencyID =Cur.ID
	left JOIN crm.Units as unit on Prices.UnitID =unit.ID
	WHERE(PR.code = @Code) AND Prices.Price IS NOT NULL
)