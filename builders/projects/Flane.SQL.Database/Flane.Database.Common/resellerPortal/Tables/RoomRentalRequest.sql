CREATE TABLE [resellerPortal].[RoomRentalRequest] (
    [ID]            INT              NOT NULL,
    [CompanyID]     INT              NOT NULL,
    [SiteID]        UNIQUEIDENTIFIER NOT NULL,
    [StartDate]     DATE             NOT NULL,
    [EndDate]       DATE             NOT NULL,
    [StudentNumber] INT              NOT NULL,
    [Status]        NVARCHAR (50)    NOT NULL,
    [Notes]         NVARCHAR (MAX)   NULL,
    [UserToApprove] NVARCHAR (50)    NULL,
    [CompanyNote]   NVARCHAR (MAX)   NULL,
    [NotifyCompany] BIT              NULL,
    CONSTRAINT [PK_RoomRentalRequest] PRIMARY KEY CLUSTERED ([ID] ASC)
);

