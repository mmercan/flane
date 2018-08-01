CREATE TABLE [flane].[vwVendors] (
    [Name]              NVARCHAR (250)   NOT NULL,
    [OrderBy]           INT              NULL,
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [base64HeaderImage] VARCHAR (MAX)    NULL,
    [base64LogoImage]   VARCHAR (MAX)    NULL,
    [VideoURL]          VARCHAR (MAX)    NULL,
    [Html]              NVARCHAR (MAX)   NULL,
    [CertificationHTML] NVARCHAR (MAX)   NULL,
    [Active]            BIT              NOT NULL,
    [ShowOnPartnerPage] BIT              NOT NULL,
    [CountryCodes]      NVARCHAR (200)   NULL,
    [UrlPart]           VARCHAR (100)    NULL,
    [LogoImage]         NVARCHAR (200)   NULL,
    CONSTRAINT [PK_vwVendors] PRIMARY KEY CLUSTERED ([Name] ASC)
);

