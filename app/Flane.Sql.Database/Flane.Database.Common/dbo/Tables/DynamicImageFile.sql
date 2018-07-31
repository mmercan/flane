CREATE TABLE [dbo].[DynamicImageFile] (
    [ID]            INT             NOT NULL,
    [Title]         NVARCHAR (200)  NOT NULL,
    [ImageFile]     VARBINARY (MAX) NOT NULL,
    [ImageMimeType] NVARCHAR (200)  NULL,
    [FileName]      NVARCHAR (200)  NULL,
    CONSTRAINT [PK_DynamicImageFile] PRIMARY KEY CLUSTERED ([ID] ASC)
);

