USE [ERP]
GO

/****** Object:  UserDefinedFunction [Accounting].[GetStatementOfAccount]    Script Date: 05/02/2019 1:44:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [Accounting].[GetStatementOfAccount] 
(
	@accountID int, @financialYearID int, @fromDate date, @toDate date, @entryStatus int
)
RETURNS 
@tblStatementOfAccount TABLE 
(
	EntryID int,
	[Status] int,
    EntrySide int,
    Notes nvarchar(MAX),
    Debit decimal,
    Credit decimal,
    ValueAfterOperation decimal,
    [Date] date
)
AS
BEGIN

	declare @openningCredit decimal, @openningDebit decimal, @balance decimal, @detailValue decimal, @debitValue decimal, @creditValue decimal, @entrySide int, @entryID int, @entryDate date, @entryNotes nvarchar(MAX)
	
	set @creditValue = 0
	set @debitValue = 0
	set @balance = 0

	select @openningCredit = TotalCredit, @openningDebit = TotalDebit
	from [Accounting].[GetAccountOpenningValues] (@accountID, @financialYearID, @fromDate, @entryStatus)

	set @balance = @openningDebit - @openningCredit

	if(@balance < 0)
	begin
		set @creditValue = Abs(@balance)
		set @entrySide = 1
	end
	else
	begin
		set @debitValue = @balance
		set @entrySide = 0
	end

	insert into @tblStatementOfAccount values(0, 1, @entrySide, N'Openning Balance', @debitValue, @creditValue, Abs(@balance), @fromDate)


	DECLARE transaction_cursor CURSOR FOR   
		select E.ID, E.Notes, E.[Date], E.[Status], D.Value * D.Rate as Value, D.Side
		from [Accounting].[Entry] E, [Accounting].[EntryDetail] D
		where E.IsDeleted = 0 and D.IsDeleted = 0 and E.ID = D.EntryID and D.AccountID = @accountID and E.IsOpenningBalance = 0 and (@entryStatus = 2 OR E.[Status] = @entryStatus) and E.[Date] >= @fromDate and E.[Date] <= @toDate
		order by E.[Date]

OPEN transaction_cursor

FETCH NEXT FROM transaction_cursor
INTO @entryID, @entryNotes, @entryDate, @entryStatus, @detailValue, @entrySide

WHILE @@FETCH_STATUS = 0  
BEGIN   

	set @creditValue = 0
	set @debitValue = 0

	if(@entrySide = 0)
	begin
		set @debitValue = @detailValue
		set @balance += @detailValue
	end
	else
	begin
		set @creditValue = @detailValue
		set @balance -= @detailValue
	end
		
	insert into @tblStatementOfAccount values(@entryID, @entryStatus, @entrySide, @entryNotes, @debitValue, @creditValue, Abs(@balance), @entryDate)

	FETCH NEXT FROM transaction_cursor
	INTO @entryID, @entryNotes, @entryDate, @entryStatus, @detailValue, @entrySide

END

CLOSE transaction_cursor
DEALLOCATE transaction_cursor


	RETURN 
END

GO


