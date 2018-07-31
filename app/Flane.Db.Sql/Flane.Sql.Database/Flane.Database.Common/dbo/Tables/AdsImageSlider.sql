CREATE TABLE [dbo].[AdsImageSlider] (
    [Id]             INT              NOT NULL,
    [ImageUrl]       NVARCHAR (200)   NOT NULL,
    [LinkUrl]        NVARCHAR (200)   NOT NULL,
    [LinkController] NVARCHAR (200)   NULL,
    [OrderId]        INT              NOT NULL,
    [RowGuid]        UNIQUEIDENTIFIER NOT NULL,
    [CountryCodes]   NVARCHAR (200)   NOT NULL,
    [Html]           NVARCHAR (MAX)   NULL,
    [Header]         NVARCHAR (200)   NULL,
    CONSTRAINT [PK_AdsImageSlider] PRIMARY KEY CLUSTERED ([Id] ASC)
);

