CREATE TABLE [dbo].[Site] (
    [SiteID]     UNIQUEIDENTIFIER NOT NULL,
    [ModifiedOn] DATETIME         NULL,
    [CreatedOn]  DATETIME         NULL,
    [Name]       NVARCHAR (50)    NULL,
    [City]       NVARCHAR (50)    NULL,
    [Country]    NVARCHAR (50)    NULL,
    [Email]      NVARCHAR (250)   NULL,
    [State]      NVARCHAR (50)    NULL,
    [MainPhone]  NVARCHAR (50)    NULL,
    [OrherPhone] NVARCHAR (50)    NULL,
    [Address]    NVARCHAR (250)   NULL,
    [PostCode]   NVARCHAR (50)    NULL,
    [Fax]        NVARCHAR (50)    NULL,
    CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED ([SiteID] ASC)
);

