CREATE TABLE [crm].[Technologies] (
    [ID]         UNIQUEIDENTIFIER NOT NULL,
    [VendorID]   UNIQUEIDENTIFIER NULL,
    [CategoryID] UNIQUEIDENTIFIER NULL,
    [ParentID]   UNIQUEIDENTIFIER NULL,
    [Name]       NVARCHAR (250)   NULL,
    [OrderBy]    INT              NULL,
    CONSTRAINT [PK_Technologies] PRIMARY KEY CLUSTERED ([ID] ASC)
);

