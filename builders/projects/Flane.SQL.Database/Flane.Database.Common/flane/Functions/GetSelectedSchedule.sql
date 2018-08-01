



CREATE FUNCTION [flane].[GetSelectedSchedule]
(
@Code NVARCHAR(50) = '',
@Site NVARCHAR(50) = '',
@Date DATETIME
)
RETURNS TABLE
AS

--RETURN SELECT        SA.ActualStart, SA.ActualEnd, SA.Subject, PR.ProductNumber, PR.Name, SA.SiteName, ST.Country, ST.City, ST.Email, ST.State, SA.ServiceActivityID, 
--                         PR.ProductID, ST.SiteID
--FROM            ServiceActivity AS SA INNER JOIN
--                         Product AS PR ON SA.ProductID = PR.ProductID INNER JOIN
--                         Site AS ST ON SA.SiteID = ST.SiteID
--WHERE        (PR.ProductNumber = @Code) AND (DATEPART(YY,SA.ActualStart) = DATEPART(YY,@Date)) AND (DATEPART(MM,SA.ActualStart) = DATEPART(MM,@Date)) AND (DATEPART(DD,SA.ActualStart) = DATEPART(DD,@Date)) AND (SA.SiteName = @Site)



RETURN SELECT        SA.StartDate as ActualStart, SA.EndDate as ActualEnd, SA.NAme as Subject, PR.code as ProductNumber, PR.Name, ST.Title as SiteName, CNTRY.Title as Country, ST.Title as City,'info@flane.com.au' as Email, States.Title as State, SA.ID as ServiceActivityID, 
                         PR.ID as ProductID, ST.ID as SiteID, vendor.Name as VendorName, cat.Name as CategoryName
FROM crm.Schedules AS SA 
INNER JOIN crm.Products AS PR ON SA.ProductID = PR.ID 
INNER JOIN crm.Cities AS ST ON SA.CityID = ST.ID
left join  crm.Countries as CNTRY ON SA.CountryID=CNTRY.ID
left join crm.States as States ON sa.StateID= States.ID
left join crm.[Vendors] as vendor ON PR.[VendorID]=vendor.ID
left join [crm].[Categories] as cat on PR.CategoryID = cat.ID
WHERE        (PR.code = @Code) AND (DATEPART(YY,SA.StartDate) = DATEPART(YY,@Date)) AND (DATEPART(MM,SA.StartDate) = DATEPART(MM,@Date)) AND (DATEPART(DD,SA.StartDate) = DATEPART(DD,@Date)) AND (ST.Name = @Site)