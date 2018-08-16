CREATE TABLE [dbo].[Vebinars] (
    [ID]            UNIQUEIDENTIFIER NOT NULL,
    [Text]          NVARCHAR (250)   NOT NULL,
    [PublishedDate] DATETIME         NOT NULL,
    [Presenter]     NVARCHAR (250)   NOT NULL,
    [Html]          NVARCHAR (MAX)   NULL,
    [videoLocation] NVARCHAR (250)   NULL,
    [PdfLocation]   NVARCHAR (250)   NULL,
    [UrlPart]       VARCHAR (100)    NULL,
    CONSTRAINT [PK_Vebinars] PRIMARY KEY CLUSTERED ([ID] ASC)
);

