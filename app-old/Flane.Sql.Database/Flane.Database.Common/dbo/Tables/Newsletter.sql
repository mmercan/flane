CREATE TABLE [dbo].[Newsletter] (
    [NewsletterID] INT            NOT NULL,
    [FirstName]    NVARCHAR (50)  NULL,
    [LastName]     NVARCHAR (50)  NULL,
    [Company]      NVARCHAR (50)  NULL,
    [Department]   NVARCHAR (50)  NULL,
    [Address]      NVARCHAR (250) NULL,
    [City]         NVARCHAR (50)  NULL,
    [Country]      NVARCHAR (50)  NULL,
    [PostCode]     NVARCHAR (10)  NULL,
    [Telephone]    NVARCHAR (50)  NULL,
    [Mobile]       NVARCHAR (50)  NULL,
    [Email]        NVARCHAR (50)  NULL,
    [Vendor]       NVARCHAR (MAX) NULL,
    [Technology]   NVARCHAR (MAX) NULL,
    [Comment]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Newsletter] PRIMARY KEY CLUSTERED ([NewsletterID] ASC)
);

