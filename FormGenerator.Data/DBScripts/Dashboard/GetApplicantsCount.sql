USE [Menco]
GO

/****** Object:  UserDefinedFunction [Dashboard].[GetApplicantsCount]    Script Date: 23-Apr-19 11:34:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE FUNCTION [Dashboard].[GetApplicantsCount]
(
	@branchID int, @academicYearID int
)
RETURNS int
AS
BEGIN
	DECLARE @applicantsCount int

	SELECT @applicantsCount = count(ID)
	from [StudentAffairs].[Applicant]
	where IsDeleted = 0 and BranchID = @branchID and (@academicYearID is NULL or AcademicYearID = @academicYearID)

	RETURN coalesce(@applicantsCount, 0)

END
GO


