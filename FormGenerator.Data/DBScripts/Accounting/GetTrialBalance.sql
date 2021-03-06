USE [ERP]
GO

/****** Object:  UserDefinedFunction [Accounting].[GetTrialBalance]    Script Date: 05/02/2019 1:45:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [Accounting].[GetTrialBalance] 
(
	@financialYearID int, @fromDate date, @toDate date, @entryStatus int
)
RETURNS 
@tblChartOfAccounts TABLE 
(
	ID int,
	[Type] int,
	Name nvarchar(250),
	ParentID int,
    PreviousDebit decimal,
    PreviousCredit decimal,
    CurrentDebit decimal,
    CurrentCredit decimal,
	[Level] int
)
AS
BEGIN
 DECLARE @accountID int

	DECLARE mainAccount_cursor CURSOR FOR   
		select ID
		from [Accounting].[Account]
		where ParentID is NULL

	OPEN mainAccount_cursor

	FETCH NEXT FROM mainAccount_cursor
	INTO @accountID

	WHILE @@FETCH_STATUS = 0  
	BEGIN   
		
		insert into @tblChartOfAccounts 
		select *
		from [Accounting].[GetAccountDetailValues](@accountID, 1, @financialYearID, @fromDate, @toDate, @entryStatus)

		FETCH NEXT FROM mainAccount_cursor
		INTO @accountID
	END

	CLOSE mainAccount_cursor
	DEALLOCATE mainAccount_cursor

	RETURN 
END


GO


