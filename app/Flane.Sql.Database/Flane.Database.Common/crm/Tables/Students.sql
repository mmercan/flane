CREATE TABLE [crm].[Students] (
    [ID]                              UNIQUEIDENTIFIER NOT NULL,
    [ScheduleID]                      UNIQUEIDENTIFIER NULL,
    [Code]                            NVARCHAR (100)   NULL,
    [JobTitle]                        NVARCHAR (100)   NULL,
    [FirstName]                       NVARCHAR (50)    NULL,
    [Department]                      NVARCHAR (100)   NULL,
    [NickName]                        NVARCHAR (50)    NULL,
    [LastName]                        NVARCHAR (50)    NULL,
    [MiddleName]                      NVARCHAR (50)    NULL,
    [EMailAddress]                    NVARCHAR (100)   NULL,
    [Telephone]                       NVARCHAR (50)    NULL,
    [ContactID]                       UNIQUEIDENTIFIER NULL,
    [ProductID]                       UNIQUEIDENTIFIER NULL,
    [OperationStatus]                 INT              NULL,
    [FinanceStatus]                   INT              NULL,
    [RegistrationAcknowledgementSent] BIT              NULL,
    [CourseConfirmationSent]          BIT              NULL,
    [SalesOrderID]                    UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([ID] ASC)
);

