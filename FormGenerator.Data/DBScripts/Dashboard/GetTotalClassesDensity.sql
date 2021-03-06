USE [Menco]
GO

/****** Object:  StoredProcedure [Dashboard].[GetTotalClassesDensity]    Script Date: 23-Apr-19 11:37:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dashboard].[GetTotalClassesDensity]
	
	@branchID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Count(ID) as Count, Sum(Capacity) as Capacity
	FROM [StudentAffairs].[Class]
	where IsDeleted = 0 and ClassLevelID in 
	(
		select ID
		from [StudentAffairs].[ClassLevel]
		where EducationalStageID in
		(
			select ID
			from [StudentAffairs].[EducationalStage]
			where BranchID = @branchID
		)
	)
END
GO


