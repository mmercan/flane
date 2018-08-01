CREATE TABLE [dbo].[Vendor] (
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [Text]              NVARCHAR (200)   NOT NULL,
    [UrlPart]           VARCHAR (100)    NULL,
    [HeaderImage]       NVARCHAR (200)   NULL,
    [LogoImage]         NVARCHAR (200)   NULL,
    [base64HeaderImage] VARCHAR (MAX)    NULL,
    [base64LogoImage]   VARCHAR (MAX)    NULL,
    [VideoURL]          NVARCHAR (250)   NULL,
    [Html]              NVARCHAR (MAX)   NULL,
    [CertificationHTML] NVARCHAR (MAX)   NULL,
    [OrderId]           INT              NULL,
    [Active]            BIT              NOT NULL,
    [ShowOnPartnerPage] BIT              NULL,
    [CountryCodes]      NVARCHAR (200)   NOT NULL,
    CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED ([ID] ASC)
);

