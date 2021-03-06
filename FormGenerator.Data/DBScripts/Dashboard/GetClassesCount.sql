USE [Menco]
GO

/****** Object:  UserDefinedFunction [Dashboard].[GetClassesCount]    Script Date: 23-Apr-19 11:35:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE FUNCTION [Dashboard].[GetClassesCount]
(
	@branchID int, @educationalStageID int, @classLevelID int
)
RETURNS int
AS
BEGIN
	DECLARE @classesCount int

	SELECT @classesCount = Count(ID)
	FROM [StudentAffairs].[Class]
	where IsDeleted = 0  and 
	(@classLevelID is null OR ClassLevelID = @classLevelID) and (@educationalStageID is null OR ClassLevelID in
		(
			select ID
			from [StudentAffairs].[ClassLevel]
			where IsDeleted = 0 and EducationalStageID = @educationalStageID
		)
	)
	
	RETURN coalesce(@classesCount, 0)

END
GO


