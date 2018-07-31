CREATE TABLE [dbo].[Product] (
    [ProductID]      UNIQUEIDENTIFIER NOT NULL,
    [VendorID]       UNIQUEIDENTIFIER NOT NULL,
    [VendorName]     NVARCHAR (250)   NULL,
    [TechnologyID]   UNIQUEIDENTIFIER NOT NULL,
    [TechnologyName] NVARCHAR (250)   NULL,
    [ProductNumber]  NVARCHAR (50)    NULL,
    [Name]           NVARCHAR (250)   NULL,
    [Duration]       NVARCHAR (50)    NULL,
    [DurationType]   NVARCHAR (50)    NULL,
    [CreatedOn]      DATETIME         NULL,
    [ModifiedOn]     DATETIME         NULL,
    [Url]            VARCHAR (418)    NULL,
    [VendorUrl]      VARCHAR (100)    NULL,
    [TechnologyUrl]  VARCHAR (100)    NULL,
    [ProductUrl]     VARCHAR (100)    NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

