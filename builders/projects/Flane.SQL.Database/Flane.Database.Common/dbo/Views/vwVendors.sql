CREATE VIEW [dbo].[vwVendors]
AS
SELECT        crm.Vendors.Name, crm.Vendors.OrderBy, crm.Vendors.ID, flane.VendorInfo.base64HeaderImage, flane.VendorInfo.base64LogoImage, flane.VendorInfo.VideoURL, flane.VendorInfo.Html, 
                         flane.VendorInfo.CertificationHTML, flane.VendorInfo.Active, flane.VendorInfo.ShowOnPartnerPage, flane.VendorInfo.CountryCodes, flane.VendorInfo.UrlPart, flane.VendorInfo.LogoImage
FROM            flane.VendorInfo INNER JOIN
                         crm.Vendors ON flane.VendorInfo.VendorID = crm.Vendors.ID