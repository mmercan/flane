CREATE TABLE [flane].[CityInfo] (
    [ID]             UNIQUEIDENTIFIER NOT NULL,
    [CityID]         UNIQUEIDENTIFIER NOT NULL,
    [Active]         BIT              NOT NULL,
    [Text]           NVARCHAR (200)   NULL,
    [OrderID]        INT              NOT NULL,
    [Email]          NVARCHAR (200)   NULL,
    [Url]            NVARCHAR (200)   NULL,
    [Address]        NVARCHAR (MAX)   NULL,
    [ZipCode]        VARCHAR (20)     NULL,
    [Phone]          NVARCHAR (50)    NULL,
    [ShowInLocation] BIT              NOT NULL,
    [lat]            FLOAT (53)       NULL,
    [lng]            FLOAT (53)       NULL,
    CONSTRAINT [PK_CityInfo] PRIMARY KEY CLUSTERED ([ID] ASC)
);

