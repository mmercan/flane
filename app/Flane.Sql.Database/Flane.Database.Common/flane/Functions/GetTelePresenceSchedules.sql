

CREATE FUNCTION [flane].[GetTelePresenceSchedules]
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT        sch.ID as ServiceActivityID,sch.CityID as SiteID, sch.ProductID, sch.Name as subject, sch.StartDate as ActualStart, 
                         sch.EndDate as ActualEnd, sch.year AS Year, sch.Month AS Month, pro.VendorID,Vendors.Name as VendorName, 
                         cat.ID as TechnologyID,cat.Name as TechnologyName, pro.code as ProductNumber, pro.Name,'' as Url,Vendors.Name as VendorUrl, cat.Name as TechnologyUrl, 
                         '' as ProductUrl, Cities.Title as City,coun.Title as Country,sch.Type as DeliveryStatus,sch.status as ScheduleStatus
FROM            crm.Schedules as sch 

INNER JOIN crm.Products as pro ON sch.ProductID = pro.ID 
INNER JOIN crm.Cities ON sch.CityID = Cities.ID
INNER JOIN crm.Vendors ON sch.VendorID = Vendors.ID
INNER JOIN crm.Categories AS cat ON pro.CategoryID = cat.ID
inner join crm.Countries as coun ON sch.CountryID= coun.ID
WHERE        (sch.StartDate >= GETDATE()) AND (sch.Type = 102880001) and (sch.publish != '102880000' or sch.publish is null)

)