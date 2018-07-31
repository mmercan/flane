CREATE TABLE [resellerPortal].[ResellerCompanyUsers] (
    [ID]        INT            NOT NULL,
    [CompanyID] INT            NOT NULL,
    [UserName]  NVARCHAR (200) NULL,
    CONSTRAINT [PK_ResellerCompanyUsers] PRIMARY KEY CLUSTERED ([ID] ASC)
);

