CREATE TABLE [dbo].[Contact] (
    [ContactID]     UNIQUEIDENTIFIER NOT NULL,
    [FirstName]     NVARCHAR (50)    NULL,
    [MiddleName]    NVARCHAR (50)    NULL,
    [LastName]      NVARCHAR (50)    NULL,
    [Email]         NVARCHAR (100)   NULL,
    [Company]       NVARCHAR (250)   NULL,
    [JobTitle]      NVARCHAR (100)   NULL,
    [Address]       NVARCHAR (250)   NULL,
    [City]          NVARCHAR (100)   NULL,
    [Country]       NVARCHAR (100)   NULL,
    [PostalCode]    NVARCHAR (50)    NULL,
    [BusinessPhone] NVARCHAR (50)    NULL,
    [MobilePhone]   NVARCHAR (50)    NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([ContactID] ASC)
);

