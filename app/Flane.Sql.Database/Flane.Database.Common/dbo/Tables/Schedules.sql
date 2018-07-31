CREATE TABLE [dbo].[Schedules] (
    [ScheduleID] UNIQUEIDENTIFIER NOT NULL,
    [ClassCode]  NVARCHAR (250)   NULL,
    [CourseCode] NVARCHAR (50)    NULL,
    [Country]    NVARCHAR (250)   NULL,
    [City]       NVARCHAR (250)   NULL,
    [StartDate]  DATETIME         NULL,
    [EndDate]    DATETIME         NULL,
    CONSTRAINT [PK_Schedules_1] PRIMARY KEY CLUSTERED ([ScheduleID] ASC)
);

