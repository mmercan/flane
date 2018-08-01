CREATE TABLE [crm].[Products] (
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [VendorID]          UNIQUEIDENTIFIER NULL,
    [CategoryID]        UNIQUEIDENTIFIER NULL,
    [TechnologyID]      UNIQUEIDENTIFIER NULL,
    [ChildTechnologyID] UNIQUEIDENTIFIER NULL,
    [Code]              NVARCHAR (50)    NULL,
    [Version]           NVARCHAR (50)    NULL,
    [Name]              NVARCHAR (250)   NULL,
    [Unit]              NVARCHAR (50)    NULL,
    [Published]         BIT              NULL,
    [OrderBy]           INT              NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ID] ASC)
);

