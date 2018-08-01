CREATE TABLE [crm].[Regions] (
    [ID]      UNIQUEIDENTIFIER NOT NULL,
    [Name]    NVARCHAR (50)    NULL,
    [Title]   NVARCHAR (250)   NULL,
    [OrderBy] INT              NULL,
    CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED ([ID] ASC)
);

