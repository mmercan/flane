CREATE TABLE [crm].[ScheduleTypes] (
    [ID]      INT            NOT NULL,
    [Value]   NVARCHAR (250) NULL,
    [OrderBy] INT            NULL,
    CONSTRAINT [PK_ScheduleTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

