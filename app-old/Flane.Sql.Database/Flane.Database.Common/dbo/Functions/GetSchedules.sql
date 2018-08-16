
CREATE FUNCTION [dbo].[GetSchedules]
(	

)
RETURNS TABLE 
AS
RETURN 
(
--SELECT        PR.VendorName, PR.TechnologyName, PR.ProductNumber, PR.Name, SA.Subject, SA.ActualStart, SA.ActualEnd, SA.SiteName, Site.City, Site.Country, 
--                         YEAR(SA.ActualStart) AS Year, MONTH(SA.ActualStart) AS Month, DAY(SA.ActualStart) AS Day, PR.Url
--FROM            Site INNER JOIN
--                         ServiceActivity AS SA ON Site.SiteID = SA.SiteID RIGHT OUTER JOIN
--                         Product AS PR ON SA.ProductID = PR.ProductID
--WHERE        (SA.ActualEnd <= DATEADD(month, 6, GETDATE())) AND (SA.ActualStart >= GETDATE())
----ORDER BY SA.ActualStart, SA.ActualEnd, PR.VendorName, PR.TechnologyName, PR.ProductNumber

SELECT        VEN.Name as VendorName, CAT.Name as TechnologyName, PR.Code as ProductNumber, PR.Name, SCH.Name as Subject, SCH.StartDate as ActualStart, SCH.EndDate as ActualEnd, CTY.Name as SiteName, CTY.Title as City, COU.Title as Country, 
                         YEAR(SCH.StartDate) AS Year, MONTH(SCH.StartDate) AS Month, DAY(SCH.StartDate) AS Day, '' as Url
FROM          crm.Schedules as SCH 
              inner join crm.Cities as CTY ON CTY.ID = SCH.CityID 
			  RIGHT OUTER JOIN crm.Products AS PR ON SCH.ProductID = PR.ID
			  inner join crm.Categories as CAT ON PR.CategoryID = CAT.ID
			  inner join crm.vendors as VEN ON PR.VendorID = VEN.ID
			  inner join crm.Countries as COU ON SCH.CountryID = COU.ID
WHERE        (SCH.EndDate <= DATEADD(month, 6, GETDATE())) AND (SCH.StartDate >= GETDATE()) and (SCH.publish != '102880000' or SCH.publish is null)

)