CREATE TABLE [flane].[DynamicFile] (
    [ID]                  INT             NOT NULL,
    [FileName]            NVARCHAR (250)  NOT NULL,
    [MimeType]            NVARCHAR (100)  NOT NULL,
    [FileExtension]       NVARCHAR (50)   NOT NULL,
    [Length]              BIGINT          NOT NULL,
    [Title]               NVARCHAR (200)  NOT NULL,
    [FileBinary]          VARBINARY (MAX) NOT NULL,
    [ThumbnailFileBinary] VARBINARY (MAX) NULL,
    CONSTRAINT [pk_FlaneDynamicFile] PRIMARY KEY CLUSTERED ([ID] ASC)
);

