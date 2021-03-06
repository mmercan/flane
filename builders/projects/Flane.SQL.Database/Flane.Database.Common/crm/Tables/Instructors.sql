﻿CREATE TABLE [crm].[Instructors] (
    [ID]        UNIQUEIDENTIFIER NOT NULL,
    [Name]      NVARCHAR (100)   NULL,
    [ContactID] UNIQUEIDENTIFIER NULL,
    [RegionID]  UNIQUEIDENTIFIER NULL,
    [CountryID] UNIQUEIDENTIFIER NULL,
    [CityID]    UNIQUEIDENTIFIER NULL,
    [StateID]   UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED ([ID] ASC)
);

