CREATE TABLE [resellerPortal].[ResellerTechPercentage] (
    [ID]                 INT              NOT NULL,
    [ResellerCompanyID]  INT              NOT NULL,
    [TechnologyID]       UNIQUEIDENTIFIER NOT NULL,
    [DiscountPercentage] INT              NOT NULL,
    CONSTRAINT [PK_ResellerTechPercentage] PRIMARY KEY CLUSTERED ([ID] ASC)
);

