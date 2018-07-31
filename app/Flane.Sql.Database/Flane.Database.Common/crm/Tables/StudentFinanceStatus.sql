CREATE TABLE [crm].[StudentFinanceStatus] (
    [ID]      INT            NOT NULL,
    [Value]   NVARCHAR (250) NULL,
    [OrderBy] INT            NULL,
    CONSTRAINT [PK_StudentFinanceStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);

