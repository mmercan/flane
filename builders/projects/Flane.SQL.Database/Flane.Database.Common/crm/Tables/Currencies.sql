CREATE TABLE [crm].[Currencies] (
    [ID]           UNIQUEIDENTIFIER NOT NULL,
    [Symbol]       NVARCHAR (13)    NULL,
    [Code]         NVARCHAR (5)     NULL,
    [Name]         NVARCHAR (100)   NULL,
    [ExchangeRate] DECIMAL (23, 10) NULL,
    [Precision]    INT              NULL,
    CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED ([ID] ASC)
);

