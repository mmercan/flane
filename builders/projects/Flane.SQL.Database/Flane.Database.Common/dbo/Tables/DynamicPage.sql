CREATE TABLE [dbo].[DynamicPage] (
    [ID]       INT            NOT NULL,
    [Title]    NVARCHAR (200) NOT NULL,
    [Category] NVARCHAR (200) NOT NULL,
    [Html]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_DynamicPage] PRIMARY KEY CLUSTERED ([ID] ASC)
);

