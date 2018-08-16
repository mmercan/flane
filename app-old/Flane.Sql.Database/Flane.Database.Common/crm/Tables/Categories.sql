CREATE TABLE [crm].[Categories] (
    [ID]              UNIQUEIDENTIFIER NOT NULL,
    [VendorID]        UNIQUEIDENTIFIER NULL,
    [Name]            NVARCHAR (250)   NULL,
    [OrderBy]         INT              NULL,
    [Base64LogoImage] NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([ID] ASC)
);

