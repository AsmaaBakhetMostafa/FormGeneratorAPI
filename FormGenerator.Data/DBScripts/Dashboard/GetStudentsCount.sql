USE [Menco]
GO

/****** Object:  UserDefinedFunction [Dashboard].[GetStudentsCount]    Script Date: 23-Apr-19 11:35:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE FUNCTION [Dashboard].[GetStudentsCount]
(
	@branchID int, @academicYearID int, @educationalStageID int, @classLevelID int
)
RETURNS int
AS
BEGIN
	DECLARE @studentsCount int

	SELECT @studentsCount = count(ID)
	from [StudentAffairs].[Student]
	where IsDeleted = 0 and ApplicantID in
	(
		select ID
		from [StudentAffairs].[Applicant]
		where IsDeleted = 0 and BranchID = @branchID and (@academicYearID is NULL or AcademicYearID = @academicYearID)
	)  and 
	(@classLevelID is null OR ClassLevelID = @classLevelID) and (@educationalStageID is null OR ClassLevelID in
		(
			select ID
			from [StudentAffairs].[ClassLevel]
			where IsDeleted = 0 and EducationalStageID = @educationalStageID
		)
	)
	RETURN coalesce(@studentsCount, 0)

END
GO


