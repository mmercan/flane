CREATE TABLE [flane].[VendorInfo] (
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [VendorID]          UNIQUEIDENTIFIER NOT NULL,
    [Text]              NVARCHAR (200)   NOT NULL,
    [base64HeaderImage] VARCHAR (MAX)    NULL,
    [base64LogoImage]   VARCHAR (MAX)    NULL,
    [VideoURL]          VARCHAR (MAX)    NULL,
    [Html]              NVARCHAR (MAX)   NULL,
    [CertificationHTML] NVARCHAR (MAX)   NULL,
    [LogoImage]         NVARCHAR (200)   NULL,
    [Active]            BIT              NOT NULL,
    [ShowOnPartnerPage] BIT              NOT NULL,
    [CountryCodes]      NVARCHAR (200)   NULL,
    [UrlPart]           VARCHAR (100)    NULL,
    CONSTRAINT [pk_VendorInfoID] PRIMARY KEY CLUSTERED ([ID] ASC)
);

