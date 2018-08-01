CREATE TABLE [crm].[Prices] (
    [ID]           UNIQUEIDENTIFIER NOT NULL,
    [PriceListID]  UNIQUEIDENTIFIER NULL,
    [ProductID]    UNIQUEIDENTIFIER NULL,
    [UnitID]       UNIQUEIDENTIFIER NULL,
    [CurrencyID]   UNIQUEIDENTIFIER NULL,
    [ExchangeRate] DECIMAL (23, 10) NULL,
    [Price]        MONEY            NULL,
    [PriceBase]    MONEY            NULL,
    CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED ([ID] ASC)
);

