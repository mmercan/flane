CREATE TABLE [dbo].[Course] (
    [CourseID]    UNIQUEIDENTIFIER NOT NULL,
    [ProductID]   UNIQUEIDENTIFIER NULL,
    [Html]        NVARCHAR (MAX)   NULL,
    [CreatedOn]   DATETIME         NULL,
    [ModifiedOn]  DATETIME         NULL,
    [IsPublished] BIT              NULL,
    [IsActive]    BIT              NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([CourseID] ASC)
);

