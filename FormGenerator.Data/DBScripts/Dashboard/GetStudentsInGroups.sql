USE [Menco]
GO

/****** Object:  StoredProcedure [Dashboard].[GetStudentsInGroups]    Script Date: 23-Apr-19 11:39:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dashboard].[GetStudentsInGroups]
	
	@branchID int , @academicYearID int, @groupCriteria nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @academicYearCriteria nvarchar(max) = ''

	if(@academicYearID is not null)
	begin
		set @academicYearCriteria = ' and S.AcademicYearID = ' + Str(@academicYearID)
	end

	DECLARE @sql nvarchar(max) = 
	'SELECT ' + @groupCriteria + ', Count(S.ID) as Count 
	FROM [StudentAffairs].[Applicant] A, [StudentAffairs].[Student] S
	where A.IsDeleted = 0 and S.IsDeleted = 0 and A.BranchID = ' + Str(@branchID) + ' and A.ID = S.ApplicantID ' + @academicYearCriteria +
	' Group by ' + @groupCriteria;

	--select @sql
	exec (@sql)-- sp_executesql @sql, N''
END
GO


