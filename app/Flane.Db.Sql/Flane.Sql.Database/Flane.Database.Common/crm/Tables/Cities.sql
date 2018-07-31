﻿CREATE TABLE [crm].[Cities] (
    [ID]        UNIQUEIDENTIFIER NOT NULL,
    [CountryID] UNIQUEIDENTIFIER NULL,
    [StateID]   UNIQUEIDENTIFIER NULL,
    [Name]      NVARCHAR (50)    NULL,
    [Title]     NVARCHAR (250)   NULL,
    CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED ([ID] ASC)
);
