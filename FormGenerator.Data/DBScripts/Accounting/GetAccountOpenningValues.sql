USE [ERP]
GO
/****** Object:  UserDefinedFunction [Accounting].[GetAccountOpenningValues]    Script Date: 05/02/2019 1:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [Accounting].[GetAccountOpenningValues] 
(
	@accountID int, @financialYearID int, @beforeDate date, @entryStatus int
)
RETURNS 
@tblAccountOpenningValues TABLE 
(
	TotalCredit decimal,
	TotalDebit decimal
)
AS
BEGIN
 DECLARE @totalCredit decimal, @totalDebit decimal, @financialYearStartDate date, @entryDebitSide int, @entryCreditSide int

	set @entryDebitSide = 0
	set @entryCreditSide = 1

	select @financialYearStartDate = StartDate
	from [Accounting].[FinancialYear]
	where ID = @financialYearID and IsDeleted = 0
	
	set @totalCredit = 0
	set @totalDebit = 0

	if(@beforeDate = @financialYearStartDate)
	begin
		select  @totalDebit = CASE When D.Side = @entryDebitSide Then E.Value Else 0 End ,
			@totalCredit = CASE When D.Side = @entryCreditSide Then E.Value Else 0 End
		from [Accounting].[Entry] E, [Accounting].[EntryDetail] D
		where E.IsDeleted = 0 and D.IsDeleted = 0 and E.ID = D.EntryID and D.AccountID = @accountID and E.FinancialYearID = @financialYearID and E.IsOpenningBalance = 1
	end
	else
	begin
		set @beforeDate = Dateadd(DAY, -1, @beforeDate)
		select @totalCredit = TotalCredit, @totalDebit = TotalDebit
		from [Accounting].[GetAccountValues](@accountID, @financialYearStartDate, @beforeDate, @entryStatus)
	end

	set @totalDebit = coalesce(@totalDebit, 0)
	set @totalCredit = coalesce(@totalCredit, 0)

	insert into @tblAccountOpenningValues values(@totalCredit, @totalDebit)

	RETURN 
END

