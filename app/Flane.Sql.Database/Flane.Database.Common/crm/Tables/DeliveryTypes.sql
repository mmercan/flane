CREATE TABLE [crm].[DeliveryTypes] (
    [ID]         UNIQUEIDENTIFIER NOT NULL,
    [ScheduleID] UNIQUEIDENTIFIER NULL,
    [RegionID]   UNIQUEIDENTIFIER NULL,
    [CountryID]  UNIQUEIDENTIFIER NULL,
    [StateID]    UNIQUEIDENTIFIER NULL,
    [CityID]     UNIQUEIDENTIFIER NULL,
    [Name]       NVARCHAR (250)   NULL,
    [StartDate]  SMALLDATETIME    NULL,
    [StartTime]  INT              NULL,
    [EndDate]    SMALLDATETIME    NULL,
    [EndTime]    INT              NULL,
    [Year]       INT              NULL,
    [Month]      INT              NULL,
    [Week]       INT              NULL,
    [Day]        INT              NULL,
    [Type]       INT              NULL,
    [TimeZone]   INT              NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

