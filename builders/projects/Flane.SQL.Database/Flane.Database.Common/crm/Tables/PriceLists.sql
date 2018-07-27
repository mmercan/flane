CREATE TABLE [crm].[PriceLists] (
    [ID]           UNIQUEIDENTIFIER NOT NULL,
    [CurrencyID]   UNIQUEIDENTIFIER NULL,
    [Name]         NVARCHAR (250)   NULL,
    [Description]  NVARCHAR (500)   NULL,
    [BeginDate]    DATETIME         NULL,
    [EndDate]      DATETIME         NULL,
    [ExchangeRate] DECIMAL (23, 10) NULL,
    CONSTRAINT [PK_PriceLists] PRIMARY KEY CLUSTERED ([ID] ASC)
);

