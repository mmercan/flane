CREATE TABLE [resellerPortal].[ResellerCourseOfferingsRequest] (
    [ID]            INT              NOT NULL,
    [CompanyID]     INT              NOT NULL,
    [StartDate]     DATE             NOT NULL,
    [ProductID]     UNIQUEIDENTIFIER NOT NULL,
    [ProductName]   NVARCHAR (200)   NULL,
    [StudentNumber] INT              NOT NULL,
    [Status]        NVARCHAR (50)    NOT NULL,
    [Notes]         NVARCHAR (MAX)   NULL,
    [UserToApprove] NVARCHAR (50)    NULL,
    [CompanyNote]   NVARCHAR (MAX)   NULL,
    [SiteID]        UNIQUEIDENTIFIER NULL,
    [NotifyCompany] BIT              NULL,
    CONSTRAINT [PK_ResellerCourseOfferingsRequest] PRIMARY KEY CLUSTERED ([ID] ASC)
);

