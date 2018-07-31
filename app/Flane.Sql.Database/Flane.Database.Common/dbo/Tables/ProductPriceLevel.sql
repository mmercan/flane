CREATE TABLE [dbo].[ProductPriceLevel] (
    [ProductPriceLevelID] UNIQUEIDENTIFIER NOT NULL,
    [PriceListID]         UNIQUEIDENTIFIER NULL,
    [PriceListName]       NVARCHAR (250)   NULL,
    [ProductID]           UNIQUEIDENTIFIER NULL,
    [ProductName]         NVARCHAR (250)   NULL,
    [UnitID]              UNIQUEIDENTIFIER NULL,
    [UnitName]            NVARCHAR (50)    NULL,
    [Amount]              MONEY            NULL,
    [AmountBase]          MONEY            NULL,
    [CreatedOn]           DATETIME         NULL,
    [ModifiedOn]          DATETIME         NULL,
    CONSTRAINT [PK_ProductPriceLevel] PRIMARY KEY CLUSTERED ([ProductPriceLevelID] ASC)
);

