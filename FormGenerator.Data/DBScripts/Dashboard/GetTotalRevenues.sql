USE [Menco]
GO

/****** Object:  UserDefinedFunction [Dashboard].[GetTotalRevenues]    Script Date: 23-Apr-19 11:36:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE FUNCTION [Dashboard].[GetTotalRevenues]
(
	@branchID int, @academicYearID int, @educationalStageID int, @classLevelID int
)
RETURNS decimal
AS
BEGIN
	DECLARE @applicationFees decimal,  @enrollmentInstallments decimal

	SELECT @applicationFees = Sum(ApplicationFees)
	from [StudentAffairs].[Applicant]
	where IsDeleted = 0 and ApplicationFeesPaid = 1 and (@academicYearID is null OR AcademicYearID = @academicYearID) and 
		(@classLevelID is null OR ClassLevelID = @classLevelID) and (@educationalStageID is null OR ClassLevelID in
			(
				select ID
				from [StudentAffairs].[ClassLevel]
				where IsDeleted = 0 and EducationalStageID = @educationalStageID
			)
		)

	select @enrollmentInstallments = Sum(Amount)
	from [Accounting].[EnrollmentInstallment]
	where IsDeleted = 0 and (@academicYearID is null OR AcademicYearID = @academicYearID) and
		(@classLevelID is null OR ClassLevelID = @classLevelID) and (@educationalStageID is null OR ClassLevelID in
			(
				select ID
				from [StudentAffairs].[ClassLevel]
				where IsDeleted = 0 and EducationalStageID = @educationalStageID
			)
		)
	and StudentID in
	(
		select ID 
		from [StudentAffairs].[Student]
		where IsDeleted = 0 and ApplicantID in
		(
			select ID
			from [StudentAffairs].[Applicant]
			where IsDeleted = 0 and BranchID = @branchID
		)
	)

	RETURN coalesce(@applicationFees, 0) + coalesce(@enrollmentInstallments, 0)

END
GO


