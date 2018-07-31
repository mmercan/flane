CREATE TABLE [dbo].[LocationRegion] (
    [ID]      UNIQUEIDENTIFIER NOT NULL,
    [Text]    NVARCHAR (200)   NOT NULL,
    [OrderID] INT              NOT NULL,
    CONSTRAINT [PK_LocationRegion] PRIMARY KEY CLUSTERED ([ID] ASC)
);

