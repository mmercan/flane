



create FUNCTION [flane].[GetSchedulesByCourseCode]
(
@Code NVARCHAR(50) = '',
@EndDate DATETIME
)
RETURNS TABLE
AS

--RETURN SELECT        SA.ActualStart, SA.ActualEnd, SA.Subject, PR.ProductNumber, PR.Name, SA.SiteName, ST.Country, ST.City, ST.Email, ST.State, SA.ServiceActivityID, 
--                         PR.ProductID, ST.SiteID, SA.ScheduleStatus, SA.DeliveryStatus
--FROM            ServiceActivity AS SA INNER JOIN
--                         Product AS PR ON SA.ProductID = PR.ProductID INNER JOIN
--                         Site AS ST ON SA.SiteID = ST.SiteID
--WHERE        (PR.ProductNumber = @Code) AND (SA.ActualEnd >= @EndDate) AND (ST.Country IS NOT NULL)


RETURN SELECT        SA.StartDate as ActualStart, SA.EndDate as ActualEnd, SA.Name as Subject , PR.Code as ProductNumber, PR.Name ,CITY.Name as SiteName, CTRY.Title as Country , CITY.Title as City,'info@flane.com.au' as Email,  STATES.Title as State, SA.ID as ServiceActivityID,
                         PR.ID as ProductID, CITY.ID as SiteID, SA.Status as ScheduleStatus, SA.Type as DeliveryStatus
FROM            crm.Schedules AS SA 
				INNER JOIN crm.Products AS PR ON SA.ProductID = PR.ID 
				INNER JOIN crm.Countries AS CTRY ON SA.CountryID = CTRY.ID
				left JOIN crm.Cities AS CITY ON SA.CityID = CITY.ID
				left JOIN crm.States AS STATES ON SA.StateID = STATES.ID
WHERE        (PR.code = @Code) AND (SA.EndDate >= @EndDate) AND (CTRY.ID IS NOT NULL) and (SA.publish != '102880000' or SA.publish is null)