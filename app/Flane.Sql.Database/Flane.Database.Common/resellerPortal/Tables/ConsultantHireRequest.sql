CREATE TABLE [resellerPortal].[ConsultantHireRequest] (
    [ID]             INT              NOT NULL,
    [CompanyID]      INT              NOT NULL,
    [StartDate]      DATE             NOT NULL,
    [VendorID]       UNIQUEIDENTIFIER NOT NULL,
    [TechnologyID]   UNIQUEIDENTIFIER NULL,
    [TechnologyName] NVARCHAR (50)    NULL,
    [Status]         NVARCHAR (50)    NOT NULL,
    [Notes]          NVARCHAR (MAX)   NULL,
    [UserToApprove]  NVARCHAR (50)    NULL,
    [CompanyNote]    NVARCHAR (MAX)   NULL,
    [SiteID]         UNIQUEIDENTIFIER NULL,
    [NotifyCompany]  BIT              NULL,
    CONSTRAINT [PK_ConsultantHireRequest] PRIMARY KEY CLUSTERED ([ID] ASC)
);

