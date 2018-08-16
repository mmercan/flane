CREATE TABLE [resellerPortal].[LabHireProducts] (
    [ID]         INT            NOT NULL,
    [Code]       NVARCHAR (50)  NOT NULL,
    [Name]       NVARCHAR (200) NOT NULL,
    [GroupID]    INT            NOT NULL,
    [Duration]   INT            NOT NULL,
    [UpTo8]      FLOAT (53)     NULL,
    [UpTo10]     FLOAT (53)     NULL,
    [UpTo12]     FLOAT (53)     NULL,
    [Upto16]     FLOAT (53)     NULL,
    [CreatedAt]  DATETIME       NULL,
    [CreatedBy]  NVARCHAR (50)  NULL,
    [ModifiedAt] DATETIME       NULL,
    [ModifiedBy] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_LabHireProducts] PRIMARY KEY CLUSTERED ([ID] ASC)
);

