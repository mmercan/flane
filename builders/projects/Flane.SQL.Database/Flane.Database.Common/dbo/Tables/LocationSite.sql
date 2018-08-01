CREATE TABLE [dbo].[LocationSite] (
    [ID]              UNIQUEIDENTIFIER NOT NULL,
    [CrmID]           UNIQUEIDENTIFIER NULL,
    [CountryID]       UNIQUEIDENTIFIER NOT NULL,
    [Text]            NVARCHAR (200)   NOT NULL,
    [OrderID]         INT              NOT NULL,
    [Email]           NVARCHAR (200)   NULL,
    [Url]             NVARCHAR (200)   NULL,
    [ZipCode]         VARCHAR (10)     NULL,
    [Address]         NVARCHAR (MAX)   NULL,
    [Phone]           NVARCHAR (50)    NULL,
    [UrlPart]         VARCHAR (100)    NULL,
    [ShowInLocations] BIT              NOT NULL,
    [lat]             FLOAT (53)       NULL,
    [lng]             FLOAT (53)       NULL,
    CONSTRAINT [PK_LocationSite] PRIMARY KEY CLUSTERED ([ID] ASC)
);

