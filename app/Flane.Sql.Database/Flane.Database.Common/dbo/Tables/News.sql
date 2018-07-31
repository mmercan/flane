CREATE TABLE [dbo].[News] (
    [ID]           UNIQUEIDENTIFIER NOT NULL,
    [Category]     NVARCHAR (50)    NOT NULL,
    [UrlPart]      VARCHAR (100)    NULL,
    [Text]         NVARCHAR (200)   NOT NULL,
    [Html]         NVARCHAR (MAX)   NOT NULL,
    [PublishedAt]  DATETIME         NOT NULL,
    [CreatedAt]    DATETIME         NOT NULL,
    [ModifiedAt]   DATETIME         NOT NULL,
    [IsPublished]  BIT              NOT NULL,
    [Year]         INT              NULL,
    [Month]        INT              NULL,
    [Week]         INT              NULL,
    [Day]          INT              NULL,
    [CountryCodes] NVARCHAR (200)   NOT NULL,
    CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED ([ID] ASC)
);

