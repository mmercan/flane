CREATE TABLE [dbo].[OldTechnologies] (
    [ID]              INT              NOT NULL,
    [VendorID]        UNIQUEIDENTIFIER NOT NULL,
    [TechnologyID]    UNIQUEIDENTIFIER NOT NULL,
    [Text]            NVARCHAR (200)   NOT NULL,
    [Base64LogoImage] NVARCHAR (MAX)   NULL,
    [Description]     NVARCHAR (MAX)   NULL,
    [UrlPart]         VARCHAR (100)    NULL,
    [Active]          BIT              NOT NULL,
    [OrderNumber]     INT              NULL,
    [TechCatID]       INT              NULL,
    [RowNumber]       INT              NOT NULL,
    CONSTRAINT [PK_Technologies_1] PRIMARY KEY CLUSTERED ([ID] ASC)
);

