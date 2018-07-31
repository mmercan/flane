CREATE TABLE [crm].[Countries] (
    [ID]       UNIQUEIDENTIFIER NOT NULL,
    [RegionID] UNIQUEIDENTIFIER NULL,
    [Name]     NVARCHAR (50)    NULL,
    [Title]    NVARCHAR (250)   NULL,
    CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED ([ID] ASC)
);

