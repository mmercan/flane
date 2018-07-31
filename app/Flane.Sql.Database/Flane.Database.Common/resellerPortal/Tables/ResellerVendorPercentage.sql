CREATE TABLE [resellerPortal].[ResellerVendorPercentage] (
    [ID]                 INT              NOT NULL,
    [ResellerCompanyID]  INT              NOT NULL,
    [VendorID]           UNIQUEIDENTIFIER NOT NULL,
    [DiscountPercentage] INT              NOT NULL,
    CONSTRAINT [PK_ResellerVendorPercentage] PRIMARY KEY CLUSTERED ([ID] ASC)
);

