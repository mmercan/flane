CREATE TABLE [dbo].[LocationCountry] (
    [ID]       UNIQUEIDENTIFIER NOT NULL,
    [RegionID] UNIQUEIDENTIFIER NOT NULL,
    [Text]     NVARCHAR (200)   NOT NULL,
    [OrderID]  INT              NOT NULL,
    CONSTRAINT [PK_LocationCountry] PRIMARY KEY CLUSTERED ([ID] ASC)
);

