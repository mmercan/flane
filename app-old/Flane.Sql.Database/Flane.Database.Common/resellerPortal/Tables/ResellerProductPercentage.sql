CREATE TABLE [resellerPortal].[ResellerProductPercentage] (
    [ID]                 INT              NOT NULL,
    [ResellerCompanyID]  INT              NOT NULL,
    [ProductID]          UNIQUEIDENTIFIER NOT NULL,
    [DiscountPercentage] FLOAT (53)       NOT NULL,
    CONSTRAINT [PK_ResellerProductPercentage] PRIMARY KEY CLUSTERED ([ID] ASC)
);

