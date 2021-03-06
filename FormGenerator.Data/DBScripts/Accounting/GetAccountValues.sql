USE [ERP]
GO

/****** Object:  UserDefinedFunction [Accounting].[GetAccountValues]    Script Date: 05/02/2019 1:44:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [Accounting].[GetAccountValues] 
(
	@accountID int, @fromDate date, @toDate date, @entryStatus int
)
RETURNS 
@tblAccountValues TABLE 
(
	TotalCredit decimal,
	TotalDebit decimal
)
AS
BEGIN
 DECLARE @totalCredit decimal, @totalDebit decimal, @entryDebitSide int, @entryCreditSide int

	set @entryDebitSide = 0
	set @entryCreditSide = 1

	select @totalDebit = SUM(CASE When D.Side = @entryDebitSide Then (D.[Value] * D.Rate) Else 0 End ),
       @totalCredit = SUM(CASE When D.Side = @entryCreditSide Then (D.[Value] * D.Rate) Else 0 End )
	from [Accounting].[Entry] E, [Accounting].[EntryDetail] D
	where E.IsDeleted = 0 and D.IsDeleted = 0 and E.ID = D.EntryID and D.AccountID = @accountID and (@entryStatus = 2 OR E.[Status] = @entryStatus) and E.[Date] >= @fromDate and E.[Date] <= @toDate

	set @totalDebit = coalesce(@totalDebit, 0)
	set @totalCredit = coalesce(@totalCredit, 0)

	insert into @tblAccountValues values(@totalCredit, @totalDebit)

	RETURN 
END


GO


