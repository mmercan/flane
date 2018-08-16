CREATE TABLE [flane].[vwCity] (
    [ID]             UNIQUEIDENTIFIER NOT NULL,
    [CountryID]      UNIQUEIDENTIFIER NULL,
    [StateID]        UNIQUEIDENTIFIER NULL,
    [Name]           NVARCHAR (50)    NULL,
    [Title]          NVARCHAR (250)   NULL,
    [Active]         BIT              NULL,
    [OrderID]        INT              NULL,
    [Email]          NVARCHAR (200)   NULL,
    [Url]            NVARCHAR (200)   NULL,
    [Address]        NVARCHAR (MAX)   NULL,
    [ZipCode]        VARCHAR (20)     NULL,
    [Phone]          NVARCHAR (50)    NULL,
    [ShowInLocation] BIT              NULL,
    [lat]            FLOAT (53)       NULL,
    [lng]            FLOAT (53)       NULL,
    [CountryName]    NVARCHAR (50)    NULL,
    [CountryTitle]   NVARCHAR (250)   NULL,
    [StateName]      NVARCHAR (50)    NULL,
    [StateTitle]     NVARCHAR (250)   NULL,
    CONSTRAINT [PK_vwCity] PRIMARY KEY CLUSTERED ([ID] ASC)
);

