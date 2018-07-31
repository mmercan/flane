CREATE TABLE [dbo].[AdsImages] (
    [Id]             INT              NOT NULL,
    [ImageUrl]       NVARCHAR (200)   NOT NULL,
    [LinkUrl]        NVARCHAR (200)   NOT NULL,
    [LinkController] NVARCHAR (200)   NULL,
    [OrderId]        INT              NOT NULL,
    [RowGuid]        UNIQUEIDENTIFIER NOT NULL,
    [CountryCodes]   NVARCHAR (200)   NOT NULL,
    [HeaderText]     NVARCHAR (200)   NULL,
    [AdsText]        NVARCHAR (200)   NULL,
    [AdsIcon]        NVARCHAR (200)   NULL,
    [BoxColor]       NVARCHAR (200)   NULL,
    CONSTRAINT [PK_AdsImages] PRIMARY KEY CLUSTERED ([Id] ASC)
);

