CREATE TABLE [dbo].[PriceList] (
    [PriceListID]  UNIQUEIDENTIFIER NOT NULL,
    [CurrencyID]   UNIQUEIDENTIFIER NULL,
    [CurrenyName]  NVARCHAR (250)   NULL,
    [Name]         NVARCHAR (250)   NULL,
    [Description]  NVARCHAR (500)   NULL,
    [CreatedOn]    DATETIME         NULL,
    [ModifiedOn]   DATETIME         NULL,
    [ExchangeRate] DECIMAL (18, 10) NULL,
    [BeginDate]    DATETIME         NULL,
    [EndDate]      DATETIME         NULL,
    CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED ([PriceListID] ASC)
);

