CREATE TABLE [flane].[ProductInfo] (
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [CrmID]             UNIQUEIDENTIFIER NOT NULL,
    [NewCrmID]          UNIQUEIDENTIFIER NULL,
    [ProductCode]       NVARCHAR (50)    NULL,
    [Html]              NVARCHAR (MAX)   NULL,
    [Active]            BIT              NOT NULL,
    [useTabs]           BIT              NOT NULL,
    [DescriptionHtml]   NVARCHAR (MAX)   NULL,
    [ObjectivesHtml]    NVARCHAR (MAX)   NULL,
    [AudienceHtml]      NVARCHAR (MAX)   NULL,
    [PrerequisitesHtml] NVARCHAR (MAX)   NULL,
    [TopicsHtml]        NVARCHAR (MAX)   NULL,
    [RelatedHtml]       NVARCHAR (MAX)   NULL,
    [RoadmapsHtml]      NVARCHAR (MAX)   NULL,
    [LanguageCode]      NVARCHAR (100)   NULL,
    CONSTRAINT [PK_ProductInfo] PRIMARY KEY CLUSTERED ([ID] ASC)
);

