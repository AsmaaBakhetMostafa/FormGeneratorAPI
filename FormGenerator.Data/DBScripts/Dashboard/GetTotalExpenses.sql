USE [Menco]
GO

/****** Object:  UserDefinedFunction [Dashboard].[GetTotalExpenses]    Script Date: 23-Apr-19 11:36:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE FUNCTION [Dashboard].[GetTotalExpenses]
(
	@branchID int, @academicYearID int, @educationalStageID int, @classLevelID int
)
RETURNS decimal
AS
BEGIN
	RETURN 0

END
GO


