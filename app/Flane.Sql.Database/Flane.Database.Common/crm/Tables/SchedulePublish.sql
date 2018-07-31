CREATE TABLE [crm].[SchedulePublish] (
    [ID]      INT            NOT NULL,
    [Value]   NVARCHAR (250) NULL,
    [OrderBy] INT            NULL,
    CONSTRAINT [PK_SchedulePublish] PRIMARY KEY CLUSTERED ([ID] ASC)
);

