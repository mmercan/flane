CREATE TABLE [dbo].[ServiceActivity] (
    [ServiceActivityID] UNIQUEIDENTIFIER NOT NULL,
    [SiteID]            UNIQUEIDENTIFIER NULL,
    [SiteName]          NVARCHAR (50)    NULL,
    [ProductID]         UNIQUEIDENTIFIER NULL,
    [ProductName]       NVARCHAR (250)   NULL,
    [Subject]           NVARCHAR (50)    NULL,
    [ActualStart]       DATETIME         NULL,
    [ActualEnd]         DATETIME         NULL,
    [ModifiedOn]        DATETIME         NULL,
    [CreatedOn]         DATETIME         NULL,
    [ClassCode]         DATETIME         NULL,
    [ScheduleStatus]    INT              NULL,
    [DeliveryStatus]    INT              NULL,
    [IsShowConfirmed]   BIT              NULL,
    CONSTRAINT [PK_ServiceActivity] PRIMARY KEY CLUSTERED ([ServiceActivityID] ASC)
);

