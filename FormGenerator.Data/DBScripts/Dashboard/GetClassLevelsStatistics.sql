USE [Menco]
GO

/****** Object:  StoredProcedure [Dashboard].[GetClassLevelsStatistics]    Script Date: 23-Apr-19 11:37:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dashboard].[GetClassLevelsStatistics]
	
	@branchID int, @academicYearID int, @educationalStageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ID, NameArabic, NameEnglish, [Dashboard].[GetStudentsCount](@branchID, @academicYearID, EducationalStageID, ID) as StudentsCount, [Dashboard].[GetClassesCount](@branchID, EducationalStageID, ID) as ClassesCount, 
		[Dashboard].[GetTotalRevenues](@branchID, @academicYearID, EducationalStageID, ID) as Revenues, [Dashboard].[GetTotalExpenses](@branchID, @academicYearID, EducationalStageID, ID) as Expenses
	FROM [StudentAffairs].[ClassLevel]
	where IsDeleted = 0 and (@educationalStageID is NULL OR EducationalStageID = @educationalStageID)
END
GO


