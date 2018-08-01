CREATE TABLE [crm].[StudentOperationStatus] (
    [ID]      INT            NOT NULL,
    [Value]   NVARCHAR (250) NULL,
    [OrderBy] INT            NULL,
    CONSTRAINT [PK_StudentOperationStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);

