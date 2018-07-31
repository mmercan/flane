CREATE TABLE [resellerPortal].[ResellerCompany] (
    [ID]                         INT              NOT NULL,
    [Name]                       NVARCHAR (200)   NOT NULL,
    [ResellerDiscountPercentage] INT              NOT NULL,
    [PriceListsID]               UNIQUEIDENTIFIER NULL,
    [DefaultPriceListID]         UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_ResellerCompany] PRIMARY KEY CLUSTERED ([ID] ASC)
);

