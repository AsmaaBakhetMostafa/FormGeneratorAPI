USE [ERP]
GO

/****** Object:  UserDefinedFunction [Accounting].[GetAccountDetailValues]    Script Date: 2/8/2019 2:38:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter FUNCTION [Accounting].[GetAccountDetailValues] 
(
	@accountID int, @level int, @financialYearID int, @fromDate date, @toDate date, @entryStatus int
)
RETURNS 
@tblAccountValues TABLE 
(
	ID int,
	[Type] int,
	Name nvarchar(250),
	ParentID int,
    PreviousDebit decimal,
    PreviousCredit decimal,
    CurrentDebit decimal,
    CurrentCredit decimal,
	[Level] int,
	Classification int
)
AS
BEGIN
 DECLARE @accountType int, @accountParentID int, @accountName nvarchar(250), 
		@subAccountID int, @subAccountType int, @subAccountName nvarchar(250),@classification int,
		@previousCredit decimal, @previousDebit decimal, @currentCredit decimal, @currentDebit decimal

	select @accountType = [Type], @accountName = Name, @accountParentID = ParentID
	,@classification=Classification
	from [Accounting].[Account]
	where ID = @accountID

	insert into @tblAccountValues values(@accountID, @accountType, @accountName, @accountParentID, 0, 0, 0, 0, @level,@classification)

	DECLARE subAccount_cursor CURSOR FOR   
		select ID
		from [Accounting].[Account]
		where ParentID = @accountID and [Type] <> 3  -- not a leaf account

	OPEN subAccount_cursor

	FETCH NEXT FROM subAccount_cursor
	INTO @subAccountID

	WHILE @@FETCH_STATUS = 0  
	BEGIN   
		
		insert into @tblAccountValues
		select *
		from [Accounting].[GetAccountDetailValues](@subAccountID, @level + 1, @financialYearID, @fromDate, @toDate, @entryStatus)

		FETCH NEXT FROM subAccount_cursor
		INTO @subAccountID
	END

	CLOSE subAccount_cursor
	DEALLOCATE subAccount_cursor

	DECLARE leafAccount_cursor CURSOR FOR   
		select ID
		from [Accounting].[Account]
		where ParentID = @accountID and [Type] = 3  -- a leaf account

	OPEN leafAccount_cursor

	FETCH NEXT FROM leafAccount_cursor
	INTO @subAccountID

	WHILE @@FETCH_STATUS = 0  
	BEGIN   
		select @previousCredit = TotalCredit, @previousDebit = TotalDebit
		from [Accounting].[GetAccountOpenningValues](@subAccountID, @financialYearID, @fromDate, @entryStatus)

		select @currentCredit = TotalCredit, @currentDebit = TotalDebit
		from [Accounting].[GetAccountValues](@subAccountID, @fromDate, @toDate, @entryStatus)

		select @subAccountName = Name, @subAccountType = [Type]
		from [Accounting].[Account]
		where ID = @subAccountID

		insert into @tblAccountValues
		values (@subAccountID, @subAccountType, @subAccountName, @accountID, @previousCredit, @previousDebit, @currentCredit, @currentDebit, @level + 1,@classification)

		FETCH NEXT FROM leafAccount_cursor
		INTO @subAccountID
	END

	CLOSE leafAccount_cursor
	DEALLOCATE leafAccount_cursor

	select @previousCredit = Sum(PreviousCredit), @previousDebit = Sum(PreviousDebit),
		@currentCredit = Sum(CurrentCredit),@currentDebit = Sum(CurrentDebit)
	from @tblAccountValues
	where ParentID = @accountID
	
	set @previousCredit = coalesce(@previousCredit, 0)
	set @previousDebit = coalesce(@previousDebit, 0)
	set @currentCredit = coalesce(@currentCredit, 0)
	set @currentDebit = coalesce(@currentDebit, 0)

	update @tblAccountValues
	set PreviousCredit = @previousCredit, PreviousDebit = @previousDebit,
		CurrentCredit = @currentCredit, CurrentDebit = @currentDebit 
	where ID = @accountID

	RETURN 
END



GO


