CREATE TABLE [crm].[ScheduleStatus] (
    [ID]      INT            NOT NULL,
    [Value]   NVARCHAR (250) NULL,
    [OrderBy] INT            NULL,
    CONSTRAINT [PK_ScheduleStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);

