CREATE TABLE [crm].[Vendors] (
    [ID]      UNIQUEIDENTIFIER NOT NULL,
    [Name]    NVARCHAR (250)   NULL,
    [OrderBy] INT              NULL,
    CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED ([ID] ASC)
);

