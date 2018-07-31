﻿CREATE TABLE [crm].[Schedules] (
    [ID]            UNIQUEIDENTIFIER NOT NULL,
    [RegionID]      UNIQUEIDENTIFIER NULL,
    [CountryID]     UNIQUEIDENTIFIER NULL,
    [StateID]       UNIQUEIDENTIFIER NULL,
    [CityID]        UNIQUEIDENTIFIER NULL,
    [ProductID]     UNIQUEIDENTIFIER NULL,
    [VendorID]      UNIQUEIDENTIFIER NULL,
    [CategoryID]    UNIQUEIDENTIFIER NULL,
    [TechnologyID]  UNIQUEIDENTIFIER NULL,
    [InstructorID]  UNIQUEIDENTIFIER NULL,
    [TotalStudents] INT              NULL,
    [Name]          NVARCHAR (250)   NULL,
    [StartDate]     DATETIME         NULL,
    [StartTime]     INT              NULL,
    [EndDate]       DATETIME         NULL,
    [EndTime]       INT              NULL,
    [Year]          INT              NULL,
    [Month]         INT              NULL,
    [Week]          INT              NULL,
    [Day]           INT              NULL,
    [Type]          INT              NULL,
    [Status]        INT              NULL,
    [Publish]       INT              NULL,
    CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED ([ID] ASC)
);
