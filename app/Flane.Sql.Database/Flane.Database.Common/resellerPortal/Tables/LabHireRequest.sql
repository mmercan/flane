CREATE TABLE [resellerPortal].[LabHireRequest] (
    [ID]            INT            NOT NULL,
    [CompanyID]     INT            NOT NULL,
    [ProductID]     INT            NOT NULL,
    [ProductName]   NVARCHAR (200) NULL,
    [LabCode]       NVARCHAR (50)  NOT NULL,
    [StartDate]     DATE           NOT NULL,
    [StudentNumber] INT            NOT NULL,
    [Status]        NVARCHAR (50)  NOT NULL,
    [Notes]         NVARCHAR (MAX) NULL,
    [UserToApprove] NVARCHAR (50)  NULL,
    [CompanyNote]   NVARCHAR (MAX) NULL,
    [NotifyCompany] BIT            NULL,
    CONSTRAINT [PK_LabHireRequest] PRIMARY KEY CLUSTERED ([ID] ASC)
);

