CREATE VIEW dbo.[vwCity]
AS
SELECT        crm.Cities.ID, crm.Cities.CountryID, crm.Cities.StateID, crm.Cities.Name, crm.Cities.Title, flane.CityInfo.Active, flane.CityInfo.OrderID, flane.CityInfo.Email, flane.CityInfo.Url, flane.CityInfo.Address, 
                         flane.CityInfo.ZipCode, flane.CityInfo.Phone, flane.CityInfo.ShowInLocation, flane.CityInfo.lat, flane.CityInfo.lng, crm.Countries.Name AS CountryName, crm.Countries.Title AS CountryTitle, 
                         crm.States.Name AS StateName, crm.States.Title AS StateTitle
FROM            crm.Cities LEFT OUTER JOIN
                         flane.CityInfo ON crm.Cities.ID = flane.CityInfo.CityID LEFT OUTER JOIN
                         crm.States ON crm.Cities.ID = crm.States.ID LEFT OUTER JOIN
                         crm.Countries ON crm.Cities.CountryID = crm.Countries.ID