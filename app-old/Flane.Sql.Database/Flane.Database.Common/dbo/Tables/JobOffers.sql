CREATE TABLE [dbo].[JobOffers] (
    [ID]          INT            NOT NULL,
    [Text]        NVARCHAR (200) NOT NULL,
    [Description] NVARCHAR (MAX) NOT NULL,
    [Location]    NVARCHAR (200) NOT NULL,
    [JobTitle]    NVARCHAR (200) NOT NULL,
    [StartDate]   DATE           NULL,
    CONSTRAINT [PK_JobOffers] PRIMARY KEY CLUSTERED ([ID] ASC)
);

