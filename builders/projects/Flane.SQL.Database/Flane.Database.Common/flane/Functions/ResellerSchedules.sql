-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [flane].[ResellerSchedules]
(	
	-- Add the parameters for the function here
	@ResellerCompanyId int 
)
RETURNS TABLE 
AS
RETURN 
(
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Product.[VendorID]
	  ,vendor.Name as VendorName
      ,Product.[CategoryID]
	  ,Cat.Name as [CategoryName]
      ,Product.[TechnologyID]
	  ,Tech.Name as TechnologyName
      ,Product.[ChildTechnologyID]
      ,Product.[Code]
      ,Product.[Version]
      ,Product.[Name]
      ,Product.[Unit]
      ,Product.[Published]
      ,Product.[OrderBy]
	  ,defaultResellerPrice.Price as [DefaultResellerPrice]
	  ,defaultResellerPrice.Price as [FinalPrice]
	  ,Schedules.name as [ScheduledTrainings]
	  ,Schedules.[StartDate]
	  ,Schedules.[EndDate]
	  ,Schedules.[CityID]
	  ,Schedules.[CountryID]
	  ,city.[Title] as CityName

  FROM [crm].[Products] as Product
  inner join [crm].[Vendors] as vendor on vendor.ID = Product.VendorID
  left join [crm].[Categories] as Cat on Cat.ID = Product.[CategoryID]
  left join [crm].[Technologies] as Tech on Tech.ID = product.TechnologyID
  
  inner join [crm].Prices as defaultResellerPrice on defaultResellerPrice.ProductID=product.ID and PriceListID='6544CAB3-19B6-E311-80C6-02BF0A6464DD' 
  inner join [crm].[Schedules] as Schedules on Schedules.productID = product.ID and Schedules.StartDate >= getdate()
  left join [crm].[Cities] as city on [Schedules].[CityID] = city.ID
  )