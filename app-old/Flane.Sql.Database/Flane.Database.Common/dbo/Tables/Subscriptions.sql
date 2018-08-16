CREATE TABLE [dbo].[Subscriptions] (
    [SubscriptionID] INT            NOT NULL,
    [FirstName]      NVARCHAR (50)  NULL,
    [SecondName]     NVARCHAR (50)  NULL,
    [LastName]       NVARCHAR (50)  NULL,
    [Company]        NVARCHAR (50)  NULL,
    [Department]     NVARCHAR (50)  NULL,
    [Address]        NVARCHAR (250) NULL,
    [City]           NVARCHAR (50)  NULL,
    [Country]        NVARCHAR (50)  NULL,
    [PostCode]       NVARCHAR (10)  NULL,
    [Telephone]      NVARCHAR (50)  NULL,
    [Mobile]         NVARCHAR (50)  NULL,
    [Email]          NVARCHAR (50)  NULL,
    [Vendors]        NVARCHAR (500) NULL,
    [Technologies]   NVARCHAR (500) NULL,
    [Comments]       NVARCHAR (500) NULL,
    [CreateOn]       DATETIME       NULL,
    [ModifiedOn]     DATETIME       NULL,
    CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED ([SubscriptionID] ASC)
);

