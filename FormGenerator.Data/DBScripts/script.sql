/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.2002)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [ERPDB]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE DATABASE [ERPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ERPDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ERPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ERPDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ERPDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERPDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERPDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERPDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERPDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERPDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERPDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERPDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERPDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERPDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERPDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ERPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERPDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ERPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERPDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ERPDB] SET  MULTI_USER 
GO
ALTER DATABASE [ERPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERPDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ERPDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ERPDB', N'ON'
GO
ALTER DATABASE [ERPDB] SET QUERY_STORE = OFF
GO
USE [ERPDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ERPDB]
GO
/****** Object:  Schema [Accounting]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Accounting]
GO
/****** Object:  Schema [Bank]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Bank]
GO
/****** Object:  Schema [Cashier]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Cashier]
GO
/****** Object:  Schema [ClientAccount]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [ClientAccount]
GO
/****** Object:  Schema [CreditCard]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [CreditCard]
GO
/****** Object:  Schema [Currency]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Currency]
GO
/****** Object:  Schema [HR]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Location]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Location]
GO
/****** Object:  Schema [Log]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Log]
GO
/****** Object:  Schema [Mail]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Mail]
GO
/****** Object:  Schema [Module]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Module]
GO
/****** Object:  Schema [Page]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Page]
GO
/****** Object:  Schema [Project]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Project]
GO
/****** Object:  Schema [Template]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Template]
GO
/****** Object:  Schema [Treasury]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [Treasury]
GO
/****** Object:  Schema [User]    Script Date: 1/21/2019 2:30:01 PM ******/
CREATE SCHEMA [User]
GO
/****** Object:  UserDefinedFunction [Accounting].[GetAccountBalance]    Script Date: 1/21/2019 2:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [Accounting].[GetAccountBalance] 
(
	@accountID int, @fromDate date, @toDate date, @entryStatus int
)
RETURNS decimal
AS
BEGIN
	-- Declare the return variable here
	DECLARE @totalDebit decimal, @totalCredit decimal, @entryDebitSide int, @entryCreditSide int

	set @entryDebitSide = 0
	set @entryCreditSide = 1

	select @totalDebit = SUM(CASE When D.Side = @entryDebitSide Then (D.[Value] * D.Rate) Else 0 End ),
       @totalCredit = SUM(CASE When D.Side = @entryCreditSide Then (D.[Value] * D.Rate) Else 0 End )
	from [Accounting].[Entry] E, [Accounting].[EntryDetail] D
	where E.ID = D.EntryID and D.AccountID = @accountID and (@entryStatus = 2 OR E.[Status] = @entryStatus) and E.[Date] >= @fromDate and E.[Date] <= @toDate

	RETURN coalesce(@totalDebit, 0) - coalesce(@totalCredit, 0)

END
GO
/****** Object:  UserDefinedFunction [Accounting].[GetStatementOfAccount]    Script Date: 1/21/2019 2:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.2002)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

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

	declare @financialYearStartDate date, @beforeDate date, @balance decimal, @detailValue decimal, @debitValue decimal, @creditValue decimal, @entrySide int, @entryID int, @entryDate date, @entryNotes nvarchar(MAX)

	select @financialYearStartDate = StartDate
	from [Accounting].[FinancialYear]
	where ID = @financialYearID
	
	set @creditValue = 0
	set @debitValue = 0
	set @balance = 0

	if(@fromDate = @financialYearStartDate)
	begin
		select  @balance = CASE When D.Side = 0 Then E.Value Else (E.Value * -1) End
		from [Accounting].[Entry] E, [Accounting].[EntryDetail] D
		where E.ID = D.EntryID and D.AccountID = @accountID and E.FinancialYearID = @financialYearID and E.IsOpenningBalance = 1
	end
	else
	begin
		set @beforeDate = Dateadd(DAY, -1, @fromDate)
		set @balance = [Accounting].[GetAccountBalance](@accountID, @financialYearStartDate, @beforeDate, @entryStatus)
	end

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

	insert into @tblStatementOfAccount values(0, 1, @entrySide, N'Openning Balance', @debitValue, @creditValue, Abs(@balance), @beforeDate)

	Declare @temp Table
	(
		ID int,
		Notes nvarchar(Max),
		[Date] date,
		[Status] int,
		[Value] decimal,
		Side int
	)
	insert into @temp
		select E.ID, E.Notes, E.[Date], E.[Status], D.Value * D.Rate as Value, D.Side
		from [Accounting].[Entry] E, [Accounting].[EntryDetail] D
		where E.ID = D.EntryID and D.AccountID = @accountID and E.IsOpenningBalance = 0 and (@entryStatus = 2 OR E.[Status] = @entryStatus) and E.[Date] >= @fromDate and E.[Date] <= @toDate
		order by E.[Date]

--OPEN transaction_cursor

--FETCH NEXT FROM transaction_cursor
--INTO @entryID, @entryNotes, @entryDate, @entryStatus, @detailValue, @entrySide

--WHILE @@FETCH_STATUS = 0 
WHILE exists (select 1 from @temp)  
 
BEGIN   
	select top(1) @entryID=ID ,@entryNotes= Notes,@entryDate = [Date] ,@entryStatus = [Status],@detailValue =[Value],  @entrySide = Side  from @temp; 
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

	--FETCH NEXT FROM transaction_cursor
	--INTO @entryID, @entryNotes, @entryDate, @entryStatus, @detailValue, @entrySide
	delete top(1) 
	from @temp; 
END

--CLOSE transaction_cursor
--DEALLOCATE transaction_cursor


	RETURN 
END
GO
/****** Object:  Table [Accounting].[Account]    Script Date: 1/21/2019 2:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Type] [int] NOT NULL,
	[DefaultEntrySide] [int] NOT NULL,
	[Classification] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[ParentID] [int] NULL,
	[CurrencyID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[AccountSetting]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[AccountSetting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.AccountSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[AccountTransaction]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[AccountTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[FromAccountID] [int] NOT NULL,
	[ToAccountID] [int] NOT NULL,
	[EntryID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.AccountTransaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[Entry]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Entry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[IsOpenningBalance] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
	[FinancialYearID] [int] NOT NULL,
 CONSTRAINT [PK_Accounting.Entry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[EntryDetail]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[EntryDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Side] [int] NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[EntryID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.EntryDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[EntryGuidance]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[EntryGuidance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.EntryGuidance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[EntryGuidanceDetail]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[EntryGuidanceDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntrySide] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[EntryGuidanceID] [int] NOT NULL,
	[ValueType] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.EntryGuidanceDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[FinancialYear]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[FinancialYear](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Year] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.FinancialYear] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Accounting].[PendingEntryRequest]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[PendingEntryRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EntryID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accounting.PendingEntryRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bank].[Bank]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bank].[Bank](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Bank.Bank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bank].[BankAccount]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bank].[BankAccount](
	[ID] [int] NOT NULL,
	[BankID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Bank.BankAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cashier].[Cashier]    Script Date: 1/21/2019 2:30:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cashier].[Cashier](
	[ID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Cashier.Cashier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cashier].[CashierAccountTransaction]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cashier].[CashierAccountTransaction](
	[ID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[ExchangeRate] [decimal](18, 2) NOT NULL,
	[IsOpeningBalance] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Cashier.CashierAccountTransaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cashier].[ChequeExchange]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cashier].[ChequeExchange](
	[ID] [int] NOT NULL,
	[DocumentNumber] [nvarchar](max) NULL,
	[DocumentType] [int] NOT NULL,
	[BankAccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Cashier.ChequeExchange] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cashier].[MoneyExchange]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cashier].[MoneyExchange](
	[ID] [int] NOT NULL,
	[FromCurrencyID] [int] NOT NULL,
	[ToCurrencyID] [int] NOT NULL,
	[FromAmount] [decimal](18, 2) NOT NULL,
	[ToAmount] [decimal](18, 2) NOT NULL,
	[FromExchangeRate] [decimal](18, 2) NOT NULL,
	[ToExchangeRate] [decimal](18, 2) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NationalID] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Cashier.MoneyExchange] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cashier].[MoneyTransfer]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cashier].[MoneyTransfer](
	[ID] [int] NOT NULL,
	[ToRequestID] [int] NULL,
	[Number] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[FromAccountID] [int] NOT NULL,
	[FromCurrencyID] [int] NOT NULL,
	[FromExchangeRate] [decimal](18, 2) NOT NULL,
	[ToAccountID] [int] NOT NULL,
	[ToCurrencyID] [int] NOT NULL,
	[ToExchangeRate] [decimal](18, 2) NOT NULL,
	[Active] [bit] NOT NULL,
	[Paused] [bit] NOT NULL,
	[DocumentType] [int] NOT NULL,
	[DocumentNumber] [int] NOT NULL,
	[RecipientName] [nvarchar](250) NULL,
	[RecipientMobile] [nvarchar](250) NULL,
	[RecipientNID] [nvarchar](250) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Request_ID] [int] NULL,
 CONSTRAINT [PK_Cashier.MoneyTransfer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cashier].[Request]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cashier].[Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[AccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChequeExchange_ID] [int] NULL,
 CONSTRAINT [PK_Cashier.Request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ClientAccount].[ClientAccount]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClientAccount].[ClientAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[Mobile] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](250) NULL,
	[ViewPermission] [int] NOT NULL,
	[BalanceStartDate] [datetime] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[CssClass] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ClientAccount.ClientAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ClientAccount].[ClientAccountType]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ClientAccount].[ClientAccountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ClientAccount.ClientAccountType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CreditCard].[CardReceiptFromGuarantor]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CreditCard].[CardReceiptFromGuarantor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Time] [time](7) NOT NULL,
	[GuarantorID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CreditCard.CardReceiptFromGuarantor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CreditCard].[CardReceiptFromGuarantorDetail]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CreditCard].[CardReceiptFromGuarantorDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[PIN] [int] NOT NULL,
	[ExpectedBalance] [decimal](18, 2) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[TransactionValue] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[CardID] [int] NOT NULL,
	[ReceiptID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CreditCard.CardReceiptFromGuarantorDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CreditCard].[CreditCard]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CreditCard].[CreditCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[HolderName] [nvarchar](250) NOT NULL,
	[Type] [int] NOT NULL,
	[BankID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CreditCard.CreditCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CreditCard].[Guarantor]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CreditCard].[Guarantor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Mobile1] [nvarchar](250) NOT NULL,
	[Mobile2] [nvarchar](250) NULL,
	[Mobile3] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CreditCard.Guarantor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Currency].[CashierCurrency]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Currency].[CashierCurrency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CashierID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Currency.CashierCurrency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Currency].[Currency]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Currency].[Currency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[Icon] [nvarchar](250) NULL,
	[Symbol] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsDefaultCurrency] [bit] NOT NULL,
 CONSTRAINT [PK_Currency.Currency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Currency].[ExchangeRate]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Currency].[ExchangeRate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[Buy] [decimal](18, 2) NOT NULL,
	[Sell] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Currency.ExchangeRate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ItemVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHILD]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHILD](
	[CID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARENT]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARENT](
	[PID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Employee]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[GovernorateID] [int] NOT NULL,
	[QualificationID] [int] NOT NULL,
	[GenderID] [int] NOT NULL,
	[MaritalStatusID] [int] NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[Code] [nvarchar](250) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](60) NULL,
	[NationalID] [nvarchar](60) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Specialization] [nvarchar](250) NULL,
	[GraduationPlace] [nvarchar](250) NULL,
	[GraduationYear] [nvarchar](250) NULL,
	[Experiences] [nvarchar](250) NULL,
	[PreviousProjects] [nvarchar](250) NULL,
	[Language] [nvarchar](250) NULL,
	[EliminationCauses] [nvarchar](250) NULL,
	[EliminationDate] [datetime] NULL,
	[BankAccountNumber] [nvarchar](250) NULL,
	[BankCardNumber] [nvarchar](250) NULL,
	[BankBranchName] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_HR.Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[Job]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Job](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_HR.Job] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Location].[Country]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Location.Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Location].[Governorate]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[Governorate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[CountryID] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Location.Governorate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Location].[Region]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[Region](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[GovernorateID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Location.Region] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Log].[ApplicationLog]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Log].[ApplicationLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogTypeID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[IP] [nvarchar](250) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Log.ApplicationLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Mail].[MailAccount]    Script Date: 1/21/2019 2:30:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mail].[MailAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[SMTP] [nvarchar](250) NOT NULL,
	[IsSSL] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Mail.MailAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Module].[Module]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Module].[Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[Link] [nvarchar](250) NOT NULL,
	[CssClass] [nvarchar](250) NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Module.Module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Module].[UserRoleModule]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Module].[UserRoleModule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[UserRoleID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Module.UserRoleModule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Project].[Client]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project.Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Project].[Project]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GovernorateID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TimeFrom] [datetime] NOT NULL,
	[TimeTo] [datetime] NOT NULL,
	[DelayTolerance] [int] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project.Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Project].[ProjectEmplyee]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectEmplyee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project.ProjectEmplyee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Project].[ProjectGroup]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[SupervisorName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project.ProjectGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Project].[ProjectJobRate]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectJobRate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[HourRate] [decimal](18, 2) NOT NULL,
	[OverTimeHourRate] [decimal](18, 2) NOT NULL,
	[OffDayHourRate] [decimal](18, 2) NOT NULL,
	[OffDayOverTimeHourRate] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project.ProjectJobRate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Template].[Template]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Template].[Template](
	[ID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[NameArabic] [nvarchar](200) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[TitleArabic] [nvarchar](250) NOT NULL,
	[TitleEnglish] [nvarchar](250) NOT NULL,
	[TextArabic] [nvarchar](max) NOT NULL,
	[TextEnglish] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Template.Template] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Template].[TemplateSection]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Template].[TemplateSection](
	[ID] [int] NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Template.TemplateSection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Treasury].[Transaction]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Treasury].[Transaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DefaultExchangeRate] [decimal](18, 2) NOT NULL,
	[ExchangeRate] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[RequestID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Treasury.Transaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[AutoLoginRequest]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[AutoLoginRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TokenID] [int] NOT NULL,
	[Code] [nvarchar](250) NOT NULL,
	[IP] [nvarchar](250) NOT NULL,
	[UserAgent] [nvarchar](max) NULL,
	[ReturnUrl] [nvarchar](max) NULL,
	[UsageDate] [datetime] NULL,
	[Role] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.AutoLoginRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[ExternalLoginRequest]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[ExternalLoginRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderID] [int] NOT NULL,
	[UserID] [int] NULL,
	[UserData] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.ExternalLoginRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[Page]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[TextArabic] [nvarchar](250) NULL,
	[TextEnglish] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Link] [nvarchar](250) NOT NULL,
	[CssClass] [nvarchar](250) NULL,
	[DisplayOrder] [int] NOT NULL,
	[ParentPageID] [int] NULL,
	[ModuleID] [int] NOT NULL,
 CONSTRAINT [PK_Page.Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[PageAction]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[PageAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[CssClass] [nvarchar](250) NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.PageAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[PageActionRole]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[PageActionRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageActionID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.PageActionRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[Provider]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Provider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[LoginCount] [int] NOT NULL,
	[RegisterCount] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.Provider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[ResetPasswordRequest]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[ResetPasswordRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Confirmed] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.ResetPasswordRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[Role]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameArabic] [nvarchar](250) NOT NULL,
	[NameEnglish] [nvarchar](250) NOT NULL,
	[RedirectUrl] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[Token]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Token](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Code] [nvarchar](250) NOT NULL,
	[IP] [nvarchar](250) NOT NULL,
	[UserAgent] [nvarchar](max) NULL,
	[ParentTokenID] [int] NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[LoggedOutDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[ProviderID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.Token] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[TokenLog]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[TokenLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TokenID] [int] NOT NULL,
	[IP] [nvarchar](250) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
	[IsAuthorized] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.TokenLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[User]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Mobile] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NOT NULL,
	[LastActivity] [datetime] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[ProviderID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[UserRole]    Script Date: 1/21/2019 2:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[UserRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User.UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Accounting].[Account] ON 

INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'a63969c7-af08-43c8-967a-562635617a6b', N'مصروفات', 3, 0, 0, CAST(0.00 AS Decimal(18, 2)), NULL, 3, CAST(N'2019-01-08T17:13:56.813' AS DateTime), N'1', NULL, NULL, 1)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, N'1c075b58-4ef3-4d6f-b9a6-42f5bb05595b', N'ايرادات', 3, 1, 0, CAST(0.00 AS Decimal(18, 2)), NULL, 3, CAST(N'2019-01-08T17:13:56.873' AS DateTime), N'1', NULL, NULL, 1)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, N'9f3c657c-eadb-49db-8820-d589fc5683c2', N'أصول', 3, 1, 0, CAST(0.00 AS Decimal(18, 2)), NULL, 3, CAST(N'2019-01-08T17:13:56.877' AS DateTime), N'1', NULL, NULL, 1)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, N'1', N'اصول', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2019-01-09T17:55:44.347' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, N'1-1', N'خزن', 1, 0, 0, CAST(0.00 AS Decimal(18, 2)), 4, 1, CAST(N'2019-01-09T17:56:34.087' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, N'1-1-1', N'خزنة فرعية أ', 3, 0, 0, CAST(0.00 AS Decimal(18, 2)), 5, 1, CAST(N'2019-01-09T17:57:11.857' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (7, N'2', N'ايرادات', 0, 1, 2, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2019-01-09T17:58:23.810' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (8, N'2-2', N'تحصيل فورى', 1, 1, 2, CAST(0.00 AS Decimal(18, 2)), 7, 1, CAST(N'2019-01-09T17:59:14.420' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (9, N'2-2-2', N'دفع نقدي', 3, 1, 2, CAST(0.00 AS Decimal(18, 2)), 8, 1, CAST(N'2019-01-09T17:59:52.407' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (10, N'3', N'مصروفات', 0, 0, 3, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2019-01-09T18:17:57.480' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (11, N'3-1', N'قبض', 1, 0, 3, CAST(0.00 AS Decimal(18, 2)), 10, 1, CAST(N'2019-01-09T18:20:30.857' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[Account] ([ID], [Code], [Name], [Type], [DefaultEntrySide], [Classification], [Balance], [ParentID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (12, N'3-1-1', N'قبض موظفين', 3, 0, 3, CAST(0.00 AS Decimal(18, 2)), 11, 1, CAST(N'2019-01-09T18:20:57.190' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [Accounting].[Account] OFF
SET IDENTITY_INSERT [Accounting].[Entry] ON 

INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (2, CAST(N'2019-01-09T00:00:00.000' AS DateTime), 1, CAST(1000.00 AS Decimal(18, 2)), N'qqqq', 1, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, NULL, NULL, 1, 4)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (3, CAST(N'2019-01-09T00:00:00.000' AS DateTime), 1, CAST(200.00 AS Decimal(18, 2)), N'qqqq', 1, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, NULL, NULL, 1, 4)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (4, CAST(N'2040-01-01T00:00:00.000' AS DateTime), 1, CAST(6000.00 AS Decimal(18, 2)), N'qqq', 0, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, NULL, NULL, 1, 5)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (5, CAST(N'2040-03-03T00:00:00.000' AS DateTime), 1, CAST(400.00 AS Decimal(18, 2)), N'qqq', 0, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, NULL, NULL, 1, 5)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (6, CAST(N'2040-05-05T00:00:00.000' AS DateTime), 1, CAST(300.00 AS Decimal(18, 2)), N'dsds', 0, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, NULL, NULL, 1, 5)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (7, CAST(N'2019-01-09T00:00:00.000' AS DateTime), 0, CAST(10.00 AS Decimal(18, 2)), N'hjhjhjh', 1, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, NULL, NULL, 1, 5)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (8, CAST(N'2020-02-02T00:00:00.000' AS DateTime), 1, CAST(2000.00 AS Decimal(18, 2)), N'ايرادات الي الخزنة', 1, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, CAST(N'2019-01-09T18:37:52.627' AS DateTime), NULL, 0, 6)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (9, CAST(N'2020-02-02T00:00:00.000' AS DateTime), 1, CAST(3000.00 AS Decimal(18, 2)), N'ايرادات الي الخزنة ايجار', 0, CAST(N'2019-01-14T13:20:09.960' AS DateTime), NULL, CAST(N'2019-01-09T18:38:19.393' AS DateTime), NULL, 0, 6)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (10, CAST(N'2020-02-02T00:00:00.000' AS DateTime), 1, CAST(500.00 AS Decimal(18, 2)), N'قبض موظفين', 0, CAST(N'2019-01-08T18:22:38.123' AS DateTime), NULL, NULL, NULL, 0, 6)
INSERT [Accounting].[Entry] ([ID], [Date], [Status], [Value], [Notes], [IsOpenningBalance], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [FinancialYearID]) VALUES (11, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 0, CAST(300.00 AS Decimal(18, 2)), N'دفع فاتورة مياه', 0, CAST(N'2019-01-21T14:25:27.393' AS DateTime), NULL, NULL, NULL, 0, 6)
SET IDENTITY_INSERT [Accounting].[Entry] OFF
SET IDENTITY_INSERT [Accounting].[EntryDetail] ON 

INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, CAST(1000.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'qqq', 2, 3, 1, CAST(N'2019-01-09T11:07:18.357' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, CAST(1000.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'aaa', 2, 2, 1, CAST(N'2019-01-09T11:07:18.383' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, CAST(200.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'qqq', 3, 3, 1, CAST(N'2019-01-09T11:07:50.033' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, CAST(200.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'aaa', 3, 2, 1, CAST(N'2019-01-09T11:07:50.033' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, CAST(500.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'l;l', 3, 2, 1, CAST(N'2001-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, CAST(6000.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'wqwq', 4, 3, 1, CAST(N'2019-01-09T13:16:41.170' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (7, CAST(6000.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'cdfd', 4, 2, 1, CAST(N'2019-01-09T13:16:41.173' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (8, CAST(400.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'qq', 5, 3, 1, CAST(N'2019-01-09T14:36:03.100' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (9, CAST(400.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'aa', 5, 1, 1, CAST(N'2019-01-09T14:36:03.107' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (10, CAST(300.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'323sa', 6, 2, 1, CAST(N'2019-01-09T14:40:43.310' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (11, CAST(300.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), N'aa', 6, 3, 1, CAST(N'2019-01-09T14:40:43.310' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (12, CAST(10.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'klkl', 7, 3, 1, CAST(N'2019-01-09T17:03:43.510' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (13, CAST(10.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'ioio', 7, 2, 1, CAST(N'2019-01-09T17:03:43.537' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (14, CAST(2000.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'', 8, 9, 1, CAST(N'2019-01-09T18:15:22.963' AS DateTime), NULL, CAST(N'2019-01-09T18:37:52.743' AS DateTime), NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (15, CAST(2000.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'', 8, 6, 1, CAST(N'2019-01-09T18:15:22.987' AS DateTime), NULL, CAST(N'2019-01-09T18:37:52.747' AS DateTime), NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (16, CAST(3000.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'', 9, 9, 1, CAST(N'2019-01-09T18:16:38.587' AS DateTime), NULL, CAST(N'2019-01-09T18:38:19.417' AS DateTime), NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (17, CAST(3000.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'', 9, 6, 1, CAST(N'2019-01-09T18:16:38.587' AS DateTime), NULL, CAST(N'2019-01-09T18:38:19.423' AS DateTime), NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (18, CAST(500.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'', 10, 12, 1, CAST(N'2019-01-09T18:22:38.133' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (19, CAST(500.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'', 10, 6, 1, CAST(N'2019-01-09T18:22:38.133' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1020, CAST(300.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), N'فففف', 11, 6, 1, CAST(N'2019-01-21T14:25:27.500' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Accounting].[EntryDetail] ([ID], [Value], [Side], [Rate], [Notes], [EntryID], [AccountID], [CurrencyID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1021, CAST(300.00 AS Decimal(18, 2)), 0, CAST(1.00 AS Decimal(18, 2)), N'ااااا', 11, 9, 1, CAST(N'2019-01-21T14:25:27.520' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [Accounting].[EntryDetail] OFF
SET IDENTITY_INSERT [Accounting].[FinancialYear] ON 

INSERT [Accounting].[FinancialYear] ([ID], [StartDate], [EndDate], [Year], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'20189', 0, CAST(N'2019-01-14T13:36:53.247' AS DateTime), NULL, CAST(N'2019-01-07T15:50:18.390' AS DateTime), NULL, 1)
INSERT [Accounting].[FinancialYear] ([ID], [StartDate], [EndDate], [Year], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, CAST(N'2019-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'2014', 0, CAST(N'2019-01-14T13:36:53.247' AS DateTime), NULL, NULL, NULL, 1)
INSERT [Accounting].[FinancialYear] ([ID], [StartDate], [EndDate], [Year], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, CAST(N'2019-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'2014', 1, CAST(N'2019-01-14T13:36:53.247' AS DateTime), NULL, NULL, NULL, 1)
INSERT [Accounting].[FinancialYear] ([ID], [StartDate], [EndDate], [Year], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, CAST(N'2021-01-01' AS Date), CAST(N'2022-12-31' AS Date), N'201345', 0, CAST(N'2019-01-14T13:36:53.247' AS DateTime), NULL, NULL, NULL, 1)
INSERT [Accounting].[FinancialYear] ([ID], [StartDate], [EndDate], [Year], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, CAST(N'2040-01-01' AS Date), CAST(N'2040-12-31' AS Date), N'2040', 0, CAST(N'2019-01-14T13:36:53.247' AS DateTime), NULL, NULL, NULL, 1)
INSERT [Accounting].[FinancialYear] ([ID], [StartDate], [EndDate], [Year], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, CAST(N'2020-01-01' AS Date), CAST(N'2020-12-31' AS Date), N'2020', 0, CAST(N'2019-01-14T13:36:53.247' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [Accounting].[FinancialYear] OFF
SET IDENTITY_INSERT [Currency].[Currency] ON 

INSERT [Currency].[Currency] ([ID], [NameArabic], [NameEnglish], [Icon], [Symbol], [IsActive], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [IsDefaultCurrency]) VALUES (1, N'جنيه', N'EG', N'  fa fa', NULL, 1, 1, CAST(N'2019-01-07T13:16:59.857' AS DateTime), N'1', CAST(N'2019-01-07T17:46:50.930' AS DateTime), NULL, 0, 0)
INSERT [Currency].[Currency] ([ID], [NameArabic], [NameEnglish], [Icon], [Symbol], [IsActive], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [IsDefaultCurrency]) VALUES (2, N'Euro', N'Euro', N'fa', NULL, 1, 1, CAST(N'2019-01-07T13:28:05.933' AS DateTime), NULL, CAST(N'2019-01-07T15:47:23.247' AS DateTime), NULL, 0, 0)
INSERT [Currency].[Currency] ([ID], [NameArabic], [NameEnglish], [Icon], [Symbol], [IsActive], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [IsDefaultCurrency]) VALUES (3, N'جنيه', N'EG', NULL, NULL, 1, 1, CAST(N'2019-01-08T17:13:56.750' AS DateTime), N'1', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [Currency].[Currency] OFF
SET IDENTITY_INSERT [Currency].[ExchangeRate] ON 

INSERT [Currency].[ExchangeRate] ([ID], [CurrencyID], [Buy], [Sell], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(N'2019-01-07T13:16:59.857' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Currency].[ExchangeRate] ([ID], [CurrencyID], [Buy], [Sell], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, 2, CAST(20.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)), CAST(N'2019-01-07T13:28:06.100' AS DateTime), NULL, NULL, NULL, 0)
INSERT [Currency].[ExchangeRate] ([ID], [CurrencyID], [Buy], [Sell], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, 2, CAST(20.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), CAST(N'2019-01-07T13:38:21.887' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [Currency].[ExchangeRate] OFF
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901071116258_init', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB721CB992D8BB23FC0F0C3ED91B674569C667BD3B21ED862E1C8D6675E12139639F2746B11B6CD699EAAEDEAA6A493C0E7F991FFC49FE050375C525714755F50531111A762191482412894402C8FC7FFFE7FFBEFCB7EFEBECEC2B2ACA34DFBC3A7FF1ECF9F919DA2CF265BA59BD3ADF550FFFF8CFE7FFF6AFFFF93FBDBC5CAEBF9FFDDEC1FD48E070CD4DF9EAFCB1AAB63F5D5C948B47B44ECA67EB7451E465FE503D5BE4EB8B64995FFCF0FCF9BF5CBC787181308A738CEBECECE5F56E53A56B54FFC03FDFE69B05DA56BB24FB942F5156B6DF71C94D8DF5EC73B246E53659A057E797D757CFDE2555727EF63A4B13DCFE0DCA1ECECF92CD26AF920A53F7D36F25BAA98A7CB3BAD9E20F4976FBB44518EE21C94AD452FDD3006EDA81E73F900E5C0C153B548B5D59E56B4B842F7E6C3972C15777E2EB79CF31CCB34BCCDBEA89F4BAE6DBABF3D78B458E197E7EC6B7F5D3DBAC20700D571BDE3F6BA1B100747FFEE96C28FE532F045856C87F7F3A7BBBCBAA5D815E6DD0AE2A92EC4F6757BBFB2C5DFC3B7ABACDFF409B579B5D96D10462127119F3017FBA2AF22D2AAAA76BF4D092FDE1DDF9D9055BEF82AFD857A3EA343DFAB0A97EFCE1FCEC336E3CB9CF503FFE54EF6FAABC40EFD10615498596574955A1020FDF8725AA3928B4CEB5F51633A46B0D0B1C66D8F9D9A7E4FB47B459558FAFCE7FF8339E233FA7DFD1B2FBD252F0DB26C5130C57AA8A1D022854B74AFE9DBE55D25EDF2A9E709D6834DF2D91BD430F0996192CA7C5D34DBA6411535F2DD1BECD92B24C1FD2453B8F446A7908CB06DE245982155587F91D5AA4EB243B3FBB2AF05FAD02FDE7F3B39B45425042C2A7C67F951458F20411D6F47A57E05A8B27BDE46BF01488CC02AC5A870EE2BF6FD3B5C34834B8DE3C051054754BBF6D9772AA8DAA4E40E487F21DCA106EAB6BE94D9E67283110C0CFC9D774550B2B87B215E8F2FCEC1A653540F9986E5969BF1B807E2EF2F5759E0D15FBB2BB9B7C57D4329D4B006E9362852A6BD26E5045D61025852DCC5DBF40097472103D311CB53C58D729539ADF26983854B473294530D52CD41344B60444A05B06E748B8925E059D3AFADCE96A3B06D3D5F5BAFB031254299048AB14D2966AD27AB7B015C9A64C1635E5CA4926AD23CE3909A8740ACAE06D6764B3AEF8AB0AC9E41375892961B7B92DB7253544A2414029A7616888CF2F2F06F3DAC4E86E3593B3EDDDD68F2638D896CC2C6DB9E6649DB628A23D7582F654586345A26D64368D939AE10C09433DD381F3264D5433F0FC6BB8E4AD12026DD5A2868A1A2AD4C684D751BA0D8CE5C644B92F01765DE20E450092EE5544C871762DBF95529A6110F98E858383E8B55D094C578006BAFBFF8929FECFF9266AD9A8659DB4AC893B45A2557DB5A9997FCA55AFCA88966B6053F2899A5352DC00884492EF52BAEA422FE3B969D6485F12D0135392A6D6F13C275297EB24CDA66FF6537E9F6621BAAB3B0A2ACB6F79B19CBE831F93B27ABDA8D2AFF5C87B2E581FCA3759BEF8C34143F3FC28F2AFE912D882C5C5F77816DF6E90C1A5A2D6F603C4B0563005C262C196DA2E5C0407BCD612BCA45458BA9802C1F2674BEDFDE5781D81E9A98B046286AF02255491D7B6631812A375B4038F6B29D816F9F77591DCA78B796E965C6E56595A3ECEB0ECE4AB74F3B6B1AB7DB65BD768959698E70150C5C563DF160F2BC39EA8390BE39E8047A504CB45E9EFFB26EC8DAE94639B903ADB496D3A351080E954FF0359724369301784A12127A546EA85D051436A6355B3D359980DCCDDA0D244123910A9D5C9C379197E16FA35EA56695B276BF05DA3655AA045F55B31831727AE2487B492107DA5D985AB9712E92EDC5F0BB2AAD5D2DE6C2A45CD08B6D530C7D766EC581D6DCF53D218DD6CD49B551DA4D4A86AFF27B3FF5828573B30B401A8A15630149D549F95CA8BAA2E1A8180D72FDDFC3183F55796F54BB0D135DBBBB4DC66C9D397A2F68FC7E5E754961F87EDBDE93AA4D9DA73AB95935EAF75ADA15AAF61A35687453880DB749E37C61FAEA66F9370EBF50A0D873640D3F8CF20772BC873A85AF62CAF135C7EDFA6452D1B4114F1C77CB542CB2FBBCA4541D6773490B5CE8AF72A4E6F3952DEAB68EE0140172BD812614FC115DB6E7DEAEA780628AE33E0D2BB7631E2A8EA4BE06B0D43B1ED0D0BE93181F67E05CC1EFF3B8A5D876C16640C1ED764B02D58EB1FC2F278FD71063BA07CBDAB1EF322FDBBFF0DBEB8641CD292D1AA5D1FCD0C2A445171BBBD75717DEE18DF39463F14C4E405153068AC697AF3B4BECF431C766A957690AD41745E9DA6EA1783B2840FE1223CE9D1067B31A5FEF2FBE231D9ACD0351E0098741AE26E584806B2410061A30143B9449CF9946FF0C242028F3C4823F974F8217880E122989CE500AC2DD36D7A6040BD29E59E54DFE636748BD000E53C909C7601D2E5E850F71ED0FDC5B2946EC9CB66272B8E9E42B6961C5D375A73F0521928DCC49BDDF0102C74C8432CA7D968C8A3DD71887647C8459B5763EAA5DDF11604A5C62D832F30754F4C8B998460C0C386FE63874ADB98A89F77EB7BEF4D8BFAE42DCC515410D5D4546A90382178BDA61F4B8557C381D6212A1C62085421C9622D9991F8D80729F4A5F8360FD5F7DB7C929E073AEB4C76A5BF1FFB5DBED8AD5117F9BAD50F6489620B1CB186D05CD798E9DB94204B820466306C6DA2C80843EF06E11DADB1CF79ED451879158876EAD1D8A91E6E0E699030894BC1C6C5A40A6BC4A0BF63A007A2A54082892D87B4F570D08BF4585E3129D3151E341BFA5BFBD590F13DB48AF12D9001E33B487BC798B9BC50B032A27B100DC9039C3DC16672E2E6C393CA88D4DB674EB7B97C50B072469BC9C600E777089B9165D82EB90C5387FD7562FB5F532F1E9568C5D75A0F640FCE14A84BF75A2C90F569BBA978ACFD1823F7EEF7147DBB42C53A2DC9A460B61D7C915B4E9B9B2A2924D7506D852CAF54FCF8F3F310FC98EC0547A8C3F468E21F9289CF24B7820C0A7ADDBA63A029834206241EAE49216D0DA137C9E60F95ED469543614C8162C1FA81606CED9ED6FC804F2D3BDB04A08F2B1268E3CBFDE229D3A3D20CAEAF894360A39903B6358F6D12EF4AC58562B4346C9EAB84B0EDD4AE274E6A8E59328C141CA941AF2427A6D14C0E2E097762C48913D404A1AC2EDE4454596636C6A196BE0608268EFCADA4AC06F0F22935CDDBA9A113D33FF1327F549C47A43829FD019B5156DA49B55B65D497F1695F819669F53629961223AF2F1788E38A44838E2BF7DBADF6C84CB7A97D05EACFA84A6175C6DCCAF0B80760A97D7EC933BCA19C676B2CDC6F19A4C4E9864B34894F51B3FBEA4CC1552AD1A9A634BDDF2545B2C1DAE01A2D50BAADDEA12A4933593AA562D9821102FBAA4D9DBB46D7D2398BB4E040EA3A7D1DCFA470AA061C960A25BEB87CC0AA86BA4AECA6F8AE3E7CF64370F97D8B16449334C77DE3DD511DF267AB16101ECABD95DF936C375E776EB000EC4A492FBA425B5F31CAD2AFA87872590F48B3DE91F89BE91BD7E2535A8B9BC56A9A454ECCD767BE309A9F20D6F85CBAD45735EE555B64DBB1AE9A677E6FB88D704B775CB4C1B642DCC4DF8FE73DFD4847957F4A2ADF636BE3AE222D3738BC66B5DEC659F5EE8EAAA6EFD9006DACF8A92A5E4ADF43CB47B53EF65E6C1E775C73BFF5C55C0DFF30D105DE1F476F679A0BBBAF97CB024D703F352EC987B42453EB86DDBAECBC7299AEC7C062E7B472F56F54ACE220B4B5E29205B635CD23D4406FCBA3423A2485A4BAB564710F9BB78F65F7B46DEFDF0F6E5E89B6ACD587087D073C95D30203BA5257C3FA32C123A9D8854C50729D071599CF4248C78003730AEDA6A4988180380F0208DC86A16C396C10D1AD432D7F0A0A434839EC1B866E102C492C74B5609B88B2A9F05AB8252573C372E597E239315BC0E45271B0A02DFCC19CC87DA753B991C3084D1269E643F9658B3678FDE60E4AE3BBBF533087D45104A4E600148F4E0F0D7815B555EC8FC9E4E105025B4FE6BD09137C80B38FEC561DA6725C6AC4832B301CD57861F04689A945DDFD8DBBDA5352E3BA57D0DC968801A7549E144AD47572D0F0FB2DAE31AE82947E767FA5E9010BEC1F1FD5514F3375A39A16DA0919C6325C50C83AE6D7B87B81DB7CE406260CEA3949339A43CB30CBF8E75AA0934C1998314C53DA703F3132E3E9ADFBDA8081ECB2C682CBFC9534141C570D060DB9557374B1AAA9758F0E68C1631A5846EE00A3A19802F44BA968EDAEBCC573B7DC154FCF4ED743699C6191DFC3EDB95BF11D7A48F0504DB20A4FB3D44F725C2C0BCC3F536CF8B8501FD242AD5C40749E55235FEAE8DE53874339158D417CA2CEA7716D452C3FC059505CE7C0B626D880064BF710081116B8226AEA93D2D4F590830A1038D86981072D28831154A114D02566BCCAF5DBB9652938F6FE8540BC0C54B863A183B70F0E6ED2911E4AD70D1050DA0918DAEBCA482B1DB60B525D2DAE41605B419428F0C6B9E6B9E3F3E6711F644FB3B9696E81C46B2027BAE8811A35F41228D1BCF2B5D26AC9563DFEA300447A854231F1B100E1BF2C588523E11787187B6436757C935249128795A3FE6A1B96E2F07D6241F647A16EAC44C7DAE9AE5C5AB50F5C77018AC5F4B9008CED0E4D9DE6976A00CCF20B942BA974F6FDC937BE96CBA78A3AF91ED7DCE7B7DDE265ACA6F163BE325D41994A71E504DBC29C214D797BDFD26A828B0AEF50B928D26DE3F31DBBADA44AC6DF825D05D0BF9643F5DBF5C7E91B8D0BECBE2DB0E6BA7757E5584BA41BBB57CF7CB5A87F61C5497AE76DBEAAB3B88F9556660EE555A2E2F50A0D4752231EFD6379DCFC56A892FA8569E9B7325921171D434CADB8EF392EB5AC3E2BC1BA02F6D171CAF6AE05A53C74208478440583F9C579CABF62959817F57019AD1D548DB86C806D917F4F33ED05D98EFBFB9FC2A5328BB9334F5115B762082A634A7BDDF5708326068A05350CC158FB76D6DB2C7F4248723CD296DE31DA9972F100E5E2210904649F2673253D7B6ACA64348AA540AE4C01C42F2244379E662FBC1AE8B886816D695EEB444F44D4B3E76FD32A9568300735CB6B07952A763BE66D15A2A17EE8C0A38200DBFA35BFF7B5F3A811F645F5975D92A50FED8102F5F8AF5E4D97BB45FB2CF023FA8A327B3AD1065BA21CD6E6A37D2CD3A448AB246B6E367128993227CBFF44771D7338D8B4CF3F7F18A5596DECD8106BC5E5BABE0A236DE49F423462F45437484B6431FEF2F0262DAA476FABE2668B1629D6357F4F34075D6156EDF745B2DC356B6F962C4288B9697B7F45892AEA4A98E6484EA022459B85F26A4CA0A8CB05FA9AE6BB127FFE1B5A54E337F831D9AC76C96A82AE5D66E93ADDD4C3F636D995D3B6E862F652E149B4F17DC2104C5A249187276CEE4D916C168F8136529A25B036D8466E64AA80E2D169778A9B49C68D14CA2726DC7C5239CE4C29C53B1F358535004019FE2EA78814DA52322C6500396D216980E01F76BF03651210612B2E83F3DA8ED75C32DA8963C8B80907DB3AD93D5F3C228AAB8DD7A352B3F3179526979EB7D06ADE4933B2EAD65049B295A2BE04DB6A99E4FD0ABD1D6A5F3C51F79CB2EE096DB5F1A6A5CEBAB3B4324DC8ED41A5D4B63F75C476605E779B7A6A6C1468D49C605B01CF6ADE6629F27F5D76B2A6EF4D95145510557FB909B364904A64C20741749B7BA3C11A3BC1D3314305FD70DEF12DE4444EAFB8A1894685D75D8C5AA9AAD6E8BB0E44589BDB12D99ADC1587BDE3E66C39689C53BC8111CAFFD8E195B81F8162293F7D9C8FEF8B7CB75572B48650F0932997719305B2E525DE0193B7F44A325B1805A11C848C541ECCEF0A613B47CC6E10D6C0D16004DB3A59FB2CAEE47125F759C94D0E75F46BB94459F24BBDCFBEBA5E23EC36D77595A830C1B602F92635F70DC2BC8ABCD9E15F5FD3322F26692E2AB0035460E16C54891D0D1BB23E1AAD3525ED745A5B296AB531B55A80DBE6BF60291A35C2D717BCAB23937BFC861E1EDE254F13353359AFA2B57B8A8B85EC3215B7B9E70EE2C552D92241838C70F065EFC5D0D01964396B1E561A2E630D705CBEC0B64ED68B11F2BC2F2AE40352C83A3FB8F5AB6F5EE1291E863B29BB3A82E1FB5DBA6C0EFB9CE2F776D5A31684679DFA855DA8D48D137812087AE6CDE520095E899EA38E3B241DA70D4DDEE9033A48EAA062B858AB2A603874B9B2867F287316BDA74A8CA1CD953768FA58E3944E718F401E324B523780BEC8EAF0ED067A93828BCAF38895A736C037A7DD6481BE61303858B504D629A2F6A0C7C7D7FE269D81D70B37EDFF9DA8AF247388080B558D4A1F6C0BFFFC9A320141DC142B09972AE0D0570914FB3AEAE823D6D19D88C23A0E98EA77430D4ABFA90045DDA684B655D544D2CDA96FA03594132033AA6B482F4DFC096BF67EE13352C0548DA877C1B674516946F2845E2565F92D2F96D3B77CF3E9768628DE1FCA9B9B8FD6AA281EE69DC8B2637EA7225999BA630968547A605B277B00758BBE57DA8E8F64EC92B6F51D1FA9F160AA33D93413DC17D1CD63FE8DCC50DA411FF5F9C9E9F36B54A2AA3386EC9C0B50D5A8EF6179819C0261036206BA939B6F1ED262EDB06B8D2A61CF5582D3BE1C9AE3C2BE5C0A04DC1290417AEDCB6FD17A9B995FF1EDC04F4C597DAE63CC6AAC02B460632D8FF98CFFF911DAB72429E35C967DDD7834ED4FDEB48F6BEF21ADBDADCA0597DF6EA5BAEB818655972F13165B0120C81ADB5362B5D4B6B5E28A1B5D41D1997CCADAAE5308F0353D2B7DC75FC2932A44337DB75B53DAAE3DB36B2E3E7D287FCE9255D9F7D5ECEA0546D8DFBF23A521741F1EBE252AB2273CDCB46E6279FF099160E8BD5151A1554EF2F4D437B95E9D3F17C68A81BFD9DD0B555EA8ABFC82323CC2FDB9685B49BCF5C054E2C17F1487A91910C5205137F23C86A8C732CF00BD43F769653A3A583F2D29E8170E4C6B19FF36C3BBF03EB74E08196731CEC3CCD76589488C05336E7E4CF1B29BB5E9AECC64FD1A7D459B1D05AF1173920A635352F03FAAE11B8BA185FD6FEEC37B83AAAA655B88B1A5D0CDA5C6F02A81DB920DAD116FD8B7001E5CA111CDC38FDB22D9940FC40D67A8381E89B3CD54CA3F6C4A6C1EAC91B93A7F87B67999FAA9F3DF53F4ED0A15EBB42C7D55128B6A9E216AB098B2FCAA48BFD6B620CC6F230636AB03C987E22DE12CAA7918F82929F1368AD0602AE5BFA765E2B53852DD26132CA9EDC890CC64B1CE2598C5E23129912957F1445A6055505FFC3013E67AE3F17AADB2072D87A3CB9E1764141A64F330FF1A2D10DEF42EC9BEE6FD2EC1F250E5C65A1CEFC6705D2C46F935DA16A824A3D26CA14DAD17BC53446DEB12145A45DF912052EFA2F4BB0D52C0E906A39CC96E610D76EDF8DE7B5AF721F9B8170CFCB03165DE979D1FEB9A7DA0BF9EA1F0CCA4DFD16659FB830CD57B5ED61E1E1FD609B9587DF8C7219B8789BFA4ABC736FDAC9C39C2F6136B46BC4C32696B4D15EBCF1848EE0F01F6895EDBC42ECFADC7383528E6320D33736304AD6968173B844BE1EBC13406D35CBC2B0A0B99BEC198E5EC1356B0F46B8EADC5A5A91CFF8F74997FA3C03D5C1EC2637F7F138243399309B12B0AB4593CBDD93D5968F5AED60DCA32BA9A87CB107E151C94CB3DDE798D736EEBA25B409394AF61C4E5D765992FD29A492CA3BB97B02547EBE56679D61C75F080C3D9EF13FF96FBFCEC136656BAC5EC49AB27DC9967CFC419AFC0DC9FB26831FF8380F61A3DA082DC904CB2B739F12925E9A6128F6BD3CD22DD2699A66F5C3DC3835EC2FCBE05BEE41DDA92456C53693A6FD2F45552B4F94F4402FA76B833681D7F5E5E503262243AADA3B67F9EAD19660E5C21462DA47ECCB56D980B9428A73E0225A1633AB19230DB84002A82C42CD2D5BADFBB45452B5E127848BE38501B0193B532B98469089940C4340C3F201933952D03997290A5D965683ED939649961C59F9CE7EAC659A86121472AFB498E1F90286BDDE72559D22E4F286352B698D0D0569E4DDAEA870A7D480599043050905435CF27CC55138B1010A321CA8381A9EF2442200913880DC84B236B9C8AE6329BAC903EDC917F94B2D243C964A5C660292F0352405E2084010545687B2241111869D22E819F5F486A95A01D4FF649552021615E5F69B4546821A1DB9E524868469AB4DB3DDF9C55483EE5CB1DA6BDF99F5658186895D0B4F81C44876D0210211875602102A998509840469BB4DFD4D817B1EA7588E1A8F773694CD1EA1B91E8A70916320925D30B18CF7053BD35EB02577BE3F526330B0689540D6123491CCA59AC669886094407E6E741D8CD35E91FF3D55D33E2CAE1EDC1A4128321AC8566C00A080D288721C545687D2A71119869D2705D6166EDA2B49D0790805A650693596C7832357250C672E767520A050D64E1F6D39C9C3258A7950EA8E9099D7AB612329F7474C723DD1FDA8376690D506E247E5CA5D4481B98FCE05DDBD729444AC70E233F715B773639BBFCBE784C362B54E7FEEAA54226022034245F34A0CDAA0537009D47180BB0938029E99840B8948C3E08C16AF23C73D754EA7B5852FD22AB012A301AD8EAF454DA0A2465347073896C9C555147D414FA4CC77E131AA86AB349DE9B64F307D70DA9CC01B090B4516096A616D4804ED0461232052913889782D3FB6D88F56FB1EE4817E4DA8B850375560F62A5B038C480F4D4848DA499E0D6A7D04730434D5A26F033EEEB48BCC0054AB715F372AECDB6520FBF7C63A6AD0BEF0255D5ECEE16E90980D49754B2836D1B8DE99A6437693C4C46B61A86DF3B71BD1B1E4DDA0ACB50D54658438829D53220A5D2A646165291AA1965541C1C1362FA4A7B27A7ED9C6B8B5C356B5B34AB72ED68006FDF99CD9969B42D47E8FC0A971B3D1382DA2A7BB14951DA953CA0E5F644258F02EA694D4B59F3136F460ECAB8EC0251EBF6B51C1C24347D047D7381E1B1CEB49195903181DC48D86AE11999FBB8498C38A1F7FAEAAB2A8EA6C45A0E6F1D544D4FEF1C36276A92A5D174700EC36D2CED4EA7AFEC45A59BB53E426A76A2AA681CBADC0C6BE0D1A59423695621E5C666BF5D817564BAEE68E68EB6BAA47221AD024A23036DA527E5ED488CBA919F8869E99942EAB4CC37B5F7E65EBC3FE51BF4D477846C81B48BB6BC0A24790CB48DE0299A997E61D6133381D4E9196F42045D6F4FC44EB70083D0D6C2A65968E146265F5C95644C2E6487B488B294DFE6968A6CA830A21AA31A995B8989A44C2E5D22CB4D48186AED8BBDC60A87A125C5B2C2DA66D36D1B548D81CF9414F23D8EE906D234BDF1068EC35E2BBA4E297302A2F3AD71FD0EEBB8E39043CACD529C1D18520F6517155C7E9F1506B7608866EE49F0CB66DD10C65CC9769B3701363E3853AF9BA39F6D4F3C6B33FBD20EDE7B66E32F33F4900510A8D9ACF4799D5E9E6EAEB6CABC867AA7F5EA7DACCED925AD2135D50D95AA612B331D4769099ACA6257B1DED4E7B0179E2EA623466E07A886B5D499B81EC086E6713FA8489945E40ECE0DD1537F9BDBE9B61E7E44CD36B4B1177A4D2067721113986EE686D82F8D46F261D8E8B31E7E5449B35764E1420F68689941CC1CF4585F69FE07A344131B6EB11575823F1A059AF0DC6A3B3BB8F4BD9EC2BFA567CCC19C13F57DB195BB91656ECFE46D7E597397B3FD91B1DBDC56CAF81AC1E54C68606E4993F5784A599331E5500E8FBA7E90901126D17A61F8E0B2C6A19F2F54AFBABF534A1ACC9283D06A97240357FB8A41B7050560C1D00B039855E40500FBE491C515444C20500A069BB43EF74693265F1FC903001E499AE60CE3A1206362813AC8F324BA03F5DF46F254FF3D923035B801496AC81B5F8C180226962186B1266DD715E64EF4439F83A98548564191ECC7F17852DAD2C492A5A3630201D331FD60E48C3EF6A27AA34F4D26A96791A9CC244D99AC15B9916525DB3EE2A7E3C07452A8E392A94B6C6E5BAC375E731781046B051647B88D7D104665EF2714452587CCBC18B38BE1AECA3FE6AB74D31FAA284315C3E0A0E07190566B2FDCCAC4218CD5544C21664A669BC9D79C218DDFE75F51B1C98B3A42219172856107C042524581D90814841DDA6BB6448E234F0A2226102605838D369A4D95F9F699EB6D963F2174474B80743B080083BBCD16CE6AAB09E1864209C92535D49E5341C914DB4E05934D9AA7AACD2F55BFE6F77A69C240C1A588E004A487D033B2D4502D4F292D14134D9AC5E0B34907A6E66F685111D209E5FD38CB0655020FC90C0B6A2339B24620B7844430034992869209844AC37023BF445B676E21BB6BEEEBE964AB05538894832C7548A5B708C71520AEF9E9E48663A6911954D7985D584C8C200036B0D8CC6E01290899508A0ED8FE69BBF0BEC877DBBB4E1234C3CE002B24AA8673102B163F9CEB0A92D8B0320552319D50814C3669BEAD32B74461B3AD4E4CA0B2AB45508534B5500EF244E39FD4D296B73F9D1C01CC3D10ABBBA3DC502B71E0A34AD2DCBA4942C7F45275B8FAA9DB32184A17073EEA8E6E6EE992D031FD76EE00A5EB1AADC8E9B889792E82C2810B5696F71600BCB3D8E6723A26902439730FC532AFEF4BBCDFA5CB64B34036D73FE13AD2BB562CB8F59D2B496BF35C0B5513338593533F002654CC7D260C7583F9662581CCB789E4906D537663ABEFCE74320912369364820363E433A52BCE9897B0C25A3AC99813F22B5D766E652D384FA158C12E5FA1AA418B54DEC1F2161AD03385449A0C84A1CD376F966FB027CA9CBDD21A9309A04D5EDF700FB9B5A4CC2577079516FA1A95A8BA4ACAF25B4E729E18C89BB406BCE51081ED3620B2C6A6CD23ADA563927D8886F17B2F6CB708EFC6EBFD136A6E76CA869D07042385B5305661C278BCD02DC016A6A371A45861124A26902319734D9A6EAB4C2441D836C43CC775B089B941C56031A615791B7BB6D89555BE4E369BBCAAEBFE84A5FB6D5690C12C5F9D57C54EDC5C108437A8623747185553026D3105610251E00F55BA592930B5105A84EC7BDABA9F024AE1CDAD194E052A2D0AA238A0FA8DD2D554EECC2A08C160A21A50402458460529D322912130AADCB5F2295FEED47434105A8472448608EA3BB950FDF62EB349756CBC4831E032BD702925D55444E914E4102236C5BB96AF4CC80688BD4C78045D0FE9F057602FD9F85836E86A65A543D9E402D7A0A532474008992C1C06A86438F4DDEBB3B382FDA272B76AB5962A0D1FACCCD4C9131D1BB4694ADB8812AB399AD60004755967679BAD0AD09321E93A013DCFD135C3C47806717351A04D66B70A1F17B75CA704D51DB7E9AA192B1D7848BC64B082BD6C1E1918D47F92CF1BAA58DFC72DB1856B7B4BB272B0107A84DCCB1410A5F000482774AD8928CE30FAB04A87A47EA72059D8BAE71D3ACEB7774241B6F7776A35487ECDEFA1FAF57513BDE9459D834A0C30E6B0D90CA10293C902B8418A85D49486FA62938290F6D69819B2F61E82025D7FD943AB9A579299DF9DC09ACCD6CE272E9DAFC389830D3A8D12E08F4EB4569BE80083AD37C8EFA8D3F3980285414315EBC73881570AF2DD603C45C70B3CBA90B34BB7FAB4BB7170E9E95D1C8648DAEDB90A57EFD6E050525B70613DBB1B4681026357B30186F70B888F813BD0DEADD3F787DE920B0E0605A2CE8F638088F13660487336B43BF8FEE85CCE0C1E52DB13AE82823183A341CF1F1EEBB85CE29C122A36C940E53D92D4801805385014AC92219E8457063C32E78D014F8C5831310B80E192334304D67747A8E3CD201123C02AAD183AF0ACF6F60F0E33914F2C80BC270C1CC48FD6DDA760068B026000E5F40BD271D2EC5DE3A7833B3E00A8A9EEE1641D6F9D849ACE0F6880CE83287C3ADEF859151D170FED608A99A33AF78E3387703AC1F1E878E308BDEBFCA17206B080FA1E30F02A86F44E5A03B6B04801F64890F93368F0806B59D4831AF7A71FF5B06CEAD14AE428D4246A425DA8F4260721EF010B08F1A373C92BD8C021195977768EFC361A8BACF7038486F01E50DAFBC62FA463C080076000CC45E7B197694FAA54375C32BD693CDE636BCCCE3A91F59529D71B39B2FE5A594AA3F7B933DBBB3F543B5539B0A223B23A206B0CB71C529CE35ADCF411DA10B21560140C28EF10080F31883BE453F008460999D921ED6BE6D0ADDB0735876F8038498115432FAB038A1377ECA81229295E8865C0F9A337EBE874F78A5D2D0426EF16000D318A3DF954B009C2A7635010B9EA0F3DEF9A2354409A3810C558B390A0E4D047B02AB1E15001BC688F8203AC4EAAA3D9BBE640185AB4F4D554CB90B636BCC4690E9E952B9FBE4948E4E4231690D977D4F9B239AFA95AF6FD1E2ADB70DA8DC7545B008BE5C8C38B735BE420D15D4D67096B8B2696EBAE55D0116638C69EAB8E4CB30A3066EB834CB73A2D36636BD7EE3AB062E5E541E484739010138653300503783C93ACB4B26B2A4A83D7A09676AFA3A8ACD846813746F41B2B5563A31BC95212FA334F1B0E83090A0DFBCC272B1C93BF7CD24283D9E0C25CE62AD41D73690FE0AA1C5AD1456925908FFCED2D15F3E49825BA2FE0CC672E7DDDD189EA20CE29A0E5FD93578238C75F5353304E8178ECD9CC36AD98C130A0699F1433D5994FD3CC48B6CD2155989E4714AC6997862A413945A11D7D75607500771553ABC258786355C37637AC1AE358099DE9A886C5C39AE3EFC5CA8D3A0E526F93717DF435F138749090A907C0834BFC657F399754991CC16E491239BA724992B6911725AA2FFEC71F8616B0A5CD6B6AE51ADB5DB358B286B6AB9DB56A689F3A7166C215AF4F504DE537912E7920B0667182EA48173DE99430C43BC5D6536C5D674D81C036DDD35955AE6C9B43CEFAF4257A760DA0A69DEA6B0465D580757AF9EA53C09BB0CB56B684A4F481D835D11E5A919B5E752CAC4B650F1FE22A92D97B1C0D2BF2D78F692EC852ABABD866CFB2F0EC9A935542867015B3D4E9C4E1CE49138A7B304C9A437C12967149AE550C53E5C386BB26C988EDC12C4912EC912FFB5E02C99AA1CB1ABA9CCEECBD0A455667FAA206F35E50754F4391C779A45B2C50DE610D5F4CEEB0A83214FB7266B21D0DDDE865F33E51CD994B319196B417974C222D5F9E5C3289B3386C61B80178F1A54C91C2CA7B23ABA278BD63BCEB93E29E8261D2D4A68AE75F46D950A12E6AF3A11AA8112BBC72F5A41A1D0F6EC2593915BC3448E309F6589DC8D3958FEAD49DE373114E2A09B1CF20FD24DB4375024ABA6BE21B7515E7D42927C7B8E60CA5470458A4CDA2C8F4439547915EC1DAB7F60A8EA87226D2988607F7FE4B2194E40F5A0DB5C900D9254C950E9056CAC3BB7FD582A84A00A865B10F57EAD8010A6E08C93660BAE9441BEEBDA7D36950589AB007DE7D96A55E03BA6F94A58DE9832E4F1BFBA8830DC5A0608D2E339B09AFDD59D525109373084C3106F5804F3226F2C388117C5A31D6D1D6449308D67B8DC6D026CE023BA0D11756CC984A5B80299DE41C51A47E82BA01277F1279D285F9D033064EF764C06577DED0C989E49C91A630827A01253112FB30C42BD1F3054A5B349A9EE593EDE8B9622C31B2C43C61B833A9DCF04963F48B913197640966C22C45D37009487E021EECAB53A470A7F0D22429CC39C44ABB3957A44519C56653A4EF90B9774CB27D88AE194DBE0FDEE523C414D2B97E34193E4674182A3350183291AD64D755E6DB680C655B91B88AE8C85201DE14AA1227806F0B8D332DB0DD35CAB54077150E4DA57C7368925D81D577C15E69CB03FF9B3251F3AE579F27203CF3C67EFE2B8F5E0F2E16326095A697D481970E1158B790C8D08FC834210A3B74E54919A99DBD9F248BD54EBBB9862067AA9B4EB2E8EC00A621D299313F5E5E3478FA78E27DD9CB8B9BC5235A27ED879717186481B6D52EC93EE54B94955DC1A764BB25C1B7869AED97B39B6DB2204786FF78737EF67D9D6DCA57E78F55B5FDE9E2A2AC5197CFD6E9A2C8CBFCA17AB6C8D717C932BFF8E1F9F37FB978F1E262DDE0B858303EDE971CB57D4B15B63856882B25BEB325FA392DCAEA5D5225F7498947E0ED722D80D51F8493D4973D8BBB66B800E9E2A81178F278B8AB40FE6E55D9F5D53342C43389D531B0ED67DC9335DED6D79D42E2F22FD6C4756F164996145D6C7A2A26FEDB3CDBAD37F218F9F2DA84776CFDE68B3906F22F8BA1F9628EA179664E6380A23EAB30BC430FC92EABEA35FE26E57B24965AF027C33A2A7D6883BA729CE2CACCB1BEC1DF6AF38B46D77F34C7739590EC02BC040C5F2DFAD99ED3F2B8E8EF16D80A8435D5F25DBD7961D0D105D6F8DE3C81D8DE08B16855B87EDB2E61DA98026B7C3C6DD467735C1FCA772843B81A37A587CF22AE97179C4AE115D685A0B1B87583D78036FAF1A60BCAE8A3265B24EEDA528A601CA5E9AFB05ABA7932A8CF71B2C5C9D64F3693E08F06D38D4F9E623FDFB41846B2529A6685C569F83CD74A1727729CC8F613D96FFEBACFDBA9E66B9C15715658CC8AC6BFE33425202F96C17C80AB8D3319FC37C897EB3A23018DA2FD648EE3537E9F661C1DDD379B0D67E3B1E3379CDD57734C1F93B27ABDA8D2AF7848586C6C898DC0BFC9F2C51FA2C0F79F2DFA4965C3657AAAC8922BC71655D8D1ABB0E140C4498DC98E810C5499BCEA78EAEC7591DCA70B51A975DFEDB05D6E56595A3E8AE8FA020BB5420E61DE3607C48C52A1BE9B6323C7DD6585F73B2242AE282A83A80C187BA689E0ED6CD34051CA0DED1AB8EA38CAA04BAACC8CAE24D1B21C0BA198C7D27D8B132B4EAC7E62794C2AC70935E564DAEF95F51A2DD3022DAADF8A8C5F09A982385DE37415D6C12E4186D76A08A737B158136508C699CC4D6B3C8EE1ABDD1A0BAD90F4F738EDE2B4EBA79DD774739E66D34EAFFD5E2B3FA6242033B3FF4CC5FCE12A0C6FCBB2BE5EC2CDAAFEABC5DD98B4DC66C9D397A2BE96CADC8B614AA20A892AA45721EDEB5C270D02BE3D365020927AFBBC71F5BF3DF7E18AEBC5956D2F5EAF10EF9BA23EDBDE25AB0701BE50D617591C5C7CDFA6457D3B4E9C907C99958F6F85965F769588942BB239B1ACD2AF1CB2EE5B3C36887A764C3D5B278D7357B5B8BAABB605AB8EA37041C5E2A0523C15E6F5474EC0C8071BD17ABDAB1EF322FDBB285D74499CE471920F977E7CAFED79DCD79BF8A2DE7E6FCB3E2CF82BFCCD17730C374FEBFB9CF37F76DFACB408606E0C5FE3E62EEAA3A67C147DC4E6A2745249340A07B5A4AE3E8E6A0A7BEFF7CD8E139AFA8385224119AF46EA2F71A2C6894A39723501738DFCB9140E27B7AEB2FE589B85F649B0B861A00A2C0C89DDFA9E5F20BB6F537A7BC409613B136E53FE3269F3C5C2D3B1162F3375DFE6D2A654C04A1E215764875346255F66879559BD04BC6CA98DCC4B38C014D8E093F59E2DB1C128EF395F36B9E72DD995BC4AEFBE59CCCF7CB1235A507CE0C796D8638434105F66731763916E495438F293BF8DC11439E0846E8A0B852EB40A57BC98120B6D9ED7F11418659E832116E438A2F574F4D6139786C4CDF542E370F1BFA8EB8F633D51F9ED252FB0BA223B578CE883B13A0BDA9F472C8FD8A6E5968AE693398EDF53F4ED0A15EBB42C85B8107C99C5AE32A94340DC5449011C6E89A5763A535499F3DC4808E7FE8A5AFCB4B438C11D4293D7569CA73687718CE756F7D3BED1E51C67718D699E59CC64BC769ABF8A0CDF063357597B9C394B9AE43174DFE2DC887383991B1E93C27136C413E138BD4E627A61DE2FD3EA6D522C5D2DC71E818BC9A8A83CD2840B72D6F14B9E612B4EB43BE9EF169E63EF806971358DD3DD6CBA27249EF002A5DB8A9CC6BCDF2545B2C193B20B2CEEA60294489DE231D9211CE94A84F781E6D587CF9C238D7CB0BA208E16441C132020AA5068A170864C6C80EEE10B9DF0FE9E643B39E2B6D4E2424895543BCEB9D67DB3D89CA30C6FE78B27E0A09929B190112CA962DCBDE69BD521109175E004A8FB1C957854E25A251E587D0754DC8765DDEDC33D949E753C439882A816A25AE8D582AF1EF099F893CFF47D88CCDF9CADBE800E5C5FD8E3F901C2F3833D9E1F213C3F4E7D02FC7AB92C107F1CDA7F8C7A2BEAAD216C519711C7496BB5B55D8217C96A8E649B04B897152307C799651F4FDB2C69BC79846D119F7BCC6D135C23591041EF6807487A11E4E6B9FC0EB2EB0DE40FE5972DDAE0A104BD506269D44051030D1AE8912CB29DE8B9AA1D06898BAED1201847C18C73B93DFC257CEAF6077486148D0B337CA736B53F91A76F9E339BC1E1FAFC6EEA793DCED3A9F00F92EAB7618051417FB7A10FC2357CB5A36BAC4762633CC1F277147DAE033925193FB2F4F7A9AFF9470D7DF41ADA7FC3E7B7C59B6153B72FDBB02EA9AA541D8100736EF342B8A724CFD29D1EA5C794AB51DBB9A45CF5577A41DC5BF3F9B5C228B031620E847EC37F495256F3B8FA8F513944E5300475C252E11C61AE162997384E70BD91BC4DDE9756C2DCB1032EFE59DFF60B618B348E698DDF3A3AAE4DF19DA2C278F2BA154D6170D51DD3DE770E31736F52FE5A4EF3C5620F2108EE1C3B9950A645D003FBB8238A3ACC6A47B4DD66E9A2F631BA07D16691B8EC843408C65166B82928C20BF5D9E6366FC5FB5BDB4F360EA17251A4DB4A0887C21458997B8960EE2556823C6BA8F0A87E8E5FFDECAABC4E2CEB77C18F47E3A282B42846F246078AEA7F4C8954AE51B52B36409AC4FEB30D5DC90A01D374F86C41572E44F5CBE3895A5469EC75A6B472F622BDCFBFA262931789534C7065ED71B417F9778F6353900D94B847A33E5B1853C18336C5206E51AB986B955A66DD13A03422EF722F5256733C85E27791264E86A39F0C97EB6D963F21E7B39AB6BA8BCB555A759CE9F06B7ECF23683F99E3A0CC02E1A1305B648EF32FBB244B1F5A970D8F5528B4A0156D80E47FC3578B1B7049915649D61C4EF10885C2E3B1787C7781FB13203844B8E3B0B72A897AFEF2F0262D2A6EB498028B93902D5AA478AEFC3D117D7E7C99C51C2A92E5AEAE759525FC99A650E882F7AF282964689B329B5B6AF8578A360BFE3C8629B090BC027D4DF35D893FFF0D2D2A0EA9586AE12E4E36AB5DB2E2E9A43E5BF43A4BD7E9A666D85B926381EFBB58EC845B3434844273BCD4430FE8B90A506C879B04069121A6CBECB0BE2992CDE251342BF9320B1D8B8D014EC7D65F2C4EFC023D7C8F3BC868341B1BCDD86E74B497714D075319AC758A5EA8E8398AF3BEC634CFBC6F4D1DB27375DF32B3481CB4810EC1388AA16D9547427DB6D98E345B7FE1C60FF53D4EE13885C79BC27E73D77DD24E355BC770543509478413A0FEEBB118199284474E998E2E37C08CED3FDADC895A23F21084BF16D57DB5C3749B8B78C8379BFB55D8D8BACD33548877BDF9B2E93773D14C8C6B4C8D69B62C511BE497E4CF391F54DC2746051015408F695623F37D91EFB67E96668DC2DDDC9454DFFF1D22F9D7EFEEC2CD0EFFFA9A96399037842F8B93374E5E7EF2FE9ADF9397507ED3B745E23E81A508F67F0A87B86FF14BBE2BC4176AC357734C5FF0A6976C73608C62A905E6878777C993042F57668B5543B504265A3551318E12387AE51EE5A3A9EC14361AAE788ADB9A51BC7A71E21EFBC4AD1F52BFDFA5CBA4BE01E4347F191CAE0FECE5F5C799CDFB90B5C23F445A9CA1A73543FDC360B0987C67EBB46131EAA6C5B816D4678BF38480E120189680A12AE84273BC75CC0F5149509FA3A6889A62D014DF2B6CE725598097DE102A175D618466347FC5D71478E5407FB710A952C4D47DB3C3F24E0817317C8DD3394EE721AA3B5E59DBE5C835A6FB80C125A2BBAAF6480B7C80B7285749597ECB0B6E8087AF16C7049F6EB9580DCD171B69BBB9F9C84B5AFD29FAE1A2CE18E38022714E0041AABA1C4680D54ED103778BBE571075F4773B6C20754CC12C6A24D93482CF4DFBE1B3858A7DCCBF1109127D296C49547251C951870D25AABA05DD3765A588CAE920C204CD384A31CCCEC4DF1DFA36DF3CA4C59A1720EA739CC471120F1951D07A9BB95FA2E8AABBE44291561D6782DEA00514BE81FA7C34161009C5099A407481253ED808624AA28D36A68D1695F1C928E3562779EAE4168B876A966238C57D657400C5992C16BF2ECB7C91D61146800D52BD03B9E392EDC21B201854DCE1809B1AAC18961CB3608C77B749B142D0DECA683E73C8A0E94D18D6D3E24CE64DBE2BC04B2CCE6A474917DE1D2D533286671FCACFBB2C7B75FE9064253F3B759D7F79014A83BDC07C22495CEB44590FA8289502C38382F960BB720BB161F17A8E478734A0BC70F4F989F538F222EFB55E503AB5831BAA9274830A1EA4D76BED97FE77D97D209290ACD0A77C89B272A877B37844EBA46644B94D16AD87E1E7B428C9CBD9E43E295103727ED61DD1E24DD25359A175237937FF91B5EFD87A804FC9267DC05DAD0379BF3AFFE1F98B1FCECF5E67695292FD55F6707EF67D9D6DCA9F16BBB2CAD7C966935775D75F9D3F56D5F6A78B8BB26EB17CB64E17455EE60FD5B345BEBE4896F905C6F5E3C58B171768B9BEE0ABB7688DB03CFF970E4B592E999B329451C5DE4961A5E9E5BF23410C3AF1B8460F6732497A79C1577C09482369FDD5794A985ACFE0F7088F395921AF928A9CDD63A825AAE93C3F230297DC67A817BA0B25FAC681D434B0F99A14587D15E7679F92EF1FD166553DE2E1FAF3736BA48D3B3830D2E62E0DC50ACBFA5D06D1E11E923BAEB75952967D58471F4C7D36AD06C5122DD2759291C983FF2AEB59F0E29FF1B06345858B7FB0C67F9514EDEB7E8A467EAAFCF461B344DF5F9DFFAFBAD24F671FFEE75D57EF4F67F54BCB9FCE9E9FFD6FBAF1AA10131D095CA212EDD8B53ED494B56F364CB4C5DC3218FF5DA5443CDD70119BD45CB04DB8C498CE72222D5085A79132A21BC4F7A94ED469D3D9449FE285AEC20BD491A8555F6545DD70B49B397DC538718E7DE2BC4DCAC714159DAE3C9299D3F6CA61CDE82AFA49FEDC6B569CF971E61BCEFC9966BC812CC63910E7C0C87380DC9E3892256F94ED727B253730D62EFA7D583919EEFD0626F7635256F5094C3D2C9E53F943F926CB177FD84833D055EA6183E58EBCAFE9B5278FBA6DFF755B37D447A4DFBA13DA113C8DFD696D68E541DE43D5299F7C76F224FC418919E88D28CEDC0398B9C42AA9F3601EC7CCEDAEA8DAAD544D2D2F139CF0D0BEE1A656B4FD8F7D961DD10C3BD0B5F11A2DD3022DAA3A017160DC710A1EC014EC16BA4FF972773493B1E98CFDBAD3D5F35A793A8EBAADB771E93B8D797754F3ED4017BF8FE9E68FF0AB5E59D6B74A420B231B2F3B6E3F8F5A3BD457EC8E4439CCB6F71CE54ADC87ABE02849575FAFD0E055EA30FF9775F2FDBFDAFBE0C985AF5A8038AEDBE1B9FCBE4D0B2AA7A6A7AAF898AF5668F965578598D3DD638CE8BE8F5A786C2D8C05F7481431A4130C04BEADE6A58AC7D09AD71FC32BF7F2F5AE7ACC8BF4EF7E878371761FC0EC3EB2FB7607BA07FBB018EEDD87929A9BA7F57D6EE5CF3493457FB3236EE24E48C1746F08C5BC2107AB6466BF55FB6637DCFF09FDC4E60665D968C8E38C3D8019AB78467B44B7726FF3F6CDAACB5EA0AFEAB3FBFDBC5BDF7B2E80806FC7C95D126442DEA6C3C5CF0601A536FEBBFDB5E9357DC728BC2A9A5B89934CB9CE57C399CADE64B8F382ADED4D08632C8C35F2B7B933DBA9AA9ECAC79DE5745D4F22266177003765B22BFD5C11EFF2C58E044421187C146E87C75F755F63E66E496401F233B475D0231FE782FB40FB20BDA1707FCE497CBE106B5AB435E7B3352199190284585E83EC6B9A1B5BE6EEAF3ABAC77105C1687B435A707E73D654F65A5E6C15DB38EF804C04DC5E4B9A2D5B8F7823159AD6DF53F4ED0A15EBB42CC3C4EAB8A992427B1C6936E079A5EEEE9F9F5B7777AC7B2421DC98718139006706A3E06BF3EF3894FC28DA353AF7E3ECB29A5D6F92CD1FF31A4FE33B0A491FED1B6D6AC51BCCA730038E684939C0B3F3384D0E609A60C62ED3EA6D522C8F65B2301E40A9A3CA08D72F79861789512C3A5F87675CFCE2AC56CCEA84A41E5AA0745B91D39BF7BBA4483678A241299A0F76A6D387AC2E53E8EAC3679FEA97DFB768412463E4D0AAF5817F52E740F0551A14AA3A6FF4787755B006DA953EA4E2B981F7BBC55388294C66834BA03F52CB2FBC4033055D5CEB6DC5A8AA4F55551F8992F63F90DDC72B30FD28D94F6DAA6A9CDCC73EB98F6D36FB9A5CA36CA59A53C21723E1FD619C43CD1F43A31DE550F3F57259A0F0877C51771D80EE02B33C1DACE60A777D29460D3ED9B90370504CC765B9CBE4118C7197AA89E3DD9DB50F4E80A33D1A9CFD0EB9AFA766E43BF693DC2FFE507ED9A24DBA59711EB278A5E7B0B49EB99E61F3461EAB7281EF9AFB3DF309740D9EBAF6E17638146D949399ADF56BC2A39FAC7BF38A6A2F5E16D5AFD3C6352D6EF3911B98F039DA24CD403E31A745E4732D3E4926BEFD7142075FBE8F2F7E8E753D987F5FB877D911C755645DA6D82994CC349A2C988FCD390280F6FDFF61B80FA2C23C0085B937FEB4E0EF14C737E0F620BEC21E441BA89384DB37DF568B1AE6D8354C3DD047A25482489AFFBDC271EF3D86B3801AE779F49E9FD8643FAA0BDA23DF314EFDEE221DC85668461B61EE9B0E711716D5A67E17B6DD66E9A29684E389858E7B42B04B332418DE79AE02F96FDFA17251A4DB2A158321BB46354CC258498711B83D2A92435024BB2AAF73F11ED7C5C719D32A9C66869B6B54ED8A0D90B1D209DB6F65B24221E6649DCCD46335893AEC0074D8FBFC2BD61639511D47A2BEC8BF8718FB82EC7F5CF66D7D45BF2B6A81623DC5686C27A2385AB13B22A5118DF85394E3CBF536CB9FD0B1AC7EBFE6F7F64B485DC96BF9A0CC088707CE74652F32FEB24BB2F4A175EEF8F942F09888E9142D717C4A8AB44AB2E60CCA0FD5C15A35236CE84C82FC8E12E3D75A71E9631CFF937D5875E9A54D4FC46409F8F2F0262DAA47EFE5EA668B16299E8B7F4F2017A0EF7AF0BE4896BB1AF355962CAC04CC0EFD5F51223CD7F0C54EA2001529DA2CC4E31EEF17DD05FA9AE6BB127FFE1B5A54C1F17F4C36AB5DB20A4FF86596AED34DCDF2B72443C4980D84B074A8872FF09B1E5F7A490324CECB78D8DF14C966F1686BF71ADDDDAEED96B038470A2B1077AB2762E5630BF7480CFC033504A37F29CE58AB19DBDA30647B7E3CBBF3B653F65BE4BEA2DFEDE1D6D7E17039A8AFE997363DCEDE939ABD47326DF7C4BBD524407138216AEB79E7803A40BB235C4EA4CB4D189D43024B9237294110DDE6DE68B012489E6EF30C15F4A571A7D78FE36CD2A2E918179F1A855DA2A823597B0E54EFC6491B27ADD5A46D2DC6F745BEDB1EC9D49D79B707F9769D6E14DEECF0AFAF699983894D627C8F239F92BFE6F7D7C7733D70E64939D3FD8C5FF25D31EAF3B52F78934B3624E337F4F0F02E799AA899C97A15CD9C13D1A9D768753C613F0E746FB22FEEBC385FF77FBED6AFA2DFEFD265ED1C3B8E690B5DCA738C1F18683B4050F87809E2543AB4A97454612BEA9EF9469798397602333A8ED12386EA5EA4D45140A24A380595F09DCCBC243BC257D4F8E7D7547C4160E668686B7ACD22F246D9BEF1A696794A11B85DA3700D711A1FCB34FE8497F276153A92D9AB7FB8E1B2F1BC4ACAF25B5E2C8323BEF9741B3EC8C187F2E6E6A3B9B444A7D6C9CEFFAB64B67C10D1A5D56CA0D1F70A26DB6DD925F824B4BA210CA20B924D23C33E486E1EF36F445E69DF45544C47AA98AE5189AA6ED53DAEFDC518E6FDB4DEC3B7F9E6212DD69EE914E334DCFF69788BD6DB6CBE2B04B62B045A00E1030C26575F71928BD6CFF7CC0221B12347B29C6ADCD1749ADB748ABAF680746DAB8C0E43E51EE8AE2B3A388E7352BD2ECB7C91D6CB3C7B38D79DB595DCB4BADC2CCF48B8CC1EB0A3E106650FCFFA6F9F76599592E0D3B8CD57E7CF9F3D7B21744AC044309860FB0701159ED0A820BB8B24C3A6765915099E9AE2EC4F378B749B641CFD1C9CA19E202CED31F225EFD096C454DA5440074D9ABB4A8AF6F99BD8688F9B535B3A1EBCBCA0C6DA48046E5055A59BD51DECEF7612042329A85B85B0F54547230F4D7F4C5AA4CECC679189B749F998A2A2CB1E30955070CD32E884B243170BBE4307241713CB0324074733FE0735EEACCCA6486E2F580CDD7E6B049B619A4123B47566930CE278ED6F7648A5A107A0C76FF868653F9216193CCD8751061FEED838A35F77C3C85EA46EE0CC36E684E6BB3A92BE6C9CE830FBF538351FCCE77ED78C30D810A240032EF668BCC1366E8B00CE3FD8A27CDA4ECA7D1B6CE31937E56077E75FB30EF6A77CB9C343DEFC4F3AE86D313D62DD27FB810790F145A30801D4C771C5C0A2C506745FC4019663D749BCCF42613563A7178BAECA6C8251E7449AD6ECAB9B6410B55F0EDEF06BFA7110965F4DEAC77C7507D06C3F56DAE126690C052CF5C75106DD7C20428CB890A351D2569FB66CC6993EAEED37EDD49ECAEA3397A6594DBECEB533EE105BB883C07560AF47DADF4534C53877BEFCEE0FED911FEC749378DB0CCE7A263CEDB372A18539DE31F3D651899C679182CBEF8BC764B34224E8C71DCCA53124806E9641C6161CBC2C30DD39088168620A72D700EA37AA52A1A06BD0AF591BE9104B2D5609BAB21CED588222903EC5DAC174CCA4418AC0D9A486CA13A23D0B741C54959C50CD330899EF635915F623E6292274AFF6DBC428D032AD487A973B42B35422EA427EDCACF444DF102B4FD4E7513484D8AB71469CEA88496B84AC19F70FE405CA02A5DB8A447F7EBF4B8A6453E5451308E34EEC84CF38AAB7182A42B89D871A749CE5C56E50BDF724CA2E1AD92618C5DE89D55DFF9754AA06087ACCA9AFFE3265244D23C9918401D38A9151DB3DF4DE4951AB9CDA22C5259680C37FD0BACB470CE6D7646DF5BD3097C7B58C1C2CE303B38D6CADE1598DA3F669EE1C7BA4EE55307303A7FB36FEFE790A51001F3E4B9ADA931B94DDE61DABB032A91F324DE88593D200B9E521A883F7CFC9FB7618CE3AA910C131009CB4C1841214CE2963A30A6695A1F964E791B0A87350DF4997513F6342293C0C05ACC47045A3592853DEEF67FB646AABCCBD507DCA37E8A9171362714FB740316D73F70A9992835F88D8FE9834488FC49E08C7448B8EA3541CE4E2622F177B220BB7795413FB200EC338EC8BA5A1E883FF988E626F84D31CA1A6F39846C7ECCE1115CDA30DE7AC8E925083348AA7849BBEB38B473D87EA6D16462DBFAD66318C1A81601A1455D15032CE0BB4898D8DBE3B260D766332DF75E4591C673247C77139C70ECE1D3683036C3E4998502FD80A424BDABC3B914E8FD52E8B19CE5BE65D35263F7BB15F3BA871D9234999D287612F1D87EBC3B0128D3D9187DB3CEA8DFD138E7E54F6464A02EA8CB81571178BB9CD8EFE451559470C77A9617DA0F3A98DA97DA0D696C6EC9B935E3AA264EC8F64EC8F54DCE6512EF6472EF6E1D4A4930CF26AD924C05EE05B617386D89BFE06985D8CBDB965E39224216DEFAC4F147A936A927DB04B7F3FF4109C74674C9A9B7B2342CBC1848FB7671385499F6E5BCAC25E2985FA6FA92434A5C2D01D860C005DDB0F01A8E1E78EDA4E1F818C2E049A6BBF93DD189F4C241CEFF8EE8564D0E7205407826478380421993EC0BFAD98ECC38148272CBD93358ACA3E8ACAFC3EF0D7BB2AA7B3D98F1F01906F91950DA1F0B023020AFD31938A392303BECFBFA2629317752429229B0AE3A32B67B622DD377391A09A64DFF6D3DFC7D989401D1C4714E8CE186D441AD2E6DB87ACB759FE84D09D9470BF11546E4BDAB659BBB6FF384EFC05CBF1F1DD9674BD31698BA26D7E79F835BF97CA0129A3C7ACFEBDDFE32E74670FC61BD334DB38636AFE861615A1978C364CB7EB98A9069F6D988F2DCD148DB3FDB419214F69E03A64B4FB6CC99B5B30EE9ABB259ABB34C0251A0759808460D41B33138EBD9911505335FB90CF60024C2F01131B003662B00FEB7F4BEFFB22DF6DEF40E2DD46CF4008EA36215C6DC158A9028CC7278C2834BD3169AFAD30B72C6033A50E383CA245C8B604C9405F74C8D621D79703B111BBF19F561BCC260BD36B041B79D8139DD0ED1BA69589D9360DD3CB84CD9E616E99B8462B72823983F9D8B4CC5DD55E8D77D630B1F1D8F6E5506CC7FAE4F4FD2E5D269B059AE1C213DBB4785ACE971FFA7114D4299366E73E8D82E484F9A6BE06D1434907F8302547C182FD921FA6DE8CC9502AACF1928C39D7BC0A9AD44E9D14456C9E4B8E02011C7CBE3BB05B8656CABCE9EF4081F14F9CA57904B64F7232554A2D6719993597DA352A51759594E5B79CC4AC0E251F6AFB556C92B366218083160EB04B7B2F1CB7086FC88817E40601177FE8BB332D6007C7DCA2E1CB2C4257B455417C63DD9FE1C89D4038FA1E99B4D5D235914C60AB073317D7C176D20615FDFD8D25FA392DCAEA5D5225F74929DAAEA4D60DAA58DBFBFCAC2980763D378B47B44E7AD07443D2A826F7CC6E499013B015FCA1A92E6BAC07D0B7D9836A9A161E1D096D0B105DE3D49B87A66901D2AC6D799B545B7D4A4BA6296D138D8617F0379F3BE4EDBAD0606E7E68D00E16A8807A2802D10FC50694934926A1BE2992F6A029D6342141AF406D84964F1A2EA5BF03E89AEA1390B3FDE83E6B9A9536A769C6107D7BA552C0DE7E07D9D5969960AE132DC3C8EB2239FEBA5837D314D3DB605E9B4E6836C1A4D0145B2C6D8E05D38E3AF39C16187CA65CA64F38301D3BD9F823224FD9F2BE512EA049CB5DF6AB4DD34DCA4775F30D8C05094D050D194C54728100A6B46BBA4DB7D2B4C84018B4256944815DCF492AF199C842AAB0E71D9D40AD651CF549BBD8A95309016BA0BA828A2C4D5547522D8874224F4B988A12B3A6CDDBEA776FE2FAD895C894490F6066FF404F2F64161104ABB191A02A3AC2B810AF22351C8094040ECE44992B9AE5CA95CADCB85135DF414EDF16282977C5B064D930D768B855E32C37FA6DC8B86CDE03888B74F35DD1580B61825FAADC98525D5B866AEBF596ECA8EB8D206C4DF1005DBBF58F8E931C8CAE4DE1698CD8AA0002DA7222984E19D267B0A23AA44B878E363D1BD4210DA5530ADD1312511B7425D2767A089DD0F437944589E98BBA567EB91EC4A42FD434505F741270D75F01B4F577FD5690B9D0006D081980AE9DE1AE45BF3364E0CCDA9537A86DC9D0D6941A98F206BA72B32EB4F70565FD688B359D69A1CC5AEC6F24C9DAEC0134ADF6705A636205EBF9AE403A733A00136D3B9CA7C2FA7628D769DC01D2A65DB5B6E7A14C6930D4FEF0B90CB00785C0408D0C83EA4C184CAB7C63C494F6FE88E60CBBB55D68089D3427A095D47CEE25B7FED5896D626010C1871880E84260B0DB0804D5D965BDB75C34CAFAA2DE221BFCEDAD45D67F306CA677F24B5BEB21B48DF6905CDB94AB5AB007BBAB37E5F91905C69A83030CEF3F076EE8F41D95FAA1A17AA43993BA8CDF1D039A77B4F54CF7578DE4DDE52147EC34E378A7ABCBFCE8F6DDE7BCE3AAFECB40C33340E2FEAFEBEBDCF9CE2C30E8FAF85D86BA1AB08B2CF3486C39456745E020E4CF38D244FD0FB77B80AEB30072B2F993969A5ED9210A70DA4FD5024F76DCBA465AB86B0E43E0AE0D007202E9E3979A40E87445E892504B7ADCE3D1B586558AAE41B70F6C793F4BD79AD39EBBEED047DE4516504E387BEC54930D9F2881DD056A6B8EBDBCBB3E3055DBF91E34D0B8CDC682FAA04CA98F38883114127382585783CF071DBB87B7296D9C1859F706086F22C53A94CB6DA806B9D05C474FA693A8D2900A69BCD1EA567D598798F2905D1AD9F2E9ACD5EE0FD586460EAC201F345D24368BABA9E8D071FABC7A88140A741A061CA3C3D0417C5D5B79B6EE30E6F4C17167B33707C8C0984B81152C901D7737BCD09D5BCB71C9F104600B75BAADDAEB4060C1C9677000C7F63506D571BC8354F4E7AE77CD493C200B1C889A648156F5380B07FB0D97E467F52E3A5C75C27ED7B402A9767DB5801DE3B4BFC905847651B0BA3F108E7D77D4F9BC39F7A85AF2EE0B7707EA9E4AEF0318B1CE8869E34B5B5BE420705DCD89BABEB7F2486B6299CA126042EAAC691473F74A42B126F120E3AE47DCE942E305919C0F381BDA40F466959566506B0C934D7B198836D70DEE7B8464573F2436DC92BC15711BFD7D63159BB69999A5008FE4D0413502CB24F00E57C319F5AD2C7B763017AEEEE88C50103B14D0634C2CF05259EBA753DD13F3658362D2C080E127CA5C5D1F32FCE87B4FC11EF6E873B39C43AFD50A2C7CF00ECDA61B3A8382472C373D38C811BA31A10DD2758A4B40A6E8BE2A555938ADC03F99182448FA0AC2C1716B68724D6664C96C85B0D681A1E9348DB1344D97E559C1650B00083CEE6E633AC197A7BE3662C7C816C10C2C18B23D6B1920490C7D34D230A4343660C53148822A75AFEA684897E937A485382D232C98709C0C1012B2AA58A0CEDE7AB84CE0728FAA58A04A531AD6FF34D1FDB04B20C9267462AACBC5E97ACCCB9E968A4F959AC352C5E323BF2E2B4F89B57927431D124FDEEDCBE61190BACF9750EE179E6C91E03DE82AE00495F6580A1BB6E31A1FE928CED1EE904496134F71BFDD288D5E90393F2763E0FC6F0AB618248C3B5CA6C0B9CE206E18644563B7BE0E77D9640F3A1B06E8DE68DA771F4AEC05F45D9BFF8B5D13D8A79ACD92003FC164CFC8C527A5CD29B9E299A8C38A00E5B08216056DAE2B5FE259F5CABD3D6D34ACEC61A947B7EB57A58AEE02D1ED2932A917AC3585C01BD549BB25CB4C04F4D02889913BF14C4DF859EE4D7B5957F5D0D699055D0E1E79CFC12C3D806303F068987416EA65C0EE69A6AB362D4DD0D93A4997D9B42AF23E2BD2AFB8120DD5631E4AD395E1C7CFCEDDA63388C83B2DCD33E2A5AEE017DA7467656FAEBDBBAB1F67656A8D90233D65F7F9DC107AC53D7AF727D1DA401A04F0544E9D2C21A85263C304B4AE5CF0FDBFE33E5C12ED5FB62337490E10CE030387111836BA9A80006158C27C33650C5BC9B09BF20EEE23AB94D1DBC1B70EC6E1DE790DE0F8BC4A1500A2E18C493C8740AC91BDED310C6ACE74CCFEA1CF5CAC9087E40635AB0C38242B54C12C5A050B01F8DF01E003504317009441AA5957061CA5A2716AA8A34E8078400416DD7E79D1D4EFE32BF7652F2F9AF018ED07FCB3C20BDF8ABCE54459597F7D79714D02BEAC51F3EB1D2AD3D580E225C6B969BA3220ED603E6C1EF22EB234475107D2157787AF58052E932A795D54E943B2A870F10295651DD3E1F724DBD5BBCC7BB4FCB0F9B2ABB6BB0A7719ADEF33C65142C253ABDA7F7921D0FCF2CBB6F6D285E8022613ABF30A7DD9BCD9A5D9B2A7FBE7242BB94193A12071AFDF23FCBD19CB8A9822ABA71ED3E77C6388A8655F1FAEBB939DF2CBE626F98A5C68C373F8235A258BA741CDCB90E8078265FBCB7769B22A9275D9E218EAE39F588697EBEFFFFAFF01BCFDA33B6D150500, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901071231228_init1', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB721CB992D8BB23FC0F0C3ED91B674569C6677D7642DA0D5D288D6675E1929CB1CF13A3D80D36EB4C75576F55B5463C0E7F991FFC49FE050375C525714755F50531111A762191001289442291C8FC7FFFE7FFBEFCD7EFEBECEC1B2ACA34DFBC3A7FF1ECF9F919DA2CF265BA59BD3ADF550FFFF897F37FFD97FFFC9F5E5E2ED7DFCF7EEBE07E2470B8E6A67C75FE5855DB9F2E2ECAC5235A27E5B375BA28F2327FA89E2DF2F545B2CC2F7E78FEFC9F2F5EBCB84018C539C67576F6F27AB7A9D235AA7FE09F6FF3CD026DAB5D927DCE97282BDBEFB8E4A6C67AF62559A3729B2CD0ABF3CBEBAB67EF922A393F7B9DA5096EFF06650FE767C966935749857BF7D3AF25BAA98A7CB3BAD9E20F4976FBB44518EE21C94AD4F6FAA701DC7400CF7F2003B8182A76A816BBB2CAD796085FFCD852E482AFEE44D7F39E6298669798B6D51319754DB757E7AF178B1C13FCFC8C6FEBA7B75941E01AAA36B47FD6426306E8FEFCD3D950FCA79E0930AF90FFFE74F6769755BB02BDDAA05D5524D99FCEAE76F759BAF837F4749BFF8E36AF36BB2CA33B88BB88CB980FF8D355916F51513D5DA387B6DB1FDF9D9F5DB0F52EF88A7D35AA4E33A28F9BEAC71FCECFBEE0C693FB0CF5F34F8DFEA6CA0BF4016D50915468799554152AF0F47D5CA29A8242EB5C5B6F3141BAD630C361829D9F7D4EBE7F429B55F5F8EAFC873FE335F23EFD8E96DD97B607BF6E52BCC070A5AAD821A087EA56C9BFD3B74ADAEB5BC50BAE638DE6BB25B277E821C13C83F9B478BA49972C62EAAB25DAB7595296E943BA68D791D85B1EC2B2813749966041D5617E8716E93AC9CECFAE0AFC572B40FF727E76B348084A88F9D4F8AF9202739EC0C29A51EF0A5C6BF1A4E77C0D9E0291558045EB3040FCF76DBA76988906D79BA7008CAA6EE9D7ED52DE6BA3AA1374F263F90E6508B7D5B5F426CF33941830E097E45BBAAA999543D93274797E768DB21AA07C4CB72CB7DF0D40EF8B7C7D9D6743C5BEECEE26DF15354FE71280DBA458A1CABA6B37A8227B88B2872DCC5DBF4109FDE420FACE70BDE5C1BA4199F6F96D823B878A762DA508EE350BF504755B0222F45B06E7D871657F15FDD4F5CFBD5FEDC0E07E75A3EEFE8018550A24F6550A69DB6BD27AB7B115C9A64C1675CF958B4C5A475C731250E91294C1DBAEC8665FF1171592C527CA12D38EDDE6B6D496D4103B0D024A290D4343747E7931A8D7264A772B999C75EFB67E54C1C1B6646A694B3527EDB44511F5A913D4A7C22A2B126923D3699CC40CA74818CA990E9C5769A29881D75F43256F9110E8A81625549450A10E26BC8CD21D602C0F26CA730970EA124F280290F4AC22428E736AF9B594F61906919F583838A8BFB63B81E90ED04077FF3F31C1FF25DF44291BA5AC93943531A748A4AAAF3435B34FB9CA5559A7E512D8B4FB44CC297BDC00889D24DFA5FDAA0BBD94E7A659237949404F4C489A6AC7F3DC485DAE93349BBED9CFF97D9A8518AEEE2AA82CFFC88BE5F403FC9494D5EB45957EAB67DE73C3FA58BEC9F2C5EF0E129AA747917F4B97C0112C6EBEC7B3F976930C6E15B5B41F2086BD822910360BB6D476E32238E0BD96E025A5C2D6C514089A3F5B6A6F2FC7FB08DC9FBA48E8CCF055E80955E475EC18A6C4681FEDC0E35E0AB645FE7D5D24F7E9621ECF92CBCD2A4BCBC719B69D7C956EDE367AB5CF71EB1AADD212D33C00AAB879ECDBE661A5D8133167A1DC13F0289460BE28FD6DDF84BCD194726C0B52A73BA955A70602509DEA7F204D6E280D66823054E4A4BD915A2174BD21B5B1A8D9E934CC06E66E106962173910A9D6C9C379297E16F235CA56695B27ABF05DA3655AA045F56B31831527EE2487B4931079A53985ABB712E929DC5F0AB2A2D552DF6C2A45C908B6D510C75767EC481D75CF539218DD6AD4AB551DA454A96AFF27D3FF5828573D30B402A8E9ADA0283A893E2B9117455D540201AB5FBAF97D06EDAF2CEB9760A34BB67769B9CD92A7AF456D1F8FDBCFA96C3F0EC77BD37D4873B4E7762B27B95ECB5A43B15EC346A90EB37000B3E93C6F8C3F5E4DDF26A1D6EB151A2E6D80A6F19F417C2BC873A89AF72CDD092EBF6FD3A2E68D2082F853BE5AA1E5D75DE522206B1F0D642DB3A25FC5E96D474ABF8AC60F0072AC604B843305576C7BF4A9ABE315A07067C0A577ED66C4F5AA2F81DD1A86625B0F0BE93581D6BF02268FBF8F6237209B0D1983C73D196C0B96FA87B03D5E7F9A410F285FEFAAC7BC48FFEEEFC117B78C43DA325AB1EB23994181280A6EB7B72EAECF1DE33BC768878288BCA002068DB54C6F9ED6F77988CB4EADD00E723488C6ABD314FD625096F0215C84273DDA602FA6BDBFFCBE784C362B748D2700EE3A0D71376C2443B74100E1A00143B9449CF99C6FF0C642028F3C4823F974F8217880E022989CE400AC2DD16D4660D07BD39E7BF6FA36B7E9B7080DF49C0792F75D8074B93AD4BD07747FB12CEDB7E465B39316472F215B4D8EAE1BB53978AB0C146EE2CD6E7808163AE421E6D36C34E451EF3844BD23E4A6CD8B31F5D6EEE805418971CBE00B4CDD139362262118F0B4A1FFD8A1D23626EA97DDFADEFBD0A2BE790B731515443435951A244E085EAFE9C752E1C570A07D880A87180255C86EB19ACC4874EC8314FAF6F8360F35F6DB7C929107BAEB4C76A5BF1DFB5DBED8AD5117F9BA950F648B620B1CB186905CD798E8DB94204B820466306C6DA2C808C3E806E61DADB12F796D45187917887AEAD1E8A91E660E6990308949C1C6C4A40A6BC4A0BF63A0874E4B8104155B0E696BE1A037E9B1AC6252A22B2C6836FD6FF55743C2F7D02AC2B7400684EF20ED0D63E6FC42C1CA3ADD8368BA3CC0D977D88C4FDC6C78521E915AFBCCFB6DCE1F14AC9CD066BC31C0F95DC266641BB64B2EC3D4617F9DD8F9D7D48A47255AF1D5D603E9833305EAD2BD160BA47DDA1E2A1E6B3BC6C8A3FB2D457F5CA1629D96645130C70EBEC82DA7CD4D95141237545B26CB2B153DFEFC3C043D267BC111EA323DAAF887A4E233C9AD208582DEB7EE18684AA1900189976B52485B45E84DB2F95DA5BB51E5501853A058D07E20185BBDA7553FE05BCB4E3701FAC715097DE3CBFDE229D3B3D24CAEAF8A4360A39A03B6358F6E127DA5E246315A1A36CF5D4238766AF7132731C76C1946028ED4A07792139368261797843A31E2C4094A82505A17AF22AA34331BE550DBBF0608EE1CF95BD9B31AC0CBA6D4346F27864E4CFE4467FE28388F487052F20356A3ACA493EAB4CA882FE3DBBE022DD3EA6D522C254A5E5F2E748E2B12153AAEDCEFB4DA23333DA6F615A83FA32885C519E395E1E10760297D7ECE337CA09CE7682CF8B70C5CE2E4E11255E25394ECBE325330954A64AA699F3EEC9222D96069708D1628DD56EF5095A4992C9D52B16CC14807FBAA4D9DBB46D6D2398BB4E040EA3A7D1DCFA470AA061CB60A25BEB87DC0A286722576137C571FBFF821B8FCBE450B22499AEBBEF17C5487FCD9AA0D8487726FE5B724DB8D379C1BCC00BB52328AAED0D6568CB2F41B2A9E5CF603D2AC7724FE66F9C6BDF894F6E266B39A669313F3F5996F8CE63788353E9721F5558D47D516D90EACABE699DF1B6E23DCD61D376DB0AD109EF8FBF1BCA79FE928F24F49E47B1C6DDC45A4E5018797ACD6C738ABD1DD51D5F4231BA08D053F55C54BE87B48F928D6C73E8BCD638E6BFC5B5FCCD5F00F1339F0FE387A3BD338ECBE5E2E0B34817F6ADC920F694BA6F60DBB7DD979E732DD8F81CDCE69E7EADFA858C541686BC52D0B6C6B9A47A881DE96478174480249E5B564E187CDEBC7323F6D5BFFFBC1CC2B9196B5F810A1EF80A7725A604056EA6A583B133C928A5DC80425D5795091F82C84740E3830A7D06ECA1E331010E5410081DA30942D850D22BA75A8E54F41610829857DC3D00D8C258985AE666C135636655E0BB3A4646D58EEFC523C27A60B983815070BDAC25FCC89D477BA951B398CD02491663E965FB76883F76FEEA234BEFB3B0575481D4540AA0E40F1E8F4D08055515BC5FE9A4C1E5E20B0F6643E9A30C10738FDC86ED7612AC7AD46BCB802C3518D17066F94985A94EF6F3CD59E9218D7BD82E68E440C3825F2A450A2AC9383863F6F718D7115A4FD67CF579A11B0C0FEF1511DE53453378A69A19D90612CC30585AC637E8D7B16B8CD476E60C2A09E9334A3B9B40CB38D7FA9193AC9948119C334A50DF71323339EDEBEAF0D18C86E6B2CB8CC5E4943C171D560D09047354713ABBAB7EED1012D684C03CBBA3BC0687A4C01FAA554B43657DEE2B55BEE8AA767A76BA134CEB0C89FE1F6DCACF80E3D2478AA26D985A7D9EA27B92E9605E69F29367CDCA80F69A3566E203ACBAA912D7574EBA9C3A59CAA8F416CA2CEB7716D45CC3FC05D50DCE7C0B6263880064BF710081166B8224AEA9392D4F594830210B8D86981072928831144A114D02566BCCAF4DB99652938D6FF42E8BC0C54F0B1D0C1DB07073719480FA51B0608281D040CEDE532D27287ED8654578B7B10D85610210ABC71AE69EEF8BC79DC07D9D31C6E1A2F90E80672A29B1E2851436F8112C92BDF2BADB66CD5E33F0A40ECAF5028263E1620FCB705AB7024FCE610638FCC268E6F522A49E2B073D45F6DC3521CBE4D2CC8F92894C74A34AC9DEECEA515FB80BB0B502CA6CF05606C4F68EA34BF540360965FA05CD94B67DB9FFCE06BB97DAA7A273FE39ADBFCB65BBC8DD57DFC94AF4C7750A652DC39C1B630654853DED6B7B49AC051E11D2A1745BA6D6CBE63B79554C9F847B0AB00F2D772AA7EBDFE347DA37183DDB70DD65CF6EEAA1C4B897463F7EA99AF16E52F2C38C9E8BCD5577516F7B1D2CACC21BC4A54BC5EA1E14A6AC4AB7FCC8F9B5F0B5552BF302DFD5A262BE4226388AA15CF3DC72596D577255856C0363A4ED8DEB5A094850E8410AFA86030BF384FF9372C12F3A29E2EA3BD83AA11B70DB02DF2EF69A6BD20C7717FFB53B854663177E6298AE2960D41614C49AFBB1E6E90C440B1208621186BDBCE7A9BE54F0849AE47DAD23B463A53261EA05CBC248180ECD364AEA4774F4D99AC8F6229902B5300F18B08D1CDA7D90BAF063AEE61605B9AD73AD11211E5ECF9DBB44A2512CC41CCF2D241258ADDAE795B8168281F3AF02820C0B67EC9EF7DF53C6A867D51FDFB2EC9D287F642817AFC57EFA6CBDDA27D16F8097D43997D3FD1066BA21CD6E6A37D2CD3A448AB246B3C9B38944C9993E67FA2A78E390C6CDAE79F3F8CD2AC36766C88BDE2725DBBC2481BF9A7108D183DD50DD212D98CBF3EBC498BEAD15BABB8D9A2458A65CDDF13CD4557985DFB43912C77CDDE9B258B106C6EDADE5F51A28ABA12A6399213A848D166A1748D091475B940DFD27C57E2CF7F438B6AFC063F259BD52E594D30B4CB2C5DA79B7ADADE26BB72DA165DD45E2A3C8936BE4F980E931649E4E1099B7B53249BC563A08394660BAC15B6911B992AA07834DA9DE26192312385B289099E4F2AC399694FF1C947DDC31A00E819FE2EEF1129B4EDC9B09501DD690B490304FF70FA1D7A2601118EE23238AFE3784D25A39338868C8770B0AD933DF3C52BA2B8DB783D2A35BB7F514972E97D0B2DE69D24232B6E0D85245B29CA4BB0AD9648DEAFD0DBA9F6C51365CF29CB9ED05A1BAF5AEAB43B4B2DD3A4BB3DA8B4B7ED4F5D673B302FDFA6BE373602344A4EB0AD8077356FB314F9BF2E3B59D5F7A64A8A2A88A8BFDC84D9324825B2E08320BACDBDD160899DE0E598A1827E38EFF8167222A3573CD044A5C2CB17A316AAAA3DFAAE0311F6E6B644B62777C5617DDC9C35078D718A573042D91F3BBC12F323502CA5A78FF1F14391EFB64A8AD6100A7A32E5326AB240B6B4C42760F2965ED9CD1646D1510E42D6551ECCCF85B05D23661E8435705418C1B64E563F8B3B79DCC97D7672934B1DFD5E2E1196FC56EF73AEAEF708BBC3755D250A4CB0AD40B6498DBF41985791373BFCEB5B5AE6C524CD45017680022C9C8E2AD1A36145D647A2B5AAA49D4C6B2B45A936A6540BE06DFE33E6A251237C7DC5A73AB2B8C76FE8E1E15DF2345133938D2A6ABBA7B859C89CA9B8C33D77112F96CA36091A64848B2F7B2B86A69F41B6B3E661A5E136D600C7ED0B6CEB64AD1821EFFBA2403E2081ACB3835BBFFAE6059EE261B893B0AB23187ED8A5CBE6B2CF297E6F573D4A4178D5A95FD8854ADD38812581A067DE5C0E9CE095E839CAB8439271DAD0E49D3CA083A40E22868BB5AA028643972B6BF8873267D17B8AC418DA5CE941D3C71AA7648A7B04F2905992BA09F44556876F37909B145C149E472C3CB501BE39E9260BF40D83C1C1AA25B04E11B507393EBEF437190CBC5FB849FFEF447C2599434458A86A14FA605BF8E7B7940908E2265849B8540187BE4AA0D8D751461FB18CEE58149671C052BF1B6A50F24D0528CA3625B4ADA8269C6EDEFB065AD3730264D6EB1AD24B12BF4F37589CA749D684D1B0D5C099EA510C836DED9F1FBC2664CA489239DE9B1DAB843796369FB11ED9ABD946B286AA11C50B2C143431B046BA77B94ACAF28FBC584EDFF2CDE7DB1972067C2C6F6E3EF98AAE28024F5E045E252BD3CB1F021A851ED8D6C95E77DFA2EF9576E0232970A46DFDC0F75D7B4C36CD02F74574F398FF4156287D1D18E5F9C9C9F36B54A2AA5386EC4C9950D528EF617E814C9061C3EF067A01906F1ED262ED60238B2261CF45829315105AE38215500A04F824C920BDAC80B768BDCDCC1F1474E02726ACBED411AD355A015AB091DDC70C1AF2FC08F55B9202762ECDBE6E3CAAF627AFDAC7BDF790F6DE56E482DB6FB753DDF540C3AECB97099BAD0010648FED7B62B5D5B6B5E28E1B4D41D1987CCAD2AE1308B053B095BCE35D7EA502D14CDEEDD694B46BEFEC1A37CB8FE5FB2C5995FD58CD1CBD30C2DED7809486907D78FA96A8C89EF074D3B289A5FD6744522FF44A45855639C90A56FB8DBE3A7F2ECC15037FB3BB17AABC5057F919657886FB7BD1B692E863C554E2C17F14A7A99910C52451FEBF1E53D463996782DEA1FBB4329D1D2C9F9614F40B07A2B5847F9BE153789FC92B048FB318E721E6EBB24424A28B19353FA578DBCDDAE47A66BC7E8DBEA1CD8E82D7B03949BCB32929F81FD5F08DC6D0C2FE37F7E9BD4155D5922DC4DC52E8E612637897C06DC9A6D68836ECCB230FAAD088E6A1C76D916CCA07628633141C8FC4D866CAE51F3725560FD6C85C9CBF43DBBC4CFDC4F96F29FAE30A15EBB42C7D45128B6A9E296AB09892FCAA48BFD5BA204C6F230236BB03C9BEE4CDE12CAA7908F83929F1318AF4C194CB7F4BCBC46B73A4864D165852EB912189C9629D8B318BC563522253AAE285B4C0A2A076FC3063E6FAE0F17AADD2072DA7A3CBD51964161A64F310FF1A2D103EF42EC9B9E6C32EC1FC50E5C6521C9FC6705DCC46F935DA16A824B3D21CA14DB5177C52446DEB12145A41DF7541ECBD8BD0EF0E4801971B8C7226BD8555D8B5F37BEFA9DD87A4E35E10F0E3C694785F777EA46BCE81FE7286C233937C479B656D0F3214EF79595B787C4827647EF6A11F876C1E22FE9CAE1EDB64D772E208C74F2C19F136C924C93615ACEF3190DC1E029C13BD8E895D566D8F796A50CCA51A66E6CA085AD3D02E7A089730DC83680CA6B9685714163C7D8331CBC927EC60E9B71C6B8B4B533EFE1FE932FF8302F7307908A145FC55080EE54C2AC4AE28D066F1F466F76421D5BB5A3728CBE86A1E2643380641502AF778E755CEB9A38B6E034D52BE8611955F9765BE486B22B184EEDEDD975C5F2F37CBB3E6AA83071CEE7E9FF8C811E7679F31B1D22D264F5A3DE1C13C7B26AE7805E6FE96458BF91F04B4D7E80115C44332C9DEE6C4A694A49B4ABCAE4D378B749B649AB171F50C2F7A09F1FB16F89277684B36B14DA519BC49D35749D1665B123BD0B7C3DD41EBE8F3F282E21123D6690DB57D3008CD3473E00A366A21F573AE6DC39CA1443EF56128493FA6632B09B14D3A40C5AB9985BB5AF37BB7A968D94B020FF117076AC360B25626E7304D472660310DC10F88C74C79CB80A71C7869761E9A8F770E996758F627F7B9BA79166A58F0914A7F92E30738CA5AF679719674C813F298942C267D682BCFC66DF543853E808B8C03182888AB9AE713E6A2894508B0D11053C640D5776221B00B13B00D484B236D9C8A1D351BAF9031DC917F94BCD243C978A5C660C92F0352805F2084011945687B2246110869D22E819F9F496A91A09D4FF649552026615E5F69A4546826A1DB9E924968429AB4DB3DDF9C95493EE7CB1DEE7BF33F2DB330D02AA669F139B00EDB04C04230EAC04C04F662426602096DD27E53635FD8AA972186B3DEAFA53159AB6F44229F26D8C8243D999EC178829BCAAD5937B8DA1AAF5799593088A56A081B4EE250CEA235C37D988075607A1E84DE5C77FD53BEBA6B665C39BD3D989463308435D30C5801A601F93024BB08AD4FC52E02314D1AAE2BCC2C5D94BAF3001250AACCA0328B0D4F26460E4A59EEEC4C4AA6A0812CCC7E9A9B5306EBB4DC01353DA151CF9643E6E38EEE7AA4FB437BD12EAD01F28DC48EABE41A6903935FBC6BC73A054BE9C86164276EEBCEC66797DF178FC96685EA4C833D57C858008486F88B06B4D9B5E006A0FB086306766230653F26602E25A10F82B19AACF29C9B4AED8725952FB21AA000A381AD6E4FA5AD405C4603374E64E3EC8ABA4E4D21CF74E437E903556D36CE7B936C7EE78621E5390016E2360ACC52D5821AD031DA484CA6E8CA04ECA5A0F47E2B62FD5BAC3B3204B9F462E14099D58358092C0E31C03D75C746924C70EB53C82398A0262D13F819CF75245EE002A5DB8A7939D7E676AAA75F7E30D3D6854F81AA6A76BE45FA0E40E24BCAD9C18E8DC6FD9AE434693C4D46BA1A86DF3B76BD1B1E4DDA32CB50D5865943B029D532C0A5D2A6466652B15733F2A83839269DE92BED1D9FB66BAE2D7295AC6DD1ACC2B5EB03E87D67B666A691B65C47E717B8DCEC9974A8ADB2178714A55EC9035A1E4F54FC28A09E56B594353FF161E4A094CB2E10B5EE5CCBC1414CD347D03767181EEB4C0759493726E01B09592D2C23735F37891127F4565F7D55C5D59458CBE1AD83AAE9E98DC3E69D9A646B349D9CC3301B4B87D3C92B7B56E956AD0F939ADDA82A1A879C9B61093C3A97725D9A9549B9B9D96F53601D99AEBB9AB9A3B52E295F48AB80DCC8405BC949793B12A56EE42762DAFE4CC1755AE29BEA7B736FDE9FF30D7AEA07428E40DA4D5B5E05E23C06DA86F114CD4CBF31EB3B3301D7E9096FD209BADE9EB09D6E0306A1AD994DB3D1C28D4CBEB92ABB3139931DD226CAF6FC36B71464438511C518D5C8DC424CECCAE4DC2592DCA40B43AD7DD1D758E630D4A4585258EB6CBA6383AA31F0999282BFC751DDC03E4DAFBC81F3B0D782AE13CA1C83E86C6BDCB8C31AEE38E49070B364670782D453D9450597FBB3C2E01604D1AC3D097ED9AA1BC2982BC96EF326C0C606676A7573B4B3ED89656D665BDAC15BCF6CEC658616B2000C359B963EAFD1CBD3CCD556995751EFA45E7D8ED519BBA435A4AABAA150356C65A6EB286D87A6D2D855A437B539EC85A58B198891D901AA61CD7526A607B0A179CC0FAAAECCC272076786E87B7F9BDBC9B61E7E44C936B4B117724DE8CEE42C2610DDCC0CB15F128DE4C3B091673DFCA89C662FC8C2851ED0F46506367390637DA5F91F8C12496C78C456D409FE681468C2F3A8ED6CE0D28F7A0AFB969E3007734FD48FC596EF46E6B93DE3B7F979CD9DCFF687C76E735B2EE36B04E733A181B9394D36E229794D469443B93CEAC64142469844EB85E183F31A877EBE50BDEAF14EC96930490E42AA5D920C5CED2B06DD11148005432F0C6056911700EC93471657746202865210D8A4F5B90F9A74F7F5913C00E091B869CE301E8A6E4CCC5007799F440FA0FEDB889FEABF4762A60637C0494DF7C66723A60313F310435893B6EB0A7327FAA1EFC1D44C24ABA048F6E3783D296D6962CED2F5630206D311FD60F88CBEF6A246A34F4D26A96791A9CC244D99AC15B99265C5DB3EECA7A3C0745CA8A392A9496C6E5DAC575E731786046B056647B88D7D6046E5E82764452585CCAC18B3B3E1AECA3FE5AB74D35FAA284315C3E020E37190567B2FDCCAC4218CD5BD9882CD94C436E3AF39431A7FC8BFA1629317758442C2E50AC50E8085B88A02B36128083B74D66C3B390E3F293A31013329086C74D06CAACC77CE5C6FB3FC09A13B9A03A4C74100183C6DB67056474D0837144A48CEA9A1CE9C8A9E4C71EC5410D9A479AADAFC5CF54B7EAFE7260C149C8B084E807B487F46E61AAAE529B98522A249B3187C36EEC0BDF91B5A54A4EBA4E7FD3CCB2655020FF10C0B6AC339B24620B3848431037192A62713309586E0467689B6CEDC4C76D7F8EBE978AB0553B094032F7548A55E84E33210D7FC747CC311D3480DAA6BCCCE2C264A10001B986D66D780141D99908B0E58FF6987F0A1C877DBBB8E1334D3CE002B38AA8673602B163F9CEB0AE2D8B03C05F6623AA602896CD27C5B656E8EC26A5B9D9840A5578BA00A6E6AA11CF889C63FA9A62D6F7F3A3E02887B205A77D77343A9C4818FCA4973CB26493FA6E7AAC3954FDD91C190BB38F0514F74737397A41FD31FE70E90BBAED18ADC8E9BA8E722281CB86065E9B700E09D453797F763024E9213F75034F3DA5FE2C32E5D269B05B271FF84EB487DAD58706B9F2B496BF3B885AA3B338591533F0126BD98FB4E181A06F3CD8A03996F13F121DBA6CC63AB1FCE743C09766C26CE0427C6C8664A579C312F6185A574923137E457BAECDCCA5A709E42B1825DBE42558316A9BC83E52D34E8CF141C693211863ADFBC59BEC1912873F64A6B4CC68036797DC33DE4D676652EBE3BA8B4D0D7A844D55552967FE424E78901BF496BC0470E11D8EE00226B6CDA3CD2DA7E4C720ED1107EEF99ED16E1D3787D7E428D67A76CDA79403052580B6315268CC70B7901B6305D1F478A1526E9C9047C2423AE49D36D95893808EB8698E6B80E563137A81834C6B4226F63CF16BBB2CAD7C966935775DD9F3077BFCD0A3299E5ABF3AAD889870B82F00655ECE108A36A4AA023A6C04C200AFCA14A372B05A616428B907D4F5B8F534029BCB935C3A940A54541040754BF11BA9ACA9D5A0521185454831E100E96F582946991C8101855EE5AF99C2F77EA7E34105A84724486086A9F5CA87EEBCB6C521D2B2F520CB84CCF5C4A4E3565513A053984884DF1AEA52B13B201222F131E4137423AFC15384A363E960DBA5A58E95036B9C03568A9CC111042260B87012A190EFDF0FAECACE0B8A8DCAD5AA9A54AC3070B3375F244C7066D9AD236A2C46A8EA655004159D6E9D966BB02F46448BA4F40CF7374CD30319E41DC5C146893D5ADC2C7C52DD70941F5C06D866A464A071A122B192C602F9B470606F59FE4EB862AD68F714B74E15ADF92EC1C2C841E21F7320544293C00D2315DAB228A2B8CBEACD221A9DF294836B6EE79878EF2AD4F2848F6DEA75683E497FC1EAA5FBB9BE8552FEA1E54A2803197CD660815984C36C00D526CA4A67DA81D9B141D69BDC6CC90B57E080A74BDB3875634AF242BBFBB813559AD9D4D5CBA5E871B071B741A21C05F9D68B536D100066B6F90DD5183FC7DBAC15DC1A7C6BFA204DC2D1900FDB68107A4D08FA8623DCB24F0C643BE1BB08768C7819905B29DE936B3F6700FEE64BDC5C410497BDA57E1EAAD241C4AEA442F6C8F77C32C5060ECE638C0F06606F16D7107DA5B89FAF1D0277CC15EA140D499850C1031C60B0C694E86D620D0DFC4CB89C1436A47C255501066B05BE8E9C3631D974A9C8D43452619A87C44921A10A1007B8C825432C493D0CA8046E6B431A0891129262601305D726288C0FAE10875BC0924620448A56543079AD5970783FD4DA4130B201F090307D1A3B51E2A88C1A2000840D910830C9C347BD798FDE0810F00EA5EF770B281B73647CDE00734C0E041143E036FCCB68A818B7780708F999B3FF78133777A3AC6F118786357BDEBCCAB7202B080FA1130F02A82F4365F03B2B04801F24890F9136830A86B49D4831A8FA79FF5B064EAD14AF828D4226A2267A8E42607211F010B08D1A3B3F02BC8C02119597676F7026D7017D9E807084DC77B40E9E81B33938E00031E800030159DE75E263DA952DD74C9E4A6F17C8F2D313BED443656A65CAFE4C8C66BA5298D3EE64E6DEFFE509D54E5C08A81C8EA80A4313C7248718EAB71D33772430458805030A07C40203C4420EECE5041231825A46687D4AF993BBCEE1CD4DCE501EC2405564CBDAC0EC84EDC2DA68AA5A478219201D799DEA4A36E2B55A75A084C3E2C001A22147B91AA2013844F47A0207CD5DFA1DE3537B2003771208AB9662141CEA16F74556CC3A10268D1DE2C07D89D5437BD77CDFD32B469E9ABA9B6216D6D788BD3DC632B773E7D9310CBC9672C20B1EFA8EB6A735A53B5ECC73D54B6A1B41B8DA9B60012CB918767E7B6C881A3BB9ACE1CD6164DCCD75DABA021CC708E3D771D99641560CCF607996C75DA6CC696AE9D77B162E7E541E41DE72021220CB7600A02F07826D969655E2F4A85D7A096F6ACA3A8AC3846810E28FA8395AAB1D195646917FA3B4F1B0A83F90E0DC7CCE73E1C93BE7C0E4483D5E0425CC6B3EA8EF10104A82A87560C515A09A423EF0CA6229E1CB344F6055CF98C0FD91D9DF70EA29C025A3E3E79258872BCD79B82700AC463AF66B669C50A86014DC7A458A9CE749A6645B26D0E99C7F434A2604D873454094A290AEDE8BB032B0338CF4EAD0863E18D450D3BDCB0628C232574A7A39A160F6D8E77B3952B751CA45E27E3C6E8ABE271E82026534F800795F8B703722AA9124382C392E48574A592240B24CF4AD458FCAF3F0C35604B9DD754CB35D6BB66D1640D75573B6DD5503F75A2CC843B5E9FEF9A4A9722DDF24060CDE604D5916E7AD2256188778AA3A7D8BA4E9B02816D86A7D3AA5CC936079FF5D950F4E41A404D07D5D7084AAA01EBF4FCD567943721972D6F0939EE03916BA233B422D5BDEA5A180037B8C4956789F7B91A96677D1F555D90656A5791CD9E64E1C93527A98484E32A62A9B393C38393E627F720983425F92424E37266AB08A64AAF0D0F4D9260DB8358929CDA233BFB5E02B99F21670D5D8A68D6AF4291249A76D4609E1FAAFC341469A147F26281D2186BE862E2C3A24A78EC4B99C94E3474A397CD734735652EC5BC5CD2515C3279B97C6972C9E4E1E2B085A10660C59712450A2B1F8DAC8AE2F58EF1A94F8A7B0A824933A52A9E7F1925578586A84DAF6A2046ACF0CAC5936A763CA80927F954D0D2202B283862755E50573AAA33818E4F45384725443E836C96EC08D5F92CE9A1894FDE55945367B01CC3CD19CAB60890489B949119872A2D23BD83B54FF7151451A560A4310DEFF7FDB742286720B41B6A730BB25B982ABB202D94873002AA0D51954F504B621FAAD4A10814D4107277C0FDA6F376B88F9ECECE416169A228788F5996C90D18BE51D237660CBAB46FECA30E36B2838234BA446F26B4762755978F4C4E2130631934023E6799480F2342F059CA58435B139C22D8E83512439B870B1C80465E5811632A6901668892534491490A1A069C4B4AA4491735444F18387B940195DD6943E73A9253469A11091A059413491CC310FE444F17280BD2687296CFDDA3A78A31C7C8F2FC84A1CEA47CC3E7A0D16F46C65492E5AB09B3154D432520970A78B1AFCEB8C2DDC24B73AE30F7102BEDE15C916565149D4D910D4466DE31491E229A6634E94378938F10A24867FAD1240C19D160A84C68614844B692DD50996FA311946D45622AA20355057853A8CAC300BE2D344EDCC00ED72875033D5438D295F2CDA149B20656DE057BA52DCF23604A44CDBB5E7DDA81F0C41BFBF9AF3C183EB859C88055925E5207DE3A4460DD4622433F22D184A0EE90CB9332F03BEB9F240BFD4E9BB98620672A4F2759B07700D310E9CC981E2F2F1A3C7D78F2BEECE5C5CDE211AD93F6C3CB0B0CB240DB6A97649FF325CACAAEE073B2DD92E05B43CDF6CBD9CD3659902BC37FBC393FFBBECE36E5ABF3C7AADAFE747151D6A8CB67EB7451E465FE503D5BE4EB8B64995FFCF0FCF93F5FBC7871B16E705C2C181BEF4BAEB77D4B15D63856882B25B6B3257A9F1665F52EA992FBA4C433F076B916C0EA0FC24DEACB9EC45D335CBC7571D6083C793CDC55207FB7A2ECFAEA19E9C43389D63190ED3D1EC91A1FEBEB412171FB176BE2BA378B244B8A2ED43D1562FF6D9EEDD61B79C87D796D423BB67EF3C51C03F997C5D07C31C7D03C33A7314041A45518DEA187649755F51E7F93F223124B2DE8936119953EB43162394A7165E658DFE06FB5FA45A3EB3F9AE3B94A48B2029E0386AF16E36CEF69795CF4770B6C05C2926AF9AE3EBC30E8E8026B7C6F9E406C6F84D0B62A5CBF6E9770DF98026B7C7CDFA8CFE6B83E96EF508670356E490F9F455C2F2F3891C20BAC0B416271FB062F016DE4E34D1794D1474CB648DCA5A514C13842D35F60B5FDE6BB417D8E8B2D2EB67EB199047F34586E7C2E16FBF5A6C5309296D2342B6C4EC3E7B976BAB890E342B65FC87EEBD77DDD4EB55EE3AA88ABC2625534F61DA7250159B10CD6035C6D9CC5E07F40BE5CD7090E6814ED27731C9FF3FB34E3FAD17DB3397036163BFEC0D97D35C7F42929ABD78B2AFD86A784C5C696D830FC9B2C5FFC2E327CFFD9629C54725D66A48AA4BB726C51841DBD081B2E449CC498EC1AC84094C9AB8E27CE5E17C97DBA10855AF7DD0EDBE56695A5E5A388AE2FB0102BE412E66D7341CC0815EABB393672DD5D56F8BC2322E48AA23088C280D1679A08DECE3A0D14A5DC50AF81AB8E230CBA1CCDCCEC4AF236CBB1901EF358BA6F7161C585D52F2C8F45E5B8A0A65C4CFBBDB35EA3655AA045F56B91F13B215510976B5CAEC23ED825C8F0DA0DE1F426167BA20CC1388BB9698DC7317CB5DB63A11D92FE1E975D5C76FDB2F35A6ECECB6CDAE5B5DF7BE5A794046466CE9FA9988E5C85E16D59D6EE25DCAAEABF5AF8C6A4E5364B9EBE16B55B2AE317C39444111245482F42DAD7B94E12047C7B6C204024F5F6F9E0EAEF3DF7F18A1BC595ED285EAF106F9BA23EDBFA92D593003B94F545161717DFB769517BC7890B922FB3B2F1ADD0F2EBAE1291724536379655FA8D43D67D8BD70651CE8E2967EBA471EEA216577795B660D571042E28581C448AA7C0BCFEC43118F960C35AAF77D5635EA47F17B98B2E898B3C2EF2C1E9C7D76DCFC35F6F6247BDFD3E967D5CF02EFCCD17730C374FEBFB9CB37F76DFACA408A06E0C5FE3E12ECAA3A67C1479C4E6A2741249340A07B1A4AE3E8E680AEBF7FB66C7314DFDC14290A08C1723F597B850E342A50CB99A80B946F65C0A87935957597FACC342FB24583C305005168AC46E7DCF6F90DDB729AD3DE282B05D09B729EF4CDA7CB1B074AC4567A6EEDB5CD2940A58C923E48AEC70CA7AC997D96165762F012F5B6AC3F3120A300536F864A3674B6C30CA47CE974D6E794B76252FD2BB6F16EB335FEC8814141FF8B125F6182109C497D9F8622CD22D890A477EF2DE184C91034EC8535C2874E9ABE0E2C5945848F3BC8EA7C008F31C0CB120C711B5A7A3D79EB834246EA6171A878BFD455D7F1CED89CA6F2F7981D515D99962441B8CD55DD0FE3C6279C43A2DB755349FCC71FC96A23FAE50B14ECB52880BC197599C2A933A04C44D9514C0E596586A27334591398F474238F35794E2A725C509EE1092BCD6E23CA5398C633CB3BA9FF48D26E7B88A6B4CF3AC6226E3B5D3FA5564F83658B9CADAE3AC59D2248FA1FB16D7465C1BCCDAF058148EAB21DE08C7E57512CB0BD37E99566F9362E9AA39F6085C544645E591165C90BB8E9FF30C6B71A2DE497FB7B01C7B074C8BBB695CEE66CB3D21F1841728DD56E436E6C32E29920D5E945D60713711A044EA148FC90EE1482E11DE179A571FBF708634F2C1CA411C2D083B26404054A1D042E00C99D800D9C3173AE1FD2DC97672C46DA985434895543BCEB8D67DB3389CA30C1FE78B27E0A29929B1E011CCA962DCBDE69BD52510E175E006A8FB1C857814E25A211E587C0714DC87A5DDED831F4A4F3A9E204C41140B512CF462C1570EF82CFCC957FA3E44E66FEE565F4017AE2FECF1FC00E1F9C11ECF8F109E1FA7BE017EBD5C1688BF0EED3F46B915E5D610B6A8CB88E324B5DADA2EC18B643547D24D02F865C5C8C17165D9C7D3364B1A6F1E615BC4E71E73DB04D7481A44501FED00492F82789ECB7D905D3D903F965FB76883A712B44289A5510245093448A047B2C976ACE72A7618242EB24683601C01338E737B78277CCAFB03BA438ACA8519BE535BDA9FC9D337CF95CDE0707D7E37F5BA1EE7E954F80749F5DB3040A9A0BFDBF40FC2357CB5EBD7588FC4C67882E56F28FA5207724A327E66E9EF53BBF947097DF412DAFFC0E777C49BE150B72FC7B02EA9AA541C8100731EF34298A724CFD29D1EA5C794AB51DAB9A45CF5177A41CC5BF3D9B5C208B031620E847EC37F495256F3B8FA8F513844E1300475C25CE11C61AE662997384E70BD91AC4DDE4E2B617CEC00C73F6B6FBF10BA486398D6D8ADA3E1DA14DF290A8C272FAF680A83ABEC98D6DF39C4CABD4979B79CE68BC5194260DC394E32A1548BA017F6F144146598D58968BBCDD2456D63740FA2CD2271390969108C23CC7053508417EAB38D376FC5DB5BDB4F3606A17251A4DB4A0887C21458A97B89A0EE25568C3C6BA8F0287E8E5FFCECAABC4E2CEBE7E0C7A37111415A142359A30345F53FA6442AD7A8DA151B204D62FFD9A65FC90A01CB74F86CD1AF5C88EA97C71BB528D25877A6B472B6227DC8BFA162931789534C7065ED71A417F9778F63539003947846A33E5B2853C18336C5206E51AA984B959A67DD13A0342CEFE21729AB399E40F173A4898BE1E817C3E57A9BE54FC8F9AEA6ADEE627295561D6739FC92DFF308DA4FE63828B5407828CC1699E3FCF75D92A50FADC986C72A145AF4156D80E47FC3570B0FB8A448AB246B2EA7788442E1F1683CBEA7C0FD09101C22DC7158AF4A229EBF3EBC498B8A9B2DA6C0E226648B16295E2B7F4F449B1F5F66B1868A64B9AB6B5D65097FA72914BAE0FD2B4A0A19DAA6CCC64B0DFF4AD166C1DFC73005169C57A06F69BE2BF1E7BFA145C521154B2DCCC5C966B54B567C3FA9CF16A3CED275BAA909F696E458E0C72E163BE116150DA1D01C2FF5D0037AAE0214DBE12681416488E9323BAC6F8A64B37814D54ABECC42C662658093B1F5178B1BBF400FDFE309322ACDC64A33D61B1DF5655CD34155066B9DA2152A5A8EE2BAAF31CDB3EE5B55879C5CDD8FCC2C120769A043308E60685BE591509F6D8E23CDD15FF0F8A1BEC7251C97F0784BD86FEDBA2FDAA956EB1886AA26E1887003D47F3D16254392F0C829D3D1E50658B1FD471B9FA835220F4178B7A8EEAB1DA6DB5CC443BED9F8576165EB36CF5021FA7AF365D31FE6A29A18F7981AD36C59A236C82FC99F733EA8784E8C02200A801ED3AC4AE68722DF6DFD34CD1A85BBBA29A9BEFF2744F2AF9FEFC2CD0EFFFA9696399037842F8B8B372E5E7EF1FE92DF9397507ECBB745E2BE80A508F67F0987F0B7F839DF15E20BB5E1AB39A6AFF8D04B8E393046B1D402F3C3C3BBE44982972BB3C5AAE9B504266A3551308E12387AE51EE5A3A9EC14361AAE788AC79A51AC7A71E11EFBC2AD1F527FD8A5CBA4F600725ABF0C0ED707F6F2FAE3ACE67DC85AE11F222DAED0D35AA1FE6130584CBEAB75DAB01875D3625C0BEAB3C57D42C070100C49C0501574A139DE3AE6872824A8CF5152444931488AEF15D6F3922CC04B6F08958BAC3042339ABDE25B0ABC72A0BF5BB0542962EABED9617927848B18BEC6E51C9773BF9CDFA71BBC65A449467CFD1DD73183C361016BEA8FB372F7D1C9427C8B61FB0223DAD3E2DA37CFE880B5EA561575CDE7306070C9E6A0AA3D92721FE01DDA5552967FE40537C1C3570B19F4F9968BD3D27CB1E1B69B9B4F3CA7D59FA2CC8832638CCBC9C439F90BA9EA721109563B45EBFB2DFA5E41BDA3BFDB61037BC714CC2246924DC3F8DCB21F3E5B88D8C7FC0FC241A21D952D89422E0A39EAA2B14455B7A1FBA6AB1551395D429AA019472886B14AF85F85BCCD370F69B1E61988FA1C17715CC4433624B4DE66EE0E545D75973C48D2AA239932D0020ADD427D3E1A0D8884E1055520BAC0121FAC04312551471B53478BC2F86484712B933C65728BC543344B319CE2B9321A80E24A168B5F9765BE48EBE842C001A93E81DC7189B6E103100C2A9E70C0430D160C4B8E5830C6BBDBA45821E86C65B49E3964D0F22604EBFBE2DCCD9B7C57800E6CCE6247D92F7C3A5AA6640ECF3E965F7659F6EAFC21C94A7E75EA06FFF202E4067B86F94C1238D749F21E50512A19860705734177E5166CC3E2F59C8F0E69407EE1FAE7C7D6E3F08B7CD47A46E9C40E6EA84AD20D2A78905EAEB55FFADF65F7817042B2429FF325CACAA1DECDE211AD939A10E53659B41686F76951920BDDE43E295103727ED6B967E043D25359A175C37937FF91B56F587B80CFC9267DC043AD83F8BF3AFFE1F98B1FCECF5E67695292F355F6707EF67D9D6DCA9F16BBB2CAD7C9669357F5D05F9D3F56D5F6A78B8BB26EB17CB64E17455EE60FD5B345BEBE4896F905C6F5E3C58B171768B9BEE0ABB7688DB03CFFE70E4B592E192F394AA962FDD1586E7AF96F4860838E3DAED1C3998C935E5EF0155F02DC485A7F759E12A2D62BF803C2734E76C8ABA4227E3B186A89EA7E9E9F11864BEE33D433DD85127D63406A1AD87C4B0A2CBE8AF3B3CFC9F74F68B3AA1EF174FDF9B935D2C61C1C1869E3474791C2B27E973D78F04174C7F5364BCAB20FE9EA83A9CFA4D7A058A245BA4E32B278F05F65BD0A5EFC054F3B1654B8F8076BFC5749D146F6A0FAC82F959F3E6E96E8FBABF3FF5557FAE9ECE3FFBCEBEAFDE9AC7E65FDD3D9F3B3FF4D375E15629233814A54922DBBD6879AB2F6CDA689D6985B02E3BFAB94B0A71B2EA2939A33B6099518D559DE490B54E1FB4829D10DE2FB54C7EAB4EA6C224FF14657E10DEA48C4AAAFB0A2BC9BED564E5F312E9C635F386F93F2314545272B8F64E5B4A372D833BA8A7E9C3FF79E15577E5CF9862B7FA6156FC08B710DC43530F21A20DE1347B2E58D725C6E5D720363ED325F84E593C1EF3770773F256555DFC0D4D3E2B9943F966FB27CF1BB0D370343A51E35599EC8FB9A5E67F228DBF65FB675537D44F2ADBBA11DC1D2D8DFD686161EE42D649DEECDE7244F429F949880DE88E2CA3D80954BB4923A07EE71ACDCCE45D56EA76A6A79A9E08486F60D37B5A2EE7FECABEC8856D881EE8DD76899166851D5C9C703E38E4BF0009660B7D17DCE97BBA3598CCD60ECF79DAE9ED7CED351D46DBF8D5BDF69ACBBA35A6F07BAF97D4A37BF87DFF5CAB2F62A09CD8C6CACFC78FC3C6AE950BBD81D897098EDEC398A4BDCC7ABE028C9505FAFD06055EA30FF9775F2FDBFDADBE089C357CD401CD5EDF05C7EDFA605954FD753547CCA572BB4FCBAAB42ACE9EE314634DF47293CB614C68C7B2482189209060CDF56F312C56348CDEB4FE1857BF97A573DE645FA77BFCBC1B8BA0F60751F99BFDD819EC13E2E06BFFB505C73F3B4BECFADEC9966BCE8AF76C443DC090998EE0DA19833E86085CCEC5EB56F7683FF4FE827363728CB46431E57EC01AC58C533DA23F2CABDCDDB37AB2E6781BEAACFE9F7CB6E7DEFB90102B61D2773499005799B0E8E9F0D024A6CFC777BB7E935ED63145E14CD2DC449966C67D770A6B27737DC69C1D6F6EE08A32C8C35F3B7B933D9A9AA9EC2C79DE4745DCF4E4C42EE0066CA6457FA9922DEE58B1D09884230F808DC0E8FBFE8BEC6C4DD92C802E46768EDA0473E8E83FBD0F7817B43E1FE9293F87C21F6B4A86BCEA76B423C330408B17483EC6B9A2B5BE6E6AF3ABAC77105C16847435A707E73D654F6DA5E6C05DB38EF804C18DC5E4A9A6D5B8FF82015BAAFBFA5E88F2B54ACD3B20C13AB834A6FE2292489E8560EF7CFCFAD873B961F49083366DC600EC098C108F85AFD3B0E213F8A748DC6FDB8BAAC56D79B64F3FBBCCAD3F886423246FB469B5AD183F91456C0116D290778771E97C9012C134CD8655ABD4D8AE5B12C16C60228355419E1FA39CFF026318A46E76BF08C9B5F5CD58A559D90D4430B946E2B727BF3619714C9062F34283DFBC1AE74FA92D565095D7DFCE253FDF2FB162D08678C1C5AB5BEF04FEA1C08BE42834255E78C1FCF57054BA05DE9D355BC36F079B7780AB184C96A7009F4476AF985176896A08B69BDAD1845F5A98AEA2311D2FE17B2FBE802D3CF92FDD2A6AAC6C57DEC8BFBD856B3AFCA35CA51AAB9257C3112DE1FC6B9D4FC3134DA512E355F2F97050A7FC91765D701C82E30CBD3C14AAE70EE4B316AF0C9AE1D8082623A2ECB53268F600C5FAA268E7777D73E18018EF66A70761F725F4BCDC83EF693F8177F2CBF6ED126DDAC380B5974E9392CA9672E67D8BC91C72A5C605F73BF673E81DCE029B70FB7CBA1A8A39CCC6AAD5F131EFD62DD9B57547BF1B2A87E9D36AE6A719B8FDCC084CFD1266906B289396D225F6AF64932F1ED8F133AD8F93EBEF839D6FD60FE73E1DE65471C5790759962A71032D348B2603636E70800DAF7FF87613E8802F30004E6DED8D382BF531C5F81DB83F80A7B106DA04E126EDF7C5B2D4A98639730F5441F895009C269FE7E85E3FA3D86D3801AE379B49E9FD8623F2A07ED917D8C533F5FA403390ACDA823CCEDE9104F61516CEA4F61DB6D962E6A4E389E58E8782404BB344382A1CF7315C87EFB0E958B22DD56A9180CD935AA6112464B3A8CC0ED51901C8220D955799D8BF7B81C1F674CAB709A196EAE51B52B3640C64A276CBF96C90A8558937532538FDD24CAB00390611FF26F585AE444741C89F822FF1E62EC0B72FE7139B7F515FD5CD402C57A8AD1D84E4470B46C774442232AF1A7C8C797EB6D963FA163D9FD7EC9EFEDB790BA92D7F641A9110E0F9CE9CA5EDDF8F75D92A50FAD71C7CF1682E7444CA76889E37352A455923577507EA80E56AB19E1406712E4779418BFD6824B1FE3F89FECC3AA4B9D363D11932DE0EBC39BB4A81EBDB7AB9B2D5AA4782DFE3D814C80BEFBC1872259EE6ACC5759B2B062303BF47F4589F05CC3173B890254A468B310AF7BBC5F7417E85B9AEF4AFCF96F685105C7FF29D9AC76C92A7CC72FB3749D6E6A92BF251922C66C2084A6433D7C81DFF4F8F6973440E2BC8C87FD4D916C168FB67AAF91EF76ADB784C539525881785A3D112D1F6BB847A2E01FA82218ED4B71C55AADD8568721C7F3E3399DB783B23F22F715FDBC875B5B878373505FD32F6D7A5CBD27B57A8F64D9EE8975AB4980E27043D4D6F3CE0175807A47B89C48979B3032870496246F528220BACDBDD16021903CDDE6192A68A771A7D78FE31CD2A2EA18379F1A855DA2A823D97B0E54EEC6451B17ADD5A26D35C60F45BEDB1EC9D29DF9B407D9769D3C0A6F76F8D7B7B4CCC1C42631BEC7912FC95FF2FBEBE3710F9C7951CEE49FF173BE2B467DBEF6151F72C98164FC861E1EDE254F133533D9A8A29A732232F51AAD8E27ECC7819E4DF6C59C17D7EBFEAFD7FA55F4875DBAAC8D63C7B16C21A73CC7F881818E0304858F95202EA5435B4A4715B6A21E996F748999632730B3E3183D62A8EED5953A0A481409A72012BE9395976447F88A1AFFFC968A2F08CC0C0D6D4DAF5544DE28DB37DED4324F2902B76B14AE212EE36359C6EFD30D16FB6992D5FEF2C7B17EF7CF71007A8CE0B6A8A2B5E94416E667AC63B7EAE1912C4BFD8B2A178BD05552967FE4C53238E29BCFB7E1A38F7C2C6F6E3EF9ACDDB8FE4F64FD5F25B3256A89B6E6C6B285BE5770B7DDB66E824FD2D719758164D3F0B00F929BC7FC0FC2AFB451310AA623154CD7A84455B7EB1ED7C17F8C73F7B466FDB7F9E6212DD69E794EE332DCFF65788BD6DB6C3EDF1EDB1D022D80B81E068BABAF38C90B88E77BA68190A0AE23694E35EEA83ACDAD3A45597B40B2B615468721720FF4D4150D1CC7B9A85E9765BE48EB6D9EBD35EF2EC14B6E595D6E9667248E6D0FD8F5E106650FCFFA6F9F77599592A8F0B8CD57E7CF9F3D7B210C4AC044309860FB0701155ED0A820A78B24C3AA765915095E9AE2EA4F378B749B645CFF393843394148DA63E44BDEA12D0976B6A980019A34779514EDBB54B1D11E3727B67434787941CDB5110BDCA0AA4A37AB3BD8DEEDC408465C50B70A61EB8B8E861F9AF198B44839B3CCC2136F93F231454597D6632AA6E09A65D0096587CE16FC800E882F26E607880F8E66FE0F6ADE599E4D915C5FB098BAFD960836D334834468EBCCC619C4F0DABB5C49B9A107A0E76FF868A53F9216193CCD8751261F1ED838B35F0FC3485FA45CE3669B73D2E7BB3AC5856C9EE8FC17F53C351FCCD77ED78C30D910A240132E8E68BCC9366E8B00CE3FD9227FDA2ECA7D9B6CE31537E56477F75FB34EF6E77CB9C353DEFC4F3AE96D313D63DD27FB890790F145A3300134C671D9C0A2C506745FD801E663D745BCCF4C61B562A7678BAECA6C8C51272B9B56EDAB9B6410B55F0E5EF16BC671109A5FDDD54FF9EA0EE8B3FD5C69A79BE41715B0D41F479974F3890831E342F254495B7D3EC11957FAB8BADFB44B7B2AADCF9C9B6655F93AD3CEB8536C610E02F781BD9E697F13D114F3DCD9F2BB3FB4577EB0D14D626D33B8EB99F0B6CFCA8416E67AC7CC5A4765589F850B2EBF2F1E93CD0A91683C773095C6E000BA5906195B70F0BCC00CE72018A209F6C9B90190099233055DA38664B8432CB5D825E8CA72B463318AD0F529F60E6660260D521D9C8D6BA8043EDABB40C74955F109D53C8390F93E9656613F639E2C428F6ABF558C022DD38AE45DBA237D9672445DC8CF9B959CE81B62F989FA3C8A84104735CE8C530331698D746BC6F3037981B240E9B62261D93FEC9222D95479D144A8B91307E1338FEA2386AA23DCC9430D3ACEF66237A9DE6712E5108D74138C62EFD8EAAEFF4BCA5503043DE7D4577F9E32E2A691F848428069D9C8A8ED1E7AEFB8A8154E6D91C28925E0F41FB4ECF26183F925595B7D2FD4E571352307CDF8C074235B6D7856E5A87D9A3BC719A97B15CC78E074DFC63F3F4FC10AE0C36749537BE241D91DDEB1082B93FA21D3845638691F20B33C0475F0F639F9D80EC3582765223806809334989083C219656C44C1AC3C341FEF3C12127506EA3BE936EAA74C289987E901CB315CD1681ACA94FEFDEC984C7595B937AACFF9063DF56C4234EEE93628A66DCEAF902939F88D881D8F4983F44CEC09734CB4E93872C5416E2EF67CB127BC709B4731B10FEC30CCC3BE681A8A31F8CFE928FA4638C9116A398FA974CC6E1C51F579B4E99CD550126A9246B19470CB7776F6A8D7507DCCC2A8E5DE6A16D3A86108A64151140D25E3BC409B58D9E88763D2603727F3B923CF623893193A8ECB387670E6B0190C60F371C28472C19611DAAECD7B12E9E4586DB298E1BE65DE5D63F2BB17FBBD839A973DE294296D18F6DC71B8360C2BD6D8137EB8CDA3DCD83FE6E867656FB824A0CC88471177B6985BEDE85F54917DC4F0941AD6063A9FD898DA066AAD69CC7E38E9B92372C6FE70C6FE70C56D1EF9627FF8621F6E4D3ACE20AF964D02EC05F60A9B33C4DEF41E607631F6E6E68D4B921DB8F5599F28F426D524FB6097FE7EE82138E9C1983437F74184E683091F6FCFC60A933EDDB6E485BD120AF5DF524E684A85A93B0C1E0086B61F0C50C3CF1DB59DBE02199D09346EBF93798C4FC6128E3EBE7BC119F43D08358020191E0E8149A60FF06FCB26FB7021D2314B6F648DACB28FAC32BF0DFCF5AECA3FE5AB74D3B9808C1E01906F91E50DA1F0B023020AE331E38A3923037EC8BFA1629317752429C29B0AE5A32B678E22DD377396A09A64DFF6D3DFC7398940031C8715E8C1181D449AAECD770E596FB3FC09A13B69C7FD6650792C69DB66F5DAFEE338F1172CE7C7F758D28DC6A42DAA6FF3F3C32FF9BD940F48193D67F5EFFD9E7761387B30DFB84FB3CD33EECDDFD0A222FD25B30DF7DB75CE5493CF36CCC796668AC6397EDACC9027377003323A7DB6DD9B9B31EE1ADF128D2F0DE044E3C00B10138CEA3133E1DC9B290175AF669FF2195480E939606205C0860DF661FF6FFBFBA1C877DB3BB0F36EB367C004759B10AEB660AC5401C6F31386159AD198B4D756989B17B09A52071C1E5123645B8278A02F3A64ED901BCB81E888DDFC4F2B0D66E385E925820D3FEC894CE8CE0DD3F2C46C8786E979C2E6CC30374F5CA315B9C19C417D6C5AE65CB557E3DD354CAC3CB6633914DDB1BE39FDB04B97C96681667078629B166FCBF9F243BF8E820665D2ECDCB751109F30DFD46E103D9474820F93731424D82FFE61EACD980CA5C2122FC9987BCDABA049EDD44951C4E6B9E42810C0C1E7BB038765A8A5CC9BFE0E6418FFC4599A4760FBC42753A5D472E6915973A95DA31255574959FE919398D5A1F843ADBF8A4D72DA2C0470D0CC010E69EF99E316E10319B182DC20C0F187F69D69013B38C68B862FB3085DD15605F18DE53FC3757702E6E84764D256DBAF8978026B3D98B8B80ED69336A8E8FD3796E87D5A94D5BBA44AEE9352D45D49AD1B54B1BAF7F95953009D7A6E168F689DF4A0E986A4514DEE99D392C027602BF843535DD6580FA06FB307D5342D3C3A12DA1620BAC6A9370F4DD302A459DBF236A9B6FA94964C53DA261A092FE06F3E77C8DB7DA1C1DCFCD0A01D345001F55004A21F8A0D7A4E1699A4F74D9174044DB1A609097A056A23B47CD27069FF3B80AEA93E01393B8EEEB3A65969739A660CD1B72E9502F6F63B48AEB6CC04739D6819465E17C9F1D7C5BA95A658DE06EBDA7441B3092685A6D86269732C9876D699E7B4C0E433E53279C281E9C8C9C61F1169CA96F78D72014D5AEAB25F6D9A6E523EAA9B6F602CBAD054D07483894A2E748029ED9A6ED3AD342D3210066D491A5160D753924A7C2692902AEC694727506B09477DD26E76EA5442C01EA8AEA0EA96A6AA63572D3AE9D43D6DC7543D316BDABCADFEF426EE8F5D894C98F40066FA0FF4F442A61141B01A1D09AAA2EB1817E255EC0D0720ED02076722CC15CD72E54A616EDCA89AEE20A56F0B9494BB62D8B26C886B34DDAA79962BFD36DDB86CDE03889B74F35DD1580B61825F2ADC98525D5B8662EBF5969CA8EB8320AC4DF1005DBBF58F8E921C8CAE4DE1698CD8AA0002EA7222984E18D277B0A238A44B878136231BC4210DA5130ADD1312511A7425D2767A081DD3F41ECA22C7F4455D2B3F5F0F6CD2176A1AA81D9D04DCF557006DFD5D7F14641C1AA0032103D0B533F85AF4274306CEAC5D7983DA960C754DA982296FA02B371B42EB2F281B475BAC194C0B65D662EF91246BB307D0B4DAC3699589152CE7BB02E9CAE9004CA4ED709F0ACBDBA15C277107489B76D5D29E8732ED83A1F487EF6580332804064A641854D38DF7E906773A4DB2BFA2045253B972051138489DEA8469243F9031A5BD1DA4B93B6F75261A42B78A12503B6B3EF72BA6FED52D97C44011832F4F80250381C1E62A1054A70FF6567A5119EC8B7A4D70B0F3B79A60FFC1B099FE7241DA5A0FA16DB487E4DAA64CE4821EDAB9FC94E7671418AB860E30BCDD1EF00CEA072AB57F43F548732675197B3F06341F686B11EF5D9CE4C3E521471C3463F0A7ABCBECF7F6C3E7ACF2AAF1CB40C3134072ED50D7D75D233893C060E8E30F191A6AC021B2C42331ED1483158183747FC69926E27FF02A0286CE02C8BBCDDFF0D4FD955DDE005E06542DF046C96D68A485BBE612061EDA0020EF207DED537710BAD5118624D4925E33790CAD2195626890D7832DED67195A73CB74D75D36C987C802CA3BCE5E77D5DD866FB2C0E102B535D76DDE431F88AA1D7C0F1A68DE6623417D41A794471CC4180289B9B9ACABC1F7928EC3C3C7A3363E8D6C7803847727C53A94A96FA80699EE5C674F2693A8D2900269BCD9EA767DD98098F290431A59F3E9B4D5EE0FD581460EACE83EA8BA4874165755D161E0F43DF910A11418340C38C680210780BAB6F24EDF61CEE90BEB4E676F2EAE813997022B4820BB666F68A1BB2F97E392E3094016EA565D75D681C082779FC101B80BD418546E000E5CD1DFF7DE351E00002F7020EA2E0B7D55CFB3E050D05049EE23E022C35537FB774D2B9068D7570B38304EFA9B383EB49B8295DF4238F2DD517E01E6D4A36AC9872FF82CD42395FA211891CE8868E3735B5BE4C0705DCD8986BEB7FC484B6299C8126042CAAC690473F73A43B127F120E3EE47DCED42630591DC0F382BDA40D468959666506B0C954DEB8444ABEB067E2621C9D54F890DB5246F54DC667FDF48C5A68B665629402339745089C01209F41D6B28A3F606B32707E3E8754767A282C8A1801E636181CE6CAD9D4EE59FE64B06C5A28101C32F94B9863E6416D28F9E823DECD9E75639875E2B1558F8E0039A4D36740A058F58AE7A7090230C63421DA41B1497F84C317C558AB47052817FAA317090F4F58583E1D650E59A4CC992E90A61B50343D5691A65699A21CBB391CB36001078DCD3C6748C2F4FB96D448E9135821948306499D612409290FA68B86148A56C408A63E00455CA60D5D5902EC370480D715A425810E138092024825591409D35F67089C0E53C559140951E35ACFD6922FFB04B20B9277463AACB01EA7ACDCBDE968A4FA49ACB52C5A327BF212B6F89B5F92E435D124F3EECCBE6F1917ACC9750CE19BEDB6287F760A88011543A62296CD8816B6CA4A31847BB4B12592E3E857FBB51FABE206B7E4EC2C079E7146431485477B8448173AC41D430C8C6C61E7D1D7CD9640F491B02E8DE86DA0F1F4A28068C5D9B778CDD13D827A2CD96003FFD64EFC8C5A7ACCD2DB9E279AAC38E00E5CE8236056D8E2DDFCEB3E2957BF3DA4858D983568F61D7AF5915C305A2EA53DDA45ECED63D04DEC64E3A2C594624608446C993DC3BCFD4849F03DFB4CEBAAA07BECE24E872FFC8470E6607020C1B8045C364B0D028030E4FB35CB5E97082AED64986CCA673918F5991F6C5B5D3503DE681365D197E74ED3C6C3A73897CD0D2FC265EE20A7E194E0F56F6D6DB7BB8FA7956A6F40839D3530E9FCF49A117DCA30F7F12A90DA45F006FE5D4491A820A35363C416BCA05E30E389EC325590664277293A404E12C3070F882E1A0AB0944108624CC3753C2B0950C87291FE03E924A19351E7CEB601C669E97008ECFAB5481271ACA98C49108441AD9DB1EC360EACCC0EC1FFACC450A79287050B2CA8043924215CCA215B01080BF0F001FF81A72005006C7664D1970948AC6A8A18E3A01E20111580CFBE54553BF8FEBDC97BDBC68C263B41FF0CF0A6F7C2BF296136565FDF5E5C53589B1B246CDAF77A84C57038A9718E7A619CA80B483F9B879C8BB88D65C8F3A90AEB8BB7CC522709954C9EBA24A1F9245858B17A82CEB980EBF25D9AE3E65DEA3E5C7CDD75DB5DD5578C8687D9F31861212165BD5FECB0BA1CF2FBF6E6B2B5D8821E06E62715EA1AF9B37BB345BF6FD7E9F64253769321424DEF60784BF377359115564F5D463FA926F0C11B5E4EBC38477BC537EDDDC24DF904BDFF01AFE8456C9E26910F33224FA8960C9FEF25D9AAC8A645DB63886FAF827E6E1E5FAFBBFFC7F488BC10637220500, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901071551095_init2', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB721CB992D8BB23FC0F0C3ED91B674569C6677D7642DA0D5D288D6675E1929CB1CF13A3D80D36EB4C75576F55B5463C0E7F991FFC49FE050375C525714755F50531111A762191001289442291C8FC7FFFE7FFBEFCD7EFEBECEC1B2ACA34DFBC3A7FF1ECF9F919DA2CF265BA59BD3ADF550FFFF897F37FFD97FFFC9F5E5E2ED7DFCF7EEBE07E2470B8E6A67C75FE5855DB9F2E2ECAC5235A27E5B375BA28F2327FA89E2DF2F545B2CC2F7E78FEFC9F2F5EBCB84018C539C67576F6F27AB7A9D235AA7FE09F6FF3CD026DAB5D927DCE97282BDBEFB8E4A6C67AF62559A3729B2CD0ABF3CBEBAB67EF922A393F7B9DA5096EFF06650FE767C966935749857BF7D3AF25BAA98A7CB3BAD9E20F4976FBB44518EE21C94AD4F6FAA701DC7400CF7F2003B8182A76A816BBB2CAD796085FFCD852E482AFEE44D7F39E6298669798B6D51319754DB757E7AF178B1C13FCFC8C6FEBA7B75941E01AAA36B47FD6426306E8FEFCD3D950FCA79E0930AF90FFFE74F6769755BB02BDDAA05D5524D99FCEAE76F759BAF837F4749BFF8E36AF36BB2CA33B88BB88CB980FF8D355916F51513D5DA387B6DB1FDF9D9F5DB0F52EF88A7D35AA4E33A28F9BEAC71FCECFBEE0C693FB0CF5F34F8DFEA6CA0BF4016D50915468799554152AF0F47D5CA29A8242EB5C5B6F3141BAD630C361829D9F7D4EBE7F429B55F5F8EAFC873FE335F23EFD8E96DD97B607BF6E52BCC070A5AAD821A087EA56C9BFD3B74ADAEB5BC50BAE638DE6BB25B277E821C13C83F9B478BA49972C62EAAB25DAB7595296E943BA68D791D85B1EC2B2813749966041D5617E8716E93AC9CECFAE0AFC572B40FF727E76B348084A88F9D4F8AF9202739EC0C29A51EF0A5C6BF1A4E77C0D9E0291558045EB3040FCF76DBA76988906D79BA7008CAA6EE9D7ED52DE6BA3AA1374F263F90E6508B7D5B5F426CF33941830E097E45BBAAA999543D93274797E768DB21AA07C4CB72CB7DF0D40EF8B7C7D9D6743C5BEECEE26DF15354FE71280DBA458A1CABA6B37A8227B88B2872DCC5DBF4109FDE420FACE70BDE5C1BA4199F6F96D823B878A762DA508EE350BF504755B0222F45B06E7D871657F15FDD4F5CFBD5FEDC0E07E75A3EEFE8018550A24F6550A69DB6BD27AB7B115C9A64C1675CF958B4C5A475C731250E91294C1DBAEC8665FF1171592C527CA12D38EDDE6B6D496D4103B0D024A290D4343747E7931A8D7264A772B999C75EFB67E54C1C1B6646A694B3527EDB44511F5A913D4A7C22A2B126923D3699CC40CA74818CA990E9C5769A29881D75F43256F9110E8A81625549450A10E26BC8CD21D602C0F26CA730970EA124F280290F4AC22428E736AF9B594F61906919F583838A8BFB63B81E90ED04077FF3F31C1FF25DF44291BA5AC93943531A748A4AAAF3435B34FB9CA5559A7E512D8B4FB44CC297BDC00889D24DFA5FDAA0BBD94E7A659237949404F4C489A6AC7F3DC485DAE93349BBED9CFF97D9A8518AEEE2AA82CFFC88BE5F403FC9494D5EB45957EAB67DE73C3FA58BEC9F2C5EF0E129AA747917F4B97C0112C6EBEC7B3F976930C6E15B5B41F2086BD822910360BB6D476E32238E0BD96E025A5C2D6C514089A3F5B6A6F2FC7FB08DC9FBA48E8CCF055E80955E475EC18A6C4681FEDC0E35E0AB645FE7D5D24F7E9621ECF92CBCD2A4BCBC719B69D7C956EDE367AB5CF71EB1AADD212D33C00AAB879ECDBE661A5D8133167A1DC13F0289460BE28FD6DDF84BCD194726C0B52A73BA955A70602509DEA7F204D6E280D66823054E4A4BD915A2174BD21B5B1A8D9E934CC06E66E106962173910A9D6C9C379297E16F235CA56695B27ABF05DA3655AA045F56B31831527EE2487B4931079A53985ABB712E929DC5F0AB2A2D552DF6C2A45C908B6D510C75767EC481D75CF539218DD6AD4AB551DA454A96AFF27D3FF5828573D30B402A8E9ADA0283A893E2B9117455D540201AB5FBAF97D06EDAF2CEB9760A34BB67769B9CD92A7AF456D1F8FDBCFA96C3F0EC77BD37D4873B4E7762B27B95ECB5A43B15EC346A90EB37000B3E93C6F8C3F5E4DDF26A1D6EB151A2E6D80A6F19F417C2BC873A89AF72CDD092EBF6FD3A2E68D2082F853BE5AA1E5D75DE522206B1F0D642DB3A25FC5E96D474ABF8AC60F0072AC604B843305576C7BF4A9ABE315A07067C0A577ED66C4F5AA2F81DD1A86625B0F0BE93581D6BF02268FBF8F6237209B0D1983C73D196C0B96FA87B03D5E7F9A410F285FEFAAC7BC48FFEEEFC117B78C43DA325AB1EB23994181280A6EB7B72EAECF1DE33BC768878288BCA002068DB54C6F9ED6F77988CB4EADD00E72340867BC22F2A98EF8342CDBB8979CCE5E224679091F13467823A48D1E63DAFBCBEF8BC764B342D77802E0AED31077038B0FDD060184930B0CE512C2E673BEC13B158964F2200D0DD4E187E001828B60729203B0B644B7198141EF4D7BEED9EBDBDCA6DF2234D0731E48DE7701D2E52E52F7C0D0FD09B4B4DF92A7D24E6A21BD846C5543BA6E540FE1AD3250FC8A37BBE16559E8188A984FB3D19047BDE310F58E909B362FC6D45BBBA35B0525C62DA33930754F4C8A99C474C0D386FE63874ADB20AB5F76EB7BEF2B7CF5555E98BBAD20A2A9A9D4207142F07A4DBFBE0A2F8603ED43547CC510A842768BD56446A2631FF5D0B7C7B779A8B1DFE6938C3CD0E569B22BFD0DE3EFF2C56E8DBA50DAAD7C205B145BE0883584E4BAC644DFA604591224D283616B13855A18463730EF688D7DC96B2BC2C8BB40D4538F464FF5307348A38E494C0A362626559C2406FD1D033D745A0A24A8D872485B0B07BD498F651593125D6141B3E97FABBF1A12BE875611BE0532207C07696F1833E7170A56D6E91E44D3E501CEBEC3667CE266C393F288D4DA67DE6F73FEA060E58436E38D01CEEF563723DBB05DB61AA60EFBEBC4CEBFA6563C2A738BAFB61E481F9C29F297EEF95920EDD3F650F158DB31461EDD6F29FAE30A15EBB4248B823976F0456E49726EAAA490F8B5DA32595EA9E8F1E7E721E831D9939050B7F351C53F24159FC996052914F4BE75C740530A850C48BC5C9342DA2A426F92CDEF2ADD8D2A87E2A202C582F603C1D8EA3DADFA01DF5A76BA09D03FAE48E81B5FEE17A0999E9566727D551C021BD51CB0AD797493FD73BE8A1BC5016E1412F70BBF5D4238766AF7132731C76C1946028ED4A07792139368261797843A3184C5094A82505A17AF22AA34331BE550DBBF0608EE1CF95BD9B31AC0CBA6D4346F27864E4CFEC4D70151701E91E0A4E407AC46594927D56995115FC6B77D055AA6D5DBA4584A94BCBE5CE81C57242A745CB9DF69B547667A4CED2B507F46510A8B33C62BC3C30FC052FAFC9C67F84039CFD158F06F19B8C4C9C325AAC4A728D97D65A6602A95C854D33E7DD82545B2C1D2E01A2D50BAADDEA12A4933597EA662D982910EF6559B3A778DACA5932069C1815C78FA3A9E59E6540D386C154A7C71FB80450DE54AEC26F8AE3E7EF14370F97D8B16449234D77DE3F9A80E09B9551B080FE5DECA6F49B61B6F3837980176A564145DA1ADAD1865E937543CB9EC07A459EFD0FECDF28D7BF129EDC5CD6635CD2627260034DF18CD6F106B7C2E43EAAB1A8FAA2DB21D5857CD336138DC46B8AD3B6EDA605B213CF1F7E3794F3FD351E49F92C8F738DAB88B48CB030E2F59AD8F7156A3BBA3AAE94736401B0B7EAA8A97D0F790F251AC8F7D169BC71CD7F8B7BE98ABE11F2672E0FD71F476A671D87DBD5C166802FFD4B8251FD2964CED1B76FBB2F3CE65BA1F039B9DD3CED5BF51B18A83D0D68A5B16D8D6348F5003BD2D8F02E9900492CA6BC9C20F9BD78F657EDAB6FEF7839957222D6BF12142DF014FE5B4C080ACD4D5B07626782415BB90094AAAF3A022F15908E91C70604EA1DD943D662020CA830002B561285B0A1B4474EB50CB9F82C210520AFB86A11B184B125C5DCDD826AC6CCABC166649C9DAB0DCF9A5784E4C1730712A0E16B485BF9813A9EF742B377218A14922CD7C2CBF6ED106EFDFDC45697CF7770AEA903A8A80541D80E2D1E9A101ABA2B68AFD35993CBC4060EDC97C3461820F70FA91DDAEC3548E5B8D78710586A31A2F0CDE2831B528DFDF78AA3D2531AE7B05CD1D8918704AE449A1445927070D7FDEE21AE32A48FBCF9EAF34236081FDE3A33ACA69A66E14D3423B21C358860B0A59C7FC1AF72C709B8FDCC084413D276946736919661BFF5233749229033386694A1BEE2746663CBD7D5F1B3090DDD6587099BD928682E3AAC1A0218F6A8E2656756FDDA3035AD0980696757780D1F49802F4CBD1686DAEBCC56BB7DC154FCF4ED742699CB2913FC3EDB959B1CD7535C92E3CCD563FC975B12C30FF4CB1E1E3467D481BB57203D159568D6CA9A35B4F1D2EE5547D0C621375BE8D6B2B62FE01EE82E23E07B635C1013458BA87408830C31551529F94A4AEA71C1480C0C54E0B3C4841198C200AA5802E31E355A6DFCE2C4BC1B1FE1742E765A0828F850EDE3E38B8C9407A28DD304040E92060682F9791963B6C37A4BA5ADC83C0B6820851E08D734D73C7E7CDE33EC89EE670D3788144379013DDF440891A7A0B94485EF95E69B565AB1EFF5100627F854231F1B100E1BF2D588523E13787187B6436717C93524912879DA3FE6A1B96E2F06D6241CE47A13C56A261ED74772EADD807DC5D8062317D2E00637B4253A7F9A51A00B3FC02E5CA5E3ADBFEE4075FCBED53D53BF919D7DCE6B7DDE26DACEEE3A77C65BA833295E2CE09B68529439AF2B6BEA5D5048E0AEF50B928D26D63F31DBBADA44AC63F825D0590BF9653F5EBF5A7E91B8D1BECBE6DB0E6B27757E5584AA41BBB57CF7CB5287F61C14946E7ADBEAAB3B88F9556660EE155A2E2F50A0D5752235EFD637EDCFC5AA892FA8569E9D732592117194354AD78EE392EB1ACBE2BC1B202B6D171C2F6AE05A52C74208478450583F9C579CABF61919817F57419ED1D548DB86D806D917F4F33ED05398EFBDB9FC2A5328BB9334F5114B76C080A634A7ADDF5708324068A05310CC158DB76D6DB2C7F4248723DD296DE31D29932F100E5E2250904649F267325BD7B6ACA647D144B815C9902885F44886E3ECD5E7835D0710F03DBD2BCD68996882867CFDFA6552A91600E6296970E2A51EC76CDDB0A4443F9D081470101B6F54B7EEFABE75133EC8BEADF7749963EB4170AD4E3BF7A375DEE16EDB3C04FE81BCAECFB89365813E5B0361FED639926455A2559E3D9C4A164CA9C34FF133D75CC6160D33EFFFC619466B5B16343EC1597EBDA1546DAC83F8568C4E8A96E9096C866FCF5E14D5A548FDE5AC5CD162D522C6BFE9E682EBAC2ECDA1F8A64B96BF6DE2C59846073D3F6FE8A1255D49530CD919C40458A360BA56B4CA0A8CB05FA96E6BB127FFE1B5A54E337F829D9AC76C96A82A15D66E93ADDD4D3F636D995D3B6E8A2F652E149B4F17DC27498B448220F4FD8DC9B22D92C1E031DA4345B60ADB08DDCC85401C5A3D1EE140F938C1929944D4CF07C5219CE4C7B8A4F3EEA1ED60040CFF077798F48A16D4F86AD0CE84E5B481A20F887D3EFD0330988701497C1791DC76B2A199DC431643C84836D9DEC992F5E11C5DDC6EB51A9D9FD8B4A924BEF5B6831EF241959716B2824D94A515E826DB544F27E85DE4EB52F9E287B4E59F684D6DA78D552A7DD596A9926DDED41A5BD6D7FEA3ADB8179F936F5BDB111A05172826D05BCAB799BA5C8FF75D9C9AABE375552544144FDE526CC96412A91051F04D16DEE8D064BEC042FC70C15F4C379C7B7901319BDE281262A155EBE18B55055EDD1771D88B037B725B23DB92B0EEBE3E6AC39688C53BC8211CAFED8E195981F8162293D7D8C8F1F8A7CB75552B48650D0932997519305B2A5253E0193B7F4CA6EB6308A8E7210B2AEF2607E2E84ED1A31F320AC81A3C208B675B2FA59DCC9E34EEEB3939B5CEAE8F77289B0E4B77A9F7375BD47D81DAEEB2A5160826D05B24D6AFC0DC2BC8ABCD9E15FDFD2322F26692E0AB0031460E17454891E0D2BB23E12AD5525ED645A5B294AB531A55A006FF39F31178D1AE1EB2B3ED591C53D7E430F0FEF92A7899A996C5451DB3DC5CD42E64CC51DEEB98B78B154B649D020235C7CD95B3134FD0CB29D350F2B0DB7B106386E5F605B276BC50879DF1705F20109649D1DDCFAD5372FF0140FC39D845D1DC1F0C32E5D36977D4EF17BBBEA510AC2AB4EFDC22E54EAC6092C09043DF3E672E004AF44CF51C61D928CD38626EFE4011D247510315CAC5515301CBA5C59C33F94398BDE5324C6D0E64A0F9A3ED6382553DC239087CC92D44DA02FB23A7CBB81DCA4E0A2F03C62E1A90DF0CD493759A06F180C0E562D81758AA83DC8F1F1A5BFC960E0FDC24DFA7F27E22BC91C22C24255A3D007DBC23FBFA54C401037C14AC2A50A38F45502C5BE8E32FA886574C7A2B08C0396FADD5083926F2A4051B629A16D4535E174F3DE37D09A9E1320B35ED7905E92F87DBAC1E23C4DB2268C86AD06CE548F62186C6BFFFCE03521534692CCF1DEEC5825BCB1B4F98CF5C85ECD369235548D285E60A1A0898135D2BDCB5552967FE4C572FA966F3EDFCE9033E0637973F3C95774451178F222F02A59995EFE10D028F4C0B64EF6BAFB167DAFB4031F4981236DEB07BEEFDA63B26916B82FA29BC7FC0FB242E9EBC028CF4F4E9E5FA312559D326467CA84AA46790FF30B64820C1B7E37D00B807CF390166B071B5914097B2E129CAC80D01A17AC805220C0274906E96505BC45EB6D66FEA0A0033F3161F5A58E68ADD10AD0828DEC3E66D090E747A8DF9214B07369F675E351B53F79D53EEEBD87B4F7B62217DC7EBB9DEAAE071A765DBE4CD86C0580207B6CDF13ABADB6AD1577DC680A8AC6E45396769D40809D82ADE41DEFF22B158866F26EB7A6A45D7B67D7B8597E2CDF67C9AAECC76AE6E88511F6BE06A43484ECC3D3B74445F684A79B964D2CED3F23927AA1572A2AB4CA4956B0DA6FF4D5F97361AE18F89BDDBD50E585BACACF28C333DCDF8BB695441F2BA6120FFEA3384DCD84282689F2FFF598A21ECB3C13F40EDDA795E9EC60F9B4A4A05F3810AD25FCDB0C9FC2FB4C5E21789CC5380F315F972522115DCCA8F929C5DB6ED626D733E3F56BF40D6D7614BC86CD49E29D4D49C1FFA8866F348616F6BFB94FEF0DAAAA966C21E69642379718C3BB046E4B36B546B4615F1E79508546340F3D6E8B64533E10339CA1E07824C636532EFFB829B17AB046E6E2FC1DDAE665EA27CE7F4BD11F57A858A765E92B925854F34C5183C594E45745FAADD605617A1B11B0D91D48F6256F0E6751CD43C0CF49898F51A40FA65CFE5B5A265E9B23356CB2C0925A8F0C494C16EB5C8C592C1E93129952152FA4051605B5E3871933D7078FD76B953E68391D5DAECE20B3D0209B87F8D76881F0A17749CE351F7609E6872A3796E2F83486EB6236CAAFD1B640259995E6086DAABDE093226A5B97A0D00AFAAE0B62EF5D847E77400AB8DC609433E92DACC2AE9DDF7B4FED3E241DF782801F37A6C4FBBAF3235D730EF49733149E99E43BDA2C6B7B90A178CFCBDAC2E3433A21F3B30FFD3864F310F1E774F5D826BB961347387E62C988B7492649B6A9607D8F81E4F610E09CE8754CECB26A7BCC5383622ED530335746D09A8676D143B884E11E446330CD45BBA2B0E0E91B8C594E3E61074BBFE5585B5C9AF2F1FF4897F91F14B887C943082DE2AF427028675221764581368BA737BB270BA9DED5BA41594657F33019C231088252B9C73BAF72CE1D5D741B6892F2358CA8FCBA2CF3455A13892574F7EEBEE4FA7AB9599E35571D3CE070F7FBC4478E383FFB8C89956E3179D2EA090FE6D93371C52B30F7B72C5ACCFF20A0BD460FA8201E9249F6362736A524DD54E2756DBA59A4DB24D38C8DAB6778D14B88DFB7C097BC435BB2896D2ACDE04D9ABE4A8A36DB92D881BE1DEE0E5A479F9717148F18B14E6BA8ED834168A6990357B0510BA99F736D1BE60C25F2A90F4349FA311D5B49886DD2012A5ECD2CDCD59ADFBB4D45CB5E127888BF38501B0693B5323987693A32018B69087E403C66CA5B063CE5C04BB3F3D07CBC73C83CC3B23FB9CFD5CDB350C3828F54FA931C3FC051D6B2CF8BB3A4439E90C7A46431E9435B79366EAB1F2AF4015C641CC040415CD53C9F30174D2C42808D86983206AABE130B815D98806D405A1A69E354ECA8D978858CE18EFCA3E4951E4AC62B35064B7E199002FC02210CC82842DB13318A4048937609FCFC4C528B04ED7CB24FAA023109F3FA4A23A5423309DDF6944C4213D2A4DDEEF9E6AC4CF2395FEE70DF9BFF6999858156314D8BCF8175D82600168251076622B017133213486893F69B1AFBC256BD0C319CF57E2D8DC95A7D2312F934C14626E9C9F40CC613DC546ECDBAC1D5D678BDCACC82412C5543D87012877216AD19EEC304AC03D3F320F4E6BAEB9FF2D55D33E3CAE9EDC1A41C8321AC9966C00A300DC88721D945687D2A76118869D2705D6166E9A2D49D07908052650695596C7832317250CA7267675232050D6461F6D3DC9C3258A7E50EA8E9098D7AB61C321F7774D723DD1FDA8B76690D906F24765C25D7481B98FCE25D3BD629584A470E233B715B77363EBBFCBE784C362B54671AECB942C6022034C45F34A0CDAE053700DD471833B0138329FB31017329097D108CD56495E7DC546A3F2CA97C91D50005180D6C757B2A6D05E2321AB871221B6757D4756A0A79A623BF491FA86AB371DE9B64F33B370C29CF01B010B7516096AA16D4808ED1466232455726602F05A5F75B11EBDF62DD9121C8A5170B07CAAC1EC44A60718801EEA93B369264825B9F421EC104356999C0CF78AE23F1021728DD56CCCBB936B7533DFDF28399B62E7C0A5455B3F32DD27700125F52CE0E766C34EED724A749E36932D2D530FCDEB1EBDDF068D2965986AA36CC1A824DA996012E95363532938ABD9A9147C5C931E94C5F69EFF8B45D736D91AB646D8B6615AE5D1F40EF3BB335338DB4E53A3ABFC0E566CFA4436D95BD38A428F54A1ED0F278A2E24701F5B4AAA5ACF9890F2307A55C7681A875E75A0E0E629A3E82BE39C3F058673AC84ABA3101DF48C86A611999FBBA498C38A1B7FAEAAB2AAEA6C45A0E6F1D544D4F6F1C36EFD4245BA3E9E41C86D9583A9C4E5ED9B34AB76A7D98D4EC4655D138E4DC0C4BE0D1B994EBD2AC4CCACDCD7E9B02EBC874DDD5CC1DAD7549F9425A05E44606DA4A4ECADB912875233F11D3F6670AAED312DF54DF9B7BF3FE9C6FD0533F107204D26EDAF22A10E731D0368CA76866FA8D59DF9909B84E4F78934ED0F5F684ED741B30086DCD6C9A8D166E64F2CD55D98DC999EC903651B6E7B7B9A5201B2A8C28C6A846E61662625726E72E91E4265D186AED8BBEC63287A126C592C25A67D31D1B548D81CF9414FC3D8EEA06F6697AE50D9C87BD16749D50E61844675BE3C61DD670C72187849B253B3B10A49ECA2E2AB8DC9F1506B7208866ED49F0CB56DD10C65C49769B370136363853AB9BA39D6D4F2C6B33DBD20EDE7A66632F33B4900560A8D9B4F4798D5E9E66AEB6CABC8A7A27F5EA73ACCED825AD2155D50D85AA612B335D47693B3495C6AE22BDA9CD612F2C5DCC408CCC0E500D6BAE33313D800DCD637E50756516963B383344DFFBDBDC4EB6F5F0234AB6A18DBD906B427726673181E8666688FD9268241F868D3CEBE147E5347B41162EF480A62F33B099831CEB2BCDFF60944862C323B6A24EF047A340139E476D6703977ED453D8B7F48439987BA27E2CB67C3732CFED19BFCDCF6BEE7CB63F3C769BDB72195F23389F090DCCCD69B2114FC96B32A21CCAE551370E1232C2245A2F0C1F9CD738F4F385EA558F774A4E8349721052ED9264E06A5F31E88EA0002C187A6100B38ABC00609F3CB2B8A21313309482C026ADCF7DD0A4BBAF8FE401008FC44D7386F150746362863AC8FB247A00F5DF46FC54FF3D123335B8014E6ABA373E1B311D98988718C29AB45D57983BD10F7D0FA66622590545B21FC7EB49694B137396AE1F1330988EE807C367F4B517351A7D6A32493D8B4C652669CA64ADC8952C2BDEF6613F1D05A6E3421D954C4D6273EB62BDF29ABB3024582B303BC26DEC03332A473F212B2A296466C5989D0D7755FE295FA59BFE524519AA180607198F83B4DA7BE156260E61ACEEC5146CA624B6197FCD19D2F843FE0D159BBCA82314122E572876002CC45514980D4341D8A1B366DBC971F849D1890998494160A383665365BE73E67A9BE54F08DDD11C203D0E02C0E069B385B33A6A42B8A15042724E0D75E654F4648A63A782C826CD53D5E6E7AA5FF27B3D3761A0E05C447002DC43FA3332D7502D4FC92D14114D9AC5E0B37107EECDDFD0A2225D273DEFE75936A91278886758501BCE9135029925248C198893343D9980A9340437B24BB475E666B2BBC65F4FC75B2D9882A51C78A9432AF5221C9781B8E6A7E31B8E98466A505D63766631518200D8C06C33BB06A4E8C8845C74C0FA4F3B840F45BEDBDE759CA099760658C151359C035BB1F8E15C5710C786E529B017D33115486493E6DB2A73731456DBEAC4042ABD5A045570530BE5C04F34FE49356D79FBD3F11140DC03D1BABB9E1B4A250E7C544E9A5B3649FA313D571DAE7CEA8E0C86DCC5818F7AA29B9BBB24FD98FE387780DC758D56E476DC443D1741E1C0052B4BBF0500EF2CBAB9BC1F1370929CB887A299D7FE121F76E932D92C908DFB275C47EA6BC5825BFB5C495A9BC72D54DD99298C9CFA0930E9C5DC77C2D030986F561CC87C9B880FD936651E5BFD70A6E349B0633371263831463653BAE28C79092B2CA5938CB921BFD265E756D682F3148A15ECF215AA1AB448E51D2C6FA1417FA6E048938930D4F9E6CDF20D8E4499B3575A633206B4C9EB1BEE21B7B62B73F1DD41A585BE4625AAAE92B2FC2327394F0CF84D5A033E7288C07607105963D3E691D6F66392738886F07BCF6CB7089FC6EBF3136A3C3B65D3CE038291C25A18AB30613C5EC80BB085E9FA3852AC30494F26E02319714D9A6EAB4CC4415837C434C775B08AB941C5A031A615791B7BB6D89555BE4E369BBCAAEBFE84B9FB6D5690C92C5F9D57C54E3C5C108437A8620F47185553021D3105660251E00F55BA592930B5105A84EC7BDA7A9C024AE1CDAD194E052A2D0A2238A0FA8DD0D554EED42A08C1A0A21AF48070B0AC17A44C8B4486C0A872D7CAE77CB953F7A381D0229423324450FBE442F55B5F6693EA58799162C0657AE65272AA298BD229C821446C8A772D5D99900D107999F008BA11D2E1AFC051B2F1B16CD0D5C24A87B2C905AE414B658E80103259380C50C970E887D7676705C745E56ED54A2D551A3E5898A993273A3668D394B61125567334AD0208CAB24ECF36DB15A02743D27D027A9EA36B8689F10CE2E6A2409BAC6E153E2E6EB94E08AA076E335433523AD09058C960017BD93C3230A8FF245F3754B17E8C5BA20BD7FA9664E76021F408B99729204AE101908EE95A15515C61F465950E49FD4E41B2B175CF3B74946F7D4241B2F73EB51A24BFE4F750FDDADD44AF7A51F7A012058CB96C3643A8C064B2016E90622335ED43EDD8A4E848EB356686ACF54350A0EB9D3DB4A2792559F9DD0DACC96AED6CE2D2F53ADC38D8A0D30801FEEA44ABB5890630587B83EC8E1AE4EFD30DEE0A3E35FE1525E06EC900E8B70D3C20857E4415EB592681371EF2DD803D443B0ECC2C90ED4CB799B5877B7027EB2D268648DAD3BE0A576F25E15052277A617BBC1B6681026337C701863733886F8B3BD0DE4AD48F873EE10BF60A05A2CE2C648088315E60487332B40681FE265E4E0C1E523B12AE82823083DD424F1F1EEBB854E26C1C2A32C940E52392D4800805D86314A492219E8456063432A78D014D8C4831310980E992134304D60F47A8E34D201123402A2D1B3AD0ACBE3C18EC6F229D5800F9481838881EADF550410C16054000CA861864E0A4D9BBC6EC070F7C0050F7BA87930DBCB5396A063FA001060FA2F0197863B6550C5CBC03847BCCDCFCB90F9CB9D3D3318EC7C01BBBEA5D675E95138005D48F80815711A4B7F91A9085450A904782CC9F4083415D4BA21ED4783CFDAC8725538F56C247A1165113394325373908F9085840881E9D855F41060EC9C8B2B3BB176883BBC8463F40683ADE034A47DF9899740418F0000480A9E83CF732E94995EAA64B26378DE77B6C89D96927B2B132E57A2547365E2B4D69F431776A7BF787EAA42A07560C445607248DE191438A735C8D9BBE911B22C002848201E50302E121027177860A1AC12821353BA47ECDDCE175E7A0E62E0F602729B062EA65754076E26E31552C25C50B910CB8CEF4261D755BA93AD54260F26101D010A1D88B540599207C3A0205E1ABFE0EF5AEB99105B8890351CC350B09720E7DA3AB621B0E15408BF66639C0EEA4BAE9BD6BEE97A14D4B5F4DB50D696BC35B9CE61E5BB9F3E99B84584E3E6301897D475D579BD39AAA653FEEA1B20DA5DD684CB50590588E3C3C3BB7450E1CDDD574E6B0B66862BEEE5A050D618673ECB9EBC824AB0063B63FC864ABD36633B674EDBC8B153B2F0F22EF3807091161B805531080C733C94E2BF37A512ABC06B5B4671D4565C5310A7440D11FAC548D8DAE244BBBD0DF79DA5018CC776838663EF7E198F4E573201AAC0617E2329E55778C0F20405539B46288D24A201D79673015F1E49825B22FE0CA677CC8EEE8BC7710E514D0F2F1C92B4194E3BDDE148453201E7B35B34D2B56300C683A26C54A75A6D3342B926D73C83CA6A711056B3AA4A14A504A516847DF1D5819C079766A45180B6F2C6AD8E18615631C29A13B1DD5B4786873BC9BAD5CA9E320F53A1937465F158F430731997A023CA8C4BF1D9053499518121C96242FA42B952459207956A2C6E27FFD61A8015BEABCA65AAEB1DE358B266BA8BBDA69AB86FAA9136526DCF1FA7CD754BA14E99607026B3627A88E74D3932E0943BC531C3DC5D675DA14086C333C9D56E54AB639F8ACCF86A227D7006A3AA8BE4650520D58A7E7AF3EA3BC09B96C794BC8711F885C139DA115A9EE55D7C200B8C125AE3C4BBCCFD5B03CEBFBA8EA822C53BB8A6CF6240B4FAE394925241C57114B9D9D1C1E9C343FB907C1A429C927211997335B4530557A6D78689204DB1EC492E4D41ED9D9F712C8FD0C396BE85244B37E158A24D1B4A306F3FC50E5A7A1480B3D92170B94C6584317131F1655C2635FCA4C76A2A11BBD6C9E3BAA297329E6E5928EE292C9CBE54B934B260F17872D0C35002BBE94285258F968645514AF778C4F7D52DC53104C9A2955F1FCCB28B92A34446D7A5503316285572E9E54B3E3414D38C9A78296065941C111ABF382BAD2519D09747C2AC2392A21F21964B36447A8CE67490F4D7CF2AEA29C3A83E5186ECE50B6458044DAA48CCC38546919E91DAC7DBAAFA0882A05238D6978BFEFBF15423903A1DD509B5B90DDC254D90569A13C8411506D88AA7C825A12FB50A50E45A0A08690BB03EE379DB7C37DF474760E0A4B1345C17BCCB24C6EC0F08D92BE3163D0A57D631F75B0911D14A4D1257A33A1B53BA9BA7C64720A8119CBA011F039CB447A181182CF52C61ADA9AE014C146AF9118DA3C5CE00034F2C28A1853490B3043949C228A4C52D030E05C52224DBAA8217AC2C0D9A30CA8EC4E1B3AD7919C32D28C48D028A09C48E21886F0277ABA4059904693B37CEE1E3D558C394696E7270C7526E51B3E078D7E3332A6922C5F4D98AD681A2A01B954C08B7D75C615EE165E9A7385B98758690FE78A2C2BA3E86C8A6C2032F38E49F210D134A3491FC29B7C8410453AD38F2661C888064365420B4322B295EC86CA7C1B8DA06C2B1253111DA82AC09B42551E06F06DA171E20676B846A91BE8A1C291AE946F0E4D9235B0F22ED82B6D791E0153226ADEF5EAD30E8427DED8CF7FE5C1F0C1CD4206AC92F4923AF0D62102EB361219FA1189260475875C9E9481DF59FF2459E877DACC35043953793AC982BD0398864867C6F47879D1E0E9C393F7652F2F6E168F689DB41F5E5E609005DA56BB24FB9C2F515676059F93ED9604DF1A6AB65FCE6EB6C9825C19FEE3CDF9D9F775B6295F9D3F56D5F6A78B8BB2465D3E5BA78B222FF387EAD9225F5F24CBFCE287E7CFFFF9E2C58B8B7583E362C1D8785F72BDED5BAAB0C6B1425C29B19D2DD1FBB428AB774995DC27259E81B7CBB500567F106E525FF624EE9AE1E2AD8BB346E0C9E3E1AE02F9BB1565D757CF48279E49B48E816CEFF148D6F8585F0F0A89DBBF5813D7BD5924595274A1EEA910FB6FF36CB7DEC843EECB6B13DAB1F59B2FE618C8BF2C86E68B3986E699398D010A22ADC2F00E3D24BBACAAF7F89B941F91586A419F0CCBA8F4A18D11CB518A2B33C7FA067FABD52F1A5DFFD11CCF55429215F01C307CB518677B4FCBE3A2BF5B602B109654CB77F5E18541471758E37BF304627B2384B655E1FA75BB84FBC61458E3E3FB467D36C7F5B17C873284AB714B7AF82CE27A79C189145E605D08128BDB37780968231F6FBAA08C3E62B245E22E2DA508C6119AFE02ABED37DF0DEA735C6C71B1F58BCD24F8A3C172E373B1D8AF372D8691B494A65961731A3ECFB5D3C5851C17B2FD42F65BBFEEEB76AAF51A57455C1516ABA2B1EF382D09C88A65B01EE06AE32C06FF03F2E5BA4E7040A3683F99E3F89CDFA719D78FEE9BCD81B3B1D8F107CEEEAB39A64F4959BD5E54E9373C252C36B6C486E1DF64F9E27791E1FBCF16E3A492EB32235524DD95638B22ECE845D87021E224C664D74006A24C5E753C71F6BA48EED38528D4BAEF76D82E37AB2C2D1F45747D8185582197306F9B0B6246A850DFCDB191EBEEB2C2E71D11215714854114068C3ED344F076D669A028E5867A0D5C751C61D0E56866665792B7598E85F498C7D27D8B0B2B2EAC7E61792C2AC70535E562DAEF9DF51A2DD3022DAA5F8B8CDF09A982B85CE37215F6C12E4186D76E08A737B1D8136508C659CC4D6B3C8EE1ABDD1E0BED90F4F7B8ECE2B2EB979DD772735E66D32EAFFDDE2B3FA524203373FE4CC574E42A0C6FCBB2762FE15655FFD5C237262DB759F2F4B5A8DD5219BF18A6248A9028427A11D2BECE759220E0DB63030122A9B7CF07577FEFB98F57DC28AE6C47F17A8578DB14F5D9D697AC9E04D8A1AC2FB2B8B8F8BE4D8BDA3B4E5C907C99958D6F85965F779588942BB2B9B1ACD26F1CB2EE5BBC368872764C395B278D7317B5B8BAABB405AB8E237041C1E220523C05E6F5278EC1C8071BD67ABDAB1EF322FDBBC85D74495CE471910F4E3FBE6E7B1EFE7A133BEAEDF7B1ECE38277E16FBE9863B8795ADFE79CFDB3FB662545007563F83AE7E18E2CA0FAB9C410618E5F5F5C71947551D6F5B28ECD73E924EE68140E224F5D7D1CB117D6A7F8CD8E639AFA83859042192FA2EA2F71A1C6854A198935C1788D6CC5140E2793B1B2FE580791F6B9B17818A10A2C9494DDFA9EDF7CBB6F535A92C40561BB126E53DE51B5F9626145598B8E52DDB7B9A429150C9347C815D9E194F5922FB3C3CAEC5E025EB6D486E72514600A6CF0C946CF96D860948F9C2F9BDCAA97EC4A5EA477DF2CD667BED81129283E1E644BEC314212882FB3F1F358A45B12718EFCE43D3D9822079C9017BA50E8D257C17D8C29B190E6791DAB8111E63918BE418E236A4F47AF3D71294EDCCC3A340E17DB8EBAFE38DA5317E9180F47F2BAAB2BB233F388F61DAB7BA6FD7920F388755A6EAB683E99E3F82D457F5CA1629D96A51073822FB33855267578899B2A29808B33B1D44E668A22731E6F8770A6B528C54F4B8A13DC212479ADC5794A7318C778267B3FE9BBCFE6ECB88A8F7E1533D9B49DD6AF227BB8C1CA55D61E67CD9226790CDDB7B836E2DA60D686C7A2705C0DF1B6392EAF93585E98F6CBB47A9B144B57CDB147E0A2322A2A8FB4E082DC75FC9C67588B13F54EFABB85E5D83B185BDC4DE372375BEE098955BC40E9B622B7311F7649916CF0A2EC8296BB89002552A7584F7608477289F0BED0BCFAF88533A4910F56CEE76841D8310182AD0A85160267C8F206C81EBED009EF6F49B693236E4B2D1C42AAA4DA71C6B5EE9BC5E11C65F8385F3C0117CD4C89058F604E1563FA35DFAC2E8108AF033740DDE728C4A310D70AF1C0E23BA0E03E2CED6E1FFC507AD2F104610AA2588862A1170BBE72C067E14FBED2F721EA7F73B7FA02BA707D618FE70708CF0FF6787E84F0FC38F50DF0EBE5B240FC7568FF31CAAD28B78690485DB61D27A9D5D676098C24AB39926E12C02F2B46258E2BCB3E56B759427AF3E8DD223EF778DE26B846D22082FA680748A811C4F35CEE83ECEA81FCB1FCBA451B3C95A0154A2C8D12284AA041023D924DB6633D57B1C3207191351A04E30898719CDBC33BE153DE1FD01D52542ECCF09DDAD2FE4C9EBE79AE6C0687EBF3BBA9D7F5384FA7C23F48AADF86014A05FDDDA67F10AEE1AB5DBFC67A2436C6132C7F43D1973A485492F1334B7F9FDACD3F4AE8A397D0FE073EBF23DE0C87BA7D398675095BA5E2080498F39817C23C257996EEF4283DA6738DD2CE259DABBFD00B62DE9ACFAE1546808D117320F41BFE4B920E9BC7D57F8CC2210A8721A813E60AE7E875354BB9C47182EB8D646DF2765A09E3630738FE597BFB85D0451AC3B4C66E1D0DD7A6F84E51603C79794553185C65C7B4FECE2156EE4DCABBE5345F2CCE1002E3CE719209A55A04BDB08F27A228C3AC4E44DB6D962E6A1BA37B806E1689CB494883601C61869B8222BC509F6DBC792BDEDEDA7EB23108958B22DD56423814A6C04ADD4B04752FB162E459C39047F173FCE26757E575D25A3F073F1E8D8B08D2A218C91A1D2863C0312569B946D5AED8002918FBCF36FD4A560858A6C3678B7EE54254BF3CDEA84591C6BA33A595B315E943FE0D159BBC489C62822B6B8F23BDC8BF7B1C9B821CA0C4331AF5D942991A2107410CE216A58AA954A979D63DB94AC3F22E7E91B29AE309143F479AB8188E7E315CAEB759FE849CEF6ADAEA2E265769D57196C32FF93D8FA0FD648E83520B8487C26C9139CE7FDF2559FAD09A6C78AC42A1455FD106482C387CB5F0804B8AB44AB2E6728A4728141E8FC6E37B0ADC9F00C121C21D87F5AA24E2F9EBC39BB4A8B8D9620A2C6E42B66891E2B5F2F744B4F9F165166BA84896BBBAD65596F0779A42A10BDEBFA2A490A16DCA6CBCD4F0AF146D16FC7D0C5360C17905FA96E6BB127FFE1B5A541C52B1D4C25C9C6C56BB64C5F793FA6C31EA2C5DA79B9A606F498E057EEC62B1136E51D1100ACDF1520F3DA0E72A40B11D6E12184486982EB3C3FAA648368B4751ADE4CB2C642C560638195B7FB1B8F10BF4F03D9E20A3D26CAC3463BDD1515FC6351D5465B0D6295AA1A2E528AEFB1AD33CEBBE5575C8C9D5FDC8CC227190063A04E30886B6551E09F5D9E638D21CFD058F1FEA7B5CC271098FB784FDD6AEFBA29D6AB58E61A86A128E083740FDD763513224098F9C321D5D6E8015DB7FB4F1895A23F21084778BEABEDA61BACD453CE49B8D7F1556B66EF30C15A2AF375F36FD612EAA89718FA931CD96256A83FC92FC39E7838AE7C42800A200E831CDAA647E28F2DDD64FD3AC51B8AB9B92EAFB7F4224FFFAF92EDCECF0AF6F6999037943F8B2B878E3E2E517EF2FF93D7909E5B77C5B24EE0B588A60FF9770087F8B9FF35D21BE501BBE9A63FA8A0FBDE4980363144B2D303F3CBC4B9E2478B9325BAC9A5E4B60A2561305E32881A357EE513E9ACA4E61A3E18AA778AC19C5AA1717EEB12FDCFA21F5875DBA4C6A0F20A7F5CBE0707D602FAF3FCE6ADE87AC15FE21D2E20A3DAD15EA1F0683C5E4BB5AA70D8B51372DC6B5A03E5BDC27040C07C190040C5541179AE3AD637E884282FA1C2545941483A4F85E613D2FC902BCF48650B9C80A2334A3D92BBEA5C02B07FABB054B9522A6EE9B1D967742B888E16B5CCE7139F7CBF97DBAC15B469A64C4D7DF711D33381C16B0A6FE382B771F9D2CC4B718B62F30A23D2DAE7DF38C0E58AB6E5551D77C0E0306976C0EAADA2329F701DEA15D2565F9475E70133C7CB590419F6FB9382DCD171B6EBBB9F9C4735AFD29CA8C2833C6B89C4C9C93BF90AA2E179160B553B4BEDFA2EF15D43BFABB1D36B0774CC12C6224D9348CCF2DFBE1B385887DCCFF201C24DA51D99228E4A290A32E1A4B54751BBA6FBA5A1195D325A4099A71846218AB84FF55C8DB7CF390166B9E81A8CF7111C7453C644342EB6DE6EE40D55577C98324AD3A9229032DA0D02DD4E7A3D18048185E5005A20B2CF1C14A10531275B43175B4288C4F4618B732C95326B7583C44B314C3299E2BA30128AE64B1F87559E68BB48E2E041C90EA13C81D97681B3E00C1A0E209073CD460C1B0E4880563BCBB4D8A1582CE5646EB9943062D6F42B0BE2FCEDDBCC97705E8C0E62C7694FDC2A7A3654AE6F0EC63F9659765AFCE1F92ACE457A76EF02F2F406EB06798CF2481739D24EF0115A592617850301774576EC1362C5ECFF9E89006E417AE7F7E6C3D0EBFC847AD67944EECE086AA24DDA08207E9E55AFBA5FF5D761F0827242BF4395FA2AC1CEADD2C1ED13AA909516E93456B61789F1625B9D04DEE93123520E7679D7B063E243D95155A379C77F31F59FB86B507F89C6CD2073CD43A88FFABF31F9EBFF8E1FCEC75962625395F650FE767DFD7D9A6FC69B12BAB7C9D6C3679550FFDD5F963556D7FBAB828EB16CB67EB7451E465FE503D5BE4EB8B64995F605C3F5EBC78718196EB0BBE7A8BD608CBF37FEEB094E592F192A3942AD61F8DE5A697FF860436E8D8E31A3D9CC938E9E5055FF125C08DA4F557E729216ABD823F203CE76487BC4A2AE2B783A196A8EEE7F91961B8E43E433DD35D28D13706A4A681CDB7A4C0E2AB383FFB9C7CFF8436ABEA114FD79F9F5B236DCCC18191367E7414292CEB77D983071F44775C6FB3A42CFB90AE3E98FA4C7A0D8A255AA4EB24238B07FF55D6ABE0C55FF0B46341858B7FB0C67F95146D640FAA8FFC52F9E9E36689BEBF3AFF5F75A59FCE3EFECFBBAEDE9FCEEA57D63F9D3D3FFBDF74E35521263913A84425D9B26B7DA8296BDF6C9A688DB92530FEBB4A097BBAE1223AA939639B5089519DE59DB44015BE8F9412DD20BE4F75AC4EABCE26F2146F7415DEA08E44ACFA0A2BCABBD96EE5F415E3C239F685F336291F535474B2F248564E3B2A873DA3ABE8C7F973EF5971E5C7956FB8F2675AF106BC18D7405C0323AF01E23D71245BDE28C7E5D6253730D62EF345583E19FC7E0377F7535256F50D4C3D2D9E4BF963F926CB17BFDB70333054EA5193E589BCAFE975268FB26DFF655B37D54724DFBA1BDA112C8DFD6D6D68E141DE42D6E9DE7C4EF224F4498909E88D28AEDC0358B9442BA973E01EC7CAED5C54ED76AAA696970A4E6868DF70532BEAFEC7BECA8E68851DE8DE788D96698116559D7C3C30EEB8040F6009761BDDE77CB93B9AC5D80CC67EDFE9EA79ED3C1D45DDF6DBB8F59DC6BA3BAAF576A09BDFA774F37BF85DAF2C6BAF92D0CCC8C6CA8FC7CFA3960EB58BDD910887D9CE9EA3B8C47DBC0A8E920CF5F50A0D56A50EF37F5927DFFFABBD0D9E387CD50CC451DD0ECFE5F76D5A50F9743D45C5A77CB542CBAFBB2AC49AEE1E6344F37D94C2634B61CCB8472288219960C0F06D352F513C86D4BCFE145EB897AF77D5635EA47FF7BB1C8CABFB0056F791F9DB1DE819ECE362F0BB0FC535374FEBFBDCCA9E69C68BFE6A47A8431C5917F52B889E89A3B43A6E69D53D481413101DACC49ADD45F7CD6E70260AFD5EE70665D968C8E38A3D8015AB78937B442EBEB779FB00D6E560D157F5394A7FD9ADEF3D4DA280A1C8C9F6126441DEA68317698380121BFFDDDE077B4D3B2C851745730B719272DBD9CF9CA9ECDD0D775AB0B5BD3BC2280B63CDFC6DEE4C76AAAAA7F07127395DD7B31393903B80CD33D9957E768D77F96247A2AB100C3E02B7C3E32FBAAF3171B7244C01F9195A3BE8918FE32D3FF47DE0DE50B8BFE424D85F883D2DEA9AF3E99A10CF0CD1462C7D2AFB9AE6CA96B92DAD0E15725C1135DAD190169C1FB03595BDB6175BC136CEA3221306B7979266DBD6233E4885EEEB6F29FAE30A15EBB42CC304FEA072A5780A4922BA95C3FDF373EBE18EE59412C2261A37980330663002BE56FF8E43C88F225DF7E9A620AEAE03585D6F92CDEFF32A4FE31B0AC918ED1B6D6A4577E853580147B4A51CE0457C5C2607B04C30619769F5362996C7B258180BA0D4506584EBE73CC39BC4281A9DAFC1336E7E71552B567542F2182D50BAADC8EDCD875D52241BBCD0A05CEF07BBD2E94B56972574F5F18B4FF5CBEF5BB4209C31729CD6FAC23FA9132AF80A0D0A559D807E3C5F152C8176A54F57F1DAC0E7DDE229C41226ABC1256A20A9E517ABA059822EA6F5B66214D5A72AAA8F4448FB5FC8EEA30B4C3F4BF64B9BAA1A17F7B12FEE635BCDBE2AD72847A9E696F0C548787F18E752F3C7D06847B9D47CBD5C1628FC255F945D0720BBC09451072BB9C2B92FC510C427BB76000A8AB9BD2C4F993C82317CA99AA0E0DD5DFB600438DAABC1D97DC87D2D3523FBD84FE25FFCB1FCBA459B74B3E22C64D1A5E7B0A49EB99C6193501EAB70817DCDFD9EF9047283A7DC3EDC2E87A28E7232ABB57E4D78F48B756F5E51EDC5CBA2FA75DAB8AAC56D3E7203133E479BA419C826E6B4897CA9D927C9C4B73F4EE860E7FBF8E2E758F783F9CF857B976A715C41D6A59D9D42C84C23C982D9D89C230068DFFF1F86F9200ACC0310987B634F0BFE4E717C056E0FE22BEC41B4813AE3B87DF36DB528618E5DC2D4137D24422508A7F9FB158EEBF7184E036A8CE7D17A7E628BFDA81CB447F6314EFD7C910EE42834A38E30B7A7433C8545B1A93F856DB759BAA839E17802ABE39110ECD2740B863ECF5520FBED3B542E8A745BA5626465D7A88649182DE930A2C047417208826457E57562DFE3727C9C3147C369A6CBB946D5AED800E92F9DB0FD5A262B14624DD699513D769328C30E40867DC8BF61699113D17124E28BFC7B88B12FC8F9C7E5DCD657F473510B96152246633B09C1D1B2DD11098DA8C49F221F5FAEB759FE848E65F7FB25BFB7DF42EA4A5EDB07A546383C70A62B7B75E3DF7749963EB4C61D3F5B089E133137A3258ECF49915649D6DC41F9A13A58AD6684039D4990DF5162FC5A0B2E7D8CE37FB20FAB2E75DAF4444CB680AF0F6FD2A27AF4DEAE6EB66891E2B5F8F7043201FAEE071F8A64B9AB315F65C9C28AC1ECD0FF1525C2730D5FEC240A5091A2CD42BCEEF17ED15DA06F69BE2BF1E7BFA145151CFFA764B3DA25ABF01DBFCCD275BAA949FE96648818B381109A0EF5F0057ED3E3DB5FD20089F3321EF63745B2593CDAEABD46BEDBB5DE1216E7486105E269F544B47CACE11E89827FA08A60B42FC5156BB5625B1D861CCF8FE774DE0ECAFE88DC57F4F31E6E6D1D0ECE417D4DBF1CEC71F59ED4EA3D9265BB27D6AD26018AC30D515BCF3B07D401EA1DE172225D6EC2C81C125892BC490982E836F746838540F2749B67A8A09DC69D5E3F8E73488BAA63DC7C6A147689A28E64EF3950B91B176D5CB4568BB6D5183F14F96E7B244B77E6D31E64DB75F228BCD9E15FDFD23207139BC4F81E47BE247FC9EFAF8FC73D70E64539937FC6CFF9AE18F5F9DA577CC8250792F11B7A7878973C4DD4CC64A38A6ACE89C8D46BB43A9EB01F077A36D917735E5CAFFBBF5EEB57D11F76E9B2368E1DC7B2859CF21CE307063A0E10143E5682B8940E6D291D55D88A7A64BED125668E9DC0CC8E63F488A1BA5757EA282051249C8248F84E565E921DE12B6AFCF35B2ABE20303334B435BD561179A36CDF7853CB3CA508DCAE51B886B88C8F6519BF4F3758ECA74956FBCB1FC7FADD3FC701E83182DBA28AD6A61359989FB18EDDAA8747B22CF52FAA5C2C42574959FE9117CBE0886F3EDF868F3EF2B1BCB9F9E4B376E3FA3F91F57F95CC96A825DA9A1BCB16FA5EC1DD76DBBA093E495F67D405924DC3C33E486E1EF33F08BFD246C528988E54305DA31255DDAE7B5C07FF31CEDDD39AF5DFE69B87B4587BE6398DCB70FF97E12D5A6FB3F97C7B6C7708B400E27A182CAEBEE2242F209EEF99064282BA8EA439D5B8A3EA34B7EA1465ED01C9DA56181D86C83DD0535734701CE7A27A5D96F922ADB779F6D6BCBB042FB96575B9599E9138B63D60D7871B943D3CEBBF7DDE65554AA2C2E3365F9D3F7FF6EC8530280113C16082ED1F04547841A3829C2E920CABDA65552478698AAB3FDD2CD26D9271FDE7E00CE50421698F912F7987B624D8D9A6020668D2DC5552B4EF52C5467BDC9CD8D2D1E0E50535D7462C7083AA2ADDACEE607BB71323187141DD2A84AD2F3A1A7E68C663D222E5CC320B4FBC4DCAC714155D5A8FA998826B964127941D3A5BF0033A20BE98981F203E389AF93FA87967793645727DC162EAF65B22D84CD30C12A1AD331B6710C36BEF7225E5861E809EBFE1A395FE485A64F0341F46997C7860E3CC7E3D0C237D91728D9B6DCE499FEFEA1417B279A2F35FD4F3D47C305FFB5D33C2644388024DB838A2F126DBB82D0238FF648BFC69BB28F76DB28D57DC9493DDDD7FCD3AD99FF3E50E4F79F33FE9A4B7C5F48C759FEC271E40C6178DC204D018C765038B161BD07D6107988F5D17F13E3385D58A9D9E2DBA2AB331469DAC6C5AB5AF6E9241D47E3978C5AF19C741687E75573FE5AB3BA0CFF673A59D6E925F54C0527F1C65D2CD2722C48C0BC953256DF5F904675CE9E3EA7ED32EEDA9B43E736E9A55E5EB4C3BE34EB1853908DC07F67AA6FD4D4453CC7367CBEFFED05EF9C1463789B5CDE0AE67C2DB3E2B135A98EB1D336B1D95617D162EB8FCBE784C362B44A2F1DCC1541A8303E86619646CC1C1F302339C83608826D827E706402648CE14748D1A92E10EB1D46297A02BCBD18EC52842D7A7D83B9881993448757036AEA112F868EF021D2755C52754F30C42E6FB585A85FD8C79B2083DAAFD56310AB44C2B9277E98EF459CA1175213F6F5672A26F88E527EAF32812421CD538334E0DC4A435D2AD19CF0FE405CA02A5DB8A8465FFB04B8A6453E54513A1E64E1C84CF3CAA8F18AA8E70270F35E838DB8BDDA47A9F49944334D24D308ABD63ABBBFE2F29570D10F49C535FFD79CA889B46E2230901A66523A3B67BE8BDE3A25638B5450A279680D37FD0B2CB870DE697646DF5BD5097C7D58C1C34E303D38D6CB5E15995A3F669EE1C67A4EE5530E381D37D1BFFFC3C052B800F9F254DED8907657778C722AC4CEA874C135AE1A47D80CCF210D4C1DBE7E4633B0C639D9489E018004ED260420E0A6794B11105B3F2D07CBCF34848D419A8EFA4DBA89F32A1641EA6072CC77045A3692853FAF7B36332D555E6DEA83EE71BF4D4B309D1B8A7DBA098B639BF42A6E4E03722763C260DD233B127CC31D1A6E3C81507B9B9D8F3C59EF0C26D1EC5C43EB0C3300FFBA26928C6E03FA7A3E81BE12447A8E53CA6D231BB7144D5E7D1A673564349A8491AC552C22DDFD9D9A35E43F5310BA3967BAB594CA386219806455134948CF3026D6265A31F8E4983DD9CCCE78E3C8BE14C66E8382EE3D8C199C3663080CDC70913CA055B4668BB36EF49A49363B5C96286FB9679778DC9EF5EECF70E6A5EF68853A6B461D873C7E1DA30AC58634FF8E1368F7263FF98A39F95BDE1928032231E45DCD9626EB5A37F5145F611C3536A581BE87C62636A1BA8B5A631FBE1A4E78EC819FBC319FBC315B779E48BFDE18B7DB835E93883BC5A3609B017D82B6CCE107BD37B80D9C5D89B9B372E4976E0D6677DA2D09B5493EC835DFAFBA187E0A40763D2DCDC07119A0F267CBC3D1B2B4CFA74DB9217F64A28D47F4B39A12915A6EE30780018DA7E30400D3F77D476FA0A647426D0B8FD4EE6313E194B38FAF8EE0567D0F720D400826478380426993EC0BF2D9BECC38548C72CBD9135B2CA3EB2CAFC36F0D7BB2AFF94AFD24DE702327A0440BE45963784C2C38E08288CC78C2BE68C0CF821FF868A4D5ED491A4086F2A948FAE9C398A74DFCC59826A927DDB4F7F1FE724020D701C56A00763741069BA36DF3964BDCDF22784EEA41DF79B41E5B1A46D9BD56BFB8FE3C45FB09C1FDF6349371A93B6A8BECDCF0FBFE4F7523E2065F49CD5BFF77BDE85E1ECC17CE33ECD36CFB8377F438B8AF497CC36DC6FD739534D3EDB301F5B9A291AE7F86933439EDCC00DC8E8F4D9766F6EC6B86B7C4B34BE3480138D032F404C30AAC7CC84736FA604D4BD9A7DCA675001A6E7808915001B36D887FDBFEDEF8722DF6DEFC0CEBBCD9E0113D46D42B8DA82B1520518CF4F1856684663D25E5B616E5EC06A4A1D7078448D906D09E281BEE890B5436E2C07A22376F33FAD34988D17A6970836FCB02732A13B374CCB13B31D1AA6E7099B33C3DC3C718D56E4067306F5B1699973D55E8D77D730B1F2D88EE55074C7FAE6F4C32E5D269B059AC1E1896D5ABC2DE7CB0FFD3A0A1A9449B373DF46417CC27C53BB41F450D2093E4CCE519060BFF887A9376332940A4BBC2463EE35AF8226B5532745119BE792A34000079FEF0E1C96A196326FFA3B9061FC1367691E81ED139F4C9552CB994766CDA5768D4A545D2565F9474E625687E20FB5FE2A36C969B310C041330738A4BD678E5B840F64C40A728300C71FDA77A605ECE0182F1ABECC2274455B15C43796FF0CD7DD0998A31F91495B6DBF26E209ACF560E2E23A584FDAA0A2F7DF58A2F7695156EF922AB94F4A517725B56E50C5EADEE7674D0174EAB9593CA275D283A61B924635B9674E4B029F80ADE00F4D7559633D80BECD1E54D3B4F0E848685B80E81AA7DE3C344D0B90666DCBDBA4DAEA535A324D699B6824BC80BFF9DC216FF7850673F3438376D04005D44311887E2836E839596492DE3745D21134C59A2624E815A88DD0F249C3A5FDEF00BAA6FA04E4EC38BACF9A66A5CD699A3144DFBA540AD8DBEF20B9DA3213CC75A26518795D24C75F17EB569A62791BAC6BD305CD2698149A628BA5CDB160DA59679ED30293CF94CBE40907A623271B7F44A4295BDE37CA053469A9CB7EB569BA49F9A86EBE81B1E8425341D30D262AB9D001A6B46BBA4DB7D2B4C84018B4256944815D4F492AF1994842AAB0A71D9D40AD251CF549BBD9A95309017BA0BA82AA5B9AAA8E5DB5E8A453F7B41D53F5C4AC69F3B6FAD39BB83F76253261D20398E93FD0D30B994604C16A7424A88AAE635C8857B1371C80B40B1C9C89305734CB952B85B971A36ABA8394BE2D5052EE8A61CBB221AED174ABE659AEF4DB74E3B2790F206ED2CD7745632D84097EA970634A756D198AADD75B72A2AE0F82B036C50374EDD63F3A4A7230BA3685A73162AB0208A8CB89603A6148DFC18AE2902E1D06DA8C6C108734944E28744F484469D09548DBE921744CD37B288B1CD31775ADFC7C3DB0495FA869A076741270D75F01B4F577FD51907168800E840C40D7CEE06BD19F0C1938B376E50D6A5B32D435A50AA6BC81AEDC6C08ADBFA06C1C6DB166302D94598BBD4792ACCD1E40D36A0FA7552656B09CEF0AA42BA7033091B6C37D2A2C6F87729DC41D206DDA554B7B1ECAB40F86D21FBE9701CEA01018289161504D37DEA71BDCE934C9FE8A12484DE5CA1544E02075AA13A691FC40C694F67690E6EEBCD5996808DD2A4A40EDACF9DCAF98FA57B75C1203450CBE3C01960C04069BAB40509D3ED85BE94565B02FEA35C1C1CEDF6A82FD07C366FACB05696B3D84B6D11E926B9B32910B7A68E7F2539E9F5160AC1A3AC0F0767BC033A81FA8D4FE0DD523CD99D465ECFD18D07CA0AD45BC7771920F97871C71D08CC19FAE2EB3DFDB0F9FB3CAABC62F030D4F00C9B5435D5F778DE04C0283A18F3F6468A80187C8128FC4B4530C56040ED2FD19679A88FFC1AB08183A0B20EF367FC353F757767903781950B5C01B25B7A19116EE9A4B1878680380BC83F4B54FDD41E856471892504B7ACDE431B486548AA1415E0FB6B49F6568CD2DD35D77D9241F220B28EF387BDD55771BBEC902870BD4D65CB7790F7D20AA76F03D68A0799B8D04F5059D521E7110630824E6E6B2AE06DF4B3A0E0F1F8FDAF834B2E10D10DE9D14EB50A6BEA11A64BA739D3D994CA24A430AA4F166ABDBF5650362CA430E6964CDA7D356BB3F54071A39B0A2FBA0EA22D1595C55458781D3F7E443845260D030E01803861C00EADACA3B7D8739A72FAC3B9DBDB9B806E65C0AAC2081EC9ABDA185EEBE5C8E4B8E270059A85B75D55907020BDE7D0607E02E506350B9013870457FDF7BD7780000BCC081A8BB2CF4553DCF8243414325B98F808B0C57DDECDF35AD40A25D5F2DE0C038E96FE2F8D06E0A567E0BE1C87747F90598538FAA251FBEE0B3508F54EA8760443A23A28DCF6D6D9103C37535271AFADEF2232D8965224B800929B3A611CCDDEB0CC59EC4838CBB1F71B70B8D1544723FE0AC680351A3555A9A41AD315436AD1312ADAE1BF8998424573F2536D492BC51719BFD7D23159B2E9A59A5008DE4D04125024B24D077ACA18CDA1BCC9E1C8CA3D71D9D890A2287027A8C85053AB3B5763A957F9A2F19148B06060CBF50E61AFA9059483F7A0AF6B0679F5BE51C7AAD5460E1830F6836D9D029143C62B9EAC1418E308C0975906E505CE233C5F05529D2C24905FEA9C6C041D2D7170E865B43956B32254BA62B84D50E0C55A76994A569862CCF462EDB0040E0714F1BD331BE3CE5B6113946D6086620C190655A4B004942EAA3E1862195B201298E8113542983555743BA0CC32135C46909614184E32480900856450275D6D8C3250297F3544502557AD4B0F6A789FCC32E81E49ED08DA92E07A8EB352F7B5B2A3E916A2E4B158F9EFC86ACBC25D6E6BB0C75493CF9B02F9BC747EA315F423967F86E8B1DDE83A1024650E988A5B06107AEB1918E621CED2E4964B9F814FEED46E9FB82ACF9390903E79D5390C52051DDE11205CEB10651C3201B1B7BF475F065933D246D08A07B1B6A3F7C28A11830766DDE31764F609F88365B02FCF493BD23179FB236B7E48AE7A90E3B02943B0BDA14B439B67C3BCF8A57EECD6B2361650F5A3D865DBF66550C1788AA4F75937A395BF710781B3BE9B064199180111A254F72EF3C53137E0E7CD33AEBAA1EF83A93A0CBFD231F39981D08306C00160D93C142A30C383CCD72D5A6C309BA5A2719329BCE453E6645DA17D74E43F59807DA7465F8D1B5F3B0E9CC25F2414BF39B78892BF865383D58D95B6FEFE1EAE75999D223E44C4F397C3E27855E708F3EFC49A436907E01BC95532769082AD4D8F004AD29178C3BE0780E976419909DC84D921284B3C0C0E10B8683AE261041189230DF4C09C356321CA67C80FB482A65D478F0AD837198795E02383EAF52059E6828631247221069646F7B0C83A93303B37FE8331729E4A1C041C92A030E490A55308B56C04200FE3E007CE06BC80140191C9B3565C0512A1AA3863AEA048807446031EC97174DFD3EAE735FF6F2A2098FD17EC03F2BBCF1ADC85B4E9495F5D79717D724C6CA1A35BFDEA1325D0D285E629C9B662803D20EE6E3E621EF225A733DEA40BAE2EEF2158BC0655225AF8B2A7D4816152E5EA0B2AC633AFC9664BBFA94798F961F375F77D57657E121A3F57DC6184A48586C55FB2F2F843EBFFCBAADAD74218680BB89C57985BE6EDEECD26CD9F7FB7D9295DCA4C9509078DB1F10FEDECC65455491D5538FE94BBE3144D492AF0F13DEF14EF97573937C432E7DC36BF8135A258BA741CCCB90E8278225FBCB7769B22A9275D9E218EAE39F988797EBEFFFF2FF0102FA73F631230500, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901090831056_init', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB721CB992D8BB23FC0F0C3ED91B674569C6677D7642DA0D5D288D6675E1929CB1CF13A3D80D36EB4C75576F55B5463C0E7F991FFC49FE050375C525714755F50531111A762191001289442291C8FC7FFFE7FFBEFCD7EFEBECEC1B2ACA34DFBC3A7FF1ECF9F919DA2CF265BA59BD3ADF550FFFF897F37FFD97FFFC9F5E5E2ED7DFCF7EEBE07E2470B8E6A67C75FE5855DB9F2E2ECAC5235A27E5B375BA28F2327FA89E2DF2F545B2CC2F7E78FEFC9F2F5EBCB84018C539C67576F6F27AB7A9D235AA7FE09F6FF3CD026DAB5D927DCE97282BDBEFB8E4A6C67AF62559A3729B2CD0ABF3CBEBAB67EF922A393F7B9DA5096EFF06650FE767C966935749857BF7D3AF25BAA98A7CB3BAD9E20F4976FBB44518EE21C94AD4F6FAA701DC7400CF7F2003B8182A76A816BBB2CAD796085FFCD852E482AFEE44D7F39E6298669798B6D51319754DB757E7AF178B1C13FCFC8C6FEBA7B75941E01AAA36B47FD6426306E8FEFCD3D950FCA79E0930AF90FFFE74F6769755BB02BDDAA05D5524D99FCEAE76F759BAF837F4749BFF8E36AF36BB2CA33B88BB88CB980FF8D355916F51513D5DA387B6DB1FDF9D9F5DB0F52EF88A7D35AA4E33A28F9BEAC71FCECFBEE0C693FB0CF5F34F8DFEA6CA0BF4016D50915468799554152AF0F47D5CA29A8242EB5C5B6F3141BAD630C361829D9F7D4EBE7F429B55F5F8EAFC873FE335F23EFD8E96DD97B607BF6E52BCC070A5AAD821A087EA56C9BFD3B74ADAEB5BC50BAE638DE6BB25B277E821C13C83F9B478BA49972C62EAAB25DAB7595296E943BA68D791D85B1EC2B2813749966041D5617E8716E93AC9CECFAE0AFC572B40FF727E76B348084A88F9D4F8AF9202739EC0C29A51EF0A5C6BF1A4E77C0D9E0291558045EB3040FCF76DBA76988906D79BA7008CAA6EE9D7ED52DE6BA3AA1374F263F90E6508B7D5B5F426CF33941830E097E45BBAAA999543D93274797E768DB21AA07C4CB72CB7DF0D40EF8B7C7D9D6743C5BEECEE26DF15354FE71280DBA458A1CABA6B37A8227B88B2872DCC5DBF4109FDE420FACE70BDE5C1BA4199F6F96D823B878A762DA508EE350BF504755B0222F45B06E7D871657F15FDD4F5CFBD5FEDC0E07E75A3EEFE8018550A24F6550A69DB6BD27AB7B115C9A64C1675CF958B4C5A475C731250E91294C1DBAEC8665FF1171592C527CA12D38EDDE6B6D496D4103B0D024A290D4343747E7931A8D7264A772B999C75EFB67E54C1C1B6646A694B3527EDB44511F5A913D4A7C22A2B126923D3699CC40CA74818CA990E9C5769A29881D75F43256F9110E8A81625549450A10E26BC8CD21D602C0F26CA730970EA124F280290F4AC22428E736AF9B594F61906919F583838A8BFB63B81E90ED04077FF3F31C1FF25DF44291BA5AC93943531A748A4AAAF3435B34FB9CA5559A7E512D8B4FB44CC297BDC00889D24DFA5FDAA0BBD94E7A659237949404F4C489A6AC7F3DC485DAE93349BBED9CFF97D9A8518AEEE2AA82CFFC88BE5F403FC9494D5EB45957EAB67DE73C3FA58BEC9F2C5EF0E129AA747917F4B97C0112C6EBEC7B3F976930C6E15B5B41F2086BD822910360BB6D476E32238E0BD96E025A5C2D6C514089A3F5B6A6F2FC7FB08DC9FBA48E8CCF055E80955E475EC18A6C4681FEDC0E35E0AB645FE7D5D24F7E9621ECF92CBCD2A4BCBC719B69D7C956EDE367AB5CF71EB1AADD212D33C00AAB879ECDBE661A5D8133167A1DC13F0289460BE28FD6DDF84BCD194726C0B52A73BA955A70602509DEA7F204D6E280D66823054E4A4BD915A2174BD21B5B1A8D9E934CC06E66E106962173910A9D6C9C379297E16F235CA56695B27ABF05DA3655AA045F56B31831527EE2487B4931079A53985ABB712E929DC5F0AB2A2D552DF6C2A45C908B6D510C75767EC481D75CF539218DD6AD4AB551DA454A96AFF27D3FF5828573D30B402A8E9ADA0283A893E2B9117455D540201AB5FBAF97D06EDAF2CEB9760A34BB67769B9CD92A7AF456D1F8FDBCFA96C3F0EC77BD37D4873B4E7762B27B95ECB5A43B15EC346A90EB37000B3E93C6F8C3F5E4DDF26A1D6EB151A2E6D80A6F19F417C2BC873A89AF72CDD092EBF6FD3A2E68D2082F853BE5AA1E5D75DE522206B1F0D642DB3A25FC5E96D474ABF8AC60F0072AC604B843305576C7BF4A9ABE315A07067C0A577ED66C4F5AA2F81DD1A86625B0F0BE93581D6BF02268FBF8F6237209B0D1983C73D196C0B96FA87B03D5E7F9A410F285FEFAAC7BC48FFEEEFC117B78C43DA325AB1EB23994181280A6EB7B72EAECF1DE33BC768878288BCA002068DB54C6F9ED6F77988CB4EADD00E72340867BC22F2A98EF8342CDBB8979CCE5E224679091F13467823A48D1E63DAFBCBEF8BC764B342D77802E0AED31077038B0FDD060184930B0CE512C2E673BEC13B158964F2200D0DD4E187E001828B60729203B0B644B7198141EF4D7BEED9EBDBDCA6DF2234D0731E48DE7701D2E52E52F7C0D0FD09B4B4DF92A7D24E6A21BD846C5543BA6E540FE1AD3250FC8A37BBE16559E8188A984FB3D19047BDE310F58E909B362FC6D45BBBA35B0525C62DA33930754F4C8A99C474C0D386FE63874ADB20AB5F76EB7BEF2B7CF5555E98BBAD20A2A9A9D4207142F07A4DBFBE0A2F8603ED43547CC510A842768BD56446A2631FF5D0B7C7B779A8B1DFE6938C3CD0E569B22BFD0DE3EFF2C56E8DBA50DAAD7C205B145BE0883584E4BAC644DFA604591224D283616B13855A18463730EF688D7DC96B2BC2C8BB40D4538F464FF5307348A38E494C0A362626559C2406FD1D033D745A0A24A8D872485B0B07BD498F651593125D6141B3E97FABBF1A12BE875611BE0532207C07696F1833E7170A56D6E91E44D3E501CEBEC3667CE266C393F288D4DA67DE6F73FEA060E58436E38D01CEEF563723DBB05DB61AA60EFBEBC4CEBFA6563C2A738BAFB61E481F9C29F297EEF95920EDD3F650F158DB31461EDD6F29FAE30A15EBB4248B823976F0456E49726EAAA490F8B5DA32595EA9E8F1E7E721E831D9939050B7F351C53F24159FC996052914F4BE75C740530A850C48BC5C9342DA2A426F92CDEF2ADD8D2A87E2A202C582F603C1D8EA3DADFA01DF5A76BA09D03FAE48E81B5FEE17A0999E9566727D551C021BD51CB0AD797493FD73BE8A1BC5016E1412F70BBF5D4238766AF7132731C76C1946028ED4A07792139368261797843A3184C5094A82505A17AF22AA34331BE550DBBF0608EE1CF95BD9B31AC0CBA6D4346F27864E4CFEC4D70151701E91E0A4E407AC46594927D56995115FC6B77D055AA6D5DBA4584A94BCBE5CE81C57242A745CB9DF69B547667A4CED2B507F46510A8B33C62BC3C30FC052FAFC9C67F84039CFD158F06F19B8C4C9C325AAC4A728D97D65A6602A95C854D33E7DD82545B2C1D2E01A2D50BAADDEA12A4933597EA662D982910EF6559B3A778DACA5932069C1815C78FA3A9E59E6540D386C154A7C71FB80450DE54AEC26F8AE3E7EF14370F97D8B16449234D77DE3F9A80E09B9551B080FE5DECA6F49B61B6F3837980176A564145DA1ADAD1865E937543CB9EC07A459EFD0FECDF28D7BF129EDC5CD6635CD2627260034DF18CD6F106B7C2E43EAAB1A8FAA2DB21D5857CD336138DC46B8AD3B6EDA605B213CF1F7E3794F3FD351E49F92C8F738DAB88B48CB030E2F59AD8F7156A3BBA3AAE94736401B0B7EAA8A97D0F790F251AC8F7D169BC71CD7F8B7BE98ABE11F2672E0FD71F476A671D87DBD5C166802FFD4B8251FD2964CED1B76FBB2F3CE65BA1F039B9DD3CED5BF51B18A83D0D68A5B16D8D6348F5003BD2D8F02E9900492CA6BC9C20F9BD78F657EDAB6FEF7839957222D6BF12142DF014FE5B4C080ACD4D5B07626782415BB90094AAAF3A022F15908E91C70604EA1DD943D662020CA830002B561285B0A1B4474EB50CB9F82C210520AFB86A11B184B125C5DCDD826AC6CCABC166649C9DAB0DCF9A5784E4C1730712A0E16B485BF9813A9EF742B377218A14922CD7C2CBF6ED106EFDFDC45697CF7770AEA903A8A80541D80E2D1E9A101ABA2B68AFD35993CBC4060EDC97C3461820F70FA91DDAEC3548E5B8D78710586A31A2F0CDE2831B528DFDF78AA3D2531AE7B05CD1D8918704AE449A1445927070D7FDEE21AE32A48FBCF9EAF34236081FDE3A33ACA69A66E14D3423B21C358860B0A59C7FC1AF72C709B8FDCC084413D276946736919661BFF5233749229033386694A1BEE2746663CBD7D5F1B3090DDD6587099BD928682E3AAC1A0218F6A8E2656756FDDA3035AD0980696757780D1F49802F4CBD1686DAEBCC56BB7DC154FCF4ED742699CB2913FC3EDB959B1CD7535C92E3CCD563FC975B12C30FF4CB1E1E3467D481BB57203D159568D6CA9A35B4F1D2EE5547D0C621375BE8D6B2B62FE01EE82E23E07B635C1013458BA87408830C31551529F94A4AEA71C1480C0C54E0B3C4841198C200AA5802E31E355A6DFCE2C4BC1B1FE1742E765A0828F850EDE3E38B8C9407A28DD304040E92060682F9791963B6C37A4BA5ADC83C0B6820851E08D734D73C7E7CDE33EC89EE670D37881047403799F6E309A34C9FE8A92F80CEFA47650503C87DE4F25625CBEF15AEDFFAA97841480D85FA150CCA22C40586759A19716D84506A26E854B820B02085D85A1FCB744AB502CFCC618E3AECCB615DDA45482C861D7ACBFDA86E4387C7B6090B361286F9D68543CDD8D56BB4B01AE3E40B1983A1880B13D9DAA531C530D80198E8172652F9DED9EF243BFE56EAFEA9DFC7C6FBC7D725BBFED06CA548F5B28D856B8BC40979B3082B4996BEFDD6CA64411714B39A42DA53F2B843B55F022517DF670BB06DA6EB168AAFBFB295F99CA45A6529486605B9832A429EF0B99B49AC077ED1D2A1745BA6DAE01C76E2BA992F1AD7257016488E554FD7AFD69FA46E326B16F9B84B9ECDD55399612E9C62E10065F2DCA5F587092D1799FEAA9085013661A9B437895A878BD428397C288DE60981F37BF16AA3CAF615AFAB54C56C845C610752B9A838E4B2CABAFCFB1AC806F5A38617BD78252F72C2084E8B50083F985FECBBF61919817F57419ED1D548DB86D806D917F4F3313123175F99BE5C365B78C66945314C52D1B82C298925E773DDC20898162410C4330D626EFF536CB9F90C4D6D395DE31D299B27C03E5E2553704649F397925F52068CA647D144B81F4C902885F90A06E3ECD1EFD36D0710F03DB22FF464B4494B34A399B56326BB58398E5A5834A14BB79BFB402D1503E74E05140806DFD92DFFBEA79D40CFBA2FAF75D92A50FED8502F51EBCDE4D97BB45FB52FC13FA8632FB7EA20DD64439ACCD47FBF0D649915649D638BB7228993227CDFF444F1D7318D8B411017E18A5596D38F1107BC5E5BAF6109436F24F211A318ADE10A425B2197F7D789316D5A3B75671B345E4F634FD7BA2B9E80AB36B7F2892E5AED97BB3641182CD4DDBD3F83D84698EA4892B52B459283D060305E22FD0B734DF95F8F3DFD0A21ABFC14FC966B54B56130CED324BD7E9A69EB6B7C9AE9CB64517B5978A58A50DF916A6C3A445128C7EC2E6DE14C966F118E820A5D9026B856DE446A6CA31118D76A7789864CC48A16C628243A8CA7066DA537CF251F7B006007A86BFCB7B440A6D7B326C654077DA42D200C13F9C7E879E494084A3B80CCEEB385E53C9E8248E21E3211C6CEB64CF7CF18A28EE365E9EB666F72F2A492EBD6FA1C5BC936464C5ADA190642B457909B6D512C93B30493BD5BE78A2EC3965D9135A6BE3554B9D7667A9659A74B70795F6B6FDA9EB6C07E6E5DBD4F7C6468046C909B615F0AEE66D9622FF47B727ABFAEEDF133952892CF820886E736F34586227783966A8A063A9383E119FC8E8150F3451A9F0F2C5A885AA6A8FBEEB4084BDB92D91EDC95D71581F3767CD41639CE2158C50F6C70EAFC4FC08144BE9E9637CFC50E4BBAD92A23584829E4CB98C9A2C902D2DF1099884185176B3855174948390759507F373216CD7889907610D1C1546B0AD93D5CFE24E1E77729F9DDCE45247BF974B8425BFD5FB9CABEB3DC2EE705D578902136C2B906D52E36F10E655E4CD0EFFFA96967931497351801DA0000BA7A34AF4685891F59168AD2A6927D3DA4A51AA8D29D502789BFF8CB968D4C0875FF1A98E2CEEF11B7A7878973C4DD4CC64A38ADAEE296E1632672AEE70CF5DC48BA5B24D820619E1E2CBDE8AA1E96790EDAC795869B88D35C071FB02DB3A592B46C8FBBE28900F4820EBECE0D6AFBE7981A77818EE24ECEAC0AE1F76E9B2B9EC730A6BDE558F52105E75EA1776A1B2F94E604920E89937970327BCCB17BB35A647031265DC11CB386D82894E1ED0B1A30711C385A05601C309289435FC333CB0E83D4562CCF8A0F4A0E953305032C53D3143C8C479DD04FA22ABB35A18C84D0A2E0ACF23169EDABC079C7493E53F80C1E018FE1258A74403831C1F5FFA9B0C06DE2FDCA4FF7722BE92CC21222C54350A7DB02DFCF35BCA04047113AC245CAA80435F2550ECEB28A38F5846772C0ACB3860A9DF0D3528F9A60214659B12DA5654134E37EF7D03ADE9390132EB750DE925893F63C9DE6F7C460298AA11E52ED8962E2ACD4896D0ABA42CFFC88BE5F42DDF7CBE9D218AF7C7F2E6E693B5288A977927B2ED98FB54242B53732C018D420F6CEB642FA06ED1F74A3BF091945DD2B67EE0FB9EFA2BD9340BDC17D1CD63FE0759A1B4813ECAF39393E7D7A84455A70CD91917A0AA51DEC3FC021905C206C40CE4939B6F1ED262ED706A8D2261CF4582D3B91C5AE3C2B95C0A047809C820BDCEE5B768BDCDCC5D7C3BF01313565FEA18B31AAD002DD858CB633EE37F7E84FA2D49CA3897665F371E55FB9357EDE3DE7B487B6F2B72C1EDB7DBA9EE7AA061D7E5CB84CD560008B2C7F63DB1DA6ADB5A71C78DA6A0684C3E6569D70904D84DCF4ADEF14E7852816826EF766B4ADAB577768DE3D3C7F27D96ACCA7EAC66AE171861EF7F474A43C83E3C7D4B54644F78BA69D9C4D2FE3322C1D07BA5A242AB9CE4E9A93DB95E9D3F17E68A81BFD9DD0B555EA8ABFC8C323CC3FDBD685B49F47A602AF1E03F8AD3D44C886292288F3C8F29EAB1CC3341EFD07D5A99CE0E964F4B0AFA8503D15AC2BFCDF029BCCFAD1382C7598CF310F37559221263C18C9A9F52BCED666DBA2B335EBF46DFD06647C16BD89CA4C2D89414FC8F6AF846636861FF9BFBF4DEA0AA6AC916626E2974738931BC4BE0B664536B441BF62D8007556844F3D0E3B64836E50331C3190A8E47626C33E5F28F9B12AB076B642ECEDFA16D5EA67EE2FCB714FD71858A755A96BE22894535CF1435584C497E55A4DF6A5D10A6B711019BDD81E443F1E67016D53C04FC9C94F81845FA60CAE5BFA565E2B53952C3260B2CA9F5C890C464B1CEC598C5E23129912955F1425A6051503B7E9831737DF078BD56E98396D3D165CF0B320B0DB279887F8D16081F7A97E45CF36197607EA87263298E4F63B82E66A3FC1A6D0B549259698ED0A6DA0B3E29A2B675090AADA0EFBA20F6DE45E87707A480CB0D463993DEC22AECDAF9BDF7D4EE43D2712F08F871634ABCAF3B3FD235E7407F3943E19949BEA3CDB2B607198AF7BCAC2D3C6622E435E992874817D3B6FA909A43360FBD7F4E578F6DA65A0B3A62218A775426C3ADA90C7E8F81E4A613E048E975A2EC52E27ACC5383622E2D3233D75BD09A8676E16F2EDBAF07D1184C73D1AE282C78FA066396934FD8ECD26F39562C97A67CFC3FD265FE0705EE611D11E202F86B1B1CCA99B48D5D51A0CDE2E9CDEEC96203E86ADDA02CA3AB795817E107C441A9DCE39D578FE74E39BABD3649F91A46547E5D96F922AD89C412BA7B345B727DBDDC2CCF9A5B111E70B8267EE29F7D9F9F7DC6C44AB7983C69F58407F3EC99B8E21598FB0B192DE67F10D05EA307541067CA247B9B13F353926E2AF16637DD2CD26D9269C6C6D533BC1326C4EF5BE04BDEA12DD9C4369566F0264D5F25459B2A45EC40DF0E775DADA3CFCB0B8A478C58A7B5E9F62FB935D3CC812BD8A885D4CFB9B60D738612F9D487A124FD988EAD24C436E900156C6216EE6A2DF5DDA6A2652F093CC45F1CA80D83C95A999CC3341D9980C534043F201E33E52D039E72E0A5D979683EDE39649E61D99F5CFDEAE659A861C1472AFD498E1FE0286BD9E7C559D2214FC86352B298F4A1AD3C1BB7D56F1AFAE80B320E60A020AE6A5E5A988B261621C0464340080355DF8985C02E4CC036202D8DB4712AF0CB6CBC42C67047FE51F24A0F25E3951A8325BF0C48017E8110066414A1ED89184520A449BB047E7E26A94582763ED9D75781988479A8A59152A199846E7B4A26A10969D26EF7D2735626F99C2F77B8EFCDFFB4CCC240AB98A6C5E7C03A6C13000BC1A8033311D88B09990924B449FB4D8D7D61AB5E8618CE7ABF96C664ADBE11897C9A602393F4647A06E3096E2AB766DDE06A6BBC5E6566C12096AA216C388943398BD60CF76102D681E979107A73DDF54FF9EAAE9971E5F4F660528EC110D64C3360059806E4C390EC22B43E15BB08C43469B8AE30B37451EACE034840A93283CA2C363C9918392865B9B33329998206B230FB696E4E19ACD37207D4F484463D5B0E998F3BBAEB91EE0FED45BBB406C837123BAE926BA40D4C7EF1AE1DEB142CA52387919DB8AD3B1B9F5D7E5F3C269B15AAD384F55C216301101AE22F1AD066D7821B80EE238C19D889C194FD9880B994843E08C66A5242736E2AB51F9654BEC86A80028C06B6BA3D95B60271190DDC38918DB32BEA3A35853CD391DFA40F54B5D938EF4DB2F99D1B8694E7005888DB28304B550B6A40C768233199A22B13B09782D2FBAD88F5CFB6EEC810E4D28B850365560F6225B038C400F7D41D1B4932C1AD4F218F60829AB44CE0673CD791D0820B946E2BE6915D9B98A59E7EF9C14C5B173E05AAAAD9F916E93B00892F2967073B361AF76B92D3A4F13419E96A187EEFD8F56E785F69CB2C43551B660DC1A654CB00974A9B1A9949C55ECDC8A3E2E49874A6AFB4777CDAAEB9B6C855B2B645B30AD7AE0FA0F79DD99A9946DA721D9D5FE072B367D2A1B6CA5E1C52947A250F68793C51F1A3807A5AD552D6FCC4879183522EBB98D5BA732D0707314D1F6CDF9C6178AC331D6425DD98806F2464B5B08CCC7DDD2406A7D05B7DF555155753622D87B70EAAA6A7370E9B776A92ADD174720EC36C2C1D4E27AFEC59A55BB53E4C6A76A3AA681C726E8625F0E85CCA75695626E5E666BF4D817510BBEE6AE68ED6BAA47C21AD027223036D2527E5ED4894BA919F8869FB3305D769896FAAEFCDBD797FCE37E8A91F08390269376D791588F318681BC6533433FDC6ACEFCC045CA727BC4927E87A7BC276BA0D1884B66636CD460B3732F9E6AAECC6E44C76489B28DBF3DBDC52900D154614635423730B31B12B9373974872932E0CB5F6455F6399C35093624961ADB3E98E0DAAC6C0674A0AFE1E477503FB34BDF206CEC35E0BBA4E28730CA2B3AD71E30E6BB8E39043C2CD929D1D08524F6517405CEECF0A835B1044B3F624F865AB6E8878AE24BBCD9B001B1B9CA9D5CDD1CEB62796B5996D69076F3DB3B197195AC80230D46C5AFABC462F4F33575B655E45BD937AF5395667EC92D690AAEA8642D5B09599AEA3B41D9A4A635791DED4E6B017962E6620466607A88635D799981EC086E6313FA8BA320BCB1D9C19A2EFFD6D6E27DB7AF81125DBD0C65EC835A13B93B39840743333C47E4934923AC3469EF5F0A3729ABD200B177A40D39719D8CC418EF595E67F304A24B1E1115B5127F8A351A009CFA3B6B3814B3FEA29EC5B7AC21CCC3D513F165BBE1B99E7F68CDFE6E735773EDB1F1EBBCD6DB98CAF119CCF8406E6E634D988A7E43519510EE5F2A81B0709196112AD17860FCE6B1CFAF942F5AAC73B25A7C1243908A976499275B5AF1874475000160CBD308059455E00B04F1E595CD18909184A416093D6E73E68D2DDD747F2008047E2A639C37828BA3131431DE47D123D80FA6F237EAAFF1E89991ADC002735DD1B9F8D980E4CCC430C614DDAAE2BCCC63DEFD34D820799647F454951775EA54081D010173180363A14DC82292F05D29B94C39C809F944430B238D008E64E2245DFB1AA0594AC82229194E3D5B7B4A589A596AE1F13309B8EE8FB2FC33A3D90BA1BA546A34F7B27A9679105CF24059EAC15B9026FC5DB3EECA7A3C0745CA8A392A9B9756E3DBF3F18E52E0C09D60ACC8E701BFBC08CCAD14FC88A4A0A9959C86667C35D957FCA57E9A6BFB05386C186C141C6E320ADF65EB89589C363AB7B31059B29896DC65F7386CBFE907F43C5262FEAE89784CB158A1D000B71150566C3501076C88ED176721C7E52746202665210D8C888D15499CF86B1DE66F91342773407484D0D003068C968E1ACCC18106E284C959C5343D933143D99C2A4A120B249F354B5F9B9EA97FC5ECF4D18283817119C00F790FE8CCC3554CB53720B4544936631F86CDC817BF337B4A848D749CFFB79964DAA041EE21916D48673648D406609096306E2244D4F26602A0DC18DEC126D9DB999ECAEF105D5F1560BA66029075EEA904A3D54C76520AEF9E9F88623A6911A54D7989D594C9420003630DBCCAE01293A3221171DB0FED30EE14391EFB6771D2768A69D015670540DE7C0562C7E388F1AC4B161790AECC5744C0512D9A4F9B6CADC1C85D5B63AE9854AAF164115DCD44239F0138D7F524D5BDEFE747C0410F740B4EEAEE7865289031F9593E6964D927E4CCF55872B9FBA2383217771E0A39EE8E6E62E493FA63FCE1D20775DA315B91D3751CF45503828C6CAD26F01C03B8B6E2EEFC7049C2427EEA168E6B5BFC4875DBA4C360B64E35A0CD791FAF1B1E0D6FE7C92D6E671395677660A23A77E024C7A31F79D30340CE69B150732DF26E243B64D99C7563F9CE97812ECD84C9C094E8C91CD94AE3863CECB0A4BE924636EC8AF7499DF95B5E01C986205BB5C98AA062DD2C407CB8969D09F2938D264220C75BE7933C8832351E68396D6988C016D7246870B12A0EDCA5C7C775029C7AF5189AAABA42CFFC8493E1D037E93D6808F1C22B0DD0144D6D8B439CAB5FD98E41CA221FCDE33DB2DC2A7F1FAFC841ACF4ED9B4F3806014BA16C62A041D8F17F2026C61BA3E8E14874ED29309F848465C93A6DB2A137110D60D31CD711DAC626E5031688C69459E0D9D2D766595AF93CD26AFEABA3F61EE7E9B156432CB57E755B1130F1704E10DAAD8C31146D59440474C81994014F843956E560A4C2D841621FB56BB1EA7805278CF6D8653814A8B82080EA87E237435953BB50A4230A8A8063D201C2CEB0529D322912130AADCB5F2395FEED4FD6820B408E5880C11D43EB950FDD697D9A43A565EA41870999EB9949C6ACAA2747A7B08115D6E4057261C08445E26F4866E8474683570946CEC351B74B5B0D2A16CF2CC6BD052594920844C86170354321CFAE1F5997FC171517981B5524B95E2111666EAC49C8E0DDA34A56D4489D51C4DAB0082B2ACD3B3CD7605E8C990749F809EE7E89A61E28783B8B908E326AB5B858F8B89AF1382EA81DB0CD58C940E34BC6C5F4A0372B179646050FF49BE6EA8622D2AE6B12F848C7B8CAD23D996A8D6B5FA26D98858083D42EEA10B8852784FA4E3E156E314172C7DF7A543523F7B90EC93DD6B11DD44B62EA6E02CF62EBA1A24BFE4F750FDDA7B45AFC951D7AA127D8EB9BB3643A8C064B29F6E90625F36ED43ED27A5E848EB846686AC756B50A0EB7D47B4927E251124DD85AEC9E2EF4CECD2E53F5C60D8A0D3C814FE2646AB048AF634581984CC98BA6D03F740A11F51C5FA394EE08D877C37984FD18E03CF2E643BD36D66EDE11EDCC97A8B892192F6B4AFC2D55B493894D4895ED81EEF8659A0C0D8CD7180E1CD0CE2DBE20EB4B712F5E3A14FF882BD4281A8330B1920628C1718D29C0CAD41A0BF8997138387D48E84ABA020CC60B7D0D387C73A2E95381B878A4C3250F9882435204201F61805A9648827A195018DCC6963401323524C4C0260BAE4C41081F5C311EA781348C408904ACB860E34AB2F0F06FB9B482716403E12060EA2476B3D54108345011080B22106193869F6AE31FBC1031F00D4BDEEE164036F6D8E9AC10F6880C183287C06DE986D150317EF00E11E33377FEE0367EEF4748CE331F0C6AE7AD79957E5046001F52360E05504E96DBE0664619102E49120F327D06050D792A807351E4F3FEB61C9D4A395F051A845D444CE50C94D0E423E021610A24767E15790814332B2ECECEE05DAE02EB2D10F109A8EF780D2D13776211D01063C0001602A3ACFBD4C7A52A5BAE992C94DE3F91E5B6276DA896CAC4CB95EC9918DD74A531A7DCC9DDADEFDA13AA9CA81150391D501496378E490E21C57E3A66FE486E8C200A16040F98040788840DC9DA18246304A48CD0EA95F337778DD39A8B9CB03D8490AAC987A591D909DB85B4C154B49F1422403AE33BD4947DD56AA4EB510987C5800344428F622554126089F8E4041F8AABF43BD6B6E64016EE2401473CD42829C43DFE8AAD8864305D0A2BD590EB03BA96E7AEF9AFB6568D3D257536D43DADAF016A7B9C756EE7CFA26219693CF584062DF51D7D5E6B4A66AD98F7BA86C4369371A536D012496230FCFCE6D91034777359D39AC2D9A98AFBB56414398E11C7BEE3A32C92AC098ED0F32D9EAB4D98C2D5D3BEF62C5CECB83C83BCE414244186EC11404E0F14CB2D3CABC5E940AAF412DED59475159718C021D50F4072B5563A32BC9D22EF4779E36140673691A8E99CFAB39267DF9FC9A06ABC185B88C67D51DE3030850550EAD18A2B4124847DE194C453C396689EC0BB8F2191FB23B3AA722443905B47C7CF24A10E578AF3705E11488C75ECD6CD38A150C039A8E49B1529DE934CD8A64DB1CB2DAE96944C19A0E69A812945214DAD177075606709E9D5A11C6C21B8B1A76B861C518474AE84E47352D1EDA1CEF662B57EA3848BD4EC68DD157C5E3D0414CA69E000F2AF16F07E45452251D058725C939EA4A254986519E95A8B1F85F7F186AC0963AAFA9966BAC77CDA2C91AEAAE76DAAAA17EEA44990977BC8E09E98C2BD22D0F04D66C4E501DE9A6275D128678A7387A8AADEBB42910D866783AADCA956C73F0599F0D454FAE01D474507D8DA0A41AB04ECF5FB7B931770DA0E6031B83B306AC239FA1BBFD83B0B25E3B50811B5CE28AB5425C0D0358A750172459E69564B327597872CD492A2199BD8A5802B0C1E06499E07D08264D773F09C9B87CEC2A82A952B7C34393246FF72096245FFBC8CEBE97405E71C85943977E9CF5AB502420A71D3598E7872A3F0D45CAF191BC58A014D91ABA98F8B0A89269FB5266B2130DDDE865F33E514D994B312F977414974C5E2E5F9A5C3279B8386C61A801272F06286290E59819873ACF313516FEEDAD8236EACCC6A3D007B8E590328D14563E225915C5EB26E353B114F71404936692553C8F334A3E0B0D519B7ED640CC5AE1958B6FD5EC7850134E82AAA0A541D65470C4EABCA9AE7454674A1D9F8A700E4F887C06D93ED911AAF37DD24313DFF0AB28A7CEF039861B38948D122091366925330E55DA4A7A876F63112828A24A5149631A0212F8AB0A504E45485BD0E65E64B77855F6455A280F7111540A832ADFA296C43E54A9632B28A821E43681FB4DE735711F3D9DBD84C2D28485F01EB32CD31D307CA3A478CC187469F1D8472F6CA80A05697489F04C68ED4EAA2E5F9B9C4260463768047C4E37911E4684E0B3B8B186C826DA46B0D16B2486364F1938008DBCB022C654D202CCA025A78822D316340C38D79648932E0C8A9E3070762D032ABBD386CE0525A78C346314340A2867943886219E8B9E2E5096A8D1E42C9FDB484F15638E91E5410A439D49F986CFD1A3DF8C8CA924CBE713662B9A864A40AE19D0F1419D9186F35290E6A461EE6956DAC3B9220BCD283A9B225B8ACCFC65925C45345D69D2ABF0263121E692CE34A649A832A2415599F0C390886C25BBA132DF462328DB8AC4544447DE0AF0E65295A7027C7B699CD8821DAE516A0B7AA870E82EE59B4C936416ACBC0BF68A5D9E67C194889A77CFFAB40CE18937F6F36879B20070B39001AB24BDA40EBC7588C0BA8D44867E44A20941EF21973065607C660CD2D0F8B4996B0802A7F2049305C307300D91E08CE9F1F2A2C1D3876FEFCB5E5EDC2C1ED13A693FBCBCC0200BB4AD7649F6395FA2ACEC0A3E27DB2D094E36D46CBF9CDD6C9305B952FDC79BF3B3EFEB6C53BE3A7FACAAED4F1717658DBA7CB64E17455EE60FD5B345BEBE4896F9C50FCF9FFFF3C58B1717EB06C7C582B1F1BEE47ADBB754618D6385B852623B5BA2F7695156EF922AB94F4A3C036F976B01ACFE20DCFEBCEC49DC35C3C5A317678DC093C7D55D05F2772BCAAEAF9E914E3C93681D03D9DEE391ACF1B1BE1E1412B77FB126AE7BB348B2A4E85201502908DEE6D96EBD91A72490D726B463EB375FCC31907F590CCD17730CCD337C1A0314645B85E11D7A48765955EFF137293F22B1D4823E199651E9431BF496A31457668EF50DFE56AB5F34BAFEA3399EAB842473E03960F86A31CEF61E9BC7457FB7C056202CA996EFEAC30B838E2EB0C6F7E609C4F64688D5ABC2F5EB7609F78D29B0C6C7F78DFA6C8EEB63F90E650857E396F4F059C4F5F2821329BCC0BA102416B76FF012D0463EDE74412B7DC4648BC45D5A4A118C2334FD0556DB6FBE1BD4E7B8D8E262EB179B49704C83E5C6E7AAB15F6F5A0C2369294DB3C2E6347C9E6BA78B0B392E64FB85ECB77EDDD7ED54EB35AE8AB82A2C564563DF715A129015CB603DC0D5C6590CFE07E4CB759DB18146D17E32C7F139BF4F33AE1FDD379B036763B1E30F9CDD57734C9F92B27ABDA8D26F784A586C6C890DC3BFC9F2C5EF22C3F79F2DC649251F6646AA484A2CC71645D8D18BB0E142C4498CC9AE810C4499BCEA78E2EC7591DCA70B51A875DFEDB05D6E56595A3E8AE8FA020BB1422E61DE3617C48C50A1BE9B6323D7DD6585CF3B2242AE280A83280C187DA68970EEACD34051DC0DF51AB8EA38C2A0CB61CDCCAE24AFB51C0BE9318FA5FB1617565C58FDC2F258548E0B6ACAC5B4DF3BEB355AA6055A54BF1619BF13520571B9C6E52AEC835D0211AFDD104EFF62B127CA108CB3989BD6781CC357BB3D16DA21E9EF71D9C565D72F3BAFE5E6BCCCA65D5EFBBD577E4A49C06AE6FC998AE9DA5518DE9665ED5EC2ADAAFEAB856F4C5A6EB3E4E96B51BBA5327E314C4914215184F422A47D9DEB2441C0B7C7060244526F9F0FAEFEDE731FAFB8515CD98EE2F50AF1B629EAB3AD2F593D09B043595F647171F17D9B16B5779CB820F9322B1BDF0A2DBFEE2A11295764736359A5DF3864DDB7786D10E5EC9872B64EAAE72E6A717557690B561D47E08282C541A4780ACCEB4F1C83910F36ACF57A573DE645FA7791BBE892B8C8E3221F9C7E7CDDF63CFCF52676D4DBEF63D9C705EFC2DF7C31C770F3B4BECF39FB67F7CD4A8A00EAC6F075CEC31D5940F5738921021FBFBEB8E228EBA2ACEB651D9B07D449DCD1281C449EBAFA38622FAC4FF19B1DC734F5070B2185325E44D55FE2428D0B9532126B82151BD98A291C4E266365FDB10E22ED7363F1304215582829BBF53DBFF976DFA6B424890BC27625DCA6BCA36AF3C5C28AB2161DA5BA6F7349532A18268F902BB2C329EB255F668795D9BD04BC6CA90DCF4B28C014D8E0938D9E2DB1C1281F395F36B9552FD995BC48EFBE59ACCF7CB12352507C3CC896D8638424105F66E3E7B148B724E21CF9C97B7A30450E38212F74A1D0A5AF82FB18536221CDF33A560323CC73307C831C47D49E8E5E7BE252C0B89975681C2EB61D75FD71B4A72ED2311E8EE47557576467E611ED3B56F74CFBF340E611EBB4DC56D17C32C7F15B8AFEB842C53A2D4B21E6045F6671AA4CEAF01237555200176762A99DCC1445E63CDE0EE14C6B518A9F961427B84348F25A8BF394E6308EF14CF67ED2779FCDD971151FFD2A66B28D3BAD5F4576758395ABAC3DCE9A254DF218BA6F716DC4B5C1AC0D8F45E1B81AE26D735C5E27B1BC30ED9769F5362996AE9A638FC0456554541E69C105B9EBF839CFB01627EA9DF4770BCBB17730B6B89BC6E56EB6DC1312AB7881D26D456E633EEC9222D9E045D9052D7713014AA44EB19EEC108EE412E17DA179F5F10B6748231FAC9CCFD182B06302045B150A2D04CE90E50D903D7CA113DEDF926C2747DC965A38845449B5E38C6BDD378BC339CAF071BE78022E9A99120B1EC19C2AC6F46BBE595D02115E076E80BACF51884721AE15E281C57740C17D58DADD3EF8A1F4A4E309C21444B110C5422F167CE580CFC29F7CA5EF43D4FFE66EF50574E1FAC21ECF0F109E1FECF1FC08E1F971EA1BE0D7CB6581F8EBD0FE63945B516E0D2191BA6C3B4E52ABADED121849567324DD24805F568C4A1C57967DAC6EB384F4E6D1BB457CEEF1BC4D708DA44104F5D10E90502388E7B9DC07D9D503F963F9758B36782A412B94581A2550944083047A249B6CC77AAE628741E2226B3408C61130E338B78777C2A7BC3FA03BA4A85C98E13BB5A5FD993C7DF35CD90C0ED7E77753AFEB719E4E857F9054BF0D03940AFABB4DFF205CC357BB7E8DF5486C8C2758FE86A22F7590A824E36796FE3EB59B7F94D0472FA1FD0F7C7E47BC190E75FB720CEB12B64AC5110830E7312F84794AF22CDDE9517A4CE71AA59D4B3A577FA117C4BC359F5D2B8C001B23E640E837FC97241D368FABFF188543140E435027CC15CED1EB6A967289E304D71BC9DAE4EDB412C6C70E70FCB3F6F60BA18B3486698DDDDAD170FD3EDDE02A6992FD152582838E5018055114448C207AF2F2B6A630B8CAA469FDA84348849B9477F769BE589C4D04C69DE384144A6509EA08104F5A5186D9C83066877394620C0E0739A6A93F8E2493441E710A3972B901F8B0FF688EA71E3F83A4F962C37931E0485CFBA65696ED364B17F5BD857BD07F16898B754583609CE58F9B82A246519F6D5E0854FC1D4EFBC9C6C85C2E8A745B0921969802AB2364221C21132B469E35B541143FC72F7E76555E27C2F6731AE6D1B888202D8A916EB802652139A6C44FD7A8DA151B20AD6BFFD9A65FC90A01CB74F86CD1AF5C88149AC75BFA28D25817C9B472B64C7FC8BFA162931789539E0165ED71A417F9778FE3DD10E389689FA13E5B285323E43589E7B428554CA54ACDB3EE099B1A9677F1B596D51C4FA0F839E7C5C570F48BE172BDCDF227E47CFFDB5677B96E91561D6739FC92DFF308DA4FE63828B540083EC01699E3FCF75D92A50FADC986C72A145AF4156D8064A5C3570BAFDAA448AB246B2EBC798442E1F1683CBEA7C0FD093A1E22847A584F6D229EBF3EBC498B8A9B2DA6C0E2FE618BC89547FAF744B4F9F165166BA84896BBBAD65596F07E1242A10B5EF18E822FB3F17CC5BF52B459F077B14C8105E715E85B9AEF4AFCF96F68517148C5520B7371B259ED9215DF4FEAB3C5A8B3749D6E6A82BD25795BF8B18BC54EB8811B29BED01C2FF5780C7A020714DBE126C1866488E9323BAC6F8A64B37814D54ABECC42C662658093B1F5178BDBFE40C134E209322ACDC64A33D61B1DF5655CD34155066B9DA2152A5A8EE2BAAF31CDB3EE5B55879C5CDD8FCC2C120769A043308E60685BE591509F6D8E23CDD15FF0F6A3BEC7251C97F0784BD86FEDBA2FDAA956EB1886AA2689917003D47F3D1625631F5D19498C54F2B88C778BEABEDA61BACD453CE49B8D7F1556B66EF30C15E2FB11BE6CFAC35C5413E31E53639A2DF3DC06F9250E75CE3117CF8951004401D0639A55C9FC50E4BBAD9FA659A370573725D5F7FF8448FEF5F35DB8D9E15FDFD232077211F16571F1C6C5CB2FDE5FF27BF20AD26FF9B648DC17B014C1FE2FE110FE163FE7BB427C9D3A7C35C7F4151F7AC93107C628965A607E7878973C49F07265B65835BD96C044AD260AC65182D1AFDC230735959D42D1C3154FF158338A552F2EDC635FB87510850FBB7499D41E404EEB97C1E11A5C435E7F9CD5BC0F9970FCC32EC6157A5A2BD43F040E8BC977B54E1B12A76E5A8C69437DB6B84F08180A86210918A6862E34C75BC7FB118504F5394A8A28290649F1BDC27A5E920578E90DA1729115466846B3577C4B81570EF4770B962A454CDD373B2CEF847011C3D7B89CE3721E3245E09DB5DD8E5CF3440C185CB244A86A8FB4C107788B729594E51F79C14DF0F0D5E29AE0F32D17ABA1F962C36D37379F784EAB3F453B5C9419635C5024CE4965485597CB08B0DA295AE06ED1F70AEA1DFDDD0E1BD83BA6601631926C1AC6E796FDF0D942C43EE67F100E126D296C49147251C851970D25AABA0DDD370DAE88CAE922C204CD384231CCC9C4DF1CFA36DF3CA4C59A6720EA735CC471110F5996D07A9BB93B5174D55DF22B49AB8EB3406FD0020ADF407D3E1A0D8884E2045520BAC0121FAC04312551471B53478BC2F86484712B933C65728BC543344B319CE2B9321A80E24A168B5F9765BE48EB0823C001A93E81DC7109BCE103100C2A9E70C0430D160C4B8E5830C6BBDBA45821E86C65B49E3964D0F22604EBFBE2DCCD9B7C57804E2CCE6247D92F7C3A5AA6640ECF3E965F7659F6EAFC21C94A7E75EA06FFF202E4067B86F94C1243D7C9F71E50512A19860705734C77E5166CC3E2F59C8F0E69407EE1FAE7C7D6E3F08B7CD47A46E9C40E6EA84AD20D2A78905EAEB55FFADF65F7817042B2429FF325CACAA1DECDE211AD939A10E53659B41686F769519297B3C97D52A206E4FCACBBA2C587A4A7B242EB86F36EFE236BDFB1F5009F934DFA80875A07F27E75FEC3F3173F9C9FBDCED2A424E7ABECE1FCECFB3ADB943F2D766595AF93CD26AFEAA1BF3A7FACAAED4F171765DD62F96C9D2E8ABCCC1FAA678B7C7D912CF30B8CEBC78B172F2ED0727DC1576FD11A6179FECF1D96B25C329E329452C5FAA4B0DCF4F2DF90C0061D7B5CA387331927BDBCE02BBE04B891B4FEEA3C2544AD57F00784E79CEC90574945EEEE31D412D5FD3C3F230C97DC67A867BA0B25FAC680D434B0F99614587C15E7679F93EF9FD066553DE2E9FAF3736BA48D393830D2C69786228565FD2E2BF1E087E48EEB6D9694651FD6D107539FA1AF41B1448B749D6464F1E0BFCA7A15BCF80B9E762CA870F10FD6F8AF92A27DDD4FF5915F2A3F7DDC2CD1F757E7FFABAEF4D3D9C7FF79D7D5FBD359FDD2F2A7B3E767FF9B6EBC2AC424670295A8245B76AD0F3565ED9B4D13AD31B704C67F5729614F375C442735676C132A31AAB3BC9316A8C2F79152A21BC4F7A98ED569D5D9449EE28DAEC21BD49188555F61457938DAAD9CBE625C38C7BE70DE26E5638A8A4E561EC9CA6947E5B0677415FD387FEE3D2BAEFCB8F20D57FE4C2BDE8017E31A886B60E43540BC278E64CB1BE5B8DCBAE406C6DA45BF0FCB2783DF6FE0EE7E4ACAAABE81A9A7C573297F2CDF64F9E2771B6E06864A3D6CB03C91F735BDCEE451B6EDBF6CEBA6FA88E45B77433B82A5B1BFAD0D2D3CC87BA83AE593CF499E843F283101BD11C5957B002B976825751ECCE358B99D8BAADD4ED5D4F252C1090DED1B6E6A45DDFFD857D911ADB003DD1BAFD1322DD0A2AA131007C61D97E0012CC16EA3FB9C2F7747B3189BC1D8EF3B5D3DAF9DA7A3A8DB7E1BB7BED3587747B5DE0E74F3FB946E7E0FBFEB9565ED55129A19D978D9F1F879D4D2A176B13B12E130DBD9731497B88F57C15192A1BE5EA1C1AAD461FE2FEBE4FB7FB5B7C11387AF9A8138AADBE1B9FCBE4D0B2AA7A6A7A8F894AF5668F975578558D3DD638C68BE8F52786C298C19F748043124130C18BEADE6258AC7909AD79FC20BF7F2F5AE7ACC8BF4EF7E978371751FC0EA3E327FBB033D837D5C0C7EF7A1B8E6E6697D9F5BD933CD78D15FED08758823EBA27E05D133719456C72DADBA0789621292839558B3BBE8BED90DCE44A1DFEBDCA02C1B0D795CB107B062156F728FC8C5F7366F1FC0BA1C2CFAAA3E47E92FBBF5BDA74914301439D95E822CC8DB74F0226D105062E3BFDBFB60AF6987A5F0A2686E214ED2EE3AFB993395BDBBE14E0BB6B67747186561AC99BFCD9DC94E55F5143EEE24A7EB7A7662127207B07926BBD2CFAEF12E5FEC48741582C147E07678FC45F73526EE968429203F436B073DF271BCE587BE0FDC1B0AF7979C04FB0BB1A7455D733E5D13E29921DA88A54F655FD35CD932B7A5D5A1428E2BA2463B1AD282F303B6A6B2D7F6622BD8C6795464C2E0F652D26CDB7AC407A9D07DFD2D457F5CA1629D966598C01F37555268EF36CD263CAFD4C3FDF373EBE18EE59412C2261A37980330663002BE56FF8E43C88F225DF7E9A620AEAE03585D6F92CDEFF32A4FE31B0AC918ED1B6D6A4577E853580147B4A51CE0457C5C2607B04C30619769F5362996C7B258180BA0D4506584EBE73CC39BC4281A9DAFC1336E7E71552B567542F2182D50BAADC8EDCD875D52241BBCD0A07CCF07BBD2E94B56972574F5F18B4FF5CBEF5BB4209C31729CD6FAC23FA9132AF80A0D0A559D847A3C5F152C8176A54F57F1DAC0E7DDE229C41226ABC1256A20A9E517ABA059822EA6F5B66214D5A72AAA8F4448FB5FC8EEA30B4C3F4BF64B9BAA1A17F7B12FEE635BCDBE2AD72847A9E696F0C548787F18E752F3C7D06847B9D47CBD5C1628FC255F945D0720BBC09451072BB9C2B92FC510C427BB76000A8AB9BD2C4F993C82317CA99AA0E0DD5DFB600438DAABC1D97DC87D2D3523FBD84FE25FFCB1FCBA459B74B3E22C64D1A5E7B0A49EB99C6193501EAB70817DCDFD9EF9047283A7DC3EDC2E87A28E7232ABB57E4D78F48B756F5E51EDC5CBA2FA75DAB8AAC56D3E7203133E479BA419C826E6B4897CA9D927C9C4B73F4EE860E7FBF8E2E758F783F9CF857B976A715C41D6A59D9D42C84C23C982D9D89C230068DFFF1F86F9200ACC0310987B634F0BFE4E717C056E0FE22BEC41B4813AE3B87DF36DB528618E5DC2D4137D24422508A7F9FB158EEBF7184E036A8CE781ACE7EFD30D469126D95F51E2E0B2C4558F72E724E4CE51F98A8FECEE9CFAB9451DC8A96C4675656EA78B78208C62532B36997DF24804271885C4E1A0237085358E9AA83A3136593485B8200F6041BEDE6EB374518BE6E349BA804742B04B53B118BE87A802DDEDBC43E5A248B7552A465D778D789A8439411D46868828480E4190ECAABC4EFA7D5C4ED133E66F39CD545AD7A8DA151B2035AE13B65FCB648542ACC93A6BB2C76E1265D801C8B00FF9372C2D72223A8E447C917F0F312E0E3148B81852FA8A7EEEABC132C6C453D449088E96ED8E48684425FE14F9F872BDCDF227742CBBDF2FF9BDFD165257F2DA3E2835C221F8015DD9AB1BFFBE4BB2F4A135EEF8D942F09C88795B2D717C4E8AB44AB2E67EDA0FD5C16A35231CE84C02808F12FFDB5A70E9E39FFF937DCA05A943B72762B2057C7D789316D5A3F77675B345E4CA23FD7B0299007DF7830F45B2DCD598AFB26461C56076E8A1DB055FEC24425891A2CD42BC7FF58EF650A06F69BE2BF1E7BFA145151CFFA764B3DA25ABF01DBFCCD275BAA949FE96648F19B381109A0EF5280E7EEFE7DB5FD2008901351EF63745B2593CDAEABD46EF3A6ABD252CCE91428EC4D3EA8968F958C33D1205FF4015C1685F8A2BD66AC5B63A0C399E1FCFE9BC1D94FD11B9AFE8F7B2A0B5753878EBF535BD3A1057EF69ADDE2359B67B62DD6A922339DC10B5F5BCF3C31DA0DE112E5F1AE0ADE81C7496BC570B82E836F746838540F2749B67A8A01F9438BD8C1EE7901655C7B8F9D428EC92C81DC9DE73A072372EDAB868AD166DAB317E28F2DDF64896EECCA73DC8B6EBE45178B3C3BFBEA5650E263D8AB17F8E7C49FE92DF5F1F8F7BE0CC8B7226FF8C9FF35D31EA7BD2AFF8904B0E24E337F4F0F02E799AA899C94615D59C1391A9D768753C21810EF46CB22FE6BCB85EF77FBDD6610A3EECD2656D1C3B8E650B39E539C6160D741C20287CAC0471291DDA523AAA3832F5C87CC3BDCC1CCC84991DC7702E4375AFAED46179A248380591F09DACBC243BC257D4F8E7B7547C41606668686B7AAD22F246D9BEF1A69679BA21B85DA3700D71191FCB32FE8CB7F276173A92D5AB7FB8E172F0BC4ACAF28FBC5806477CF3F9367C90838FE5CDCD27736E8946AD935DFF57C96CB962A249AB3940A3EF15DC6DB76D97E093F475C6E86AC9A6E1611F24378FF91F845F69DB45144C472A98AE5189AA6ED73DAEF3C518EAFDB4D6C3B7F9E6212DD69EA956E332DCFF65788BD6DB6C3E1702DB1D022D80F001068BABAF3889A3F5F33DD34048ECC89134A71A77549DE6569DA2AC3D2059DB0AA3C310B9077AEA8A068EE35C54AFCB325FA4F536CF5ECE75776D25B7AC2E37CB33122EB307ECFA7083B28767FDB7CFBBAC4A49F069DCE6ABF3E7CF9EBD1006256022184CB0FD83800A2F685490D345926155BBAC8A042F4D71F5A79B45BA4D32AEFF1C9CA19C2024ED31F225EFD096C454DA54C0004D9ABB4A8AF6F99BD8688F9B135B3A1ABCBCA0E6DA88056E5055A59BD51D6CEF766204232EA85B85B0F54547C30FCD784C5AA4EECC67E189B749F998A2A24BE731155370CD32E884B243670B7E4007C41713F303C4074733FF0735EF2CCFA648AE2F584CDD7E4B049B699A4122B47566E30C6278ED3D3BA4DCD003D0F3377CB4D21F498B0C9EE6C328930F0F6C9CD9AF8761A42F521E38B3CD39E9F35D1D495F364F7498FD7A9E9A0FE66BBF6B46986C0851A009174734DE641BB74500E79F6C913F6D17E5BE4DB6F18A9B72B2BBFBAF5927FB73BEDCE1296FFE279DF4B6989EB1EE93FDC403C8F8A25198001AE3B86C60D16203BA2FEC00F3B1EB22DE67A6B05AB1D3B345576536C6A873224DABF6D54D3288DA2F07AFF835E33808CDAFEEEAA77C7507F4D97EAEB4D34DD2180A58EA8FA34CBAF9448498712147A3A4AD3E6DD98C2B7D5CDD6FDAA53D95D667CE4DB3AA7C9D6967DC29B6300781FBC05ECFB4BF89688A79EE6CF9DD1FDA2B3FD8E826B1B619DCF54C78DB6765420B73BD6366ADA332ABCFC20597DF178FC9668548D08F3B984A637000DD2C838C2D38785E608673100CD1C414E4DC00EA37AA52A6A06BD0AF591BEE104B2D7609BAB21CED588C22747D8ABD8319984983540767E31A2A4F88F62ED07152557C4235CF2064BE8FA555D8CF98278BD0A3DA6F15A340CBB422E95DEE489FA51C5117F2F3662527FA86587EA23E8F2221C4518D33E3D4404C5A23DD9AF1FC405EA02C50BAAD48F4E70FBBA44836555E348130EEC441F8CCA3FA88A1EA0877F250838EB3BDD84DAAF79944394423DD04A3D83BB6BAEBFF9272D50041CF39F5D59FA78CB869243E9210605A36326ABB87DE3B2E6A85535BA470620938FD072DBB7CD8607E49D656DF0B75795CCDC841333E30DDC8561B9E55396A9FE6CE7146EA5E05331E38DDB7F1CFCF53B002F8F059D2D49E78507687772CC2CAA47EC834A1154EDA07C82C0F411DBC7D4E3EB6C330D64999088E01E0240D26E4A07046191B51302B0FCDC73B8F84449D81FA4EBA8DFA29134AE6617AC0720C57349A8632A57F3F3B26535D65EE8DEA73BE414F3D9B108D7BBA0D8A699BF32B644A0E7E2362C763D2203D137BC21C136D3A8E5C71909B8B3D5FEC092FDCE6514CEC033B0CF3B02F9A86620CFE733A8ABE114E72845ACE632A1DB31B47547D1E6D3A673594849AA4512C25DCF29D9D3DEA35541FB3306AB9B79AC5346A18826950144543C9382FD0265636FAE19834D8CDC97CEEC8B318CE64868EE3328E1D9C396C0603D87C9C30A15CB06584B66BF39E443A39569B2C66B86F9977D798FCEEC57EEFA0E6658F38654A1B863D771CAE0DC38A35F6841F6EF32837F68F39FA59D91B2E092833E251C49D2DE6563BFA1755641F313CA586B581CE2736A6B6815A6B1AB31F4E7AEE889CB13F9CB13F5C719B47BED81FBED8875B938E33C8AB6593007B81BDC2E60CB137BD07985D8CBDB979E39224216D7DD6270ABD4935C93ED8A5BF1F7A084E7A3026CDCD7D10A1F960C2C7DBB3B1C2A44FB72D7961AF8442FDB794139A5261EA0E830780A1ED0703D4F0B3CDFEFB7493E07125D95F5152D4F3AF521618686602B9124B8ED03355202E60BB391537989D36E9AECD1DC59FBE121B5D2868DCC0277B4130998870F4F99E5752740FCFA8FB176A0041327E1C02934C9FF0C1964DF6E182AC6396DEE81E59651F5965FE3B91D7BB2AFF94AFD24DE712347A4448BE45963784C2C38E10298CC78C2BE68C14F921FF868A4D5ED491C5086F2A948FAE9C399A76DFCC59826A928DF5407F1FE7640A0D701C56A0076374306DBA36DFB974BDCDF22784EEA41DF79B41E5A1A46D9BD56BFB8FE3C4E3B09C1FDF8349371A93B6A8BECDCF0FBFE4F7523E2065F49CD5BFF77BDE85E1ECC17CE33ECD36CFB8377F438B8AF497CC36DC6FD739534D3EDB301F6B9C291AE7F86933439EDCC00DC8E8F4D9766F6EC6B86B7C8D34BE55805395032F404C30AA07D584736FA604D4BD9A7DCA675001A6E7808915001B36D887FDBFEDEF8722DF6DEFC0CEBBCD9E0113D46D42B8DA82B1524718CF4F1856684663D25E5B616E5EC06A4A1D807A448D906D09E281BEE890B5436E2C07A22376F33FAD34988D17A6970836FCB02732A13B374CCB13B31D1AA6E7099B33C3DC3C718D56E4067306F5B1699973DD5F8D77D730B1F2D88EE55074C7FAE6F4C32E5D269B059AC1018E6D5ABC2DE7CB0FFD3A0A1A9449B373DF46417CC27C53BB41F450D2093E4CCE519060BFF887A93763729C0A4BBC2463EE35AF8226395427C9119BE792E54000079FFF101C96A196326F3A449061FC13A9691E05EE139F4C9562CD994766CDAD778D4A545D2565F9474E629887E20FB5FE2A36C969B310C041330738A4BD678E5B840F64C40A728300C71FDA77A605ECE0182F1ABECC2294495B15C43796FF0CD7DD0998A31F91495B6DBF26E209ACF560E2E23A584FDAA0A2F7DF58A2F7695156EF922AB94F4A517725B56E50C5EADEE7674D0174EAB9593CA275D283A61B925637B9674E4B029F80ADE00F4D7559633D80BECD1E54D3B4F0084D685B80E81AA7DEC0344D0B90666DCBDBA4DAEA539C324D699B6824BC80BFF9DC216FF7850673F3438376D04005D44311887E2836E839596492DE3745D21134C59A2624E815A88DD0F249E4A5FDEF00BAA6FA84F4EC38BACF9A66A5CD699A3144DFBA540AD8DBEF20B9DA3213CC75E26D18795D24C75F17EB569A62791BAC6BD305CD261C159A628BA5CDB160DA59679E570393CF94CBE40907A623271B8F46A4295BDE37CA05B869A9CB7EB569BA4901AA6EBE81B1E8425341D30D264ABDD001A6B46BBA4DBFD3B4C84018B4256944815D4F492A119E4842AAB0A71D9D50AF251CF549BBD9A9534B017BA0BA82AA5B9AAA8E5DB5E8A453F7B41D53F5C4AC69F3B6FAD39BB83F76253261D20398E93FD0D30B994604C16A7424A88AAE635CC85FB1371C80B40B1C9C89305734CB952B85B971A36ABA8394BE2D5052EE8A61CBB221AED174ABE659AEF4DB74E3B2790F206ED2CD7745632D84097EA970634A756D198A2DEEB5ADD02657AE689583D44DE8969CE4EB0328ACC5F1005DCBF58F6E0639185D9BC2931CB1550104D42145309D10A6EF7E45314C970E036D463688611A4A278CBAA72BA214EA4AA4EDF4103A66ED3DA3454EED8BBA567EBE1ED8B32FD434503B5809B8EBAF00DAFABBFE08CA385240075106A06B67F0F1E84FA40C9C59BBF206B52D19EAB852C556DE40576E3684D64F51368EB658339816CAACC5DE134AD6660FA069B587D32A312B787FE90AA42BA7033091F2C33D2E2CE787729DA41F206DDA55EF323C94691F0C771DF83E0838FB4260A044864175AA13EEABFC40C694F67690E6EEBCD59968081D3727A076D67CEE39B7FED5B16D62A088C1972700EB4260B0B90A04D5E983BD955E5406FBA25E131CECFCAD26D87F306CA6BF5C90B6D643681BED21B9B62913B9A087762E3FE5F91905C6AAA1030C6FB7073C83FA814AEDDF503DD29C495DC6DE8F01CD07DA5AC47B1727F97079C81107CD18FCE9EA32FBBDFDF039ABBC6AFC32D0F004905C3BD4F575D708CE243018FAF84386861A70882CF148D822C56045E020DD9F71A689F81FBC8A80A1B300F26EF3373C757F659737809701550BBC51721B1A69E1AEB98481873600C83B485FFBD41D846E75842109B5A4D74C1E436B48A5181AE4F5604BFB5986D6DC32DD75974DF221B280F28EB3D75D75B7E19B2C70B8406DCD759BF7D007A26A07DF83069AB7D948505FD029E51107318640626E2EEB6AF0BDA4E3F0F031A58D4F231BDE00E1DD49B10E65721BAA412634D7D993C924AA34A4401A6FB6BA5D5F3620A63CE49046D67C3A6DB5FB4375A091032BBA0FAA2E129DC555557418387D4F3E44AC05060D038E3160C801A0AEADBCD3779873FAC2BAD3D99B8B6B60CEA5C00A12C8AED91B5AE8EECBE5B8E478029085BA55579D7520B0E0DD677000EE023506951B800357F4F7BD778D0700C00B1C88BACB425FD5F32C3814345492FB08B8C870D5CDFE5DD30A24DAF5D5020E8C93FE268E0FEDA660E5B7108E7C77945F8039F5A85AF2E10B3E0BF548A57E0846A43322DAF8DCD61639305C5773A2A1EF2D3FD2925826B2049890326B1AC1DCBDCE50EC493CC8B8FB1177BBD0584124F703CE8A3610355AA5A519D41A4365D33A21D1EABA819F494872F55362432DC91B15B7D9DF3752B1E9C399550AD0480E1D5422B044027DC71ACAA8BDC1ECC9C1387ADDD199C9207228A0C75858A0335B6BA753F9A7F99241B16860C0F00B65AEA10F99A6F4A3A7600F7BF6B955CEA1D74A05163EF88066930D9D42C12396AB1E1CE408C3985007E906C525C2530C5F95322F9C54E09F6A0C1C247D7DE160B83554B92653B264BA4258EDC050759A46599A66C8F2ECF4B20D00041EF7B4311DE3CB53B01B9163648D6006120C59C7B5049024283F1A6E18526B1B90E218384195425A7535A4CB381D52439C96101644384E0208898155245067113E5C22703970552450A5CB0D6B7F9AC83FEC1248F60ADD98EA72C2BA5EF3B2B7A5E213A9E6B254F1E8C96FC8CA5B626DFED35097C4930FFBB27904A41EF325947386EFB6D8E13D182A9CAE1218AE415E4BA6FBE08BBA7A00CA17722E6473F7EB16B332CA3DBB35191CBDE75B631A1EC526DCDD0DC952102ADCFA8DB2160611757312064EB7A7208B417EBEC3250A9C5A0EA28641123AF6C4EFE0C2277BC7DA1040F734D57EF8501E3560ECDA746BEC56C8BE506D7642F8E529EB1A20BEA46D9C0314AF631D3642286518B4176A538BF9769E15AFDC93DB46C2CADED37A0CBB7E4CAB182E904C80EA26F570B7EE21F03477D261C91241012334CA19E5DE79A626FC1AF9A6F55156BD2F76264197F2483E7230291260CF010C39268385461970789AE5AACD021474B54E3264368B8D7CCC8A6C37AE9D86EA31EFC3E9CAF09B6FE761D3095BE48396A675F11257F0C3747AB0B2A7E6DEC3D5CFB3329349C8999E72F87C2A0EBDE01E7DF893486D20EB047819A9CE4D1154A8B1D1115A0B3618F6C0D1FC2049AE20334498E46208677882A3270C075D4D1C84302461BE991286AD64384CF900F79154CA60F9E0130FE3E8FABC04707C55A68A7BD150C6248C4520D2C89E3419C690670666FFBE692E52C823A0839255061C9214AA181EAD808500FC5D1FF878DF90DF833226386BCA80837334460D75B00D100F88C062D82F2F9AFA7D38EBBEECE5451315A4FD807F5678E35B9127AC282BEBAF2F2FAE499C9B356A7EBD4365BA1A50BCC43837CD5006A41DCCC7CD43DE05F2E67AD48174C5DD9D331681CBA44A5E1755FA902C2A5CBC40655987B2F82DC976F529F31E2D3F6EBEEEAAEDAEC24346EBFB8C31949068E0AAF65F5E087D7EF9755B5BE9420C0177138BF30A7DDDBCD9A5D9B2EFF7FB242BB94993A12061C63F20FCBD99CB8AA822ABA71ED3977C6388A8255F1F1DBDE39DF2EBE626F9865CFA86D7F027B44A164F83989721D14F044BF697EFD2645524EBB2C531D4C73F310F2FD7DFFFE5FF03A873D9FB5F2C0500, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901170916054_init1', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB72E4B892D8BB23FC0F0A3DD91B675BDD333EEBB313DDBBD117758F665BDD5A9566ECF3A4A0AAA012CFB0C85A92D5D33A0E7F991FFC49FE0503BCE292B81224EB8298881E15914800894422914864FEBFFFF37F5FFFEBF74D72F60DE5459CA56FCE5FBD78797E86D265B68AD3F59BF35DF9F88F7F39FFD77FF9CFFFE9F5E56AF3FDECB716EE4702876BA6C59BF3A7B2DCFE7471512C9FD0262A5E6CE2659E15D963F962996D2EA25576F1C3CB97FF7CF1EAD505C228CE31AEB3B3D7B7BBB48C37A8FA817FBECFD225DA96BB28B9CE5628299AEFB86451613DFB126D50B18D96E8CDF9E5EDCD8B0F51199D9FBD4DE208B7BF40C9E3F95994A6591995B8773FFD5AA0459967E97AB1C51FA2E4EE798B30DC639414A8E9F54F3DB8E9005EFE400670D1576C512D7745996D2C11BEFAB1A1C8055FDD89AEE71DC530CD2E316DCB6732EA8A6E6FCEDF2E971926F8F919DFD64FEF939CC0D554AD69FFA281C60CD0FEF9A7B3BEF84F1D13605E21FFFDE9ECFD2E2977397A93A25D9947C99FCE6E760F49BCFC37F47C97FD8ED237E92E49E80EE22EE232E603FE7493675B9497CFB7E8B1E9F6D587F3B30BB6DE055FB1AB46D5A9477495963FFE707EF605371E3D24A89B7F6AF48B32CBD12794A23C2AD1EA262A4B94E3E9BB5AA18A8242EB5C5BEF3141DAD630C361829D9F5D47DF3FA3745D3EBD39FFE1CF788D7C8CBFA355FBA5E9C1AF698C1718AE54E63B04F450DD2AF977FA56497B5DAB78C1B5AC517FB744F6013D469867309FE6CF8B78C522A6BE5AA27D9F4445113FC6CB661D89BDE5212C1B7817251116542DE60F68196FA2E4FCEC26C77F3502F42FE7678B65445042CCA7C67F13E598F30416D68C7A97E35ACB673DE76BF0E488AC022C5AFB01E2BFEFE28DC34CD4B8DE3D7B6054754BBF6E57F25E1B559DA09357C5079420DC56DBD2BB2C4B5064C0805FA26FF1BA62560E65C3D0C5F9D92D4A2A80E229DEB2DC7EDF037DCCB3CD6D96F415BBB2FB45B6CB2B9ECE24007751BE46A575D716A8247B88B2870DCC7DB74109FDE420BACE70BDE5C1DA4199F6F97D843B87F2662DC508EE350BF50C755B0222F45B06E7D871657F15FDD4F5CFBD5FCDC0E07EB5A36EFF8018550A24F6550A69DB6BD27ABBB1E5515A44CBAAE7CA4526AD23AE3909A87409CAE06D5764BDAF0C171592C527CA12D38EDD65B6D496D4103B0D024A290D4343747E7DD1ABD7264A7723999C75EFA67E50C1C1B6646A69433527EDB44111F4A913D4A7FC2A2B126923D3699CC40CA74818CA99169C5769829881D75F4DA5C122C1D3512D48A820A17C1D4C7819A53BC0581E4C94E712E0D4259E500420E95945841CE7D4F26B21ED330C223FB17070507F6D7702D31DA0866EFF7F6282FF4B9606291BA4AC93943531A748A4EA50696A669F7295ABB24ECB25B069F7899853F6B806103B49BE4BFB55150E529EEB668DE425013D312169AA1DCF732375B989E264FA66AFB38738F1315CDD555051FC91E5ABE907F8392ACAB7CB32FE56CDFCC00DEBAA789764CBDF1D24344F8F3CFB16AF802358D87C8F67F36D2719DC2A2A69DF43F47B0553206C166CA9EDC64570C07B2DC14B4A85AD8B2910347FB6D4DE5E8EF711B83F5591D099FEABD013AA68D0B1A39F12A37DB4050F7B29D816F9F76D1E3DC4CB793C4B2ED37512174F336C3BD93A4EDFD77AF590E3D62D5AC705A6B9075461F3D8B7CDC34AB12762CE42B927E04128C17C510CB77D13F20653CAB12D489DEEA4569D6A084075AAFE8134B9BED49B09C2509193F6466A85D0F586D4C6A266A7D3306B98FB5EA4895DE440A45A270F3748F1B390AF41B64ADB3A5985EF16ADE21C2DCB5FF319AC38612739A49D84C82BCD295CBD95484FE1C3A5202B5A2DF5CDBA52908C605B357186EA8C2DA983EE794A12A35D8D7AB5AA85942A55CDFF64FA1F0BE5AA07FA560035BD15144527D16725F282A80B4A2060F58BD3DF67D0FE8AA27A0936BA64FB1017DB247AFE9A57F6F1B0FD9CCAF6E370BC37DD8734477B6EB77292EB95AC3514EB156C90EA300B7B309BCEF3C6F8EA66FA3609B5DEAE517F6903348DFFF4E25B419E4355BC67E94E70F97D1BE7156F7811C49FB3F51AADBEEE4A170159F968206B9915FC2A4E6F3B52FA55D47E009063055B229C29B862DBA34F551DAF00853B032EBD6F3623AE575D09ECD6D017DB7A5848AF09B4FE15307986FB28B603B2D9903178D893C1B660A97F08DBE3EDE719F480E2EDAE7CCAF2F8EFC33DF8C29671485B46237687486650208A82DBEDAD8BEB73C7F0CE31D8A120222FA98041632DD3C5F3E621F371D9A915DA5E8E06FE8C57443E55119FFA651BF692D3D94BC4282FFE63C2086F84B4D1634C7B7FF97DF914A56B748B2700EE3A0D71DFB378DF6D104038B9C0502E216CAEB314EF542492C9A33434508B1F8207082E82C9490EC0DA12DD660406BD37EDF9C05EDF6536FD16A1819EF340F2BE0B902E7791BA0786EE4FA0A5FD963C9576520BE92564AB1AD275837A086F959EE257BCDBF52FCB7CC750C47C9A8C863CE81D87A877F8DCB47931A6DEDA1DDD2A28316E19CD81A97B6252CC24A6039E36F41F3B54D80659FDB2DB3C0CBEC2575FE5F9B9DBF2229AEA4A351227046F37F4EB2BFF62D8D33E44C557F481CA67B7584D66243A76510F87F6F82EF335F6BB6C92917BBA3C8D76C570C3F8876CB9DBA0369476231FC816C5163862F521B96E31D1B73141167989F460D8DA44A116FAD1F5CC3B5A635FB2CA8A30F22E10F4D4A3D153079839A451C72426051B13932A4E1283FE9E81EE3B2D0512546C39A4AD8583DEA4C7B28A4989AEB0A0D9F4BFD15F0D09DF41AB08DF001910BE85B4378C99F30B052BEB7407A2E9720F67DF61333E71B3E14979446AED33EFB7397F50B072429BF1460F37EC563721DBB05DB61AA60EFBEBC4CEBFA6563C2A73CB506DDD933E3853E42FDDF3334FDAA7EDA1E2A9B2638C3CBADF62F4C70DCA377141160573ECE08BDC92E42CCA2897F8B5DA325956AAE8F1E7973EE831D993105FB7F341C53F24159FC996052914F4BE75CF40530A850C48BC5C9342DA2A42EFA2F47795EE4695437151816241FB81606CF59E46FD806F2D5BDD04E81F5724F48D2F1F16A0999E957A7287AA380436A839605BF3E826FBE77C15368A03DC2824EE17C37609E1D8A9DD4F9CC41CB3651809385283DE494E4CA2995C5C12EA8410162728097C695DBC8AA8D2CC6C94436DFF6A20B873E46F65CF2A804136A5BA793B317462F227BC0E0882F3880427253F6035CA4A3AA94EAB8CF832BEEDCBD12A2EDF47F94AA2E475E542E7B82251A1E3CA879D563B64A6C7D4AE02F56710A5B03863BC3206F801584A9F9FB3041F28E7391A0BFE2D3D973879B80495F81425FB509929984A2532D5B44F9F76511EA5581ADCA2258AB7E50754467122CBCF94AF1A30D2C1AE6A5DE7BE96B57412242D38900B4F5F6760963955030E5B85125FD83E605143B912BB09BE9BAB2FC3105C7EDFA2259124F575DF783EAA7D426ED506C243B9B7F25B94ECC61BCE0233C0AE908CA22DB4B515A324FE86F26797FD80343B38B47FBD7CC35E7C4A7B71BD594DB3C9890900CD3746F31BC40A9FCB90BAAAC6A36A8A6C07D6561B98301C6EC3DFD61D366DB02D1F9EF8FBF1BCA79BE920F24F49E40F38DAB88B48CB030E2F59AD8F7156A3BBA7AAE947D6431B0B7EAACA20A13F40CA07B13EF6596C1E735CEDDFFA6AAE867F98C881F7C7D1DB99C661F7ED6A95A309FC53C3967C485B32B56FD8EDCBCE3B97E97E0C6C764E3B57F746C52A0E42532B6C59605BD33C42F5F4B63C08A44312482AAF250B3F6C5E3F96F969DBFADFF7665E89B4ACC487087D0F3C95D30203B25257C3DA99E089546C432628A9CE838AC46721A473C08139857653F6988180280F0208D486A16C296C10D1AD452D7F0A0A4348293C340C5DCF5892E0EA6AC636616553E6B5304B4AD686E5CE2FC57362BA808953B1B7A02DFCC59C487DA75BB991C3084D1269E6AAF8BA4529DEBFB98BD2F0EEEF14D421751401A93A00C5A3D3430356456D15FB6B32797801CFDA93F968FC041FE0F423BB5D87A91CB61AF1E20A0C47355E18BC51626A51BEBFE1547B4A625CF70A9A3B1231E094C8934289B24E0EEAFFBCC535C65590F69F3D5F6946C0020F8F8FEA28A799BA414C0BEDF80C63E92F286415F36BDCB3C05D3672031306F59CA419CDA5A59F6DFC4BC5D051A20CCCE8A7296DB89F1099F1F4F67D6DC040765B63C165F64A1A0A8EAB0683FA3CAA399A58D5BD758F0E6841631A58D6DD1E46D3630A70588E466B73E51D5EBBC52E7F7E71BA164AE3948DFC196ECFCD8A4DAEAB4976E169B6FA49AE8B6581F9678A0D1F36EA43DAA8951B88CEB26A644B1DDD7AEA7029A7EAA3179BA8F36D5C5311F30F701714F639B0AD090EA0DED23D784284192E0F92FAA4247535E5A000042E761AE05E0ACA6004512805748919AF32FDB666590A8EF5BF103A2F03157C2C74F0F6C1C14D06D241E98601024A0701430F721969B8C37643AAAA853D086CCB8B1005DE385734777CDE3CEE83EC690E37B517884737908F718AD1C451F2571485677827B58382E2D9F77E2A11E3F28DD76AFF57BD24A400C4FE0A8562166501C23ACB0ABDB4C02E3210552B5C125C1040E82A0C357C4BB40AC5C26F8C21EECA6C5BD122A61244F6BB66F5D53624C7E1DB03BD9C0D7D79EB04A3E2E96EB4DA5D0A70F5018AC5D4C1008CEDE9549DE2986A00CC700C942B7BE96CF7941FFA2D777B55EFE4E77BE3ED93DBFA6D3750A67AD842C1B6FCE505BA4CFD08D27AAE07EF6633258A085BCA216D29DD59C1DFA9821789EAB387DB35D0768B4553D5DFCFD9DA542E3295823404DBC294214D0DBE9089CB097CD73EA06299C7DBFA1A70ECB6A2321ADF2A77E34186584ED5AFB79FA76F346C12FBB64998CBDE5D99612911A7768130F86A41FEC282938C6EF0A99E8A003561A6B139845781F2B76BD47B298CE80D86F931FD3557E579F5D3D2AF45B4462E3286A85BC11C745C62597D7D8E65057CD3C209DBFB0694BA67012144AF05186C58E8BFEC1B1689595E4D97D1DE41D508DB06D816F9F73433211153D770B3BCBFEC96C18C728AA2B86143501853D2EBBE83EB2531502C886108C6DAE4BDD926D93392D87ADAD27B463A53966FA05CBCEA8680EC3327AFA51E047599AC8F6229903E5900191624A89D4FB347BF3574D8C3C0B6C8BFC11211E4AC52CEC6A5CC5AED206679E9A012C56EDE2F8D4034940F2D781010605BBF640F43F53C6A8687A2FAF75D94C48FCD8502F51EBCDA4D57BB65F352FC33FA8612FB7EA2146BA21CD6FAA37D78EB288FCB28A99D5D39944C9993E67FA2A78E390C6CDA88003F8CD2AC369CB88FBDE2725379084A1BF9271F8D18456FF0D212D98CBF3EBE8BF3F269B056B1D822727B1AFF3DD25C74F9D9B53FE5D16A57EFBD49B4F4C1E6A6ED69FC1EFC3447D2C4E5314A974A8F414F81F873F42DCE7605FEFC37B42CC76FF07394AE77D17A82A15D26F1264EAB697B1FED8A695B74517BA98855DA906F7E3A4C5A24C1E8276CEE5D1EA5CB274F0729CD1658296C233732558E8960B43BC5C3246346F26513131C42558633D39EE2938FBA871500D033FC5DDE235268DB937E2B03BAD314920608FEFEF4DBF74C02221CC56570838EE315958C4EE218321CC2C1B64EF6CC17AE88C26E33C8D3D6ECFE4525C9A5F72DB49877928CACB83514926CA5202FC1B61A220D0E4CD24CF5503C41F69CB2ECF1ADB5F1AAA54EBBB3D4324DBADB814A7BDBFCD475B6051BE4DBD4F5C6468006C909B6E5F1AEE67D12A3E18F6E4F56F5DDBF2772A41259F05E10DD6583D160891DE1E598A09C8EA5E2F8447C22A35738D004A562902F462554557BF47D0B22ECCD4D896C4F6E8BFDFAB8396B0E1AE314AF60F8B23FB67825E647A0584ACF21C6C74F79B6DB2A295A4128E8C994CBA8C902D9D2129F8049881165371B1845473908595779B0612E84CD1A31F320AC8083C208B675B2FA59D8C9C34E3E642737B9D4D1EFE51261C96FF543CED5D51E6177B8AEAA048109B6E5C936A9F137F0F32A72B1C3BFBEC545964FD25C10600728C0FCE9A8123D1A56648748B44695B493694DA520D5C6946A1EBCCD7FC65C346AE0C3AFF8544716F7F80D3D3E7E889E276A66B251056DF714370B99331577B8E72EE2C552D92641838C70F1656FC5D0F4D3CB76563FAC34DCC66AE0B07D816D9DAC15C3E77D5F10C8072490757670EB57DFBCC0533C0C7712765560D74FBB78555FF63985356FAB072908AF3AF50B3B5FD97C27B02410F4CC9BCB9E133E64CBDD06D3A3060932EE88659C36C1442B0FE8D8D1BD88E14250AB80E10414CA1AC3333CB0E8078AC490F141E941D3A560A0648A7B62069F89F3DA091C8AACCA6A61203729B8203C8F58786AF31E70D24D96FF00068363F84B609D120DF4727C7CE96F321878BF7093FEDF89F88A128788B050D520F4C1B6F0CF6F311310C44DB09270A9020E7D154FB1AF838C3E6219DDB2282CE380A57EDFD7A0E49B0A50946D4A685B514D38DDBCF735B4A6E704C8ACD715E420497C8D257BB7F1190960AA4690BB605BBAA8342359426FA2A2F823CB57D3B7BCB8BE9B218AF755B1587CB61645E132EF44B61D739F8A686D6A8E25A041E8816D9DEC05D41DFA5E6A073E92B24BDAD60F7CDF537F4569BDC087225A3C657F90154A1BE8833C3F3D798ED215EE7965AEB0CC36D39B96012441F0C38C0359075CECC0E1FAFED896ACD6C4097B2C894B4FCCA92A0512FD96A490DE8EFA5013FC495F0663D4DFE1E7FC5B54A0B23D21DA4945A86A9085A3C9C2497C18DE67E9639C6F1C167410BA072C74A5120C5AE38208930201AE5332C84142EC0E6DB689F9BB8716FCC484D5972AF0B6E6A884966C00FA31639BBC3CC2433FC9543B97B9A36A3CD83B4EDEDE11F6DE43DA7B1B910B6EBFED4E75DF01F5BB2E5F266CB60280973DB6EB89D556DBD40A3B6EB08F871BB6539676AD40807D97ADE41DEF992C158866F26EB7A1A45D63F1ADBD41AF8A8F49B42EBAB19AF9A361849DE59894FA907D78FA56284F9EF174D3B289A5FD352219223AA5A244EB8CD8C82AF7D637E72F85B962E017BB07A1CA2B75959F518267B87316692A89AE604C251EFC47719AEA09514C12E5A63C608A3A2CF34CD007F41097A6B383E5D38A827EE540B486F0EF137C0AEF128EF9E07116E33CC47C5B1488049E31A3E6E7186FBB499303D08CD76FD13794EE28780D9B93FC406941C1FFA886AF358606F6BFB94FEF02956543361F734BA19B4B8CE15D02B7259B5A23DAB00FA406508546340F3DEEF2282D1E8919CE50703C11639B29975FA505560F36C85C9C7F40DBAC888789F3DF62F4C70DCA3771510C15492CAA79A6A8C6624AF29B3CFE56E98230BD8D0858EF0E2449D4600E6751CD43C0EBA8C0C728D207532EFF2D2EA2419B23356CB2C0A24A8FF4494C16EB5C8C992F9FA2029952152FA425160595379C193357078FB71B953E68391D6D4A512FB350239B87F8B76889F0A17745CE359F7611E687323396E2F83486EB6236CA6ED13647059995FA086DAABDE093226A5A97A0D00AFAB60B62EF5D847E7B40F2B8DC609433E92DACC2AE9DDF8781DABD4F3AEE0501AF5253E27DDD0D235D7D0E1C2E67283C33C9F7DA51C458BC674565E13113216F49970688743197F5105273C8E6A1F7CFF1FAA949DF6D41472C44F18ECAA4FD3695C11F3190DC74021C29079D28DB3CE103E6A9463197169998EB2D684343BBF03797027D00D1184C73D12ECF2D787A8131CBC9276C76F1B70C2B962B533EFE1FF12AFB83021F601D1182A50CD736389433691BBB3C47E9F2F9DDEED96203686B2D5092D0D5065817E1A80A5EA9DCE19D578FE74E39BABD368AF91A46547E5B14D932AE88C412BA8D2450707DBD4C5767F5AD080FD85F133FF3B130CECFAE31B1E22D264F5C3EE3C1BC7821AE7805E6EE42468BF91F04B4B7E811E5C499324ADE67C4FC14C56929DEECC6E932DE4689666C5C3DC33B6142FCAE05BEE403DA924D2C2D35833769FA26CA9BFC516207BA76B8EB6A1D7D5E5F503C62C43A8D4DB70B6FA199660E5CC1460DA47ECEB56D983394C8A743184AD28FE9D84A426C930E50117866E1AEC652DF6E2A5AF692C043FCC581DA3098AC95C9394CD39109584C43F003E23153DE32E029075E9A9D87E6E39D43E61996FDC9D5AF6E9E851A167CA4D29FE4F8018EB2967D83384B3AE409794C4A16933E349567E3B6EA4D43179246C6010C14C455F54B0B73D1C42204D8A88F9263A0EA3BB110D88509D806A4A591364E45C39A8D57C818EEC93F4A5EE9A064BC5261B0E4971E29C02F10428F8C22B43D11A30884346997C0CFCF249548D0CE27FBFACA1393300FB53452CA3793D06D4FC92434214DDA6D5F7ACECA24D7D96A87FB5EFF4FCB2C0CB48A691A7C0EACC33601B0108CDA331381BD98909940429BB45FD7D817B6EA6488E1AC776B694CD6EA1A91C8A7093632494FA667309EE0A6726BD60DAEB2C6EB5566160C62A90AC286933894B368CD701F26601D989E07A137575DFF9CADEFEB19574E6F0726E5180C61CD343D568069403EF4C92E42EB53B18B404C9386AB0A334B17A5EEDC8378942A33A8CC62C39389918352965B3B93922968200BB39FE6E694C13A2D77404D4F68D4B3E590F9B8A3BD1E69FFD05EB44B6B807C23B1E32AB946DAC0E417EFDAB14EC1523A7218D9899BBAB3F1D9E5F7E55394AE51953BB1E30A190B80D0107FD18036BB16DC00741F61CCC04E0CA6ECC704CCA524F44130D6FB24C688383795CA0F4B2A5F6435400146035BDD9E4A5B81B88C06AE9DC8C6D915759D9A429EE9C86FD207AADA6C9CF72E4A7FE78621E5390016E2360ACC52D5821AD031DA484CA6E8CA04ECA5A0F47E2B62DDB3AD7B3204B9F462E14099D58158092C0E31C03D55C746924C70EB53C82398A0262D13F819CF7524B4E012C5DB927964D764ABAAA65F7E30D3D6854F81AA6A76BE45FA0E40E24BCAD9DE8E8DC6FD9AE434693C4D46BA1A86DF3B76BDEFDF57DA324B5FD586597DB029D532C0A5D2A6466652B15733F2A83839269DE92AED1D9F366BAE297295AC4DD1ACC2B5ED03E87D67B666A691B65C47E717B8DCEC9974A8A9B2178714A55EC9035A1E4F54FC28A09E56B594353FF161E4A094CB3666B5EE5CCBC1414CD305DB3767181EEB4C0759493726E01B09592D2C23735F3789C129F4565F7D55C5D59458CBE1AD83AAE9E98DC3E69D9A646B349D9CC3301B4B87D3CA2B7B566957ED102635BB5155340E3937C31278742EE5BA342B937273B3DFA6C02A885D7B35734F6B5D52BE905601B99181B69293F276244ADDC84FC4B4FD9982EBB4C437D5F7E6DEBCAFB3143D7703214720EDA62DAF02711E036DC3788A66A6DF98F59D9980EBF48437E9045D6F4FD84EB70183D0D6CCA6D968E14626DF5C95DD989CC90E6913657B7E97590AB2BEC288628C6A646E2126766572EE12496ED285BED6BEE86B2C73186A522C29AC7536DDB141D518F84C49C1DFE3A86E609FA657DEC079D86B41D70A658E4174B6356EDC7E0D771C7248B859B2B30341AAA96C0388CBFD5961700B8268D69E04BF6CD5F511CF9564B7791360638333B5BA39DAD9F6C4B236B32DEDE0AD6736F632430B9907869A4D4B9FD7E835D0CCD5549957516FA55E758ED519BBA435A4AABAA150356C65A6EB286D87A6D2D855A437B539EC85A58B198891D901AA61CD7526A607B0A179CC0FAAAECCC272076786E87A7F97D9C9B60E7E44C9D6B7B117724DE8CEE42C2610DDCC0CB15F128DA4CEB091671DFCA89C662FC8FC851ED0F46506367390635DA5F91F8C12496C78C456D4F1FE68146862E051DBD9C0A51FF514F62D3D610EE69EA81B8B2DDF8DCC737BC66FF3F39A3B9FED0F8FDD65B65CC6D7F0CE67420373739A6CC453F29A8C28877279D48E83848C3089D60BC37BE7350EFD7CA17AD5E39D92D360921C8454BB24C9BA9A570CBA2328000B865EE8C1AC222F00D8278F2CAEE8C4040CA520B049EB731F34E9EEEB237900C02371D39C613C14DD9898A10EF23E891E40F5B7113F557F8FC44C356E8093EAEE8DCF464C0726E62186B0266D571566E39E8F711AE14146C95F5194579D5729502034C4450CA08D0E05B760CA4B9EF426E53027E02725118C2C0E3482B99348D177AC6A0125ABA04824E578F52D6D6962A9A5EBC704CCA623FAFECBB0560FA4EE46A9D1E8D3DE49EA5964C1334981276B45AEC05BF1F610F6D351603A2ED451C9D4DC3AB79EDF1D8C321786046B796647B88D7D6046E5E82764452585CC2C64B3B3E1AECC3E67EB38ED2EEC9461B0617090F13848ABBD176E65E2F0D8EA5E4CC1664A629BF1D79CE1B23F65DF509E667915FD9270B942B1036021AEA2C06C180AC20ED9319A4E8EC34F8A4E4CC04C0A021B1931EA2AF3D93036DB247B46E89EE600A9A90100062D190D9C951903C20D85A99273AA2F7B86A227539834144436699EAA363F57FD923DE8B9090379E7228213E01ED29F91B9866A794A6EA18868D22C069F8D3B706FFE869625E93AE97937CFB24995C0433CC382DA708EAC11C82C21614C4F9CA4E9C9044CA521B8915DA2A9333793DDD7BEA03ADE6AC0142CE5C04B2D52A987EAB80CC4353F1DDF70C4345283AA1AB3338B891204C07A669BD93520454726E4A203D67F9A217CCAB3DDF6BEE504CDB433C00A8EAAE01CD88AC50FE7518338D62F4F81BD988EA940229B34DF54999BA3B0DA5625BD50E9D522A8829B1A28077EA2F14FAA69CBDB9F8E8F00E21E88D6DDF6DC502A71E0A372D2DCB249D28FE9B9EA70E5537B6430E42E0E7CD413DDDCDC25E9C7F4C7B903E4AE5BB426B7E326EAB9080A07C5585BFA2D007867D1CDE5FD988093E4C43D14CDBCF297F8B48B5751BA4436AEC5701DA91F1F0B6EEDCF27696D1E97637567A63072EA27C0A41773DF0943C360BE597120F36D223E64DB94796C75C3998E27C18ECDC499E0C418D94CE98A33E6BC2CB1948E12E686FC4697F95D590BCE812956B0CB85A96AD0224DBCB79C9806FD9982234D26C250E79B37833C3812653E68698DC918D02667B4BF2001DAAECCC577079572FC063710A7EB4A0AB703507B4D4B6B80075911D8EA342B6D6B62C7696D47A638D1EA086FBCDDEE15B729859BACC244BC6623D946E4B489A59A8EE87B2FD46E5181CA9BA828FEC8489230033E93D680ED2822B09D5545D6D8B4ACA6EDC724C6150DE1F79ED9EED0669B54462154BBABCBA69D0704436B363056713579BC906B7303D3F671A4E09A929E4CC04732E29A34DD54998883B058C534C775F0B9394579BF2FC725790B79B6DC1565B689D2342BABBA3F61EE7E9FE464328B37E765BE132D2604E10295ACC507A3AA4B20BB99C04C200AFCA1C41B81025303A145C806A0A8C629A014825498E154A0D2A2208203AA5F0B5D4DE5F6AC0821E8CFDD063D201C2CEB0529D322912130AADCB6729DAD76EA7ED4105A8472448608AA870650FDE6818649757C229362C0657AE65272AA298BB641D3C9052784882E37A02B13E308222F134F4837423A5E24384A36A0A40DBA4A58E95092EF5AB454AA25082193B6CA00950C877E785D3A73705C54B273ADD452E5AD8585993ADBB06383364D691B51623547D32880A02C6BF56CB35D017A0729DD27A03787BA6698A408206E2E6D82C9EA56E1E3127DE884A07AE036433523A5030D2F9BF00F805CAC4D3906F59FE5EB862AD6A262221840C8B808133A926D896A5DA96F928D8885D023E45EEF81288547923A1E6E344E71C1D217FA3A24D55B2EC93ED93E81D34D64E3370FCE62F7EE4083E497EC01AA5FB9E4E93539CA5744A2CF310E39660815984CF6D31429F665D33E54CE9F8A8E349EB566C81A5F2D05BACE214E2BE9D71241D27AA9982CFEF6DE50BAFCFB5B591B741A99C25F2F6B9540F192005606A1BB19DDB6817BA0D08FA862FD1C47F0C643BEEB2B8B3643101764A3D5B28A682282190732CBE9F6C9C66E006E929D31C61049634850E1EA0C301C4ACA5820ECBCF7FD045360ECBEDBC3F0160C3116430BDA19A0BAF1D0C603C114A240D45A9C0C103176110C694E86C6D6D0792EC989C1436A47C2555010A63789E8E9C3631D974A9CF944452619A87C44921A10A100538F825432C493D0CA8046E6B431A0891129262601305D726288C0FAE10875061348C408904ACB860E34ABEE257AD39E482716403E12060EA247639854108345011080324F7A193869F6BEB628C203EF01D4BDEEE064036FCC999AC1F76880C18328860CBCB6082B062E5E2FC23D662E15DD07CE5C17EA1867C0C06B93ED7D6BB995138005D48F80815711A433271B9085450A9047826C38817A5BBD96441DA8F178BA59F74BA60EAD848F7C2DA23AD2904A6E7210F211B080103DDACB030519382423CBCEF6CAA10986251B7D0FA1E97807281D7D6D72D211A0C7031000A6A2F3DCCBA42755AA9B2E99DC349EEFB12566AB9DC8C6CA94EB951CD978AD34A5D1C7DCAAEDED1FAA93AA1C583110591D903486470E29CE71356EFAB2AF8FC60E100A06940F08848708C45D472A6804A384D46C9FFA35733DD89E83EA6B42809DA4C08AA997D501D989BB2055B194142F4432E0A67430E9A88B50D5A91602930F0B808608C5DED12AC804E1D311C80B5F75D7B3F7F5652FC04D1C8862AE59489073E8CB6215DB70A8005A3497D61E7627D525F27D7D750D6D5AFA6AAA6D485B1BDEE23457E4CA9D4FDF24C472F219F348EC7BEA26DC9CD6542DFB71F7956D28ED4663AA2D80C472E4FED9B92972E0E8B6A63387354513F375DB2A6808339CE381BB8E4CB20A3066FB834CB63A6D36634BD7D67159B1F3F220F28E73901011FA5B300501783C93ECB432871AA5C26B504B7BD65154561CA340DF16FDC14AD5D8E84AB2B40BDD9DA70D85C1DCC38663E6F3108F495F3E1FB1C16A70212EE3B475CFB817025495432B8628AD04D291F73353114F8E5922FB3CAE7CC63DED9ECE410B514E012D1F9FBC124439DEA14E413805E2B15733DBB46205C380A66352AC54673A4DB322D936FB2CA07A1A51B0A643EAAB78A5148576F4DD8195019CD3A85684B1F0C6A2861DAE5F31C69112BAD3514DCB006D8EF7E0952B751CA45E27E3C63854C5E3D0414CA69E800154E29F25C8A9A44AD20C0E4B92A3D9954A928CCC3C2B5163197EFD61A8015BEABCA65AAEB1DE358B266BA8BBDA69AB86FAA9136526DCF15A26A4335449B73C1058B3394175A49B9E744918E29DE2E829B6AED3A640609BE1E9B42A57B2CDC1675DF6283DB97A50D3417535BC92AAC73A3D7FDD65C6DCD5839A0F6C0CCEEAB18E7C866EF70FC2CA7AED40056E70892BD6F271350C609D425DE8DAB7209B3DC9FC936B4E52DD6516C412800D06C7D7F1413001E7A42423EE1F1A875F09A8C1D0D81A3E88C5619CC8D9F792CAB2ADD81A2130855F85080D3A6A302F1B557E1A00BE91BD588004F63ABA98F8B000E0DE2833D989866EF4B27EFAA8A6CCA5186A4D3A8A4B26C8DA509A5C3261D4386C7EA801277B07286290159E19873A2F3C3516FE59AF8236EA4CF0A3D007B8E590328D14563E225915C5EB26E353B114F714049366DE563C8F334AD60D0D519BAEDB40CC5AE1958B6FD5EC0CA0269C345A414B832CD3E088D579A65DE9A8CE2C3D3E15E19CC710F90CB223B32354E747A68726860750514E9D11790C3770287B2F40226D925F661CAA34BFF40EDF843950504495D297C6D4C73A18AE2A403968216D419BAB96DDE255D96A69A1DC875C50290CAAFCB45A120FA14A15B641410D211714DC6F3A0F94FBE8E96C4F14963AE2C4E031CB328302C3374A22CA8C419746947DF4C246C15090469738D484D6EEA46AF35BCA290466C08446C0E7C014E96144083EEB256B88AC0379781BBD466268F33A8203D0C80B2B624C252DC08C83728A28321342C38073138A346923ACE80903672334A0B23B6DE8DC7972CA4833EC41A38072EC8963E843C5E8E90265D51B4DCEF2B9E0F45431E61859DE383FD499946FF89C66FACDC8984AB2FC677EB6A269A804E4E6021D1FD419BC382F05690E2FE69E66AD3D9C2BB2768DA2B329B24BC9CC5F26C9A844D395261D156F1213C239E94C639A0454231A549509920C89C856B21B2AF36D3482B2AD484C4574502F0F6F2E55797DC0B797C68980D8E11AA502A2870A470553BEC93449FEC3CA3B6FAFD8E579694C89A879F7AC4F63E39F78633F8F96275781B65329B062EF93D50137551158B3B34AB18F6AE595260931249A86D1B429457C936C6C2E9367BB00551219B04A9F90D48115141158A7AEC8D08F4834216B03E478A8CCECC08C419ADB8136A6F6A10655FE86B26C0E00A63EDEA0313D5E5FD478BAFC035DD9EB8BC5F2096DA2E6C3EB0B0CB244DB721725D7D90A25455B701D6DB724045E5FB3F972B6D8464B7271FF8F8BF3B3EF9B242DDE9C3F95E5F6A78B8BA2425DBCD8C4CB3C2BB2C7F2C532DB5C44ABECE287972FFFF9E2D5AB8B4D8DE362C9DC24BCE67ADBB55462BD768DB85262A15DA18F715E941FA2327A880A3C03EF571B01ACFA20DC31BEEE48DC36C3255410678DC09327FC6D05F277B361DEDEBC209D7821D16D7BB27DC423D9A0B4AC0685442553AC89EB2E965112E56D2E0B2A87C6FB2CD96DD2FE37CF6AF2DA84766CFDFA8B3906F22F8BA1FE628EA10EF6406380A2C4AB307C408FD12E292B09BC88F91189A516F449B08C8A1F9BA8CD1CA5B83273ACEFF0B74AC9A7D1751FCDF1DC44241B09CF01FD578B7136DE123C2EFABB05B61C6149B5FA501D911974748135BE77CF20B67742B06915AE5FB72BB86F4C81353EBE6FD467735C57C50794205C8D5BD2FD6711D7EB0B4EA4F002EB429058DCBEC14B401BF9B86843A30E11930D1277692945308ED01C2EB09A7EF3DDA03E87C516165BB7D84C42B01A2C373ED992FD7AD36218494BA99B1536A7FEF35C3B5D58C86121DB2FE461EBD77DDD4EB55EC3AA08ABC26255D4F61DA7250159B10CD6035C6D9CC530FC807CB9A9528ED0289A4FE638AEB38738E1FAD17EB33970D6163BFEC0D97E35C7F4392ACAB7CB32FE86A784C5C696D830FCBB245BFE2E327CF7D9629CCD2D8A70B4A6BE071116445827C2FA6B37273126BB6C341065F2AAE389B3B779F4102F45A1D67EB7C37699AE93B87812D175051662855CF5BDAFDD1018A1427D37C7469C2A8A129F7744845C511006411830FA4C1D47DF59A721D51DF51AB8EA38C2A04DC2CECCAE2431BB1C0BE9318FA5FD1616565858DDC21AB0A81C17D4948B69BF77D65BB48A73B42C7FCD137E27A40AC2720DCB55D807DB343583764338C990C59E284330CE62AE5BE371F45FEDF6586887A4BF876517965DB7EC062D37E76536EDF2DAEFBDF2734CC2A233E7CFEA8BC5B22A8ACABD845B55DD570BDF98B8D826D1F3D7BC727E66FC62989220428208E94448F306DC4982802FDC0D0488A4DE3E1F5C877BCF5DDD70A3B8B11DC5DB35E26D53D4675B5FB26A126087B2AEC8E2E2E2FB36CE2BEF387141F2655636BE355A7DDD952252AEC8E6C6B28CBF71C8DA6FE1DA20C8D931E56C95BAD15DD4E2EAAED216AC3A8EC005058B83481928306F3F730C463ED8B0D6DB5DF994E5F1DF45EEA24BC2220F8BBC77FA19EAB637C05F6F6247BDFD3E965D2D7917FEFA8B3986C5F3E621E3EC9FED372B2902A81BFDD7390F77640155CF25FA388FFCFAE28A83AC0BB2AE93756CB659277147A3701079EAEAE3883DBF3EC5EF761CD3541F2C84144A7811557D090B352C54CA48AC09896D642BA67038998C95F5C73A8834CF8DC5C3085560A1A4EC360FFCE6DB7E9BD292242E08DB957017F38EAAF5170B2BCA4674946ABFCD254DA990AB3C42AEC80EA7AC977C991D5666F712F0B2A5363C2FA1005360834F367AB6C406A37CE47CD9E456BD6857F022BDFD66B13EB3E58E4841F1F1205B628F1192407C998D9FC732DE92B886E427EFE9C11439E084BCD0854297BE0AEE634C898534CFAA580D8C30CFC0F00D721C417B3A7AED894B34E466D6A171B8D876D4F5C7D19EDA78DA783892D75D6D919D9947B4EF58DD33EDCF039927ACD3725B45FDC91CC76F31FAE306E59BB8288498137C99C5A932AAC24B2CCA28072ECEC4523B99298ACC79BC1DFC99D682143F2D294E70FB90E4951637509AC338C633D90F93BEFB6CCE0EABF8E8573193D3DE69FD52181C56AEB2F6386B9634C96368BF85B511D606B336062C0AC7D5106E9BC3F23A89E58569BF8ACBF751BE72D51C3B042E2AA3A2F2480BCECB5DC7CF5982B53851EFA4BF5B588E0707630BBB6958EE66CB3D22B18A9728DE96E436E6D32ECAA3142FCA3634BE9B085022758AF5648770249788C1179A37575F38431AF960E57C8E96841D2320D8AA50682170FA5C8280ECE10B9DF0FE16253B39E2A6D4C221A48CCA1D675C6BBF591CCE51828FF3F93370D1CC9458F008E65431A65FFDCDEA1288F03A7003D47E0E423C0871AD10F72CBE3D0AEEC3D2EEF6C10FA5231D4F10A620888520163AB130540E0C59F893AFF47D88FA5FDFADBE822E5C5FD9E3F901C2F3833D9E1F213C3F4E7D03FC76B5CA117F1DDA7D0C722BC8AD3E24529B6DC7496A35B55D0223C96A8EA49B78F0CB0A5189C3CAB28FD5DD5EC9F7E7EF61D1BB457CEEF1BC4D708DA44178F5D1F69050C38BE7B9DC07D9D503F9AAF8BA45299E4AD00A259606091424502F819EC826DBB29EABD86190B8C81A0D827104CC38CEEDFE9DF029EF0FE80E29281766F84E6D695F93A76F03573683C3F5F9DDD4EB7A9CA753FE1F24556FC300A582FE6ED33F0857FFD5AE5F633D121BE309D67043D1972A485494F0334B7F9FDACD3F48E8A397D0C30F7CC38E78331CEAF6E518D6266C958A231060CE639E0FF394E459BAD3A3F490CE35483B9774AEC3859E17F3D67C762D3F026C8C9803BEDFF05F9274D83CAEEE63100E4138F4419D30573847AFAB58CA258E135C6F246BD360A7153F3E7680E39FB5B79F0F5DA4364C6BECD68E86EB8F718AABC451F25714090E3A4261104441103182E87990B73585C155264DEB47ED43222C62DEDDA7FE6271361118778E13922F95C5AB2340386905196623C3981DCE518A31381CE498A6FE38924C1279C429E4C8650AF061F7D11C4F357E0649FDC586F342C091B0F64DAD2CDB6D122FAB7B0BF7A0FF2C1217EB8A06C138CB1F3705458DA23EDBBC1028F93B9CE6938D91B958E6F1B614422C31055647C848384246568C3C6B6A83207E8E5FFCECCAAC4A843DCC699847E32282B42846BAE1F29485E498123FDDA27297A7405AD7EEB34DBFA235029669FFD9A25F991029340BB7F441A4B12E9271E96C99FE947D43799AE591539E0165ED71A417F9778FE3DD10E389689FA13E5B285323E43509E7B420554CA54AC5B3EE099B6A9677F1B596D51C4FA00C73CE0B8BE1E817C3E5669B64CFC8F9FEB7A9EE72DD22AD3ACE72F8257BE011349FCC71506A81107C802D32C7F9EFBB28891F1B930D8F5528B4E82B4A8164A5FD570BAFDA288FCB28A92FBC798442E1F1683C434F81FB1374DC470875BF9EDA443C7F7D7C17E725375B4C81C5FDC316912B8FF8EF9168F3E3CB2CD6501EAD7655AD9B24E2FD24844217BCE21D055F66E3F98A7FC5285DF277B14C8105E7E5E85B9CED0AFCF96F68597248C5520B737194AE77D19AEF27F5D962D449BC89D38A60EF49DE167EEC62B1136EE0468A2F34C74B3D1E839EC001C576B849B0211962BACC0EEBBB3C4A974FA25AC99759C858AC0C7032B6FA6271DBEF299846384106A5D95869C67AA3A3BE8C6B3AA8CA60AD53B44205CB5158F715A679D67DA3EA9093ABFB919945E2200D7408C6110C4DAB3C12EAB3CD71A43EFA0BDE7ED4F7B084C3121E6F090F5BBBEE8B76AAD53A86A1AA4E6224DC00755F8F45C9D84757461223953C2EE3DDA2DAAF7698EE32110FF966E35F8595ADBB2C41B9F87E842F9BFE3017D4C4B0C7549866CB3C97A26189439D73CC8573621000410074986655323FE5D96E3B4CD3AC50B8AB9B92EAFB7F4224FF0EF35D58ECF0AF6F719101B988F8B2B078C3E2E517EF2FD9037905396CF93648DC17B014C1FE2F611FFE163F67BB5C7C9DDA7F35C7F4151F7AC93107C628965A607E7CFC103D4BF07265B65835BD96C004AD2608C65182D1AFDD2307D5959D42D1C3154FF158338A552F2CDC635FB85510854FBB7815551E404EEB97C1E11A5C435E7F9CD5BC0F997086875D0C2BF4B456E8F010382CA6A1AB75DA903855D3624C1BEAB3C57D82C750300C49C0303574A139DE2ADE8F2824A8CF41520449D14B8AEF25D6F3A2C4C34B6F08958BAC3042339ABDE25B0CBC72A0BF5BB05421626ABFD961F920848BE8BF86E51C96739F2902EFACCD76E49A27A2C7E0922542557BA40DDEC35B949BA828FEC8726E82FBAF16D704D7775CAC86FA8B0DB72D169F794EAB3E053B5C9019635C5044CE4965485597CB08B0DA295AE0EED0F712EA1DFDDD0E1BD83BA660163112A535E373CBBEFF6C21629FB23F080789B614B62408B920E47A2187D215FE551DAC871D73004C2E22D004CB3812D1CFB1E4326404086BCFF4A2AF4065AB4C0F4D412DA272BA043441B3CFCB6FF855C4FB2C7D8CF30DCF40D4E7B088C322EE339CA1CD367177606AABBBE43693561D67812ED0120A9D427D3E9AD30709830B1E3FE8024B7CF001842909E7A331CF4741189F8C306E64D24099DC6019209AA5184ED1A6138CAF61258BC56F8B225BC655741FE080549D40EEDF3F913FBA24DBF0010806154F38E0A1060B8615472C18E3FD5D94AF1174B6325ACF1C3268791382757D71EEE622DBE5A00399B3D851F60B9F8E563199C3B3ABE2CB2E49DE9C3F4649C1AF4EDDE05F5F80DC60CF30D724297B95F8F211E5859261785030BF7B5B6EC1362CDE81F3D122F5C82F5CFF86B1F538FC221FB59E515AB1831B2AA33845390FD2C9B5E64BF7BB683F104E88D6E83A5BA1A4E8EB2D964F6813558428B6D1B2B1307C8CF382BC5A8F1EA202D520E767AD7B043E243D1725DAD49CB7F88FA47943DA015C4769FC88875A05D17F73FEC3CB573F9C9FBD4DE2A820E7ABE4F1FCECFB26498B9F96BBA2CC36519A666535F437E74F65B9FDE9E2A2A85A2C5E6CE2659E15D963F962996D2EA255768171FD78F1EAD5055A6D2EF8EA0D5A232C2FFFB9C552142BC64B8D52AA587F30969B5EFF1B12D8A0658F5BF47826E3A4D7177CC5D7003792D6DF9CC784A8D50AFE84F09C931DF2262A89DF0C865AA1AA9FE76784E1A28704754C77A1445F1B90EA06D26F518EC5577E7E761D7DFF8CD275F984A7EBCF2FAD91927FBD23ADFDD8285258D66F3382F73E80EEB8DE2751517421558760EAB263D6285668196FA2842C1EFC5751AD82577FC1D38E05152EFEC11AFF4D94379135A83EF24BE5A7AB7485BEBF39FF5F55A59FCEAEFEE77D5BEF4F67D52BE79FCE5E9EFD6FBAF13217130C0A54A212DCD9B5DED794B56F364DB4C6DC1018FF5DC6843DDD70119DD49CB14DA8C4A8CEF24E5AA0F2DF474A89AE113FC43A56A7556713798A37BA126F50472256870A2BCABBD86EE57415C3C239F685F33E2A9E6294B7B2F248564E332A873DA3AD388CF3E7DEB3C2CA0F2BDF70E5CFB4E20D7831AC81B006465E03C47BE248B6BC518ECB8D3BBC67AC6DE609BF7CD2FBDC7BEEEEE7A828AB1B986A5A062EE5ABE25D922D7FB7E16660A8D4A322CB13795773D0993CC8B6FD976DED541F917C6B6F6847B03476B7B5BE8507798B58A55B1B729227A1470A4CC0C188C2CA3D80954BB4922A07ED71ACDCD645D56EA7AA6B0D52C1090DED1BAE6B05DDFFD857D911ADB003DD1B6FD12ACED1B2AC927F7BC61D96E0012CC176A3BBCE56BBA3598CF560ECF79DB6DEA09DA7A5A8DB7E1BB6BED3587747B5DE0E74F3FB1CA7BFFBDFF58AA2F22AF1CD8C6CACFA70FC3C6AE950B9D81D897098EDEC398A4BDCD58D779464A86FD7A8B72AB598FFCB26FAFE5FED6DF0C4E1AB62208EEA76782EBF6FE39CCA673B50547CCED66BB4FABA2B7DACE9F6314630DF07293CB614C68C7B2482189209060CDF541B248AC7909AB79FFD0BF7E2EDAE7CCAF2F8EFC32E07C3EA3E80D57D64FE76077A06BB5AF67EF7BEB866F1BC79C8ACEC9966BC385CEDF0758823EBA27A05D131719056C72DADDA07896202A0839558B3BBE8BEDBF5CE44BEDFEB2C50928C863CACD80358B18A37B947E4E27B97350F605D0E165DD52147E92FBBCDC3409328602872B2BD7859907771EF455A23A0C4C67FB7F7C1DED00E4BFE45D1DC429CA4BC76F633672A0FEE863B2DD8DA833BC2280B63CDFC5DE64C76AAEA40E1E34E72BAEEC04E4C426E0F36CF68570CB36B7CC8963B125D85601822705B3CC345F72D26EE968429203F7D6B071DF271BCE5FBBEF7DCEB0BF7978C04FBF3B1A7055D733E5D13E2993EDA88A54F6557D35CD932B7A555A1428E2BA246331AD282F303B6BAF2A0EDC556B08DF3A8C884C1EDA5A4D9B6F5840F52BEFBFA5B8CFEB841F9262E0A3F813F1665946BEF36CD263C2BD5C3FDF34BEBE18EE594E2C3261A36980330663002BE52FF8E43C88F225DF7E9A620ACAE03585DEFA2F4F77995A7F10D85648CF68DD6B5823BF429AC8023DA520EF0223E2C9303582698B0ABB87C1FE5AB63592C8C05506AA832C2F57396E04D62148D6EA8C1336C7E61552B567544F2182D51BC2DC9EDCDA75D9447295E6850AEF5835DE9F425ABCB12BAB9FA32A4FAE5F72D5A12CE18394E6B75E11F550915860A0D0A5595007E3C5F152C8176C590AEE2B581CFBBF9B38F254C56834BD440526B58AC827A09BA98D69B8A41549FAAA83E12213DFC42761F5D60BA59B25FDA54D5B0B88F7D711FDB6A1EAA728D7294AA6F095F8D84F787712E357FF48D76944BCDB7AB558EFC5FF205D97500B20B4C1975B092CB9FFB5208417CB26B07A0A098DBCBF294C92318C397AA0E0ADEDEB5F74680A3BD1A9CDD877CA8A566641FFB49FC8BAF8AAF5B94C6E99AB39005979EC3927AE672864D4279ACC205F6351FF6CCC7931B3CE5F6E176391474949359ADD56BC2A35FAC7BF38A6A2F5E1655AFD3C6552DEEB2911B98F039DA24CD403631A74DE44BC53E5122BEFD7142073BDF87173FC7BA1FCC7F2EDCBB548BE30AB236EDEC1442661A49E6CDC6E61C0140FBFEFF30CC0741601E80C0DC1B7B9AF7778AE32B707B105F610FA20D5419C7ED9B6FAA050973EC12A69AE823112A5E386DB85FE1B87E8FFE34A0DA78EEC97AFE314E318A384AFE8A22079725AE7A903B2721778ECA577C6477E778985BD4819CCA665457E676BA0807C22036B56293D9278F44708251481C0E3A025758E3A888AA1363934553080BF20016E4DBED36899795683E9EA40B782404BB34158BE17B88D2D3DDCE07542CF3785BC662D475D788A7919F13D46164880882E41004C9AECCAAA4DFC7E5143D63FE96D34CA5758BCA5D9E02A9719DB0FD5A446BE4634D56599307EC2641861D800CFB947DC3D22223A2E348C417F9F710E3E21083848B21A5AB38CC7DD55BC698708A3A09C1D1B0DD11098DA0C49F221F5F6EB649F68C8E65F7FB257BB0DF42AA4A83B60F4A8D70087E40571ED48D7FDF4549FCD8187786D942F09C88795B2D715C47795C46497D3F3D0CD5C16A35231CE84C02808F12FFDB5A70E9E39FFF937DCA05A943F740C4640BF8FAF82ECECBA7C1DBD5628BC89547FCF70832010EDD0F3EE5D16A5761BE49A2A51583D9A1876E1786622711C2F218A54BF1FE7570B4871C7D8BB35D813FFF0D2D4BEFF83F47E97A17ADFD77FC328937715A91FC3DC91E3366033E341DEA511CFCDE6F687F49032406D478D8DFE551BA7CB2D57B8DDE75547A8B5F9C23851C09A7D513D1F2B1867B240AFE812A82C1BE1456ACD58A6D7418723C3F9ED3793328FB23725771D8CB82C6D6E1E0ADD7D51CD481B07A4F6BF51EC9B2DD13EB569D1CC9E186A8A937383FDC01EA1DFEF2A501DE8ACE4167C97B352F88EEB2C168B010889EEFB204E5F48312A797D1E31CD282EA18369F0A855D12B923D97B0E54EE86451B16ADD5A26D34C64F79B6DB1EC9D29DF9B407D9769D3C0A173BFCEB5B5C6460D2A310FBE7C897E42FD9C3EDF1B807CEBC2867F2CFF839DBE5A3BE27FD8A0FB9E440327E438F8F1FA2E7899A996C5441CD3911997A8BD6C71312E840CF26FB62CE0BEB75FFD76B15A6E0D32E5E55C6B1E358B690539E636C514FC70182628895202CA5435B4A471547A61AD9D0702F3307336166C7319C4B5F7D5057AAB03C41249C8248F84E565E941CE12B6AFCF35B2CBE20303334343507AD22F246D9BEF1BA9679BA21B85DA3700D61191FCB32BEC65B79B30B1DC9EAD53FDC703978DE4445F14796AFBC235E5CDFF90F7270552C169FCDB92518B54E76FDDF44B3E58A0926ADFA008DBE9770B7DDB65D824FD2D719A3AB4569CDC343902C9EB23F08BFD2B68B20988E5530A17415A7EBEA707A5CC78B31B47B733B41884E1F969C64C9DDA20295ADA21BD69C9735E7CD60FF3E4B1FE37C3330BB715886FBBF0CEFD0669BCCE7B563AB94A12510B1C3607175152779DBF072CF947E12AE75A4C34A853B9C56E63EAD04597B40B2B611468721720FD4D0116C8AC7B9A8DE1645B68CAB6D9EBD0F6FAFB70B6E595DA6AB3312A1B6036CFBB040C9E38BEEDBF52E296312EF1DB7F9E6FCE58B17AF844109980806136CFF20A0C20B1AE5E474112558D52ECA3CC24B535CFD71BA8CB751C2F59F8333941384A41D46BEE403DA92306669090CD0A4B99B286F5E9C8A8D76B839B1A5A3C1EB0B6AAE8D586081CA324ED7F7F015931323187141D52A84AD2B3A1A7EA8C763D222E5A6320B4FBC8F8AA718E56D069DA998826B964127941D3A5BF0033A20BE98981F203E389AF93FA87967793646727DC162EAF65B22D84CD30C12A1A9331B6710C36BE74C25E5860E809EBFFEA395FE485A64F0D41F46997C7860E3CC7E350C237D91727A9B6DCE499FEFABE415B279A2335B54F3547F305FFB6D33C26443883C4DB838A2F126DBB82D0238FF648BFC69BB28F76DB28D57DC9493DDDE7FCD3AD9D7D96A87A7BCFE9F74D29B627AC6DA4FF6130F20E38B466102688CE3B281458B35E8BEB003CCC7AE8B789F99C26AC54ECF166D95D918A34A4336ADDA5735C9206ABE1CBCE2578FE32034BFAAAB9FB3F53DD067FBB9D24E37C91C2A60A93E8E32E9E613E163C685B4A892B6BA4C8133AEF47175BF6997F6545A9F3937CDAAF2B5A69D71A7D8C21C04EE037B3DD3C34D4453CC736BCB6FFFD05EF9C1463789B5CDE0AE67C2DB3E2B139A9FEB1D336B5DD3AFD9B8E0F2FBF2294AD788C4D9B987A9340607D0CD32C8D88283E705663807C11075184FCE0DA07A162E650ABA4605C97087586AB14BD095E568C76214A1EB53EC1DCCC04C1AA43A381BD750A979B477818E93AAE213AA790621F37D2CADC27EC606B2083DAAFD563172B48A4B9251E99EF459CA1155213F6F5672A26B88E527EAF32812421CD538334E0DC4A435D2AD19CF0FE405CA12C5DB92045CFFB48BF2282DB3BC8E3D732F0E62C83CAA8F18AA8E70270F35E838DB8BDDA40E3E93288768A49B60147BC756F7DD5F52AEEA21E839A7BE0EE729236E1A898F240498968D8CDAEEA0F78E8B1AE1D414299C583C4EFF41CBAE216C30BF246BAAEF85BA3CAE66E4A0191F986E64AB0DCFAA1C354F73E73823B5AF82190F9CF6DBF8E7E72958017CF82C696A4F3C28DBC33B166145543D649AD00A27ED03649687A00EDE3E271FDB6118EBA44C04C7007092061372903FA38C8D28989587E6E39D2742A2D6407D2FDD468729134AE6617AC0720C57349A8632A57F3F3B26535D65EE8DEA3A4BD173C72644E39E6E8362DAE6FC0A999283DF88D8F1983448CFC49E30C7449B8E23571CE4E662CF177BC20B77591013FBC00EFD3CEC8BA6A118C3F0391D45DFF027397C2DE731958ED98D23AA3E8F369DB31A4A7C4DD22896126EF9CECE1ED51AAA8E5918B5DC5BCD621A350CC134288AA2BE649C1768132B1BDD704C1A6CE7643E77E4590C673243C77119C70ECE1C3683016C3E4E98502ED83242D3B5794F22AD1CAB4C1633DCB7CCBB6B4C7EF762BF7750F3B2479C32A50DC39E3B0ED78661C51A7BC20F7759901BFBC71CDDACEC0D97789419E128E2CE1673AB1DDD8B2AB28F189E52FDDA40E7131B53DB40AD358DD90F271D7704CED81FCED81FAEB8CB025FEC0F5FECC3AD49CB19E4D5B249803DCF5E617386D89BDE03CC2EC6DEDCBC7149F2FA343EEB1385DEA49A641FECD2DF0F3D04273D1893E6E63E88D07C30E1E3EDD95861D2A7DB96BCB05742A1FA5BCA0975A9307587C103C0D0F683012EDB1C6DB3CCFEC7388DF0B8A2E4AF28CAABF957290B0C3433815C892547E899CA1317B0DD9C8A1BCC4E9B74D7E68EE24F5F898D2E14346EE093BD20984C4438FA7CCF2B29DA8767D4FD0B35002F193F0E8149A64FF860CB26FB7041D6324B67740FACB28FAC32FF9DC8DB5D997DCED671DABA048D1E11926F91E50DA1F0B023440AE331E38A3923457ECABEA13CCDF22AB218E14D85F2D1963347D3F69B394B504DB2B11EE8EFE39C4CA1018EC30AF4608C0EA675D7E63B976EB649F68CD0BDB4E3C36650792869DA66F5DAEEE338F1382CE767E8C1A41D8D495B54DFE6E7875FB207291F90327ACEAADFFB3DEFC270F660BE719F669B67DC9BBFA16549FA4B661BEEB7EB9CA9269F6D988F35CE148D73FCB499A181DCC00DC8E8F4D9746F6EC6B8AF7D8D34BE55805395032F404C30AA07D584736FA60454BD9A7DCA675001A6E7808915001B36D887FDBFE9EFA73CDB6DEFC1CEBBCD9E0113546D42B89A82B1524718CF8F1F56A84763D25E53616E5EC06A4A15807A448D906D09E281AEE890B5436E2C07A223B6F33FAD34988D17A6970836FCB02732A13D374CCB13B31D1AA6E7099B33C3DC3C718BD6E4067306F5B16E9973DD5F8F77D730B1F2D88CE55074C7EAE6F4D32E5E45E912CDE000C7362DDE96F3E5877E1D050DCAA4D9B96FA3203E61BEA9DD203A28E9041F26E72848B05FFCC3D49B31394E89255E9430F79A375E931CAA93E488CD73C972208083CF7F080ECB504B99371D22C830C313A9691E05EE139F4C9562CD994766CDAD77831B88D37525DD5AF618DD2B0F6894154D50F961FBE5414332DE76F68A3BC6CDC2B83FAC3195DC70E58C59C5C62D2A50791315C51F19497D300567404D72876008E0A079031CD2DE33C71DDA6C13623C5D20C05F9076B96B005B38C6F98E2FB38880D45405F18DE576C7757702E6E84664D256D3AF8978020B334C5C5C071FAF5294776E5F2BF431CE8BF24354460F51211E7949AD052AD923FBF9595D00194B16CB27B4893A502C47F1A4470F8C9145E013B015FCA1AE2E6BAC03D0B7D9816A9A16DEAE0A6D0B106DE3D4D3B9BA6901D2AC6D799B545B5D6664A6296D13B58417F0D79F5BE4CDBE5063AE7F68D0F6075701755F04A2EF8B0D7A4E1699A4F77591740475B1A609097A056A23B46DFBD7D96AA7EC7F0BD036D5FEE6C6D17ED6342B6D4ED38C21FAC6135BC0DE7C07C9D59499602679EE25C8AB2239FEAA58B7D214CBDB605D9B2E68364FB1D0145B2C6D8E05D3CE3A139501987CA65C264F38301D39D93056224DD9F2AE512E2E56435DF6AB4DD375E66075F3358C4517EA0A9A6E30C92D840E30A56DD34DD6AEBA4506C2A02D49230AEC7A4A52F933451252851DEDE83C9C0DE1A84FDACD4E9D910ED803D51554DDD25475ECAA45279DBAA7ED98AA27664D9BB7D59DDEC4FDB12D9109930EC04CFF815E6CC934220856A3234155741DE322858BBDE100A45DE0E04C84B9A259AE5C29CC8D1B55D31DA4F45D8EA26297F75B960D718DA65B35CF72A5DFA61B8DC554DCA4EBEF8AC61A0813FC52E1C694EADA32145BDC237DA14DAE5CD12A07A99BD02D39C9570750588BE301DA96AB1FED0C7230BA3685977C62AB0208A8438A603A214CBB8C8862982EED075A8FAC17C334944E18B52FDE4429D49648DBE92074CCDA3DA81039B52B6A5BF9F9B667CFAE50D340E59729E0AEBE0268ABEFFA2328E37F051D441980B69DDE35AC3B91327066EDCA1BD4B664A8E34A155B79036DB9D9101AF766D9389A62CD601A28B3163B074A599B1D80A6D50E4EABC4ACE1FDA52D90AE9C16C044CAF7EE1FB09CEFCB7592BE87B46957BDCBF050A67D30DC75E06B64E0EC0B8181121906D5A94EB8AFF2031953DAD9416A979B4667A22174DC1C81DA59FDB9E3DCEA57CBB691812206DEAB89AD40508A3905E1B5CB06BAC601161104061BCE40509D66DADD17886A6957D4E9A4FD8D43A393761F0C9BE9AE39A4AD7510DA463B48AE6DCA582F68C4ADCF62717E4681B10A710FC3DF2000AE8DDD40A59678A81E69CEA42E73F38001CD07DAD8E63B1F4DF97079C81107CD5C3DD0D5653709F6C3E7EE0754E39781FA2780E402A4AAAFBBD0702681C1D0C71F3234548F43648947E2AE29062B027BE9FE8C334DC47FEF16090C9D0590779BBF6BAAFA2BBB4602FC1DA85AE0DD96DBD0480BF7F575103CB41E40DE41FA02AAEA2074BF240C49A825BDF01A30B49A548AA141FE17B6B49F6568F57DD77D7BED251F220B28EF387BF156751BBE5303870BD4D65CFC0D1E7A4F54EDE03B504FF3361B09AAAB42A53CE220C61048CC1D6A550DBE21751C1E3E303501B664C3EB21067752AC4319FFFA6A9031CF75F66432892AF52990C69BAD76D7970D8829F739A491359F565B6DFF501D68E4C08AEE83AA8B44677155151D064EDFD8F721B78141C380630C187245A86A2BBD0B1CE69CBE3A6F75F6FA0A1D987329B08204B20BFF9A16BA9B7B392E391E0F64A1EEF755671D08CC7BF7191C80E3428541E590E0C015DDCDF37DED8B00F00207A2EEB2D057F53C0BAE0D3595E4DE0A2E325CE563705FB70289767D358F03E3A4BF890B46B329587950F823DF3DE5A1604E3DAA967CF882F7443552A9478411E98C88363EB735450E0CD7D69C68E87BCB8FB42496892C01C6A7CC9A4630B7EF44147B120F32EE7EC4DD2ED45610C9FD80B3A20D84BD57696906B5C650D9B4EE50B4BA6EE0F1E2935CDD94D8504BF25AC66DF6F78D548C67D73DB34A011AC9A1BD4A049648A0175B4D19B55F9A3D391897B37B3AB522440E05F4180B0B74AB6BEC742A4FB9A164502C1A18D0FF42996BE87DAA3CFDE829D8C39E7D6E9573E8B5528185F73EA0D96443AB50F088E5AA070739C23026D441DA4171993C15C357E5FCF42715F847233D0749DF8138186E0D55AEC9942C99AEE0573B30549DA65196A619329BFE9CCA5223DD0040E0714F1BD331BE38429D3600021FF2DA6747D525A3D113A0073D4E6EE892D29B90E21838A1BBEB21ACADDF0755E0A36988D312C28208C7490021B3B98A04EA34E8874B042E89B78A04AA7CDF7EED4F13F9875D02D9AAA11B535D526BD76B5EF6B6547CAC555F962A9E5F0D1BB2F296589BC0D9D725F1E4C3BEAC9F23A9C77C094504E3BB2D76780F860AE7DB05866B909897E93EF8B6AF1A80F2AD9E0BD9DCFDBAC5B4B272CF6E4D0ADAC1F3AD310D8F62136EEF86643954156EFD466957BD88BA390903E70B5590C520C1E8E11205CE8D0951C3208B267BE27770E193BDA8AD09A07B246B3F7C28112430766DBE48762B64DFCAD63B21FC0696750D10DFF4D6CE018A77BA0E1B2194F310DA0BB5B91187769E15AFDCE3DF5AC2CA5EF60E1876F5AC57315C201B0AD54DEA0971D543E091F0A4C39265B203466894F4CEBDF34C4DF85DF4A2F15156BD747626419BB34D3E7230AB1B60CF010C3926838546E971789AE5AA4D63E675B54E3264360D977CCC8A745DAE9D86EA312FD5E9CAF0EB73E761D319A7E48396E6A51A24AEE027F2F460658FDE070F573FCFCA544C3E677ACAE1F3B984F4827BF4E14F22B581B439E065A43AB98E57A1C6C669682CD860000647F383243B8CCC1061924CC69FE1098EE3D01F74351119FC9084F9664A18B692E130E503DC475229B37D804F3C8CD383F012C0F155992A02474D1993801A9E48237BD2649804831998FDFBA6B948214FE1006D2A5260BF2630453C919AB9A0F2514821630AB3DC060379621E32C8A3F3837BAD0CD8272154515D9A2D170218EE0CC3C7A2873C6194F1EA59E3161CAEA53673A9C3AF8078400416C37E7D51D7EF42AD7765AF2FEA3831CD07FCB3C4AAD09A3C6A4649517D7D7D714BE2F56C50FDEB032AE2758FE235C699D643E991B63057E963D60699E77AD482B4C5AD1702DE14575119BDCDCBF8315A96B878898AA20A6EF25B94EC2ABBC3035A5DA55F77E57657E221A3CD43C2481912A95ED5FEEB0BA1CFAFBF6E2BBBAD8F21E06EE20DBE445FD377BB385975FDFE182505376932142404FE2784BFD7735912E574FDDC61FA92A586881AF27591FB5BDE29BEA68BE81B72E91B5EC39FD13A5A3EF71BBF0C897E2258B2BFFE1047EB3CDA140D8EBE3EFE897978B5F9FE2FFF1F5C1ACBE0CC460500, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901210931313_init', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB72E4B892D8BB23FC0F0A3DD91B675BDD333EEBDD89EEDD50ABD53D3DDB171D4933F679AAA0AAA012CFB0C85A92D5D33A0E7F991FFC49FE0503BCE292B81224EB8298881E15914824128944229148FCBFFFF37F5FFFDBF74D72F60DE5459CA56FCE5FBD78797E86D265B68AD3F59BF35DF9F88FFF7CFE6FFFFA9FFFD3EBEBD5E6FBD96F2DDC8F040ED74C8B37E74F65B9FDE9E2A2583EA14D54BCD8C4CB3C2BB2C7F2C532DB5C44ABECE287972FFFE5E2D5AB0B84519C635C6767AF6F7769196F50F503FFBCCAD225DA96BB28F99CAD505234DF71C95D85F5EC4BB441C5365AA237E7D7B7372FDE4565747E7699C4116EFF0E258FE767519A66655462EA7EFAB54077659EA5EBBB2DFE1025F7CF5B84E11EA3A4400DD53FF5E0A61D78F903E9C0455FB145B5DC1565B6B144F8EAC78623177C7527BE9E771CC33CBBC6BC2D9F49AF2BBEBD39BF5C2E33CCF0F333BEAD9FAE929CC0D55CAD79FFA281C602D0FEF9A7B3BEF84F9D10605921FFFDE9EC6A9794BB1CBD49D1AECCA3E44F6737BB87245EFE3B7ABECF7E47E99B749724348198445CC67CC09F6EF26C8BF2F2F9163D36647F7C777E76C1D6BBE02B76D5A83A758F3EA6E58F3F9C9F7DC18D470F09EAC69FEAFD5D99E5E8034A511E956875139525CAF1F07D5CA18A8342EB5C5B5798216D6B58E030C3CECF3E47DF3FA1745D3EBD39FFE1CF788EBC8FBFA355FBA5A1E0D734C6130C572AF31D022854B74AFE9DBE55D25ED72A9E70AD68D4DF2D91BD438F1196192CA7F9F35DBC6211535F2DD15E255151C48FF1B2994722B53C8465036FA324C28AAAC5FC0E2DE34D949C9FDDE4F8AF4681FEF3F9D9DD32222821E153E3BF89722C7982086B7ABDCB71ADE5B35EF235787244660156AD7D07F1DFF7F1C661246A5C6F9F3D08AABAA55FB72B39D546552720F263F10E2508B7D5B6F436CB12141908E097E85BBCAE849543D90874717E768B920AA0788AB7ACB42F7AA0F779B6B9CD92BE6257B6B8CB767925D39904E03ECAD7A8B426ED0E95640D5152D8C02CBA054AA09383E888E1A8E5C1DA4E99D27C1561E250DECCA518C154B350CF10D91210816E199C23E14A7A1574EAE873A7ABE9184C57DBEBF60F4850A54022AD52485BAA49EBEDC2964769112D2BCA95934C5A479C731250E91494C1DBCEC87A5D19AE2A24934FD425A684DD67B6DC96D410890601A59C86A1213EBFBEE8CD6B13A3BBD14CCEB677533F98E0605B32B3B4E19A9375DAA008F6D409DA537E8D1589B691D9344E6A8633240CF54C0BCE9B3441CDC0F3AFE6D26095E069AB163454D050BE3626BC8ED26D602C3726CA7D09B0EB127728029074AF22428EB36BF9B590D20C83C8772C1C1C44AFED4A60BA02D4D0EDFF4F4CF17FC9D2A065839675D2B226EE1489561DAA4DCDFC53AE7A5546B45C039B924FD49C92E21A4024927C97D255150E329EEB668DF425013D3125696A1DCF732275BD89E264FA663F670F71E2A3BBBAA3A0A2F823CB57D377F053549497CB32FE568DFCC005EB63F136C996BF3B68689E1F79F62D5E015BB0B0F81ECFE2DB0E32B85454DABE87E8D70AA640582CD852DB858BE080D75A8297940A4B17532058FE6CA9BDBF1CAF23303D5591404CFF55A0842A1AB4EDE887C4681D6DC1C35A0AB645FEBDCCA38778394F64C975BA4EE2E2698665275BC7E9556D570FD96EDDA2755C609E7B4015168F7D5B3CAC0C7BA2E62C8C7B021E94122C17C570DF37616F70A51CDB84D4D94E6AD3A986004CA7EA1FC892EB4BBDB9200C0D392935C3BD10168A2A2829695B276B39DDA2559CA365F96B3E833B24A8E44352C9445769B6B36A9D2CDDCE321ADB490B56DAC9500D56B0410FC202EAC1589BE766C3C79BE9DB24DCBA5CA37EAB08348DFFF4E2D125419895EC593A31AFBF6FE3BC920D2F6A16EFB4D768F57557BAA8BFCA338CAC3552F0E69EDE62A3F4E6D6DE47C89DCB96087637576CBB0DA8AAE319A070A2E2D245B31871547525B033B52FB6F5EB4A37275AAF2ECC9EE17B92B643360B32060F6B32D816ACF50F6179BCFD34831D505CEECAA72C8FFF3EFCDC302C1987B464346A7788660615A2A8B8DD22EC5C83AC437475F0DC404C5E52D794C79AA677CF9B87CC876748ABB4BD6C0DDEC5C536899EBFE695593868BD2C9A7BE6FDB40D6BC9E9AC25E2DD52FF375185C844ED9D5553EAAFBF2F9FA2748D6EF100C0A4D3108B5EC47BB2410061E70243B95C9CFD9CA578A522F7271FA517925BFC103CC070114CCE7200D696E9363D30A0DE94F28154DF6736748BD000E53C909C7601D2E55C4E17D6EC7EF1424AB7E482869359484F215BD390AE1BCC4378A9F4746BEEEDAE8F67F59DB905CB69321AF260771CA2DDE173D1E6D5987A697752628C1AB7BC43C6D43D312D6672930C0F1BFA8F1D2A6C533B7DD96D1E86EE823447797ECEB6BCA8A6BA528DC409C1E5868EF9F4AF863DAD435456171FA87C92C55A3223F1B1CBB53294E2FBCC57DFEFB3497AEEE9F034DA15C31DE3EFB2E56E83DA047E8D7E204B145BE088D587E6BAC54CDFC60459E4E57E99616B135DF0EA7BD70BEF688D7DC92A2FC2C8AB40B0538FC64E1DE0E690E63A90B8146C5C4CAADBD90CFA0503DD132D05124C6C39A4AD87835EA4C7F28A4999AEF0A0D9D0DFD8AF868CEFA0558C6F800C18DF42DA3BC6CCE585829511DD816848EEE1EC09369313371F9E5446A4DE3E73BACDE583829533DA4C367AB861A7BA095986ED72643375D85F27B6FF35F5E251F9A2875AEB9EECC199F20DA85BF1667DDA6E2A9E2A3FC6C8BDFB2D467FDCA07C1317645230DB0EBEC82D35F75D19E592B8565B21CB4A153FFEFCD2073FAE8AA24A497E30A7F3C1C43F24139FC9D10F1914F4BAB560A029834206241EAE49216D0DA1B751FABBCA76A3CAA16C4C40B160FD4030B6764F637EC0A796AD6D02D0C71509B4F1E5C3D2C2D1A3520FEE501387C00633076C6B1EDB64FF82AFC24271800B8524FC62D82A216C3BB5EB89939A63960C2305476AD02BC989693493834BC29D90B4E10435812FAB8B37115596998D71A8A5AF068289237F2B29AB0006F994EAE6EDD4D089E99F703B2028CE23529C94FE80CD282BEDA4DAAD32EACBF8B42F47ABB8BC8AF295C4C8EBCA05E2B822D1A0E3CA87ED563B64A6DBD4AE02F56750A5B03A63A23206C401586A9F9FB3046F28E7D91A0BF12DBD943845B80493F81435FB509D29B84A253AD594A60FBB288F52AC0D6ED112C5DBF21D2AA338916585CF570D1821B0AB5AD759D4BA964EBDAE05075EE0D0D719F8B685AA0187A542892F2C1FB0AAA14289DD14DFCDC72FC3105C7FDFA225D12423BFC44B3D03A85A407828F7567E8B92DD78DDB9C302B02B24BD680B6D7DC52889BFA1FCD9653D20CD0E4E285A4FDFB0169FD25A5C2F56D32C72E2B323E60BA3F9096285CFA54B5D55E35E3545B61D6BAB0D7CA6106EC3DFD21D166DB02D1F91F8FB71BDA71BE9A0F24F49E50FD8DAB8AB48CB0D0EAF59ADB77156BD5B50D5F43DEBA18D153F556590D21FA0E5835A1F7B2F368F3BAE8E6F7D3557C33F4C14C0FBE3E8ED4C13B07BB95AE56882F8D4B0241FD2924CAD1B76EBB2F3CA65BA1E038B9DD3CAD5DD51B1CA83D0D40A4B16D8D6349750C3ABBD27A89054514B1671D8BC7D2C8BD3B68DBFEFDDBCAA477045E80570554E0B2C7B1E5D51C33A98E089546C532628B9CE838ACC6721A463C08139A5765352CC40409C0701046EC350B61C36C8E8D6A2965F058521A41C1E9A86AE172C497275B5609B88B2A9F05AB8252573C372E597E239315BC024A8D85BD216FE604EE4BED3A9DCC8698426C934F3B1F8BA45295EBFB983D270EFEF14CC21751601A93900E5A3D343035E456D15FB6332797A01CFD693796FFC241FE0EC23BB5587A91C961AF1E00A4C47355E1ABC51726A51B1BF61577B4A6A5C770B9ADB1231E094CA934289BA4E0EEA7FBFC535C65590D2CFEEAF343D608187E74775D4D34CDDA0A685767CA6B1F49714B2CAF935EE5EE03E1BB98109937A4ED28CE6D0D2CF32FEA512E828512666F4D39436DD4FC8CC787AEBBE366120BBACB1E0327F250D05E75583417D6ED51C5DAC6A6ADDB3035AF098069691DBC36828A60087BDD168EDAEBCC773B7D8E5CF2F4ED74369FC6423BF87DB73B762F3D6D524ABF0344BFD24C7C5B2C4FC33E5860F0BF5212DD4CA0544E75935F2A58EEE3D75389453D1E8C527EA7C1AD754C4F2039C0585750E6C6B820DA8B7E71E3C21C20297074D7D529ABA1A72500102073B0D70AF056530822A9402BAE48C57B97E5BB72C05C7C65F08C4CB4085180B1DBC7D7270938E7450BA6E8080D24EC0D08342461AE9B05D90AA6A610D02DBF2A244813BCE15CF1DAF378F7B217B9ACD4D1D05E2310CE47D9C62347194FC1545E11ADE49ADA0A07AF6BD9E4AD4B87CE1B55AFF5537092900915EA1507C455980B07E65859E5A20890C44D50AF7082E0820900A430D5F12AD52B1F00B63C8BB32DB527417530F44F6AB66F5D53625C7E1FB03BDEC0D7D45EB04A7E2E92EB4DA550A08F5018AC5A7830118DBDDA9FA8963AA01F08563A05C49A5B3DF53BEE9B75CED55D4C9F7F7C6CB27B7F4DB2EA04CF5B084826DF97B17E83AF5A348EBB11EBC9ACDF4504458520E6949E9F60AFE7615BC4A54EF3DDC8E81B65BAC9A2A7A3F656B53BDC8540ADA106C0B73863435F840262E27885D7B878A651E6FEB63C0B1DB8ACA687CAFDC8D071D623954BFDE7E9ABED1B048ECDB2261AE7B776586B5449CDA25C2E0AB05FD0B2B4ED2BBC1BB7A2A03D4842F8DCDA1BC0A945FAE511FA53062341896C7F4D75CF5CEAB9F967E2DA23572D131C4DC0AEEA0E352CBEAE373AC2BE093164ED92E1A50EA9C058410A31660B061A9FFB26F58256679355C466B0755232C1B605BE4DFD37C0989B8BA86BBE5FDBD6E19DC28A7A88A1B31049531A5BD161D5CAF898162410D4330D62EEFCD36C99E91C4D7D3962E18ED4C79BE8172F1A81B02B27F39792D8D20A8CB64348AA5C0F3C902C8B02441ED789A5DFAADA1C31A06B645FE0D9E88A067957A362E65DE6A0735CB6B07952A768B7E6914A2A17E68C1838200DBFA257B186AE751233C14D55F7651123F36070AD47DF06A355DED96CD4DF14FE81B4AECE94429B64439ACF547FBF4D6511E97515207BB7228993227CBFF44771D7338D8B419017E18A5596D3A711F6BC5F5A68A109436F24F3E1A31CADEE0A525B2187F7D7C1BE7E5D360ABE26E8BC8E969FCF74873D0E567D5FE9047AB5DBDF626D1D287989BB6A7897BF0D31C79262E8F51BA54460C7A4AC49FA36F71B62BF0E7BFA165397E839FA274BD8BD61374ED3A8937715A0DDB55B42BA66DD1C5ECA532566953BEF92198B44892D14FD8DCDB3C4A974F9E36529A25B032D8466E64AA372682D3EE1437938C1BC9974F4C08085539CE4C29C53B1F358515004019FE2EA78814DA52D22F6500394D216980E0EF77BF3D651210612B2E831BB41DAFB864B413C79061130EB675B27BBE704414569B4191B666E72F2A4D2E3D6FA1D5BC936664D5ADA192642B057D09B6D5306970629266A887E209BAE794758F6FAB8D372D75D69DA59569426E072AA5B6F9A923B6051B14DBD45163A34083E604DBF278567395C468F8A5DB93357DF7EF8A1CA94426BC1744F7D96034586347783A2628A773A9385E119FC8E9153634C1A818148B512955D51ABD684184B5B92991ADC96DB1DF183767CB41E39CE20D0C5FFEC716AFC4FD08144BF939C4F9F821CF765B25472B08053F9972193759205B5EE21D304931A224B3815110CA41C848E5C18685103673C42C82B0020E0623D8D6C9DA6761250F2BF99095DCE45047BF964B9425BFD40FD957576B84DDE6BAAA121426D89627DFA426DEC0CFADC8BB1DFEF52D2EB27C92E682023B4005E6CF4695D8D1B0213B44A335A6A49D4E6B2A05AD36A656F3106DFE3396A251131F7EC5BB3A32B9C76FE8F1F15DF43C513393F52A58BBA7B858C882A9B8CD3D77102F96CA16091A6484832F7B2F86864E2FCB597DB1D27019AB81C3F205B675B25E0C9FE77D41211F9042D6F9C1AD6F7DF30A4F7131DC49D955895D3FECE2557DD8E794D6BCAD1EB4203CEBD437EC7CBDE63B812781A067EE5CF692F02E5BEE36981F3548D07147ACE3B40F4CB4FA80CE1DDDAB182E05B50A187E80425963F80B0F2CFA812A31BCF8A08CA0E99E60A0748AFBC30C3E1FCE6B077028B2EA550B03BD49C105E579C4CA53FBEE01A7DD64EF1FC060700E7F09ACD34303BD1E1F5FFB9B74065E2FDCB4FF77A2BEA2C421232C5435287DB02DFCF35BCC24047153AC245DAA80435FC553EEEBA0A38F5847B7220AEB3860AA2FFA1A947E53018ABA4D096DABAA89A49B535F436B282740665457908334F167ACD9BB85CF4801533582DE05DBD265A519C9137A1315C51F59BE9ABEE5BBCFF73364F1FE58DCDD7DB25645E130EF44961D731598AD7689A943B6060E8A0F6CEB640FA13EC5E9EFD3B77A551457497450777E829ADC3735A9B4CEEBA46080715BABC14503D0DBB3F477C184650A8785C16114A6C16F1834A86BA9CA3C49757D8FBE97DE3AAE6FCA5F3FC32AE46515BA89723C438866B0746B85E5EB38962F52B2E8A5808986638BC4FB295CB9ED9543BAD5619409017A12CA9D5758B233CED2FA7D28E3B5B6AF14565D89F201D48EB5026B193D141319A81037776A5A51AA7AFAD9BB80D40F570CAA201EC63A98B9C3614A650BADA4B5FE69427103694B77AD27F514D770525AAB7F345456FF7852EFD6AA3DA875B0AD93DD4C1DA0FD1F16AC7D5BB0CC15174A5798F22A16C5F229E13E6E104012B41A2C3850E8874B905FB0318F6DCA6AE3D76063489C7A8B6BFED52D299068184921BDC571404DF0611C3218237A870771DCA20295EDF1BF9D5684AA065D389A2E9CE482CA55963EC6F9C6614207A57BC04A57AAC1A0392EA8302910702F4E06394889DDA30D36EF8D935AB4E027A6ACBE54AFAA69C2B19017D7A0D98EF6E5F1ED68EFE332996D2F5F35BEDF27A323456E9B1D958ED4B8B738C028AD157B587B4F69ED6D542EB8FCB62BD5A203EA575DBE4C586C05002F6B6C4789D552DBD40A2B6E70FE86F0E953D676AD4280832BACF41D1F5E2155884EFA8EEC4A085EAB106FB6D289693B536748CD1C1F370B4304C2A9A98F763602BA839D7B8B16B2572020806035C1502E2E61E9A93ED7440F2BA5B5FDA9A3B683B333F5761B4AF135875DE4CBF9D9C7E27D12AD8B6E9CCCEE596384DDA11929F5A108B1E8AD509E3C6351A5A73B3B1E9F1179F9B8DB4F95689D91E3812A6DC39BF397C2F831F077BB07A1CA2B75959F518247BDBB04D954126341994A3CF88FE230D503A218242AFDC68021EAB0CC3340EFD0435C9A8E0ED6AD2B0AFA9503D31AC6572107F163BC6C9EB71F2EE32CC6799879591488245437E3E6A718EF3892B88C51612AEBB7E81B4A7714BC46CCC9BBF76941C1FFA886AF374B0DEC7F731FDE3B54960DDB7C8C2D856E2E3586970EDC966C688D78C326FE1AC0151AD13CFCB8CFA3B478242710868AE3899C33984AF9C7B4C0A6CD0699ABF377689B15F13075FE5B8CFEB841F9262E8AA12A894535CF10D5584C597E93C7DF2A3B16E6B71103EBD5E12ACA5783259C45350F033F4705DE53111A4CA5FCB7B888062D8E54B7C9048BAA2DB44F66B258E712CC7CF91415C894AB78222DB12AA8C299CD84B9DA345D6E54F6A0E570DC6126EF0A4FA350239B87F9B76889E26F684576391F761196873233D6E2782789EB6231CA6ED13647051995DA7B686ABDE05D2E6A5A97A0D02AFA9604917A17A5DF6E903C4E3718E54C760B6BB06BC7F761A075EF938F7BC1C08FA929F3BEEE86B1AEDE070ED733149E99F47B1D2367ACDEB3A2F24E99A9904B42D200957EBDDAD51BC428F9843551328CD51CB279F8FD73BC7EFACB2E4AF0DED7828F5889E215B5A9D7EEC2CD74F07B0C24779D005BCA413BCA0F28AD2E0C0C18A71AC55C5664626EB7A00D0DED22DF9FA33C2EA3C4831E6130CDC5BB3CB790E93B8C59CE3E61B18BBF65D8B05C99CAF1FF8857D91F14F800EF8890047CB8B5C1A19CC9DAD8E5394A97CF6F77CF160B405BEB0E25095D6D807711CE16EC95CB1DDE79ED786E97A35B6BA398AF61C4E5CBA2C89671C52496D16D86DC82A3F53A5D9DD587233C607F7A529F7B51399ECFCF3E6366C55BCC9EB87CC69D79F1429CF10ACCDD59B416F33F08686FD1232237EFE328B9CA88FB298AD3523CE68DD365BC8D124DDFB87A8607C484F95D0B7CC93BB4258B585A6A3A6FD2749D630026A06B873BBBD6F1E7F505252346A2D3F874BBB4CD9A61E6C01562D440EAC75CDB86B94089723A44A024744C275612669B104065969F45BA1A4F7DBBA868C54B020FC917076A2360B2562697300D2113889886E1072463A6B26520530EB234BB0CCD273B872C33ACF893A35FDD380B352CE448653FC9F1031265ADFB064996B4CB13CA98942D263434956793B6EA3AD74D9B6A5D26010C142455F5253373D5C42204C4A823C9C4D4771221908409C406E4A591354EBDF2309BACF4996D54430B24B86165A58EA0B3931731230E851442E8515084B6271214819126EDB681B6F30A49A512B4E3C95E3CF52424CC1D558D96F22D2474DB530A09CD489376DB4BEEB30849E5D1D22F3B2C18242615848D8C7028675979601A261016989F07B1F654A47FCAD68B7AC495C3DB8149250643580B4D8F15101A500E7D8A8BD0FA54E22230D3A4E1AAC2CCDA45B9FEF4201EB5CA0CCB8ED8F0646AE4A0169C76AFA6140A1AC862EBAC397D60B04E2B1D50D3136E8C6D25643EE9685D8CED1FDAC32A690D506E24BE10A5D4481B98FCF04ADBD729444AC70E235F4B53773639BBFEBE7C8AD235BA25F75E3BA9908900080DC9170D68B36AC10D403E3D6301761230251D13089792D107215857498C117147BD552C8354BFC86A800A8C06B63A8190B60249190D5C07628CB32AEA889A429FE9D86F4203556D36C97B1BA5BF73DD90CA1C000B491B0566696A410DE8046D242153903281782938BDDF865877F56141BA20D75E2C1CA8B33A102B85C52106A4A7226C24CD04B73E853E82196AD232819F715F4732132E51BC2D998B2ACD4BE6D5F0CB3766DABAF02E5055CDEE7C5E4F00A4BEA492ED6DDB684CD724BB49E36132B2D530FCDE89EBA2BFA3642B2C7D551B61F521A654CB80944A9B1A594845AA66945171704C88E92AED9D9C3673AE2972D5AC4DD1ACCAB5A5018C60319B33D3685B8ED0F9152E377A26043555F66293A2B42B7940CBED894A1E05D4D39A96B2E627DE8C1C9471D9A6BCD6ED6B39384868BA5CFDE602C3639D69232B216302B991B0D5C23332F7719378C15BEFF5D557551C4D89B51CE285554D4FEF1C36276A92A5D174700EC36D2CED4EABAFEC45A59DB54384D4EC4455D1381420086BE0D1A59423695621E5C666BF5D815522A8F66866415B5D52B9905601A59181B6D293F2762446DDC8D72CB4F44C21755AE69BDA7B732FDE9FB3143D771D215B20EDA22DAF02491E036D23788A66A65F98F5C44C20757AC69B1041D7DB13B1D32DC020B4B5B069165AB891C917572519930BD9212DA22CE5F799A522EB2B8CA8C6A846E656622229934B97C8721312FA5AFB62AFB1C2616849B1ACB0B6D974DB06556380E829E57B1CD30DA4697AE30D1C87BD5674AD52E60444E75BE3FAEDD771C72187949BA5383B30A41ACA3609AF3C9E1506B7608866EE49F0CB665D9F3558C9769B3B01363E3853AF9BA39F6D4F3C6B33FBD20EDE7B66E32F33F4907910A8D9ACF4799D5E03DD5C4D95790DF556EB55FB589DB34B5A436AAA1B2A55C356663A8ED2123495C5AE62BDA9CF612F3C5D4C478CDC0E500D6BA933713D800DCDE37E5091328BC81D9C1BA2A3FE3EB3D36D1DFC889AAD6F632FF49A40CEE4222630DDCC0DB15F1A8DA49FB7D1671DFCA89266AFC8FCA51ED0D032839839E8B1AED2FC1746892636DC622BEA78BF340A343170ABEDECE0D2F77A0AFF969E3107734ED4F5C556EE4696B93D93B7F965CD5DCEF647C6EE335B29E36B789733A181B9254DD6E329654DC69443393C6AFB4152469864BC84E1BDCB1A877EBE7497EAFE4E2969304B0E42AB5D93076F9A5B0CBA2D28000BA65EE8C1AC322F00D827CFCEAB206202815230D8A4F5B9379A34F9FA4C1E00F048D234671A0F0519130BD4419E27D11DA8FE3692A7EAEF9184A9C60D48524DDEF862C41030B10C318C3569BBAA309BF4BC8FD30877324AFE8AA2BC225E654081D090143180363614DC82A92C79B29B94DD9C409E944C30F238D008E67E88853E63552B285905C5632C8E47DFD29626D65A3A3A2610361DD3F75F87B5762075364AF546FF7494A49EC54B5226CF48C95A911BF056B23D44FC741C984E0A755C3275B7CE6DE7771BA3CC4520C15A9EC5116E631F8451D9FB094551C921330FD9EC62B82BB34FD93A4EBB033B651A6C181C143C0ED26AED855B99383DB69A8A29C44CC96C33F99A335DF687EC1BCAD32CAFB25F1229571876002C245514988D4041D8213F4643E438F2A4206202615230D8C889515799CF87B1D926D933420B5A02A4AE060018F4643470566E0C083794A64A2EA9BEFC190A4AA6706928986CD23C556D7EA9FA257BD04B1306F22E450427203D849E91A5866A794A69A19868D22C069F4D3A30357F43CB92904E28EFC65936A81278486658501BC9913502B9252482E9499234944C20541A861BF9259A3A730BD9A28E05D5C95603A6102907596A914A2354C71520AEF9E9E48663A6911954D5985D584C8C2000D6B3D8CC6E01290899508A0ED8FE69BAF021CF76DB452B099A616780151255C13988158B1F7E470D9258BF320552319D50814C3669BEA932B74461B3AD7AF44265578BA00A696AA01CE489C63FA9A52D6F7F3A3902987B2056774BB9A156E2C04795A4B97593848EE9A5EA70F553BB6530942E0E7CD41DDDDCD225A163FAEDDC014AD72D5A93D37113F35C04859362AC2DE31600BCB3D8E6723A26902439730FC532AFE2253EECE255942E914D68315C471AC7C7825BC7F3495A9B27E4584DCC144E4EFD00985031F79930D40DE69B950432DF269243B64D59C456D79DE96412246C26C90407C6C8674A579CF1CDCB126BE928614EC86F742FBF2B6BC16F608A15ECDEC2543568F14CBCB737310DE89942224D06C2D0E69BF70579B027CAF7A0A5352613409B37A3FD2509D0923297DC1DD493E337D11A6F8E22828DFC29DFBBB270E0A635B24BB0CAA384D41780D29F0449089862730A73D3484375B5664C5FB2DA2584FEB5E2EE060D04272A21E5D6F99628A486F2E29E8D9160BBACE23049EB0BEDFCE0606573A407B39D2D7C03861CF0385D24144C3465240C369B36334E1880F6FAA78D38D53F4717AAA61989685D8211D9E309184BCD3C62C632DE54D8EA5AFB22729560184A41F5CF986256FD03E59502D08E235A3405D30B15CD6093D609FC7C82841B88D375B54D6F2DDC6B65F4B5B406285422B0956449DB9AF8669D969029C44CC778637FCC5E499B72F72BAB3091ACD96C7D4794B489B7BD3AA6EFFDAEF7161508EFA18AE28F8CBC226B2067D21AF0419B086C77EC266B6C5A51D3D23181AC6919BFF7C2768F36DBA43A35446AA39F070473AF37305689D779BCD0DDB706A6A571A4ECEB124A26902319734D9A6EAACC2641447C492F1AF747E33A910D37080DC9120B6823517013608A3B08B52769525231814829196DD27E5D635FC4AAFD692A58EDCF5145AB6B44B2F28DB867D45032BD80F10C375DF926DC3F6293100F01AE53E21A28EFF714714912FD9C2D7745996DA234CDCAAAEE4F98BEAB2427835ABC392FF39D287D04E11D2AD970068CAA2E81824204D90251E00F25366215981A082D4236BB62D54F01A59081D10CA702951605197AA87E6D306A2AB707A11082FE50D98002227C322AEAC9AB4122436054B9BAB30ED56EEEFA9B54FF948142D296E987522917A602D1BEBF456265214474B91619972E57C4C6A5A6D5F5907E7A00EC25FB36810DBA4A35E85092EF5AB4D4ABBD1042E605640354321CFAEEE56815975751BE02FBD5951AE808B2235AA2785B9224341F76111EB032CBEB901C5875A86A383768D394B61125567334CD5611D41CED8EDC4C07432975A45A194A5FA36B86795F0FC4CDBDC06732BB55F8B83723754A50DD719BAE9AB1D28187D74D2641402FD64E5F83FACFF27943156B5131C9F020645CB2421DCBB6C4AEAD8C25C942C442E811728960409442BE1D9D0C37F69D3861E9D8701D922A2D88649D6CB3A9E806B2B9820D8E6277855D83E497EC01AA5FDDEED2DB4DD4B50389F5C4DCED3043A8C064B29EA648B12E9BD250DD235410D25CD23443D65CFB51A0EBEE566935FD5AA248DA0B0F2693BF0D41954EFF3EC0D7069D46A7F091CA5A23508C37838D4128CC4FB76C600A14F611556CB002910D2BBCF4D40E019D9044F0CA5587B71854EE8F5B6568E8A36C63846A647A44E2C10988113AA8D2CE02D14F0ECF09E86C42670234CE5370FDEF3CD286481A6FAA0A57E78536DC60CAE58D7744710829378660A52CFAC94081B1364A0FC3FB56C414882D68E72FEB7A43BB3504278D0251EB133340C4786C30A4391B1A2F48776148CE0C1E52DB13AE828231BDB346CF1F1EEBB85CE21C3B2A36C940E53D92D480180538A114AC92219E8457063C32E78D014F8C5831310B80E192334304D67747A8339841224680555A3174E05975DADB3B1D453EB100F29E3070103F1A97A982192C0A800194E3D44BC7FBF03D49C725F17DE0A10A1BDBC775BC3196349D1723F82834208A211DAF7DD58A8E8B411B30C54CA8867BC799200C9DE03874BC4ECAAA92750E424E330B08F5BD758E2B3ACE211959DE5B977A933758D6FB1E4243780728ED7DED52D131A0C7033000E6A2F3D8CB249E2AD50D974CD68DC77B6C296F5714595F9972FDC224EBAFD5EA367A9F5B53ABFD43B5BB90032B3A22AB03B2C6D04C94E21CD74AA20FB3FA87AB0046C180F20E81F01083B8E336058F60949069E4D326628EBF5ADBB53E0603C4490AAC187A591D509CB80340954849F1422C034E0207B38E3AE853ED44203079B700688851EC19A4824D103E1D83BCC85577FCB8A80F330169E2401463CD428292431F86AAC4864305F0A23994F5B03AA90E4917F5D12CB468E9ABA996216D6D7889D31C012B573E7D9390C8C947CC23B317D449AF39AFA95AF6FDEE2BDB70DA8DC7545B008BE5C8FD8B7353E420D16D4D67096B8A2696EBB655D0796138C603571D99661560CCD607996E755A6CC6D6AE6D08BF62E5E541E48473901013FAA3100503783C93ACB4B28011A5C16B504BBBD75154566CA3C0D80DFDC64AD5D8E846B29484EEE0CB86C36D25973EB71236057FBB177E00079D6436B83097094A5A30E1730057E5D08A2E4A2B817CE4E3A854CC936396E83E8F339F09BFAA9EA053CD7805B4BC7FF24A10E7F8803105E31488C79ECD6CD38A190C039AF64931539DF934CD8C64DBBCCFCCA58A8235ED525FC52BA728B4A3AF0EAC0EE08222B52A8C853756356C77FDAA318E9522FFD4C332C09AE32354E5461D07A9B7C9B83E0E35F138749090A907600097F8B07B399738487DB7D80A83B9C4A1938912D597E1C71F8616B0A5CD6B6AE51ADB5DB358B286B6AB9DB56A689F3A7166C215AF1542FA315FE99207026B1627A88E74D1934E0943BC536C3DC5D675D614086CD33D9D55E5CAB639E4AC7B6857CFAE1ED4B4535D0DAFACEAB14E2F5FF799B174F5A0E61D1B43B27AAC23EFA1DBF58388B2DE3A50811B1CE28AB57C1C0D0358A73017BAF62DD866CF32FFEC9A9355F79905B3046083CEF1757C304CC03929CB48F887264853026AD035B6860F667118270AD0BCEEAFC7A9FCFA109822AE4284060335989B7BAA380D00DFC8512C548BCA201608CEAC23CA101617CE4CB6A3A11BBDAEAFF6A939732D261D94F6E29A4937389427D74C42410E9B1F6E307742171D5E912330A0BC1F203CC419FEDAAA823730CE51F9039C724885460A2BEF91AC8AE2468AF1AE588A7B0A86D15B4B966229DFA455B45D94D51C7CE1498657AEBE55A333809BDD36CA949770057D8FC17A83F908639D8E8BDCAD727998B70452D143B002C830F1FABB8A7330DE31C3C0E977C6BA5BEF228B2030793F0068D0DC6CAEF12B380261826C85FE2EFF7053A17D8A9D492600580B109C628907C0419BA14F29A03218206C106340160FE14A959640C10DE1D95C986EFAC95CF7DED30FE35258EA8C0A83FBCC3DEAD8277410BB2F0395F7415203628A90E541C11A195A68F997F1DA9D558B36C58394432D84B607DC0BF7003F8C18D1A2811D9175A20A6FBDD7680C084CDF018DBEB062C654DA027C9C5DCE11C523EE5037E067DC459EB41944F48C811F6E37E0B23B6FE867C6E59C913E460EF5027A8E5CEC439F0A45CF17E801F2D1F42CFF6CB69E2BC612237B62DB0F7726951BFEF967FD6264CC25D953D17E96A269B8043C630C063EA81F3BE6A214A4CF1D33E7346BEDE65CF1C0F128369BE2215E99FBCBE4DD5ED175A579B997778909E98A74AE31CD5BBD233A54956FC91A3291AD64D755E6DB680C655B91B88AE8A4551EEE5CAA9E4005EF5E1ABF99CA76D7E8D554BAAB70D62BE59D4C937752597DE7ED16BBFC094F53266AEE3DEB5FFCF4CFBCB1AF47F3EF50428BA8EAA94A769D933C56490F78A48BAD943D4FA943E2142F413DA8080649C81E5CE462188027179953D2264B96320E02786171842E436F2B4AC65CF904A33064B24718B93E30F9E13452207B76711AB6B4A9E58C98033D2BA8EB0FF7B0A03F46714F09828847601AF9C7805D1598717FAA7FFCB2A8FA67C4243AF297DB20E6488115FD91D5011925026BB825C53EEAC199F4053243A669D66EED7B65BE5936F6C22D7F4A0BDCE5C980555B34491D78CF2702EB768032F463A679E29F848262B995CF46317D903E1C459F4FF5293C5521DCB2A7A2004C7D1ECFC1FC801F3852E4FD52BC84C4F447FD161237B23DA09A49EAD78FF406D77006F58F67685904BFEAA3EA8FF0AE8F1F36092FF900686D58F5FAA246D03D36D395BDBEB85B3EA14DD47C787D814196685BEEA204D38292A22DF81C6DB724AB685FB3F97276B78D9624AEEE1FEFCECFBE6F92B47873FE5496DB9F2E2E8A0A75F162132FF3ACC81ECB17CB6C7311ADB28B1F5EBEFC978B57AF2E36358E8B2563ABBFE6A8ED5A2AB31CDB055C2939405DA1F7715E94EFA2327A880A3C0E57AB8D00567D1042805E77BC6D9B61E218A04D0481271976DA0AE4EF663F7B7BF38210F142E27AEAD9F61EF76483F74B55A790E803126BE2BA77CB2889F2F6E5A28650F25CD15596EC3669FF9B1735796DC23BB67EFDC51C03F997C5507F31C750E762A231408F94A830BC438FD12E29ABD5FC2EE67B24965AF027C1EB5DFCD83C1AC0718A2B33C7FA167FAB7C7034BAEEA3399E7ACFCD4B40FFD5A29F4D30238F8BFE6E812D4778D55BBDAB3CD80C3ABAC01ADFDB6710DB5BE1AD0315AE5FB72B9836A6C01A1F4F1BF5D91CD7C7E21D4A10AEC64DE9FEB388EBF505A75278857521682C6EDDE035A08D7EBC6BB34D0F51930D12776D2945308ED21CAEB01ABA7932A8CF61B285C9D64D3693ACD606D38D7F59CF7EBE69318C64A5D4CD0A8B53FF79AE952E4CE43091ED27F2B0F9EB3E6FA79AAF6156845961312B6A5FA1D394803CA206F301AE36CE6418BE41BEDE542F5ED1289A4FE6383E670F71C2D1D17EB3D970D6DE5F7EC3D97E35C7F4292A4A72C2F30D0F098B8D2DB111F8B749B6FC5D14F8EEB3453F9B2007616B4D7D0F2A2CA8B04E85F551314E6A4C160B64A0CAE455C753679779F4102F45A5D67EB7C3769DAE93B87812D17505166A8544E25CD551828C52A1BE9B6323318F4589F73B2242AE282883A00C187BA63EA371B669A0732843BB06AE3A8E3220EDF118DA6F16D30C53CC6369BF858915265637B1064C2AC70935E564DAEF95F516ADE21C2DCB5FF3845F09A982305DC374EDA66B73D1DB69BE82D7D80D26ACA4DE3E2F7FC3CFE03FDE70BDB8B1EDC5E51AF1162EF5D9F644BA1A04F858BA2BB2707F7CDFC67975C62E4E48BECC6AA7B046ABAFBB5244CA15D9F83DCBF81B87ACFD169C0F41CF8EA967ABF719DD552DAEEEAA6DC1AA239DBC438AC541A50C5498B79F3801231F6C44EB72573E6579FC7751BAE89230C9C324EF8F0E871EFE0F38F59FF8B87FBF37421F977C2060FDC51CC3DDF3E621E37651ED372B2D02981BFD578BF0C9B8D826D1F3D7BCBABECA844E322576F3AA0ABAEC9339F2F38B2B0EBA2EE8BA4ED7B14FCA3AA93B1A8583CA53571F47EDF98D4C7ABBE384A6FA60A1A450C2ABA8EA4B98A861A27613F5B32EEFB5C14C6570384C554DFDB13622CD053871334215581829BBCD03BFF8B6DFA6F4248913C27626DCC77CB84BFDC5C28BB2118F5BDB6F7369532AAF2A8F902BB2C329A3922FB3C3CAAC5E025EB6D446E6251C600A6CF0C97ACF96D86094F79C2F9BDCAB17ED0A5EA5B7DF2CE667B6DC112D285E41604BEC31421A882FB3392D5AC65B92BC90FCE4CF8B9822079C502C9B50E842AB7008CD945868F3ACBA3DCC28F30CBC502CC711ACA7A3B79EB8D784DCDC3A340E17DF8EBAFE38D6539B341B77471223DE169D6898ED13B669B9A5A2FE648EE3B718FD7183F24D5C14C2CD55BECC625719559754EFCA28070ECEC4523B9D29AA4C2B0D5714D5955C4EC1755FE770AD052D7E5A5A9CE0F6A1C92B2B6EA03687718CE7B21FA67DF7D99D1D66F1D1CF62E6E17AA7F94B617098B9CADAE3CC59D2248FA1FD16E646981BCCDC1830291C6743386D0ED3EB24A617E6FD2A2EAFA27CE56A3976085C4C4645E591269C97B38E9FB3045B71A2DD497FB7F01C0F4EE91256D330DDCDA67B44B2672E51BC2DC969CC875D9447299E946DFE7B3715A044EA9431C20EE1482111830F346F3E7EE11C69E48355F0395A12718C80946D42A185C2E91F0C04740F5FE884F7B728D9C91137A51601216554EE38E75AFBCD62738E12BC9DCF9F818366A6C44246B0A48A9981EA6F56874044D68113A0F67350E241896B95B867F5ED51711F9675B70F71281DEB78863005412D04B5D0A985A17A60C8C49F7CA6EF43EEE0FA6CF51574E0FACA1ECF0F109E1FECF1FC08E1F971EA13E0CBD52A47FC7168F731E8ADA0B7FAC40AEDFB0F4E5AABA9ED925E41567324DBC4435C56C86D1866967DC6CFF648BEDF7F0FCB012AE273CF0A6A826B240BC26B8CB687B4DC5E22CFE531C8AE11C81F8BAF5B94E2A104BD506269D0404103F51AE8892CB2ADE8B9AA1D06898BAED1201847C18C13DCEE3F089F8AFE80CE9082716186EFD4A6F66772F56DE0CC6670B85EBF9B7A5E8F7375CAFF85A4EA6E186054D0DF6DE88370F55FEDE81AEB92D81857B0863B8ABE5449A2A2841F59FAFBD461FE41431FBD861EBEE11BB6C59B6153B72FDBB0F6D937A93A0201E6DCE6F9704F49AEA53B5D4A0F8FC2056DE7F228DC70A5E7C5BD359F5FCB8F021B23E780EF3BFCD7E4514D1E57F7312887A01CFAA44ECDC3F34E0AA11229973C4E70BD91BC4D838356FCC4D801817FD6D17E3E6C91DA31ADF15B3B3AAEDFC729AE1247C95F512404E8088541110545C428A2E741D1D61406579D346D1CB50F8D203EAC6DFB98B6B8539A6387E4CB64F11A0810765A4187D9E830668573D4620C0E073DA6A93F8E2693641E714A39729D0272D87D34C753F59F41527FB191BC907024CC7D532FCB769BC4CBEADCC23DE93F8BC4C5BBA24130CEF4C74D4159A3A8CF3637044AFE0CA7F964E3642E9679BC2D85144B4C81D5163212B690919520CFFAB441503FC7AF7E7665563DA7392C689847E3A282B428463AE1F2F40AC9313DFC748BCA5D9E028FC3759F6DE88AD60898A6FD670BBA32215368164EE9834A634324E3D2D933FD21FB86F234CB23A7770694B5C7D15EE4DF3DCE77439C27A27F86FA6C614C8DF0AE49D8A705AD62AA552A99757FB0A9167997586B59CDF114CAB0E0BC30198E7E325C6FB649F68C9CCF7F9BEA2EC72DD2AAE34C875FB2071E41F3C91C07651608C907D822739C7FD94549FCD8B86C78AC42A105AD28051E2BEDBF5A44D546795C46497DE0CD23140A8FC7E219BA0BDC9FA4E33E52A8FB8DD426EAF9EBE3DB382FB9D1620A2CCE1FB6881C79C47F8F449F1F5F663187F268B5AB6ADD24111F272114BAE015CF28F8329BC857FC2B46E9923F8B650A2C242F47DFE26C57E0CF7F43CB92432A965AB88BA374BD8BD63C9DD4678B5E27F1264E2B865D91775BF8BE8BC54EB8811329BED01C2F75790CBA020714DBE126C9866488E9323BAC6FF3285D3E8966255F66A163B131C0E9D8EA8BC569BFA7641A6107198C6663A319DB8D8EF632AEE9602A83B54ED10B153C4761DE5798E699F78DA94376AEEE5B6616898336D02118473134ADF248A8CF36DB917AEB2F44FB51DFC3140E5378BC293C6CEEBA4FDAA966EB188EAAFA1123E104A8FB7A2C46C63E8632921CA9E472191F16D57EB5C3749F8978C8379BF82A6C6CDD6709CAC5FB237CD9F49BB960268635A6C234DBCB73291AF670A8F31B73619F18144050001DA6598DCC0F79B6DB0EB3342B14EEE6A6A4FAFEEF10C9BFC36217EE76F8D7B7B8C880B788F8B23079C3E4E527EF2FD903B905396CFA3648DC27B014C1FE4F611FF1163F67BB5CBC9DDA7F35C7F4156F7AC93607C628965A607E7C7C173D4BF07265B65835544B6082551314E328C9E8D7EE9983EACA4EA9E8E18AA7B8AD19C5AB1726EEB14FDC2A89C2875DBC8AAA0820A7F9CBE0704DAE21AF3FCE6CDE87977086A75D0C33F4B466E8F014382CA6A1B375DA943855D3624E1BEAB3C57982C754300C4BC0343574A139DE2ADF8FA824A8CF4153044DD16B8AEF25B6F3A2C4C34D6F08958BAE3042339ABFE25B0CDC72A0BF5B885421626ABFD9617927A48BE8BF86E91CA673FF52045E599BE5C8F59D881E83CB2B11AADA232DF01EEEA2DC4445F147967303DC7FB53826F87CCFE56AA8BFD848DBDDDD275ED2AA4FC10F1774C628AFCBAC7689FBB332A4B2D37B3270C553F4C37D8AD3DF5944F5178B6955145749C4873AF55FE70C75082AE4E855C84DE4FC2E15A9EA729E09563B45E5718FBE971075F4773B6C20754C41506DADDCE75838892C0A3B46A62428CBA02C19657959BD534252940D509B3D124705AA42309283059C2AB693A4A71DC2D5979863243C10DE526ABE85C91B262F3079074FDC419336D83EFB6E1B046570FCCA00A52BFCAB3AAD1B7676026072510F2658C6D1137ECE3AAEC3336361EE99460F16A86C3DF4C3261F84CA29B2D004CD3E4FBFE1F14D5759FA18E71B5E80A8CF61128749DC3F9B8C36D8B672BE15D156777930595A759C097A87C0FD2AF5F9586CF2EA6D0DD021491758E2835D924CC9B1784C3D9EDD46693DE53985D77F0ECA3828634119373A69A04E6EB00C50CD520CA7E8E908111D61261BCF6462F913EFF5A0C80E1689C33CD62118671AD7AD0959A5BBAF767B2AE85C80FE1EA6DD294EBBCBA2C8967195A917F04B541BFFC5D513F9E3FAFBF2294AD7987BA0DF0106151D0BA02F014FE3157F8C05625CDC47F91A412E0DA3F9C72183C49E30ACA3C599CCBB6C978397C19CD58492AEAB2C5DC5640CCF3E165F7649F2E6FC314A0A7E76EA3AFFFA0294067B81F99CA5E8F93E8FD2E211E5855260785031B68E2AB7101B16EFC0F168917A94178EBE61623D8EBCC87B3D5850EA356C51C75AC963315B0093882980D734928112D0A0F220000C51FB38ECD2AEEA47BD5D6C703B6514A728E741BAD5ACF9D2FD2EDA0F64A8316B30112829FA7A77CB27B4892A3E14DB68D9B873DFC77941F20E460F51816A90F3B39BE682CB9BF3BBE7A2449B5AA0EEFE2369B28075009FA3347EC4025E3D83F8E6FC8797AF7E383FBB4CE2A820CEACE4F1FCECFB26498B9F96BBA2CC36519A6665D5F537E74F65B9FDE9E2A2A85A2C5E6CE2659E15D963F962996D2EA255768171FD78F1EAD5055A6D2EF8EA0D5A232C2FFFA5C552142BE69E2165F836D201DE5578FDEF489082563A6ED1E3994C905E5FF0155F03C2485A7F731E13A65653F403C2634EECA29BA824379F30D40A55749E9F11798B1E12D4C9DC85127DEDADAF1B48BF45395EB4F2F3B3CFD1F74F285D974F78B8FEFCD21A29F9D73BD2FA2622C50ACBFAEFD063B44B4AEA16A73BAE2A56A07B146708A6B758FF54292A6B142BB48C375142260FFEABA866C1AB7FC6C38EF5142EFEC11A7F1D54C809113F557EFA98AED0F737E7FFABAAF4D3D9C7FFB968EBFDE9AC8A62F8E9ECE5D9FFA61B2FF39D9E4BBB1C23593EDBB7DED794B56F364CF43EA96130FEBB8C8978BAE1223B1173C136E112B36192136981CA3F8DD4D6A946FC10EB449DDE3099E853BCD09578813A12B53A545951F7C3ED664E57314C9C639F385751F114A3BCD5954732739A5E39AC196DC561923FF79A15667E98F986337FA6196F208B610E843930F21C20472A47B2E48DB25D6E121A78C6DABE1DEA574EFAAC099EC9FD14156575DC5D0DCBC0A9FCB1789B64CBDF6DA419E82A9516C67247DED51CB4270FBA6DFF755B3BD447A4DFDA7098113C8D5D688C6FE541B2495D55BEDE013B79923CB6C00C1C8C28CCDC0398B96DA0C791CCDCF63E80DD4A55D71A6482B7C132760DD7B582ED7FECB3EC8866D881AE8DB76815E76859FE9AFBDF638429780053B03ACC3F923938DB2A37CAE1FBC71BEF2849572FD7A8B75F5BCCFF65137DFFAFF6BB7D72B45C0910C7753B3CD7DFB7715E8D8E175581CDFD355A7DDD953EE6741B631F1C05410B8FAD85B1E01E892286748281C037D506A9E231B4E6ED27FFCABDB8DC954F591EFF7D981B32CCEE0398DD4776B27FA05B9D8FCB3EC2CF97D4DC3D6F1E32AB9D93992C0E373BD8D445EEDE4A322FAA78CB4E8883B63A6E6DD55E78111F8B3C588D357B30D0DB5D7F6CE93B32F80E25C968C8C38C3D8019ABB8F37544C144F75973C1CA6563D1551DB295FEB2DB3C0C5B4D21479193EFC5CB84BC8FFB78951A01A536FEBB7DB4D7863E1AF5AF8AE656E2EFF36CE31CD1C6541E4C863B2FD8DA8309618C85B146FE3E73663B5575A0F27167395D77201193B0DB83CF33DA15C3FC1AEFB2E58EDCDE27188628DC16CF70D57D8B99BB251722C94FDFD641877C9CB8BC9EF65E7A7DE1FE9295ED9DE4816B5AB035E7B3352199E96FB35B466F7435CD8D2D735F5A7529F9B8EEEE36BD212D3887CAD795072D2FB68A6D9CF0651301B7D79266CBD613DE48F9A6F5B718FD7183F24D5C147EAE18DF9551AE3DDB341BF0AC5477F7CF2FADBBDB2760DF3F9F6858600EC099C128F8CAFC3B0E253F8A76DDA7938230BB0E6076BD8DD2DFE7359EC67714923EDA375AD70A31C7A730038E684939C083F8304D0E609A60C6AEE2F22ACA57C73259180FA0D4516584EBE72CC18BC42816DD50876758FCC2AC56CCEA883C4FB344F1B624A7371F76511EA578A2BD432571D31CC74CA70F595DA6D0CDC72F43AA5F7FDFA225918C9133C25507FE5195277FA8D2A050FD1625BBF168BEC31A68570C2115CF0DBCDFCD9F7D4C61321B5CF213915AC36E45D653D0C5B5DE540CAAFA5455F59128E9E107B2FB1802D38D92FDD4A6AA86C97DEC93FBD866F350936B94AD547D4AF86A24BC3F8C73A8F9A36FB4A31C6A5EAE5639F27FC81774D701E82EF0499283D55CFEC29742B2C3939D3B0007C5B7632C77993C823162A9EAF4A3ED597BEF0438DAA3C1D963C8877A6A468EB19F24BEF863F1758BD2385D731EB210D273585ACF5CCFB08F9C1DAB728163CD875DF3F114064F857DB81D0E051BE564666B759BF0E827EBDEDCA2DA8B9B45D5EDB4714D8BFB6CE40626BC8E364933904FCC6911F952894F9488777F9CD0C1C1F7E1C6CFB1AE07F3EF0BF7EE51A7711559FBC0DD144A661A4DE6CDC7E69C01407BFFFF30DC0741611E80C2DC1B7F9AF77B8AE31B707B905F610FB20D546F9BDA37DF540B1AE6D8354C35D047A254BC48DAF0B8C271E31EFD5940B5F3DC93F7FC7D9C62147194FC15450E214B5CF5A0774E42EF1C55ACF8C8E1CE039F273F905DD98CE6CADC4117614318D4A6566D32EBE491284E300B89C34647900A6B1C1553756A6CB26C0A61421EC084BCDC6E937859A9E6E3797401F78460973EC562781FA2F474B6F30E15CB3CDE96B19875DD35E369E4670775182F44044572088A645766D5F3A2C715143DE3FB2DA7F994D62D2A77790A3CC2E784EDD7225A231F73B27A9F71C06A1274D801E8B00FD937AC2D32A23A8E447D917F0F312F0E7148B83852BA8AC3C257BDBD1813765127A1381AB13B22A5118CF85394E3EBCD36C99ED1B1AC7EBF640FF64B485569D0F24199110EC90FE8CA83C8F8CB2E4AE2C7C6B933CC1782C7447CB7D512C7E7288FCB28A9CFA787A13A58AB66840D9D4902F051F27F5B2B2E7DFEF37FB27F72411AD03D10315902BE3EBE8DF3F269F07275B745E4C823FE7B04B90087AE071FF268B5AB30DF24D1D24AC0ECD043A70B43B1930C61798CD2A578FE3A38DB438EBEC5D9AEC09FFF8696A577FC9FA274BD8BD6FE09BF4EE24D9C562CBF22AFC78CD9800F4B87BA1407DFF71B4A2F6980E4801A0FFBDB3C4A974FB676AFD1BD8ECA6EF18B73A4942361B77A22563EB6708FC4C03F504330F897C28CB59AB18D0D43B6E7C7B33B6F3A65BF45EE2A0EBB59D0F83A1CA2F5BA9A830808B3F7B466EF914CDB3DF16ED58F23399C1035F506BF0F77807687BFF7D2806845E7A4B3E4BE9A1744F7D96034580944CFF7598272FA4289D3CDE8713669C1740C8B4F85C2EE11B923597B0E54EF86491B26ADD5A46D2CC60F79B6DB1EC9D49D79B707F9769D220AEF76F8D7B7B8C8C0478F42EE9F239F92BF640FB7C7131E38F3A49C293EE3E76C978F7A9FF42BDEE4920DC9F80D3D3EBE8B9E276A66B25E0533E74474EA2D5A1F4F4AA003DD9BEC8B3B2FCCD7FD9FAF559A820FBB785539C78E63DA4241798EB9453D6D07088A215E8230950E6D2A1D551E99AA6743D3BDCC9CCC84191DC7742E7DF541A4546979824A380595F09DCCBC2839C25BD4F8E7B758BC4160E668686A0E9A45E48EB27DE3752DF3E786E0768DD23584697C2CD3F8335ECA9B55E84866AFFEE286CBC6F3262A8A3FB27CE51DF1DDE77BFF490E3E1677779FCCA52538B54E77FE67AB5D722CBBE303756A7D8AD3DFBD23BD2A8AAB24DADF909EA01D0E403BDC44B3BD24157443ED5E43DF4B7BB28D1C7718B303D546970D4F51A1DD4439164D32631CF68D54DD211BB8A054F7E92DE1DAB6727843B8AB38C2DBC144C82EABC74DAA2461C7A1DC5D679D6ABE19375C73D3ADF9B6EE2022C8403ABCAC54D50AC7A007AA6E1C26FC914CF603B5E4F6DD7E0993F91026334A5771BAAE8EEC8EEBD0658C330FF3D3D3F0665798729229778B0A54B6EEFF30E7BCCC396F614C5759FA18E79B61FBB4300D0F601ADEA30D367366BBCB607BAA871C37855DC5496E7CBFDC2F13B97AC46224D3BEC23DBD97D62D7442E19B9DF1859C28ADA777D0B527A26B1B6574182AF740DD0221D2E2442615319B89CFF5A8222EEACEB89E7078089374F37DF735C3FEFDC8E6DD655164CBB81AF8067913DED806DB17DCD4BB4E576744163AC096863B943CBEE8BE7DDE25654C5E9FC36DBE397FF9E2C52BA153022682C104DB3F08A8F0A447E448388E12BCC52DCA3CC2A22D6A88385DC6DB28E1E8E7E00C7509616987912F7987B624A97A5A021D3469AE3EE0861BED7073AA4DC783D717D4581B89C01D2ACB385D2FE080572741309282AA55085B577434F250F7C7A445EAD2CC2C327115154F31CADBF77CA7120AAE59069D5076E862C177E880E462627980E4E068C6FFA0C69D95D918C9ED058BA1DB6F8D60334C336884A6CE6C9241760BDDD52EA9347400F4F8F51FADEC47D22283A7FE30CAE0C31D1B67F4AB6E18D98BD415BCD9C69CD0BC00A2E4FA71A2DFD9ACC6A9FE603EF7DB6684C18610791A70B147E30DB6715BED3E7EDEC116E5D37652EEDB601BCFB82907BB3D779E65B0ABC78EA755E755930CA2E6CBC12BF4BA1F07A1D12B523F65EB0540B3FD5869871BB72462A93E8E32E8E603E163C4493F4CDAEADE239F71A68FABD3A79DDA53697373699A5595B75BB67187D8629B07AE037B3DD2C3B77E538C73EBA36BFFD0BAF2E1CDB464176DE0C39DD08B6FB535F6E3B635DB853774CD2605D7DF974F51BA46249BE702E6D218124037CB20630B0E5E1698EE1C8440D48F0570C77B6480E44241D7A82019E9104B2D5609BAB21CED588222903EC5DAC174CCA4418AC0D9A4867A0054EBE3771C54959C50CD330899EF635915F623365044E85EEDB78991A3555C92775B178466A9445485FCB859E989AE21569EA8CFA36808B157E38C38D51193D6085933EE1FC88D8E258AB72579D6E9C32ECAA3B4CCF23AC3E542ECC49071546F315484703B0F35E838CB8BDDA00EDE9328BB68649B60147B27568BEE2FA954F510F498535F87CB9491348D244712064C2B46466D77D07B27458D726A8A1487D31E87FFA075D71031985F9335D5F7C25C1ED73272B08C0FCC36B2B58667358E9AABAE73EC91DA5BB6CCC97AFB6DFCFDF314A2005E249634B5279151EDE61DABB022AA2E064DE88593D200B9E521A883F7CFC9FB7618CE3AA910C177EA9DB4C18412E4CF2963A30A6695A1F964E789B0A875502FA4CBE8306342293C0C05ACC47045A3592853C6EDB27D32B555E65EA83E67297AEEC48458DCD32D504CDB0C36AEE4E01722B63F260DD223B127C231D1A2E3281507B9B8D8CBC59EC8C27D16D4C43E88433F0EFB626928FA307C4C47B137FC690E5FD3794CA36376E7888AE6D18673564789AF411AC553C24DDFD9C5A39A43D5360BA39647AB590CA3462098064555D4978C73B3646263A3EB8E4983ED98CC178E3C8BE34CE6E8382EE7D8C1B9C3667080CD270913EA055B4168489B7727D2EAB1CA6531C379CBBCABC6E4672FF66B07352E7B242953FA30ECA5E3707D1856A2B127F2709F05BDB17FC2D18DCADE4889479D11B622EE6231B7D9D1DDA822EB88E12ED5AF0F743EB531B50FD4DAD2987D73D24947908CFD918CFD918AFB2CC8C5FEC8C53E9C9AB492416E2D9B24CEF21C153667EAACE923C0EC7267CD2D1BD7E49D9C26667DA2947A5493EC855DFAFBA1A7D6A33B63D2DCDC1B115A0E26BCBC3D9B284C7A75DB5216F64A29547F4B25A12E1586EE306400E8DA7E08C075FBE6D92CA3FF3E4E23DCAF28F92B8AF26AFC55C60203CD0C20576229117AA1F224052C99534983D96E93266DEEECDCF491D8E84A4113063ED90D82C9548463CCF7BC9AA2BD78469DBF501DF092C9FF108464FA44EEB662B20F0764ADB0744EF7202AFB282AF39F895CEECAEC53B68ED3362468F48C907C8BAC6C0885879D2152E88F9954CC9929F243F60DE569965799C5886C2A8C8FB69CD99AB6DFCC45826A92CDF5407F1F67670A75701C51A03B63B431AD499B6F5FBAD926D933420B29E1C34650B92969DA66EDDAEEE338F9382CC767E8C6A4ED8D495B146DF3CBC32FD983540E48193D66D5EFFD1E77A13B7B30DE98A6D9C61953F337B42C09BD64B461BA5DC74C35F86CC37CAE71A6689CEDA7CD080D9406AE4346BBCF86BCB9056351C71A6962AB80A02A0759808460D408AA09C7DECC08A8A89A7DC8673001A69780890D001B31D887F5BFA1F7439EEDB60B9078B7D1331082AA4D08575330D6D311C6E3E34714EADE98B4D754985B16B0995225A01ED122645B8264A02B3A64EB90EBCB81D888EDF84FAB0D669385E935828D3CEC894E68F70DD3CAC46C9B86E965C266CF30B74CDCA23539C19CC17CAC5BE642F7D7E39D354C6C3C367D3914DBB13A39FDB08B5751BA443304C0B14D8BA7E57CF9A11F47419D326976EED328484E986FEA30880E4A3AC08729390A16EC97FC30F5667C1CA7C41A2F4A9873CD1BAF8F1CAA1FC9119BE71ECB81000EFEFD43B05B8656CABCCF21820233FC2135CDA5C07D9293A99E5873969159DFD6BB89D6784313116CE44FB90A89B88446F5072BA92055485D2D1E5F1A42E8D03823DFF5CB482374BC9EF1B2F06A9790515F2BE2716B20EE1256FDC97AD0A71AF086C08986DCA89D86D7B3CEEFCB2A6A8B10BE183EC77563DD3726A0A28B0E7EC2539D319BF6334E7840082E81483E702425A378686201F577AF84A3AEB22F2222924E3BA0F85184C66E9F05C27860A6170502389F10E006E2745D6D75DBBDC2E857348046598980CA0FFB9206D425631FC45E49C7B84F72EF8F684CB58974958C59F790B7A840784753147F64E41DAC2924036A923B1181000E5A36C02EEDBD70DCA3CD362127E977486D72B6802D1C7313832FB34887D95405F18D750783237702E1E87A64D25643D76C3241049290DD6C8EA16DBB8B274225066C9382EEA18B0EDC35C175C7DC49B12FE2D0FE54AE1EC2C6A1FF78384201F7746FC4A2AD32916060A3073317D729710D9477778556E87D9C17E5BBA88C1EA242140B52EB0E95EC39EFF9595D009DB0DF2D9FD026EA40B1BD85873E7A604EE60599015BC11FEAEAB2C63A007D9B1DA8A66921E191D0B600D1364EE55BA99B1620CDDA96B749B5D57E609BD236515B8202FEFA738BBCB11F6BCCF50F0DDAFEB45340DD1781E8FB6203CA6B0D04525F17497B50176B9A90A057A03642DB5C7415F036DF41C44D9909E64F193443FA2239FEAA5827938A896030034C45BF7D6DA20EC2149A628BA5CDB1609A26B9A477429B5CB96CE671603A76B25982459EB2E55DA35CDAE186BBEC579BA64993BAE66B180B12EA0A1A3298B703050298D2B6E9E651E4BA4506C2A02D49230AEC7A4EE6681597E4596A88855461C73BEA5BCB38EA937659503FF80DAC16EA0A2AB234551D49B520D2893C2D612A4ACC9A366FABF387882B495B2253261D8099A50025C490D90E10ACC69A80AAE808E31E6212A9E100A424707026CA5CD12C57AE54E6C68DAAF90E72FA3E4751B1CBFB25CB86B946C3AD1A67B9796C43467306212ED2F57745630D84097EA972634A756D19AA2D2E079AD02657AE689583D40DE896EC79ABAD1A6CC5F1006DCBD58F760439185D9B42A214B1550104B42145309D12A623F245354C97F61DAD7BD6AB611A4AA78CDA8422A2166A4BA4ED74103A61EDEEAB8B92DA15B5ADFC7CDB8B6757A869A0BAF626E0AEBE0268ABEFFACD1A73BD05DAB231006D3BFDCD9B6EEFC6C099B52B6F50DB92A18D2B356CE50DB4E5665D686E8FCAFAD1146B3AD34099B5D8DD4F93B5D901685AEDE0B446CC1A5E5FDA02E9CC69014CB47C1F5D0FEBF9BE5CA7E97B489B76D5AB0C0F654A83E1AA0347E9027B5F080CD4C830A8CE74C2B4CA37644C69DBE8E7FA46436333D1105A33ADF6F702F6595DD0B5D0FA8C5BBBACFEA99B2C1168FCD59F61F7536460E7F1513360033480B4291AC8B8516583DAC6F40D41C7FC628B1094624280F05A9D039D2A031A080283FD7320A8CEACEF8E2F459BBE2BEA0CFAFE00B431E8BB0F86CD74A7AED2D63A086DA31DA4A133553A1F7900C9BCE4C1B866A9A3086117D35EE32BCECF28307613D3C3F0E723C06DBFAE8FD27306A85E1D31AFAFCB9CAB6040F38E36270FDDB545797779C8113BCD1CACD0D565E724F6DDE74E3F54FD9781FA6780E478A7AAAF3BAE71668141D7C7EF32D4558F5D64994752912B3A2B027B217FC691268AB0BF2908749D059093CD9FA455F4CA0EC980A82FAA167872E7D6B53E6A59D2354958331B5546194F1581901D240945E0BA055A5003BA56B34AD135280ACD96F79376AD3AE0534A240731864832279F5535F85CD3B17B789BD3641D9675AF87184CA4588772D9F5D520179CEBE8C9A4922AF52992E38D56ABF7651D62CA7D7669E4B5AFB557DA3F5426AD1C58413EB87849562D5763C1A1E3F4397BFF0E11D06918708C0E430104556D654C80C398D307DEADD5561F7C03632E0556B040764C5FF34277DE2EC725C7E3812DD4A9BCCADA85C0BC93CFE000C20D2A0CAA300207A9E8CE8B17750401200B1C889A648156F5380B01093597E431062E3A5C1519B0A85B8154BBBE9AC78E71DADF2470A25914ACE21EFCB16F41C51598738FAA25EFBE10F350F5541AC760C43A23A68D2F6D4D9183C0B53527EAFADECA23AD89652A4B80F1A9B3A651CCED7D29C59AC4838CBB1E716EED7A1F2C714C3B1BDAC05B602A2BCDA0D618269B36888936D70DE2547CB2AB1B121B6E496E8DB98DFEBEB18A89C75A30B314E0911CDAAB46609904C69ED59C514793D9B38309145BD0EFCD43EC50408F31B1C060B8AABA3ABE6D281B14930606F43F51E6EA7AFF7EB8BEF714EC618F3E37CB39F45AADC0C27BEFD06CBAA1352878C472D383831CA11B13DA206DA7988B11A04B4C02399256E0AF7AF41224BDBDE1E0B83534B92633B264B6825FEBC0D0749AC6589AA6CB8CE4D06FAB4A17001078DCDDC674822FF650670D80C0873CF7D95E752F74EA19D0831EA734DC67C6B2D0831EB22474673D44B4F5EBA00A7C340B715A465830E13819709F59B040003E122690F35A4D8490047444FFD3441142D7FD7D2495371202F372CCCB9E968A57ACEAC352C5A5A9615D569E124370A31C124FDEEDEBFA1291BACFD750663C9E6C91E03DE82A73DDADEA87645EC38072F2C11B7955079437EC5CD8E61ED94B6F67A4032D85F53BDE1AD7F0283EE1F66C88DACF500D2803BB6555FCABBA3919D319F6A66C812B1C0953B8EBA2F2D03D09A462C7EF10C227BB075B334077B5D5BEFBD4C5D54577B954EC3B04A6580AD91BAEF54A08DF5C654303C49BB8757080E276ADC342083D040FAD85DA07E38712CFAA57EECA6EAD6165F7710774BBBA8CABE82EF04424452675F1B7A210B8DA3B69B764CF7B033D347A09DC9D78A6267C9BF9AE895156DD4F766641FB90B5BCE7E053D7803F0770E4987416EAA5C7EE69A6ABF66D67AFB375922EB36F13CBFBAC78C3D89568A81E73BF9CAE0CDF1977EE36FD0CAFBCD3D2C77A07A92BF8623BDD59D955F5C1DDD58FB3F27D5A9F233D65F7F90756F58A7BF4EE4FA2B581B744C1C348F58BA35E951A9B5DA1F1608369131CDD0F922733658E08931736FD399EE0EC0BFD46579347C10F4B986FA68C612B197653DEC17D6495F20944F08A87F19B89BC0670BC55A6CA9B5173C6240D8627D6C8AE3419BE0CC874CCFE7ED35CACE0DFB5839612D5D377AC24445C280B949443A8215CDC075379B81C5D52CFB781E795B2E7DDB8D3153AB34273AC022549B06785E378F1EF9449C64CF99C9987711313A9747515D951BC74B94D8862D471F8492BB033928EEC2B2B6AAC5A2654600A1386271B2276BE2E23D95B4B50C7A5C07E7DF48A4C3B3517A0F25158215BB5CC1E211AB868CDC306F9333AE0664006EC9311AA7C47CD9E0002181EADC73F1A0385EA291F9661BDEF7022A3DA0FAF4E4C04E2011178E836FC2E8A22EB83E201150F6B3D9C83A9931CBAC877D7FB3C13DACECB1ED1003A0276617216BCBEA8B1742F5D7465AF2FEA2C56CD07FCB3C43BF53569022545F5F5F5C52DC963B641F5AF77A888D73D8AD718675A0B728FB485F9983E66ED231F1C452D485BDC5A9A78CFB68ACAE8322FE3C76859E2E2252A8A2AFBD26F51B2ABDCE20F68F531FDBA2BB7BB1277196D1E12668D210F85A8DA7F7D21D0FCFAEBB63A56F4D1054C26DE7F96E86BFA761727AB8EEEF7515270832643415E20F980F0F77A2C4BE23B593F7798BE64A921A2867DDDC329ADE628BEA677D137E4421B16C24F681D2D9FFB7DA90C897E2058B6BF7E1747EB3CDA140D8EBE3EFE896578B5F9FEAFFF1FE421904BB4840500, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ItemVersion]) VALUES (N'201901211132511_init1', N'FormGenerator.Data.Migrations.Configuration', 0x1F8B0800000000000400ED7DDB721CB992D8BB23FC0F0C3ED91B674569C667BD3B21ED0645511ACDEAC24372C63E4F8C623748D699EAAEDEAA6A8D781CFE323FF893FC0B0650375C12D74255F50531111A76219148241289442291F87FFFE7FFBEFEB7EFABECE41B2ACA345FBF397DF5E2E5E9095A2FF265BA7E7C73BAAD1EFEF19F4FFFED5FFFF37F7A7DB95C7D3FF9AD85FB91C0E19AEBF2CDE953556D7E3A3B2B174F6895942F56E9A2C8CBFCA17AB1C85767C9323FFBE1E5CB7F397BF5EA0C6114A718D7C9C9EBEBEDBA4A5788FEC03F2FF2F5026DAA6D927DCE97282B9BEFB8E486623DF992AC50B94916E8CDE9E5F5D58B7749959C9E9C676982DBBF41D9C3E949B25EE7555261EA7EFAB544375591AF1F6F36F84392DD3E6F10867B48B2123554FFD483DB76E0E50FA403677DC516D5625B56F9CA11E1AB1F1B8E9C89D5BDF87ADA710CF3EC12F3B67A26BDA67C7B737ABE58E498E1A727625B3F5D640581ABB95AF3FE45038D05A0FDF34F277DF19F3A21C0B242FEFBD3C9C536ABB6057AB346DBAA48B23F9D5C6DEFB374F1EFE8F936FF1DADDFACB759C6128849C465DC07FCE9AAC837A8A89EAFD14343F6C777A727677CBD33B162578DA953F7E8E3BAFAF187D3932FB8F1E43E43DDF833BDBFA9F2027D406B5424155A5E2555850A3C7C1F978872506A5D68EB0233A46D0D0B1C66D8E9C9E7E4FB27B47EAC9EDE9CFEF0673C47DEA7DFD1B2FDD250F0EB3AC5130C57AA8A2D0228D4B74AFE9DBE55D25ED72A9E70AD68D4DF1D91BD430F0996192CA7C5F34DBAE411335F1DD15E644959A60FE9A2994732B5228463036F932CC18AAAC5FC0E2DD255929D9E5C15F8AF4681FEF3E9C9CD22212821E1D3E3BF4A0A2C7992081B7ABD2D70ADC5B359F20D780A44660156AD7D07F1DFB7E9CA63246A5C6F9F0308AABEA55F374B35D556552720F263F90E6508B7D5B6F436CF33945808E097E45BFA48855540D90874797A728D320A503EA51B5EDAEF7AA0F745BEBACEB3BE62577677936F0B2AD3B902E036291E51E54CDA0DAAC81AA2A5B081B9EB1628894E01A22346A056046B3B654BF345828943453397520453CD433D43642B4024BA55709E846BE9D5D069A2CF9FAEA663305D6DAFDB3F20415502C9B42A215DA926ADB70B5B91ACCB644129D74E32651D79CE294095535005EF3A23EB7565B8AA504C3E5997D812769BBB725B5143261A0454721A8686F8FCFAAC37AF6D8CEE463379DBDE4DFD6882836DA9CCD2866B5ED6698322DA5347684F85355614DA4665D378A919C190B0D4332DB868D2443503CFBF9A4B835542A0AD5AD450514385DA98883ACAB48171DC9868F725C0AE4BDEA14840CABD8A0C39CEAEE5D75249330CA2DEB1087010BDAE2B81ED0A5043B7FF3F32C5FF255F472D1BB5AC9796B571A728B4EA506D6AE79FF2D5AB2AA2D51AD8967CA2E6B414D7003291E4BB922E5A38C878AE9BB5D29704F4C894A4AD753CCF89D4E52A49B3E99BFD9CDFA75988EE9A8E82CAF28FBC584EDFC14F49599D2FAAF41B1DF9810BD6C7F26D962F7EF7D0D0223F8AFC5BBA04B66071F13D9CC5B71D6470A9A0DABE87E8D70AAE405A2CF852D7858BE080D75A8297944A4B17572059FE7CA9BBBF1CAF23303DB44822A6FF2A51C2140DDA76F44362B58EB6E0712D05DB22FF9E17C97DBA9827B2E472FD98A5E5D30CCB4EFE98AE2F6ABB7AC876EB1A3DA625E679005471F1D8B5C5C3C9B0276ACEC1B827E05129C172510EF77D13F64657CAA14D4893EDA4379D6A08C074A2FF40965C5F1ACC056169C829A919EE85705054514929DB3A5ACBE91A2DD3022DAA5F8B19DC215125EF934A26BACAB09DD5EB64E57696D3D85E5A906A274B354861A31E84053480B136CFCD868F57D3B749B875FE88FAAD22D034FE33884797046152D97374625E7EDFA405958D206A16EFB41FD1F2EBB6F2517FD4338C9C3552F4E61EDF62A3F5E6D6DE47C89DCB974876B750ECBA0DA0D5F10CD0385171E95DB31809547525B033B52F76F5EB2A372746AF2ECC9EE17B92B6432E0B32068F6B32D816ACF5F76179BCFE34831D509E6FABA7BC48FF3EFCDC302E19FBB464346A7788660615A2ACB8FD22EC7C83AC637475F4DC404C5E30D794C79AA637CFABFB3C8467C8A8B4836C0DDEA5E5264B9EBF16D42C1CB45E96CD3DF37EDAC6B5E478D612F96E69F89BA85264A2F1CEAA2DF597DF174FC9FA115DE30180496721EE7A11EFC90601A49D0B0CE57371F673BEC62B15B93FF9A0BC90DCE287E00186CB606A9603B0AE4C77E98105F5B6940FA4FA3677A15B8606281781D4B44B903EE772A6B066FF8B174ABA151734BCCC42760AB99A866CDD681EC24B65A05B736FB77D3C6BE8CC2D584EB3D19047BB631FED8E908BB6A8C6F44BBB9712E3D4B8E31D32AEEE9169319B9B6478D8D07F6C51E99ADAE9CB76753F74176438CA0B73B6154435D5956A245E08CE576CCC6778351C681D62B2BA844015922CDE9219898F5DAE95A114DFE6A1FA7E9B4FD2F34087A7C9B61CEE187F972FB62BD426F06BF40359A2F8024FAC2134D73566FA2625C89220F7CB2C5B9BE88257DFBB5E78476BEC4B4EBD0823AF02D14E3D183B75809B4399EB40E152707131E96E6773E8EF38E89E6825906462AB215D3D1CEC223D96574CC9748D07CD85FEC67EB5647C07AD637C0364C1F816D2DD31662F2F0CAC8AE80EC440720FE74EB09D9CF8F9F09432A2F4F6D9D36D2F1F0CAC9AD176B2D1C30D3BD5CDC832EC96239BABC3FF3AB2FDAFAD178FC9173DD45A0F640FCE946F40DF4A30EBD37553F144FD1823F7EEB714FD71858A555A9249C16D3BC422BFD4DC37555228E25A5D852CAF74FCF8F3CB10FCB8284B9A927C6F4EE7A389BF4F263E97A31F3228D875EB8E83660C0A15907CB8A684743584DE26EBDF75B61B530E6563028A25EB078271B57B1AF3033EB56C6D13803EA148A24D2C1F96168E1D957A70879A3804369A39605BF3D826BB177C15178A3D5C2814E117C3560969DB695C4FBCD41CB76458293852835D498E4CA3D91C5C12EEC4A40D47A80942595DA289A8B3CC5C8C43237D35104C1CF95B4B190518E453AA9B77534347A67FE2ED80A8380F487132FA0336A39CB4936EB7CAA92FEBD3BE022DD3EA2229960A23AF2B9788138A64834E281FB65BED90D96E53BB0ACC9F5195C2EA8C8BCA181007E0A87D7ECE33BCA19C676B2CC5B7F452E215E1124DE263D4EC4375A6E42A55E8545B9A3E6C932259636D708D1628DD54EF5095A4992A2B7CB16CC008815DD5BACE5DAD6BD9D4EB4670E0050E739D816F5BE81AF0582AB4F8E2F201AB1A2694D84FF15D7DFC320CC1E5F70D5A104D32F24BBCCC3380BA054484F26FE5B724DB8ED79D1B2C00DB52D18BB6D0D5578CB2F41B2A9E7DD603D2ECE084A2F5F48D6BF131ADC5F56235CD22273F3B62BF30DA9F20527C3E5DEAAA5AF7AA2972ED585B6DE03385701BE196EEB868836D8588C4DF8DEB3DDD4847957F4C2A7FC0D6C65F453A6E7044CDEABC8D73EADD1D53CDDCB31EDA5AF133550629FD015A3EAAF5B1F762F3B8E3EAF8D6577335FCC34401BC3F8EDECE3401BBE7CB658126884F8D4BF23E2DC9CCBAE1B62E7BAF5CB6EB31B0D879AD5CDD1D15A73C084DADB864816D4D730935BEDA7B840A4917B5E410872DDAC7AA386DD7F8FBDECDAB7B045786BE03AECA198155CFA36B6A3807133C918A6DCA042DD7455099F93C84720C0430AFD46E5A8A390888F32080C46D18CA95C31619DD5AD4EAABA0308492C343D3D0F582A548AEAE176C1B51B6155E07B7A4626E38AEFC4A3C47660BD80415074BDA221ECCC9DCF73A951B398DD02499663E965F37688DD76FE1A034DEFB3B0673489F4540690E40F9E8CCD08057D158C5FD984C9D5E20B0F564DF9B30C90704FBC86DD5E12AC7A5463EB802D3518D97066F949C5A4CEC6FDCD51E931A37DD8216B6441C38A3F29450B2AE538386DF6F098D091594F4F3FB2B430F78E0E1F9513DF5345737AA69A99D90692CC32585A439BFC6DD0BDCE62337306152CF499A311C5A8659C6BF50814E326D62C6304D19D3FDC4CC8CC7B7EE1B1306F2CB1A0FAEF257B250705E351834E456CDD3C5AAA7D63F3BA0038F596015B93D8C81620670D81B8DCEEECA5B3C77CB6DF1FCE2783D94D64F368A7BB81D772B366F5D4DB20A4FB3D44F725CAC4ACC3F536EF8B850EFD342AD5D404C9E552B5FEAE8DE538F43391D8D417CA2DEA7714D452C3FC059505CE7C0B626D880067BEE2110222C7045D4D447A5A9E990830A1038D869807B2DA8829154A112D02767BCCEF5DBBA6519383EFE42225E052AC55898E0DD9383DB74A48332750304547602861E1432D24887EB8244ABC535086C2B881205EE38539E7B5E6F1EF742F6349B9B3A0A246018C8FB748DD1A449F65794C46B7847B58282EA39F47AAA50E3EA85D769FDD7DD246400647AA542F9156509C2F99515766A81247210B415E1115C10402215861ABE243AA5621117C6987765B6A5E826651E88EC574DFAD53525C7FEFB0383EC0D4345EB44A7E2F12EB4C6550A08F5018AE5A7830118D7DDA9FE8963A601F08563A05C4BA5B7DF53BDE9775CED75D4A9F7F7D6CBA7B0F4BB2EA05CF5B884826D857B17E8721D4691D6633D78359BE9A188B8A4ECD392D2ED15C2ED2A4495A8DF7BF81D036D365835517A3FE58FB67A91AB14B521D816E60C696AF0814C5A4D10BBF60E958B22DDD4C78063B79554C9F85EB9AB003AC471A87EBDFE347DA37191D8B545C25EF76EAB1C6B8974ED960843AC16F52FAC3849EF06EFEA990C5013BE343687F22A5171FE88FA288511A3C1B03CAE7F2D74EFBC8669E9D73279443E3A86985BD11D74586A597F7C8E75057CD22228DBBB069439670121E4A805186C58EABFFC1B5689794187CB6AED606AC465036C8BFC7B9C2F211157D770B77CB8D72DA31BE51855712386A03266B4D75D07D76B62A05852C3108CB3CB7BB5C9F267A4F0F5B4A5779C76663CDF40B97CD40D01B9BF9CFCA88C20A8CB5434CAA5C0F3C912C8B02441ED78DA5DFAADA1E31A06B645FE8D9E88A867B57A36AD54DE6A0F352B6A079D2AF68B7E6914A2A57E68C1A38200DBFA25BF1F6AE731233C14D55FB649963E34070ACC7D70BA9A2EB78BE6A6F827F40D65EE74A235B64405ACF547F7F4D6499156495607BB0A28B9322FCBFF48771D7338D88C19017E18A559633AF1106BC5E58A46082A1BF9A7108D58656F08D212598CBF3EBC4D8BEA69B05571B341E4F434FD7B6238E80AB36A7F2892E5B65E7BB3641142CC6DDB33C43D84698E3C1357A468BDD0460C064AC45FA06F69BE2DF1E7BFA145357E839F92F5E336799CA06B9759BA4AD774D82E926D396D8B3E662F93B1CA98F22D0CC1A445928C7EC2E6DE16C97AF1146823655802A9C136722353BD31119D76C7B899E4DC48A17C625240A8CE71664B29DEF9E829A4000065F8BB9A2252E84A49BF9401E43485A40182BFDFFDF6942940A4ADB80A6ED0769C72C96A278E21E3261C6CEB68F77CF18828AE3683226DEDCE5F749A5C79DEC2AA792FCDC8AB5B4B25C9578AFA126CAB61D2E0C424CD500FC51375CF31EB9ED0569B685A9AAC3B472BD386DC0E54496DF3D3446C0B3628B6A9A3C6458146CD09B615F0ACE6224BD1F04BB7476BFAEEDE153952894CF820886EF3C168B0C64EF074CC50C1E652F1BC223E91D32B6E68A251312816832A55DD1A7DD782486B7353A25A93DBE2B0316EDE9683C139251A18A1FC8F2D5E85FB112856F27388F3F143916F375A8E52080D3FB97215377920575EE21D304931A225B381D1102A40A84815C18685103673C42E8290024783116CEB68EDB3B892C7957CC84A6E73A8635ECB15CA525CEA87ECABE91AE1B6B9A655A2C204DB0AE49B34C41B84B91579B3C5BFBEA5655E4CD25C54607BA8C0C2D9A80A3B1A36648768B4C69474D3694DA5A8D5C6D46A01A2CD7FC652346AE2C3AF78574726F7F80D3D3CBC4B9E276A66B25E456BF718170B553095B0B9170EE2E552D522C1828C70F0E5EEC530D0196439AB2F565A2E6335705CBEC0B68ED68B11F2BC2F2AE43D52C8263FB8F3AD6F51E1692E867B293B9AD8F5C3365DD6877D5E69CDDBEA510BC2B34E7FC32ED46BBE137812087AEECE652F09EFF2C57685F95183441D77C03ACEF8C044AB0FD8DCD1BD8A115250EB80E10728B43586BFF0C0A31FA812E38B0FDA089AEE090646A7F83FCC10F2E1BC76008722A3AF5A58E84D062E2ACF03569EC6770F04EDA67AFF00068373F82B60BD1E1AE8F5F8F8DADFA633F07AE1A7FDBF13F595641E1961A1AA51E9836DE19FDF522E21889F6225E952251CE62A81725F471D7DC03ABA155158C70153FDAEAFC1E8371DA0ACDBB4D0AEAA9A48BA3DF535B4817202644735851CA4893F63CDDE2D7C560A98A911F52ED896292BCD489ED0ABA42CFFC88BE5F42DDF7CBE9D218BF7C7F2E6E693B32A8A877947B2ECD8ABC07CB9CD6C1DB23570547C605B477B08F5295DFF3E7DAB17657991257B75E727AAC95D53935AEBBC4E0A064515E092BB567132A104FD6739B097291B16D58B11D946BE61D0A8AB95FAF22875F52DFA5E05EBB8B9A970FD8C4B509025E82A29F00C219AC1D1A755EBAE1864724C2B60BBC4F92D8152081DB03C065A8B7BA99688E98BE035992977BD3FC9B63A8C32905500E5DE1603D9E6E7EBFAB12B6BDBA1AF14AD08853205D4A8B3426E193D141319A8A89F8F493F6B554F3F7BEF20F52314832A4884F1D1DA350E5B2A5B682DADF54F1B8A1B4857BA6B3D69A6B88653D24AFF315049FF09A4DE9D557B54EB605B47BB39DCC3FD4C5CB0766DC1B2575C68BDC494D3C01AC77791FB20480049D46AB0E040712C3E118BD1C63CB4296B0CC6838D2179EADD5D8A4F88298164C34809192C28056A428C4951C158D13B3C22E51A95A86A6319DCB4225435EAC2D174E124B76D2EF2F5435AAC3C267454BA7BAC74951A0C9AE3920A53020197FC54908394D82D5A61F3DE3A43470B7E64CAEA0B7D22CE105B8682B806ED76B42F0F6F477B9B56D96C7B79DAF86E9FF48E14866E77F43B52E3C1821A9375ADD8E3DA7B4C6B6FA372C1E5B75DA9EE3AA07ED515CBA4C5560208B2C67694382DB54DADB8E246E76F8C053F666DD72A0438B8C249DF89E1154A85E8A5EFC8AE84E0758A57E72B1D99B6B375868489EC6A591DBDC3C7A43E341162FCDC0362C54000C96A82A17C5CC2CA537DA1891E56496BFBD3446D07E766EA6D578CE26B0EBBC897D3938FE5FB2C792CBB71B2BB348E11768766A4348422C4A2B74445F68C45959DEEFC787C46E419E76E3F55A1C79C1C0FD01C146F4E5F4AE3C7C1DF6CEFA52AAFF4557E46191EF5EE466753498E6DE52A89E03FCAC3540F886690985C220386A8C332CF00BD43F769653B3A58B72E19E8571E4C6B184F430ED2877491D426C67019E731CEC3CCF3B244243BBC1D373FA578C791A5558A4A5B59BF46DFD07ACBC01BC4FCF2FB06AD4B06FE473D7CBD596A60FF9BFFF0DEA0AA6AD816626C197473A931BC74E0B654436BC51B3E8BD900AEB088E6E1C76D91ACCB07720261A9389EC83983AD947F5C97D8B459217B75FE0E6DF2321DA6CE7F4BD11F57A858A565395425F1A8E619A21A8B2DCBAF8AF41BB563617E5B31B05E1D2E92623958C27954F330F07352E23D15A1C156CA7F4BCB64D0E2C8749B4CB0846EA1433293C73A9760168BA7A444B65CC513698155010D67B61366BA693A5FE9EC41C7E1B8C14CDE968146A146360FF3AFD102A5DFD092EC723E6C132C0F556EADC5F14E12D7C562945FA34D814A322AB5F7D0D67AC1BB5CD4B4AE406154F42D0932F53E4ABFDD20059C6E30CA99EC16DE60378EEFFD40EB3E241F7782811FD7B6CCFBBA1DC6BA7A1F385CCF307866D2EF758C9CB57ACF4BEA9DB25321E784A4012AFD72B9AD378849F6096BA26C18AB0564F3F0FBE7F4F1E92FDB24C37B5F073E62258A57D4A65EBB0BB7D3C1EF3190DA75026C2907ED283FA035BD3030609C6A1473599199BDDD82562CB48F7C7F4E8AB44AB2007A84C33417EF8AC241A66F306635FBA4C52EFD9663C372692BC7FF235DE67F30E003BC235246F3E1D6868072266B635B1468BD787EBB7D765800DA5A3728CBD86A03BC8B70EAE3A05CEEF0CE6BC70BBB1CD35A9BA4620D2B2E9F9765BE4829937846B7E97E4B81D6CBF5F2A43E1C1101FBD393FADC8B49587D7AF219332BDD60F6A4D533EECC8B17F28CD760EECEA28D98FF41427B8D1E10B9799F26D9454EDC4F49BAAEE463DE74BD48374966E89B50CFF2809830BF6B412C79873664115B5786CEDB345DE7188009E8DA11CEAE4DFC797DC6C88895E8343EDD2E07B5619805708D183590E63137B6612F50B29C0E1128051DD3899582D936043069F26791AEC653DF2E2A46F152C043F22580BA0898AA95C925CC40C804226660F81EC998AD6C59C894872CCD2E43F3C9CE3ECB0C2FFEE4E8D734CE520D0739D2D94F6AFC804439EBBE4192A5ECF28432A6648B0D0D4DE5D9A48D5EE7BA6AF3C6AB24808382A4AABE6466AF9A788480187524D998FA5E2204923081D880BCB4B2C699272B6693953EB38D6E68810437BCACD411746EF22267C461904208030A8AD4F644822231D2A6DD36D0765E21A12AC1389EFCC5D34042C2DD513568A9D042C2B63DA590B08CB469B7BDE43E8B90508F9679D9E1C12031A1102E3222A09C65E58169984058607EEEC5DA4349FF943FDED523AE1DDE0E4C293118C259687AAC80D0807218525CA4D6A712178999360DD30A336B17EDFAD38304D42A332C3B72C393A991BD5A70DABD9A5628582087ADB3E1F481C33AAD74404D4FB831769590F9A4A37531B67F180FAB943540B951F842B452A36C60F2C32B635FA71029133BAC7C2D4DDDD9E4ECF2FBE229593FA26B72EFB5930A950880D0907CB1802EAB16DC00E4D3B316602F01D3D23181706919BD17827591A5189170D44B631994FA45550354602CB0D30984B21548CA58E03A10639C55D144D414FACCC47E1B1A986AB349DEDB64FDBBD00DA5CC01B090B431608EA616D48049D04612320D2913889786D3BB6D8875571FEE4817D4DA8B8703755607E2A4B004C480F450C246D24C70EB53E82398A1362D13F819F7752433E102A59B8ABBA8D23CCB4E875FBD3133D6857781BA6A6EE7F3660220F5A594EC60DB466BBA26D94D5A0F9395AD86E1774E5CEFFA3B4AAEC2D2577511D61062CAB40C48A9B2A9918554A66A46199507C78698AED2CEC96933E79A225FCDDA14CDAA5C5B1AC00816BB39338DB615089D5FE10AA367435053652736295ABB520474DC9EE8E451423DAD69A96A7EE2CDC85E19976DCA6BD3BE56808384A6CBD56F2F3022D69936B20A3226901B055B1D3C23731F37C917BCCD5E5F7355CDD1945CCB235E58D7F4F4CE617BA226591A6D07673FDCC6CAEEB4FACA5D54DA593B4448ED4E54358D430182B0061E5D4A0592661552616C76DB15481341B5473377ACD5A5940B6515501A3968273DA96E4761D48D7CCDC248CF14526764BEADBD37F7E2FD395FA3E7AE23640B645CB4D55520C9E3A05D044FD3CCF40BB3999809A4CECC781B22D87A3B2276A6051884761636C3420B3732F9E2AA25637221DBA74594A7FC367754647D8511D518D3C8DC4A4C266572E992596E43425F6B57EC355E382C2D299E15CE369B69DBA06B0C103DAD7C8F63BA81344D6FBC81E3B0D38AAE55CA8280987C6B42BFC33AEE04E490727314670F86D0A16C93F0AAE3596170078618E69E02BF6AD6F55983B56C77B913E0E283B3F5BA79FAD976C4B336B32F6DEFBD672EFE324B0F5900819ACD4A9FD7E935D0CDD55499D7506FB51EDDC79A9C5DCA1A4A53DD52A95AB632D3719491A0A92C761DEB6D7D0E3BE1E9E23A62E576806A384B9D8DEB016C681EF7838E9459446EEFDC101DF5B7B99B6EEBE047D46C7D1B3BA1D7247226173189E9766E88DDD26824FDBC8B3EEBE04795347745162EF580819619C4CC438F7595E6BF304A34B1E5165B5327F8A551A089815B6D6F0797B9D753F8B7CC8CD99B73A2AE2FAE7237B2CCED98BCCD2F6BFE72B63B32769BBB4A995823B89C490DCC2D69AA1E4F296B2AA6ECCBE151DB0F9232C226E3250C1F5CD604F4F3A5BBD4F7774A498359B2175AED923C78D3DC62306D41015830F5420FE6947901C03E79765E0D1113089486C136ADCFBDD164C93767F200804792A639D37868C89858A0F6F23C89ED00FDDB4A9EE8DF2309538D1B90A49ABCF1C58823606219E2186BD336AD309BF4BC4FD709EE6492FD152505255E674081D0901471802E3614DC82AD2C05B29BB4DD9C409EB44CB0F238B008E67E88853D63D52B285505CD632C9E47DFCA9626D65A263A26103613D3775F87B576207336CAF4C6FC7494A29EC34B5236CF48A95A511BF04EB23D44FC4C1C984E0A4D5CB275B7CE6DE7771BA3DC4720C15A81C5116E63178451DBFB094551CB213B0FD9EC62B8ADF24FF963BAEE0EECB469B0617050F00448A7B5176E65E2F4D87A2AA610332DB3EDE46BCE74D91FF26FA858E705CD7E49A45C63D801B0905431602E02056187FC180D91E3C8938688098449C3602B27465D653E1FC66A93E5CF08DDB112A0743500C0A027A38173726340B8A134556A490DE5CFD05032854B43C3649BE6996AF34BD52FF9BD599A30507029223801E921F48C2C354CCB534A0BC3449B6631F86CD281A9F91B5A548474427937CEAA4155C04332C383BA488EAA11C82DA110CC409264A06402A13230DCCA2FD1D4995BC8EEEA5850936C35601A91F290A516A93242755C01129A9F4E6E04665A9941B4C6ECC262630401B081C566760B4843C88452B4C7F64FD3850F45BEDDDCB5926018760E58235114CE43AC78FCF03B6A90C4869529908AE9840A64B24DF34D95B9250A9B6DF4D10B9D5D2D836AA4A981F2902716FFA496B6BAFDE9E40860EE9E58DD2DE5965A49001F5592E6D64D0A3AA697AAFDD54FED96C152BA04F0517774734B97828EE9B7737B285DD7E8919C8EDB98E732289C14E3D1316E01C03B8B6DAEA66302495233775F2C731A2FF1619B2E93F502B98416C37594717C3CB8733C9FA2B579428EF5C44CE1E4340F800D15739F0943DDE0BE394920F76D2239E4DB54456C75DD994E2641C266924C7060AC7CA66CC519DFBCACB0964E32EE84FCCAF4F2BBB616FC06A65CC1ED2D4C5D830ECFC4077B13D3829E2924D266202C6DBE795F90077BA27D0F5A596332017479333A5C9200232973C9DD5E3D397E95D04C8ACB6DA671FEF730E06635714BACCAA2036FC5526246DA96CA6D4FB117951968D36A5D635ED1B84A08363AC4DAF1ECE182890883125AD90094E1948B8280A96445E6A6D5E2D5D59A5566CE69E82AE9CD9D516E045895ECF460AE52243660294901C54841C144A2A460B09D38ED9620D53F5DC4A9FE39BA5035CD2844EB1C0C621F4FC0786AE611339EF1B6C256D7DA1591A382612905F49F31C58CFE03A5E202D08E235A2C05D30B15CB609BD609FC7C82841B48D78FD4B3D16E0A2EB501EBCA1AA050C9C04E92A56C6BE2CB884642A6103313E3AD5D583B256D5A8781AAC244B2E6E22D1851D226F6149898BEF38E826B5422BCB728CB3F72F2F0AE859C296BC0679332B0DB49A5AAB16945CD48C704B26664FCCE0BDB2D5A6D327AD08AF446BF0808A6AB6F609C72D58B78A1EB820D4C4BE34809EB15944C20472AE6DA34DD54994D8288F8925E345E378387138486648907749128B889A9FD9F5A2A2610292DA3F7C0272AD0DFFEB415ACF6E7A8A2D535A258F946DC331A28995EC04486DBAE7C13EE1FB149888700D7A9700D54F47B8AB422B9914E16DBB2CA57C97A9D57B4EE4F98BE8BAC20835ABE39AD8AAD2C7D04E10DAAF808108CAA2E81E26824D90251E00F15366235981A0823423E2125EDA784524A5A69875383CA88820C3D54BF36180D95DBB36308417F0E6F4101113E1515F5E435205121B0AA4CAFF943B59BF40836D53FE5A090B465E6A1D4CA85AD40B44F9691F06208115B6E4426641896B109D97C4D3D645F6B007BC93FE7E0828EAA06134AF2DD889679E81842C83D1A6D814A85C3DCBD022DD3EA22299660BFBA520B1D4176440B946E2A92B7E7C336C10356E5451DC504AB0E5D0DEF065D9A3236A2C56A8FA6D92A829AA3DD91DBE960280B91522B43197F4CCD704F1282B885470B6D66B70E9FF0CCA64909EA3BEED2553B567AF0F0B249BE08E8C5DAE96B51FF593D6F9862232A2E7F20844CC8EF6862D986D8B5D458522C443C8419A1903B074429A52832C97063DFC913960DA73721A1995414EB649B80C63490CDAD757014BB5BFF0624BFE4F7507D7A21CE6C3731373514D613771DC60EA10693CD7ABA469A75D996067AF552434873AFD50E5973534A83AEBB8E66D4F48F0A45D2DE11B199FC6DD4AE72FAF731D12EE80C3A450CEE361A8172881E6C0C429191A6650353A0B18F98628B15886C58E1A5A776089884248157AE3ABCC5A2727FDCAA42C31E655B23D4233323920F4E408CD041957116C87E72784E4067132613A0719E82EB7FE791B644D2785375B83A2FB4E506532D6FA2234A40C8B831242BE5AE9F0C0C186FA3F430A26F45CE1AD98276FEB2AE37AC5B4372D26810B53E310B449CC70643DAB3A1F1827477ACD4CC10218D3D112A6818D33B6BCCFC11B18ECB25C1B1A363930A54DD23450D885180134AC32A15E2497865C1237BDE58F0C48A1513B300182E353364607377A43A8319246304586514430F9ED1D3DEDEE928F3890750F7848383F8D1B84C35CCE051000C601CA7413ADE87EF293AAE88EF030F55F8D83EA1E38DB164E8BC1CC1C7A001510CE978EDABD6745C0EDA8029E64235FC3BCE05619804C7A3E3751E5B9DAC0B106A9A7940A8EFAD735CD37101C9C8F2DEBAD49B54CBAADEF71006C23B4065EF6B978A89013D1E80013017BDC75E25F14CA969B854B26E3DDE634B79BBA2A8FACA959B1726557F9D56B7D1FBDC9A5AED1FBADD851A58D311551D90359666A212E7B856127B98D5BFF505300A06547708848718241CB7697804A3844CA390361177FCD5DAAEF53118204E4A60CDD0ABEA80E2241C00EA444A891762197012389875CC419F6E270281A9BB0540438CE2CF20356C82F099181444AEBAE3C7BBFA30139026014433D63C242839EC61A84E6C0454002F9A43D900AB93EE90F4AE3E9A85162D7335DD3264AC0D2F71862360EDCA676E121239F5880564F61D73D26BCF6BA6967BBFFBCA2E9CF6E331D316C06235F2F0E2DC147948745BD35BC29AA289E5BA6D15745E588EF1C05547A5592518BBF541A55BBD169BB1B56B1BC2AF5979451035E10224C484FE2844C30011CF242BAD2A60446BF05AD432EE75349535DB283076C3BCB1D23536BA91AC24A13BF872E1705BC9A7CFAD844DC1DFEE5124C041A7980D3ECCE58292EEB8F03980AB6A684D179595403E8A71543AE6A9312B745FC099CF855FD157FB74335E03ADEE9FBA12C43931604CC3380DE2B16733DFB46606C380B67DD2CC546F3E4D3323F9366F737BA962606DBBD45709CA2906EDE8AB03AF0384A048A30AE3E1AD550DDFDDB06A4C60A5CC3FFDB00CB0E6C40855B55127409A6D32A18F434D3C011D2464FA0118C02531EC5ECD2501D2DC2DBEC2602E09E854A2C4F465F8F187A505EC68F3DA5AB9D676D72C96ACA5EDEA66AD5ADAA75E9C9970C56B85907DFF58B9E481C086C509AAA35CF49453C212EF145B4FB97593350502BB74CF6455F9B26D0E39EBDE2636B3AB07B5ED54572328AB7AACD3CBD76D6E2D5D3DA87DC7C690AC1EEBC87BE876FD20A26CB60E74E01687B872AD1047C300D629CC85AE7D07B6B9B32C3CBBE664D56DEEC02C09D8A273629D100C93704ECA3212FE6108D254805A748DAF11825902C68902342FFBEB713ABF3E04A689AB90A1C1400DEEE69E2E4E03C03772140BD3A236880582B3EB883684C5873393ED68D8462FEBAB7D7ACE5CCA490795BDB8E4D20D0EE5C925975050C016861BDC9DD0BB0EAFCC111850DD0F101EE28C786D55C31B18E7A8FC014E399442A38455F74855457323C57A57ACC43D05C3D8AD254FB1926FCA2AC62EAA6A0EBEF0A4C2AB56DFBAD119C0CD6E1B65CB4BB882B9C760BDC17C84B14EC745E156B93ACC5B01A9E921580164987CFD5DC73918EF9861E0ECD36CDDAD7799451098BA1F0034686E36D7F8351C813041B6427F977FB8A9D0BE5ECF251300AC05084EB3C403E0A0CDD0A714D0190C10368831208B877085A625D070437A6918A69B7D65D8BFF7EC5BC20C963AA3C2E03E0BEF60F6091DE4EEAB40D57D50D48098226579D0B04685165AFE55BCF667D55D9BE241C9A116C2D8830650C30F2B46B4686047649DA82258EF0D1A03023377C0A02F9C983195B600DFB3577344F3EE3DD40DF0517680276D06113363E0B7EE2DB8ECCF1BF66576356794EFB743BD805E7097FBD0A74231F3057AB37D343D2BBE346EE68AB5C4A85E250FC39D49E5467C31DBBC18597349F5BA7698A5681A2E012F3F83810FFAF7A1852805E50BD1DC39CDA37173AE79137A149B4DF376B1CAFD65F3D4B1ECBA323C762CBAC4A4744526D798E179E3111DAADAE7772D99C85772EB2AF76D3486F2AD285C456CD2AA00772E75AFC682772FAD9F99E5BB6BF5D02CDB5538EB95F64EA6CDD3B2BCBE0B768B5DFDEAA92D130DF79ECD8FA48667DED8D7A3D9A73BA10554F5B227BFBE016F7BB2839C98E229A1D73CB963C626CD5498EE32CF51AABAAC7AB152A61A78B3D2BDEBC02B9526249E9D17DF55543040FBFCA244BFEA0146A10F5C6E38034B544F2E4EC39636AD9C1573A027054DFD111E150CC728E1194110F1084C23FF58B08B8259F787FE139645F49F1113E8A85F6D8398A304D6F447550764940C6CE09612FBA88766CAD7C72C996658B78D6F958566D9D88BB6FA192D7087A702D66DCF1475E0FD9E0C6CDAFDA9D08F99E2497C0E0A8AE3D63E19C5F541F968147B36D5A7EFD4856FAB9E890230F5393C07F3037EDC4893F34BF30A12D71FFD3B48C2C8F6807A26E95F3E1AC556543DD3636611FCA28FAE3FD29B3E61D824BDE203A07561D5EBB31A41F7D04C57F6FAEC66F1845649F3E1F5190659A04DB54D324C0BCACAB6E073B2D9908CA27DCDE6CBC9CD26599098BA7FBC393DF9BECAD6E59BD3A7AADAFC74765652D4E58B55BA28F2327FA85E2CF2D559B2CCCF7E78F9F25FCE5EBD3A5BD538CE16DC21FF6B81DAAEA52A2FB05D209492C3D3257A9F1665F52EA992FBA4C4E370B15C4960F48314FEF3BAE36DDB0C17C300451F1078925DA7AD40FE6EF6B2D7572F08112F146EA79E6DEF714F5678F3403B8564FF8F5C13D7BD59245952B4AF16358492A78A2EF26CBB5AF7BF455153D726BCE3EBD75FEC31907F790CF5177B0C751E261603F440890EC33BF4906CB38AAEE637A9D823B9D4813F195EEFD287E6C100815342993DD6B7F81BF5BFB1E8BA8FF678EA0DA82801FD57877E36818C222EF6BB03B602E1556FF98E7AAF39746C8133BEB7CF20B6B7D23B073A5CBF6E96306D5C81333E9136E6B33DAE8FE53B94215C4D98D2FD6719D7EB3341A5880AEB4CD258C2BA216A4017FD78D3669A1EA2261B24FEDA5289601CA5395C6135748B64309FE3648B93AD9B6C3619AD2DA69BF8AA9EFB7C336218C94AA99B9516A7FEF35C2B5D9CC87122BB4FE461F3D77FDE4E355FE3AC88B3C26156D4BE42AF290179442DE6035C6D9CC9307C837CB9A2AF5DB1289A4FF6383EE7F76926D0D17E73D970D6DE5F71C3D97EB5C7F429292B72C2F30D0F098F8D2F7111F8B759BEF85D16F8EEB3433F9B0007696BCD7C8F2A2CAAB04E85F511315E6A4C150764A1CAD455C75367E745729F2E64A5D67E77C376B97ECCD2F24946D71538A815128573514708724A85F96E8F8DC43B9615DEEFC80885A2A80CA232E0EC99FA8CC6DBA681CEA12CED1AB8EA38CA80B4276268BF394C334CB188A5FD1627569C58DDC41A30A93C27D4949369B757D66BB44C0BB4A87E2D327125640AE2748DD3B59BAECD256FAFF90A5E61B798B08A7ABBBCFC0D3F83FF7825F4E2CAB517E78F48B47099CFAE27D27410E063E9AEC8C1FDF17D9316F48C5D9E906299D34EE1112DBF6E2B19A950E4E2F7ACD26F02B2F65B743E443D3BA69EA56F33FAAB5A5CDD57DB8255473A7987148B874A19A830AF3F0902463EB888D6F9B67ACA8BF4EFB274B1257192C749DE1F1D0E3DFC1F70EA3FF171FF6E6F843E2EC440C0FA8B3D869BE7D57D2EECA2DA6F4E5A043037FAAF0EE19369B9C992E7AF05BDBACA854E72256EF38A065DF6891CC5F92514475D17755DA7EBF8E764BDD41D8BC243E5E9AB8FA3F6C24626BDDD0A42433F38282994892A8A7E8913354ED46EA27E36E5BCB698A91C0E8FA96AA83FD646A4B900276F469802072365BBBA1717DFF6DB949E247942B8CE84DB540C77A9BF38785156F2716BFB6D2E6DCAE45415110A456E3855548A656E58B9D54BC2CB97BAC8BC82035C810B3E55EFF912178CEA9E8B65937BF5926D29AAF4F69BC3FCCC175BA205E52B087C893B46480389652EA7458B74431217929FE2791157E481138A65930A7D68950EA1B912076D9ED3DBC39C32CFC10BC56A1CD17A3A78EB497849C8CFADC3E2F0F1EDE8EB8F633DB509B371771431E26DD19186D93E619B56582AEA4FF6387E4BD11F57A858A56529DD5C15CB1C769509BDA47A53250570702697BAE94C59653A69B8B2A457720505D77D9DC3B516B5F8716971823B8426A756DC406D0EE318CF653F4CFBEEB23B3BCEE2839FC5DCA3F55EF397C1E03173B5B5C799B3A4491143FB2DCE8D3837B8B931605278CE8678DA1CA7D7514C2FCCFB655A5D24C5D2D772EC10F8988C9ACA234DB820671D3FE719B6E264BB93FDEEE0391E9CD225AEA671BADB4DF78464CF5CA0745391D3980FDBA448D67852B6B9EFFD548016A957C60837842385440C3ED0BCFAF84570A4910F4EC1E76841C4310152B649850E0AA77F2C10D03D62A117DEDF926CAB46DC943A04845449B5159C6BED3787CD39CAF076BE78060E9AB9120719C1922A6706AABF391D021159074E80DACF518947256E54E281D57740C5BD5FD6DD2EC4A174AC1319C21544B510D542A71686EA8121137FF299BE0BB983EBB3D557D081EB2B773C3F40787E70C7F32384E7C7A94F80CF97CB0289C7A1DDC7A8B7A2DEEA132BB4EF3F7869ADA6B64F7A0555CD916C9300715931B7619C59EE193FDB23F97EFF3D2C07A88CCF3F2BA80DAE912C88A031DA01D27207893C57C720FB46207F2CBF6ED01A0F25E885924BA3068A1AA8D7404F64916D45CF57ED70487C748D01C1380A669CE0F6F041F84CF4077486148D0B3B7CC736B53F93AB6F03673687C3F7FADDD4F37A9CAB53E12F24D1BB618051C17E77A10FC2D57F75A36BAC4B62635CC11AEE28FA429344259938B2ECF7A9C3FCA3863E780D3D7CC3376C8B37C3A66E57B661EDB36F4A750402CCB9CD0BE19E525C4BF7BA941E1F858BDACEE751B8E14A2F887B6B3EBF5618053646CE81D077F82FC9A39A22AEEE63540E5139F4499D9A87E7BD140215299F3C4E70BD91BC4D838356C2C4D801817FCED17E216C91DA316DF05B7B3AAEDFA76B5C254DB2BFA2440AD0910AA3228A8A885344CF83A2AD190CBE3A69DA38EA101A417E58DBF5316D79A734C70E2994C912341020EEB4A20E73D161DC0AE7A9C5381C1E7ACC507F1C4DA6C83CE29572E4720DC861F7D11E0FED3F87A4FEE2227931E1489CFBB65E96CD264B17F4DCC23FE93F8FC4C7BB624030CEF4C74D4159A398CF2E37042AF10CA7F9E4E2642E1745BAA9A4144B5C81D3163291B690899320CFFAB441543F87AF7EB6554E9FD31C16342CA2F151414614239D70057A85E4901E7EBA46D5B658038FC3759F5DE84A1E11304DFBCF0E74E552A6D03C9ED24795C68748A695B767FA43FE0D15EBBC48BCDE19D0D61E477B917F7738DF0D719EC8FE19E6B3833135C2BB26719F16B58AAD56A132EBFF60532DF23EB1D6AA9AE3299461C17971321CFC64B85C6DB2FC19799FFF36D57D8E5B9455C7990EBFE4F72282E6933D0EC62C90920FF045F638FFB24DB2F4A171D98858A542075AD11A78ACB4FFEA10559B14699564F581B788502A3C1C8B67E82E7077928E8748A11E36529BA8E7AF0F6FD3A212468B2B70387FD82072E491FE3D917D7E6299C31C2A92E596D6BACA12314E422AF4C12B9F5188652E91AFF8578AD60BF12C962B7090BC027D4BF36D893FFF0D2D2A01A95CEAE02E4ED68FDBE451A493F9ECD0EB2C5DA56BCAB00BF26E8BD877B9D80B3770222516DAE3652E8F4157E0806237DC24D9900A315BE686F56D91AC174FB259299639E8586C0C083A967E7138ED0F944C23EE20A3D16C6D3463BBD1D35EC6353D4C65B0D6317AA1A2E728CE7B8A699E79DF983A64E7EABF65E6917868031382711443D3AA8884F9ECB21DA9B7FE52B41FF33D4EE13885C79BC2C3E6AEFFA49D6AB68EE1A8AA1F31924E80BAAF876264EC622823C9914A2E97896151ED57374CB7B98C877C7389AFC2C6D66D9EA142BE3F22964DBF998B66625C6328A6D95E9E5BA3610F877ABF3117F78951014405D0619AD5C8FC50E4DBCD304B93A2F0373715D5777F8748FE1D16BB70B3C5BFBEA5650EBC452496C5C91B27AF38797FC9EFC92DC861D3B741E23F819508767F0A8788B7F839DF16F2EDD4FEAB3DA6AF78D34BB6393046B9D401F3C3C3BBE45981572873C56AA05A0113AD9AA818474946FFE89F39A8AEEC958A1EAE788CDB9A51BC7A71E21EFAC4A549143E6CD365422380BCE62F87C337B986BAFE38B379175EC2199E7631CED0E39AA1C353E0F09886CED66953E2D0A6E59C36CC6787F38480A960389680696AD8427BBC34DF8FAC2498CF5153444DD16B8AEF15B6F3922CC04D6F08958FAEB042339ABFE25B0ADC7260BF3B885429636ABFB9617927A58BE8BFC6E91CA773FF52045E599BE5C8F79D881E83CF2B11BADA232DF001EEA25C2565F9475E0803DC7F753826F87C2BE46AA8BFB848DBCDCD2751D2E8A7E8878B3A6394D76596DBCCFF591952D9EB3D19B8E231FAE13EA5EBDF7944F51787695596175922863AF55FE70C75882AE4E055C855E2FD2E15A9EA739E09563B46E5718BBE571075EC77376C20755C41546DADDC175838892C4A3B46AEC41E63BD2C4A97E2BBAF51ED46B5CBA9DD73FAE2094976364001F7483C55B10EC148AE1A70D2B94EB79E7608575F628F91F0407A95298F93D788EF7827EFE0893B68D2462B6AD7AD8CA80C0E5F19A0F512FFA2E77EC34E61004C3EEAC106CB387A22CCA9C9657CB02CCE3DDB38C41255ADAF7FD8E4835079C528DAA0D9E5E9373C52EA225F3FA4C54A1420E6739CC47112F70F30A315B6ADBCEF57B4D57D9E5E56561D6782DE2070BFCA7C3E149B9CBED201BA36D902477CB073932B3914DF6BC053E0645D4F7941E1F59FA3328ECA5852C68D4E1AA8931B2C0354B312C3317A3A626C489CC9D6339958FEC47B3D28468447E2318F4D08C699C6E18EE25AFAA17D553C1BB0C077B0D3EEBC2CF3454A73FE027E09BAF1BFBB78227F5C7E5F3C25EB47CC3DD0EF0083CA8E05D09780A7F1523CC60231DEDD26C523825C1A56F34F4006893D6158478B379937F9B600AF9579AB092D5D17F97A9992313CF9587ED966D99BD387242BC5D969EAFCEB33501ADC05E673BE46CFB745B22E1F50516A05460495A3F4987207B1E1F10E1C8F1669407911E81B26D6E3C88BBAD7664169D50E6EA84AD2352A44904EAF355FBADF65FB814842F248965C94957DBD9BC5135A259411E52659348EBDF76951925C76C97D52A21AE4F4A4BD34F1E6F4E6B9ACD0AA96BC9BFFC89ACC521DC0E7649D3EE0AED2A7F5DE9CFEF0F2D50FA727E7599A94C4AD913D9C9E7C5F65EBF2A7C5B6ACF255B25EE715EDFA9BD3A7AADAFC747656D216CB17AB7451E465FE50BD58E4ABB364999F615C3F9EBD7A758696AB33B17A83D60ACBCB7F69B194E592BBBBC698408D7880F1EFAFFF1D4962D08AC7357A385149D2EB33B1E26B401A49EB6F4E53C2543A833F203CE66485BC4A2A729B06432D11A5F3F484085C729FA14EE8CEB4E86BBF6DDDC0FA5B5260F5559C9E7C4EBE7F42EBC7EA090FD79F5F3A2325FF06475ADF6E6358E158FF1D7A48B659C5DC0CF4C7454F8DBB875686607A8B15104D7B58A358A245BA4A323279F05F259D05AFFE190F3B5654B8F80767FC75A09A2044E254F9E9E37A89BEBF39FD5FB4D24F271FFFE75D5BEF4F27F43CFBA7939727FF9B6DBC2AB6662E31CFDEBBB5DED754B56F374CACC5DC3018FF5DA5443CFD70119BD45EB06DB8C499CE6A221D5085A79131A26BC4F7A949D459D3D9469FE285AEC20BD481A8D5A1CA8AB973EC3673BA8A71E21CFAC4B948CAA71415ADAE3C9099D3F4CA63CD682B0E93FCB9D7AC38F3E3CCB79CF933CD780B598C7320CE8191E70071AE1FC89237CA76B9B9241F186BFB1E655839E96FE20726F7535256F4E0930ECBC0A9FCB17C9BE58BDF5DA419E82A936AC47147DED51CB4278FBA6DF7755B3BD407A4DFDAC088113C8D5D904468E5413214D147D887ECE44942D212337030A23873F760E6B647FE073273DBC870B795AAAE35C8046FC326DC1AAE6B45DBFFD067D901CDB03D5D1BAFD1322DD0A2FAB508BFC78853700FA6203DCC3F903938DB2A37CAE1FBC7ABE0284957CF1F516FBFB698FFCB2AF9FE5FDD77FBE468990A90C075373C97DF376941472788AAC0E6FE235A7EDD5621E6741B6D1D1D05510B8FAD85B1E01E882286748285C037D506A9E231B4E6F5A7F0CABD3CDF564F7991FE7D981B32CEEE3D98DD0776B2BFA75B9D8F8B3EC22F94D4DC3CAFEE73A79D939D2C0E373BF82436FEDE4A322F68BC6527C4515B1DB6B66AAF3EC80F10EEADC69A3D18E8EDB63FB60C1D197C83B26C34E471C6EEC18CD5DCFE39A060A2DBBCB96AE3B3B1E8AA0ED94A7FD9AEEE87ADA690A3C8CBF7126442DEA67DBC4A8D80511BFFDD3DDA6BC51E8D865745732BF1F745BEF28E68E32A0F26C39F177CEDC18470C6C258237F9B7BB39DA93A50F9F8B39CAD3B908849D81DC0E7996CCB617E8D77F9624BEE71130C43146E8B67B8EABEC6CCDD900B91E46768EBA0433E4E5C5E4F7B2FBDA1707FC94936AF106B5AB435E7B3352199E9EF353B466F7435ED8D2D7B5F1ABD947C5877779BDE9016BC43E5EBCA83961757C5364EF8B28D80BB6B49BB65EB096FA442D3FA5B8AFEB842C52A2DCB30578C6FAAA4309E6DDA0D785EE9BBFBE797CEDDED5371EF9E4F342E307BE0CCE0143C35FF0E43C98FA25D77E9A420CEAE3D985D6F93F5EFF31A4FE33B0A491FDD1BAD6BC598E363980107B4A4ECE1417C9C267B304D30639769759114CB43992C9C0750E9A8B2C2F5739EE14562148B6EA8C3332E7E71566B6675421E2A59A0745391D39B0FDBA448D678A2BD431571D31CC64C670F597DA6D0D5C72F43AA5F7EDFA005918C9133C2D103FF84664C1FAA341854BF25D9763C9A6FB006DA964348C57303EF778BE7105398CC069FFC44A4D6B05B91F514F471AD3715A3AA3E56557D204A7AF881EC2E86C074A3E43EB599AA71721FFAE43EB4D93CD4E41A652B559F12BE1A09EF0FE31C6AFE181AED28879AE7CB6581C21FF245DDB507BA0B7C9C626F3557B8F0A598ECF068E70EC041F91511C75DA688608C58AA3AFD687BD6DE3B010EF66870F618F2A19E9A9163EC27892FFE587EDDA075BA7E143C6431A467BFB49EBD9EE19FBB3A54E502C79A0FBBE613280C9E09FBF03B1C8A36CAD1CC567A9BF0E027EBCEDCA2DA899B45F476DAB8A6C56D3E7203135E479BA419C827E6B5887CA1E29364F2DD1F2F7470F07DBCF173A8EBC1FCFBC29D7BD4695C45D63E7037859299469305F3B179670030DEFFDF0FF74154987BA03077C69F16FC9EE2F806DC0EE457D8816C03F46D53F7E69B6A51C31CBA86A1037D204A2588A40D8F2B1C37EE319C05543BCF0379CFDFA76B8C224DB2BFA2C4236449A81EF5CE51E89D838A151F39DC79E0F3E47BB22B9BD15C993BE8226E08A3DA34AA4D6E9D3C10C5096621F1D8E84852E18C8332D5A4C626CBA61027E41E4CC8F3CD264B1754351FCEA30BB82704BBF22916CBFB1055A0B39D77A85C14E9A64AE5ACEBBE194F93303BA8FD7821222A927D5024DB2AA7CF8B1E5650F48CEFB71CE7535AD7A8DA166BE0113E2F6CBF96C9230A3127E9FB8C035693A8C3F640877DC8BF616D9113D57120EA8BFCBB8F79718843C2C791D2551C16BE1AECC598B88B3A0AC5D188DD01298D68C41FA31C5FAE3659FE8C0E65F5FB25BF775F4268A541CB07634678243F602B0F22E32FDB244B1F1AE7CE305F081E13F9DD56471C9F9322AD92AC3E9F1E866A6FAD9A1136743609C047C9FFEDACB8CCF9CFFFC9FDC9056540F740C46409F8FAF0362DAAA7C1CBD5CD0691238FF4EF09E4021CBA1E7C2892E59662BECA92859380B9A1874E1786622719C28A14AD17F2F9EBE06C0F05FA96E6DB127FFE1B5A54C1F17F4AD68FDBE4313CE19759BA4AD794E517E4F598311B0861E93097E2E0FB7E43E9250D901C50E3617F5B24EBC593ABDD6B75AF83DA2D61718E947224EE568FC4CAC716EE8118F87B6A0846FF529CB14E33B6B161C8F6FC7076E74DA7DCB7C85DC561370B1A5F8747B45E5773100171F61ED7EC3D9069BB23DEADFA71248F13A2A6DEE0F7E1F6D0EE08F75E1A10ADE89D7496DC570B82E8361F8C062B81E4F936CF50C15E28F1BA193DCE262D9A8E71F1A128DC1E913B90B5674FF56E9CB471D23A4DDAC662FC50E4DBCD814CDD99777B906FD72BA2F0668B7F7D4BCB1C7CF428E6FE39F029F94B7E7F7D38E181334FCA99E2337ECEB7C5A8F749BFE24D2ED9908CDFD0C3C3BBE479A26626EB5534738E44A75EA3C7C34909B4A77B935D71E7C5F9BAFBF395A629F8B04D97D4397618D3160ACAF3CC2D1A683B40500CF112C4A9B46F53E9A0F2C8D09E0D4DF7327332136E743CD3B9F4D5079142D3F24495700C2AE13B9979497680B7A8F1CF6FA97C83C0CED1D0D41C348BC81D65F7C6EB5AF6CF0DC1ED5AA56B88D3F850A6F167BC9437ABD081CC5EF3C50D9F8DE75552967FE4C53238E29BCFB7E1931C7C2C6F6E3ED94B4B746A1DEFFCCF97DBEC5076C77BEAD4FA94AE7F0F8EF4A22C2FB26477437AA276D803ED7095CCF69254D40DB57B0D7DAFDCC9B672DC61CC1E545B5D363C46857695145834C98CF1D8373275876CE0EAD5DCBDFDB65E3C1439068D7E4EDF36A139C20E43B7FB4E3ADD74B36EB8E6A65FF36DDD41449081F47858298F13FEB826FC814CF63D35E476DD7C8993791F26335A2FD3F5233DB13BAC3397318E3CEC0F4FE3935D71CA29A6DC352A51D57AFFE39C0B32E78245315DE4EB87B458B90C7C9C867B390D6FD10A9B39B35D65703DD4439E9BC2AEE22417BE5FEE96894CDFB018C9B4A7B8A777D2FA454E685CB3333E9093ACEBE91D75ED91E8DA4619ED87CADD53B7400CB438924945CC66E2733DA8808B59CF9B5A8EFA6D61A2FFFB20E7DD7959E68B940E7C83BC896E6C63ED4B61EA5DAE972744163AC096861B943DBCE8BE7DDE66554A1E9FC36DBE397DF9E2C52BA953122682C106DB3F48A8F0A447E444384D32BCC52DAB22C1A22D6B8874BD48374926D02FC059EA12C2D20EA358F20E6D484EF5750574D0A6B9FA7C1B6EB4C32DA836130F5E9F31636D250237A8AAD2F5E31D1CEFEA25085652405B85B0754507230F757F6C5A64EECCCC22131749F994A2A27DCE772AA1109AE5D04965FB2E166287F6482E269607480E0E66FCF76ADC79994D91DA5E7018BADDD6082EC334834668EACC261964B7D0DDEC524A4307C08E5FFFD1C97E242D7278EA0FA30C3EDCB171469F76C3CA5E646EE0CD36E684E63B204AAE1F27F6994D3A4EF507FBB9DF36230D368428D080CB3D1A6FB0ADDB6AF7F1F30EB62C9FAE9372D706DB7AC64D39D8EDB9F32C834DDF3A9E569DD3263944CD97BD57E8753FF642A353523FE58F7700CDEE63651C6EDC928C857E1C65D0ED0722C488937ED8B4D53D473EE34C1F57A74F3BB5A7D2E6F6D234AB2A6FB76CE30EB1C3360F5C07767AA4876FFDA618E7D647D7FE6174E5C39B69C52EDAC2873BA117DF696B1CC66D6BB70B6FE89A4D0A2EBF2F9E92F52322C93CEF602E8D21016CB31C32BE60EF6581EBCE5E0844FD568070BC4706482D146C0D0AC949875CEAB04AB095D568C7121489F429D60EAE63360D3204CE2635CCFB9F461FBFE7A0EAE484699E43C87D1FCBAA701FB18122C2F66AB74D8C022DD38A3CDB7A4768564A042D14C7CD494F740DF1F2C47C1E4543C8BD1A67C4998ED8B446C89A71FF406E742C50BAA9C8AB4E1FB64991ACABBCA8135CDEC99D18328EFA2D868E1061E7A1071D6779711BD4C17B126D17AD6C138C62E7C4EAAEFB4B29553D043BE6CCD7E13265254D23C9918201D38A9155DB1DF4CE4951A39C9A22CDE174C0E1DF6BDD35440CE6D7644DF59D3097C7B58C3C2CE33DB38D5CADE1598DA3E6AAEB1C7BA4F6962D77B2DE7E1B7FFF3C8528801789154DED486454BB79C72AAC4CE8C5A009BD704A1A20B73C04B5F7FE3975DFF6C359A71422F84EBD9736985082C239655C54C1AC32349FEC3C1116B50EEA3BE5323ACC98D00A0F47012F3142D16816CA9471BB7C9F6C6D95B917AACFF91A3D7762422CEEE91628AE6D0E9B50B2F70B11DF1F9B06D991D811E19868D1F1948ABD5C5CDCE5624764E1368F6A6217C4A11F875DB134347D183EA6A3D81BE13447A8E93CA6D131BB734447F368C339ABA324D4208DE22911A6EFECE241E710DD6661D4EA68358761340804D7A0AC8AFA92716E964C6C6C74DDB169B01D93F9C29167719CA91C1D87E51CDB3B77D80C0EB0F9246142BDE02A080D69F3EE445A3D465D16339CB7CCBB6A4C7EF6E2BE7630E3B2439232A50FC35D3AF6D787E1241A3B220FB779D41BBB271CDDA8EC8C9404D419712BE22F16739B1DDD8D2AB28E58EE52C3FA40E7531B53FB409D2D8DD937279D7444C9D81DC9D81DA9B8CDA35CEC8E5CECC2A9492B19E4D6B24DE2ACC0516173A6CE9A3E02CC2D77D6DCB27149DEC96962D6274AA9C734C95FD865BFEF7B6A3DB63336CDCDBD1161E560C2CBDBB389C2A457B71D6561A79402FD5B290975A93474FB210340D77643002EDB37CF6619FDF7E93AC1FD4AB2BFA2A4A0E3AF331638686E0085124789300B552029E0C99C4A1AEC769B2C697367E7668FC446570A8630F0C96E104CA6223C63BEE7D514EDC533E6FC85E940904CFEFB2024D327727715935D38206B85A573BA4751D9455199FF4CE47C5BE59FF2C774DD86048D9E11526C91970DA970BF33444AFDB1938A3933457EC8BFA1629D1734B318914D8DF1D196735BD3F69BBD48304DF2B91ED8EFE3EC4CA10E8E230A6C67AC36A63569F3ED4B579B2C7F46E84E49F8B011D46E4A9AB679BBB6FB384E3E0EC7F119BA31697B63D31643DBFCF2F04B7EAF940352C68E19FDBDDBE32E756707C61BD334DB38636AFE861615A1978C364CB7EF98E9069F6F58CC35CE158DB3FD7419A181D22074C86AF7D99037B760DCD5B14686D82A20A8CA431620211835826AC2B1B733022855B30FF90C26C0F41230B101E02206BBB0FE37F47E28F2EDE60E24DE6FF42C8480B609E16A0AC67A3AC27A7CC28842DD1B9BF69A0A73CB0236536802EA112D42BE254806BAA27DB60E85BEEC898DD88EFFB4DA603659985E23B8C8C38EE88476DF30AD4CCCB669985E265CF60C73CBC4357A24279833988F75CB42E8FEE378670D131B8F4D5FF6C576A427A71FB6E932592FD00C01707CD3F269B958BEEFC75150A76C9A9DFB340A9213EE9B3E0CA283520EF07E4A8E8605BB253F5CBD191FC7A9B0C64B32EE5CF32AE82387FA4772E4E685C7722080BD7FFF10EC96A59532EF7388A0C00C7F48CD70297097E464AA27D6BC6564D6B7F5AE129AFF6AB9D53C7FDC14F3F771EA4F0EBB9944C888547F1865C8A1FE8C33E8B41336EDD424CD3BCC5709C12693EC3A4A86C94FAA90BA538DB6F51804186BDA2F2BC5DFF17AD6313FA7015B84FEBBE1E36E1AF4BE3109155BB4F742C074C64E14764B08CE81203E702415A3B86F6201F577A784A3AEB22B222293CEFA9EC45184C66E9705C27A60A6170502389F10E006D2F523DDE5B6DB84D16F67008DF2120195EFF7FD0CA84BD6EE879D928E715FE3DE1DD1986AFFE82B19B36E1FAF5189B0955B967FE4E409AC2924036A52380C8100F65A36C02EEDBC70DCA2D5262387E837486F72B6802D1C7709432C73C884D95405F18D75FD42207702E1E87A64D35643D76C32410492905DFB4326F13CF14D4ABA872DDA736F94D09D3DF04B09E2D0FED4AE1ED2C6A1FFB83F4201F77467C4A2AD32916060A3073317D7A9700D5474D78496E87D5A94D5BBA44AEE9352160B52EB0655FC11EFE9495D001DAEDF2C9ED02AE940B1BD85873EB9E70EE52599015BC11FEAEAAAC63A00739B1DA8A16929D791D4B604D136CEA45AA99B9620EDDA56B7C9B4D57EE09B3236515B8212FEFA738BBCB11F6BCCF50F03DAFEA05342DD1781E8FB620BCA6B0D04525F17297B50171B9A50A0D7A0B642DBDC7195F036DF41C44D990DE64F393443FA22357E5A6C9249CD44B09801B6A2DF3E3451C75F4A4DF1C5CAE67830439342BE3BA94DA15C35F30430133BF904C1324FF9F2AE5121E370C35DFEAB4BD3A44953F3358C030975050319DCB38112015C69DB74F31E72DD220761D196A2110D7633270BB44C2BF22235C442A6B0E31DF3AD651CF3C9B82CE8DFFA06560B7D051D5986AA9EA43A10E9459E91301D25764DDBB7D5F943E495A42D5129930EC0CE52807261A86C0708D6604D40554C84096F30C9D408004A1204381B65AE695628D72A73EB46F57C07397D5BA0A4DC16FD92E5C25CABE1D68DB3DA3C7621A339839017E9FABBA6B106C206BF52B971A5A6B62CD59690FE4C6A5328D7B42A409A067443F6BC74AB065B712240DB32FDD18EA000636A53CA9122B72A818036A40C6652C26C30BEAC86D9D2BEA375CF7A35CC429994519B4B44D6426D89B29D0EC224ACDD55755952BBA2B6959FAF7BF1EC0A0D0DD01B6F126EFA15404BBF9B376BDCCD1668CBC601B4EDF4976EBABD1B0767D7AEBA41634B9636AED2B05537D096DB75A1B938AAEA47536CE84C0365D76277354DD566076068B583331A318FF0FAD21628674E0B60A3E5FBC07A58CFF7E5264DDF43BAB4AB5F6544285B1A2C571D384017D8FB4260A04686414DA613A655BD21E34ADB463FD797191A9B8985309A69B5BF17B0CFEA82AE85D667DCDA65F54FD3644940E3AFFE0CBB9F120B3B4F8C9A011B6001944DB140D68D6A1B3436666E083AE6975B84A03413028437EA1CE85419D0401018EC9F03414D667D777C29DBF45D5167D0F707A08D41DF7DB06CA63B7555B6D641181BED202D9DA9CAF9280228E6A5082634CB1C4548BB98F6065F797AC280F19B981E463C1F012EFA757D549E3340F5EA286A735DEE5C0503DA77B43979E86E2CAABB2B428ED869EE6085ADAE3A2771EFBE70FAA1EBBF0A343C0314C73BB4BEE9B8C69B05165D1FBFCB5057037691671EC942AEE9AC0C1C84FC19479A28C2FE9220D0751E404DB6789246E9551D9201515F4C2DF0E4CEAF6B7DD4B2A26B8AB0663EAA8C319E2881901DA4084510BA055A5003BA56B34AD335280ACD95F793768D1EF069255280184324B9934F5A0D3ED7F4EC1EDEE634098755DDEB21061329D7615C767D35C805E73B7A2AA9644A438AE478A3D5EA7D5587B8F2905D1A79ED6BED95F60F9D49AB06D6900F2E5E8A55CBD758F0E8387BCEDE3F4104741A061CA3C3500001ADAD8D09F01873F6C0BBB5DAEA836F60CC95C01A16A88EE96B5E98CEDBD5B8D47802B0853995D759BB105870F2391C40B801C5A00B23F0908AEEBCF8AE8E2000644100D1932CD1AA1F672920A1E6923AC6C04787EB2203EEEA5620D56EAE16B06382F6B7099C681605A7B88770ECBB63E20AECB9C7D452775F8A79A03D55C63158B1CE8A69E34B5B53E421706DCD89BABEB3F2C86A6295CA926042EAAC6914737B5F4AB3268920E3AE47825BBBDE072B1CD3DE8636F00C98CE4AB3A83586C9660C6262CD758B389590ECEA86C4855B8A5B637EA3BF6BACE2E2B1EEB8590AF0480D1D5423F04C0263CF6ACEE8A3C9DCD9C1058ADDB14FCD43ECD0408F31B1C060385A5D1FDF36940D9A490303869F287375BD7F3ADCDC7B0676BF475F98E5027AA356E0E183776836DDD01A142262B5E921408ED08D096D90B653DCC508D025A6801C492B88573D7A0952DEDEF070DC5A9A5C9319592A5B21AC7560693A4D632C4DD3654E72D86755950B00083CEE6E633AC1977B68B20640E07D9EFB7CAFBAC739CD0CE8410F531A6E736B59E841F75912BAB31E22DAE67550073E9A85382D231C9870980CB8CD1D5820011F0813C879AD214248013AA2FF69A208A1CBFE3E92CE1B09810539E6E54F4BE52B56F561A9E6D2D4B02E6B4F8921B8510E8927EFF6657D8948DFE74B28339E48B64CF00E7495BBEE46FBA198D730A09A7CF0461EED80F6869D0FDBFC237BD9ED8C72A095B061C7DBE01A1EC527DC9E0D31FB19A6016D60B7AA4A78553727633AC3DE962D708503618A705D541DBAA780D4ECF83D42F854F7606B0698AEB6BA779FB9B87AD75D2E95FB0E81699642FE866BBD12C23757F9D000F9266E1D1CA0B95DEBB110426FC0436BA1F1ADF8A1C4F3EA55B8B25B6B58D57DDC01DDA6977135DD055E8764C8642EFE520A81ABBD93764BF5B237D043AB47C0FD89E76AC2B7996F9A1865DDFD646F16B46F58AB7B0EBE720DF87300478E4D67A15E06EC9E61BA1A9F750E3A5B27E932FF2CB1BACF9AE78B7D8986EA71F7CBD9CAF09D71EF6EB32FF0AA3BAD7CA77790BA822FB6B39D555D551FDC5DF3386B9FA60D39D253765F7C5BD5ACB847EFFE245A1B7846143C8CD43F361A54A9F1D9151A0F369836C1D3FDA0782D53E588B0795C339CE309CEBED06F740D7914C2B084FB66CB18BE926537D51DDC4556695F3F04AF78583F97286A00CF5B65BABC1935676CD26004628DEA4A93E5A3805CC7DCEF37CDC50AF6493B681951BD78271C40B0C9079A9307288F002F378910F802A6F0F0EC12F37C9BAA5BAA17DEDC89946A48B90802764D7CA54CD13DED636601BA28A751E9EA6A72A304E9729B0EC5AAE3F083566067141DD95556D4588D4CA0601A0346241B2276BE2E23D54B4B50C795C0613DF49A3C3B3517A0F25158A15AB3EC9E201AB864CDC306F5233AE05640051C9211BA6C47CD8E0002181EAB273E190305EA699F95E17DEF701AA3DA0BAF4F4B04E2011104E836FC2A8A26E783E6F99400660C9C81A9931CB62874D7FB2C13C6CEAB9ED0003A0276617216BC3EABB174EF5C7465AFCFEA1C56CD07FCB3C2FBF447D204CA4AFAF5F5D935C962B642F5AF77A84C1F7B14AF31CE752DC83DD216E6E3FA216F9FF810286A41DAE236440EEFD89649959C1755FA902C2A5CBC406549732FFD96645BEA14BF47CB8FEBAFDB6AB3AD7097D1EA3EE3D618F24C88AEFDD76712CDAFBF6EE8A162882E6032F1EEB3425FD76FB769B6ECE87E9F64A530682A14E4FD910F087FAFC7B2229E93C7E70ED3977C6D89A8615FF76C4AAB39CAAFEB9BE41BF2A10D0BE127F4982C9EFB5DA90A89792078B6BF7E97268F45B22A1B1C7D7DFC13CBF072F5FD5FFF3F11427536FC840500, N'6.2.0-61023')
INSERT [dbo].[PARENT] ([PID]) VALUES (2)
INSERT [dbo].[PARENT] ([PID]) VALUES (3)
SET IDENTITY_INSERT [Mail].[MailAccount] ON 

INSERT [Mail].[MailAccount] ([ID], [Email], [Password], [SMTP], [IsSSL], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'dcrUxgs/8Bqi2yYJFn4Nlz9wGf8EEbyD5ZzE+hYTXCg=', N'kt+Qn9wKwcFDphVNK2KZlg==', N'mail.mohamed-sadek.com', 0, 1, CAST(N'2019-01-07T13:16:59.570' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Mail].[MailAccount] ([ID], [Email], [Password], [SMTP], [IsSSL], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, N'5m3pTmwR/yyUTvhT2sOYS1DeT6jGOqa8', N'mJWkEru7u3xDphVNK2KZlg==', N'takhfeed.com', 0, 1, CAST(N'2019-01-07T13:16:59.573' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Mail].[MailAccount] ([ID], [Email], [Password], [SMTP], [IsSSL], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, N'iZvxwjGrHLHfwZN5GtpstPHY3YSLyweu', N'eslam147', N'smtp.gmail.com', 0, 1, CAST(N'2019-01-07T13:16:59.573' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [Mail].[MailAccount] OFF
SET IDENTITY_INSERT [Module].[Module] ON 

INSERT [Module].[Module] ([ID], [NameArabic], [NameEnglish], [Link], [CssClass], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'Accounting', N'Accounting', N'/', NULL, 1, CAST(N'2019-01-21T13:49:31.973' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [Module].[Module] OFF
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, 1, N'مستخدم جديد', N'New Customer', N'تم انشاء حساب جديد', N'New customer created', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.717' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, 1, N'تفعيل الحساب لمستخدم جديد', N'New Customer Confirmation', N'تفعيل حساب جديد', N'New customer confirmation', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.747' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, 1, N'استعادة كلمة المرور', N'Customer Reset password', N'استعادة كلمة المرور', N'customer reset password', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.747' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, 1, N'تغيير بيانات الحساب', N'Customer changed data', N'تم تغيير بيانات الحساب', N'customer data changed', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.747' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, 1, N'تغيير كلمة المرور', N'Customer change password', N'تم تغيير كلمة المرور', N'customer password changed', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.747' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, 1, N'تغيير عنوان الشحن', N'Customer change shipping Address', N'تم تغيير عنوان الشحن', N'customer shipping address changed', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.747' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[Template] ([ID], [SectionID], [NameArabic], [NameEnglish], [TitleArabic], [TitleEnglish], [TextArabic], [TextEnglish], [IsActive], [CanDelete], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (7, 1, N'طلب جديد', N' make an order', N'تم تاكيد الطلب', N'order is confirmed', N'ff', N'v', 1, 0, CAST(N'2019-01-07T13:16:59.747' AS DateTime), N'1', NULL, NULL, 0)
INSERT [Template].[TemplateSection] ([ID], [NameArabic], [NameEnglish], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'العملاء', N'Customers', 1, CAST(N'2019-01-07T13:16:59.680' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[Page] ON 

INSERT [User].[Page] ([ID], [NameArabic], [NameEnglish], [TextArabic], [TextEnglish], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted], [Link], [CssClass], [DisplayOrder], [ParentPageID], [ModuleID]) VALUES (1, N'Entry', N'Entry', NULL, NULL, CAST(N'2019-01-21T13:49:31.973' AS DateTime), N'1', NULL, NULL, 0, N'/', NULL, 1, NULL, 1)
SET IDENTITY_INSERT [User].[Page] OFF
SET IDENTITY_INSERT [User].[PageAction] ON 

INSERT [User].[PageAction] ([ID], [NameArabic], [NameEnglish], [CssClass], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'AddEntry', N'AddEntry', NULL, 1, CAST(N'2019-01-21T13:49:43.913' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[PageAction] OFF
SET IDENTITY_INSERT [User].[PageActionRole] ON 

INSERT [User].[PageActionRole] ([ID], [PageID], [PageActionID], [RoleID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, 1, 1, 7, CAST(N'2019-01-21T13:49:43.923' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[PageActionRole] OFF
SET IDENTITY_INSERT [User].[Provider] ON 

INSERT [User].[Provider] ([ID], [NameArabic], [NameEnglish], [LoginCount], [RegisterCount], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'دلتا', N'ERP', 0, 0, CAST(N'2019-01-07T13:16:59.803' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[Provider] OFF
SET IDENTITY_INSERT [User].[Role] ON 

INSERT [User].[Role] ([ID], [NameArabic], [NameEnglish], [RedirectUrl], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (4, N'Admin', N'Admin', N'/', CAST(N'2019-01-21T13:46:48.293' AS DateTime), N'1', NULL, NULL, 0)
INSERT [User].[Role] ([ID], [NameArabic], [NameEnglish], [RedirectUrl], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (5, N'Customer', N'Operator', N'/home', CAST(N'2019-01-21T13:46:48.303' AS DateTime), N'1', NULL, NULL, 0)
INSERT [User].[Role] ([ID], [NameArabic], [NameEnglish], [RedirectUrl], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (6, N'Vendor', N'Finance', N'/', CAST(N'2019-01-21T13:46:48.303' AS DateTime), N'1', NULL, NULL, 0)
INSERT [User].[Role] ([ID], [NameArabic], [NameEnglish], [RedirectUrl], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (7, N'Accountant', N'Accountant', N'/', CAST(N'2019-01-21T13:46:48.303' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[Role] OFF
SET IDENTITY_INSERT [User].[Token] ON 

INSERT [User].[Token] ([ID], [UserID], [Code], [IP], [UserAgent], [ParentTokenID], [ExpirationDate], [LoggedOutDate], [Active], [ProviderID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, 1, N'uEre+BXw4HQ/pVoFnlQbqPIvYujIR/uU7yde3qzkdYiYrZQKF7jK6LJTo/PyTuxUINvHudBVjV8wz83bYNgieeQEHAb9e8joXHEXYKLvD42S6P2yqaom6kOmFU0rYpmW', N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', NULL, CAST(N'2019-05-01T14:02:38.620' AS DateTime), NULL, 1, 1, CAST(N'2019-01-21T14:02:38.620' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [User].[Token] OFF
SET IDENTITY_INSERT [User].[TokenLog] ON 

INSERT [User].[TokenLog] ([ID], [TokenID], [IP], [URL], [IsAuthorized], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, 1, N'::1', N'http://localhost:6500/Entry/Post', 1, CAST(N'2019-01-21T14:25:07.750' AS DateTime), N'1', NULL, NULL, 0)
INSERT [User].[TokenLog] ([ID], [TokenID], [IP], [URL], [IsAuthorized], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, 1, N'::1', N'http://localhost:6500/Entry/Post', 1, CAST(N'2019-01-21T14:25:25.427' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[TokenLog] OFF
SET IDENTITY_INSERT [User].[User] ON 

INSERT [User].[User] ([ID], [Name], [Email], [Mobile], [Password], [LastActivity], [IsBlocked], [ProviderID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (1, N'Mohammed Ali', N'HOyWums20QKlEq/nTOFvgGtputJ8wGHYGn460hBJgbs=', N'01000000', N'Gst6TZS55lMfCiD2eBfczIv9WnO9RstQQm2luA7HXx8=', CAST(N'2019-01-07T13:16:59.820' AS DateTime), 0, 1, CAST(N'2019-01-07T13:16:59.820' AS DateTime), N'1', NULL, NULL, 0)
INSERT [User].[User] ([ID], [Name], [Email], [Mobile], [Password], [LastActivity], [IsBlocked], [ProviderID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (2, N'Mohamed Abosehly', N'gF3WlUNHxyeDhCR4skMU0LisE+a9T+lj', N'01000000', N'q1wPK0BHZX6Z1qPuJeplzvxStAeO3/olELiCBUGEE6E=', CAST(N'2019-01-07T13:16:59.830' AS DateTime), 0, 1, CAST(N'2019-01-07T13:16:59.830' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[User] OFF
SET IDENTITY_INSERT [User].[UserRole] ON 

INSERT [User].[UserRole] ([ID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [IsDeleted]) VALUES (3, 1, 7, CAST(N'2019-01-21T13:55:58.950' AS DateTime), N'1', NULL, NULL, 0)
SET IDENTITY_INSERT [User].[UserRole] OFF
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Accounting].[Account]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentID] ON [Accounting].[Account]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [Accounting].[AccountSetting]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_EntryID] ON [Accounting].[AccountTransaction]
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FromAccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_FromAccountID] ON [Accounting].[AccountTransaction]
(
	[FromAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToAccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ToAccountID] ON [Accounting].[AccountTransaction]
(
	[ToAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FinancialYearID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_FinancialYearID] ON [Accounting].[Entry]
(
	[FinancialYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [Accounting].[EntryDetail]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Accounting].[EntryDetail]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_EntryID] ON [Accounting].[EntryDetail]
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [Accounting].[EntryGuidanceDetail]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryGuidanceID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_EntryGuidanceID] ON [Accounting].[EntryGuidanceDetail]
(
	[EntryGuidanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_EntryID] ON [Accounting].[PendingEntryRequest]
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [Accounting].[PendingEntryRequest]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_BankID] ON [Bank].[BankAccount]
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ID] ON [Bank].[BankAccount]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [Cashier].[Cashier]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ID] ON [Cashier].[Cashier]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Cashier].[CashierAccountTransaction]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ID] ON [Cashier].[CashierAccountTransaction]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankAccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_BankAccountID] ON [Cashier].[ChequeExchange]
(
	[BankAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ID] ON [Cashier].[ChequeExchange]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FromCurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_FromCurrencyID] ON [Cashier].[MoneyExchange]
(
	[FromCurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ID] ON [Cashier].[MoneyExchange]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToCurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ToCurrencyID] ON [Cashier].[MoneyExchange]
(
	[ToCurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Cashier].[MoneyTransfer]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FromAccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_FromAccountID] ON [Cashier].[MoneyTransfer]
(
	[FromAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FromCurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_FromCurrencyID] ON [Cashier].[MoneyTransfer]
(
	[FromCurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ID] ON [Cashier].[MoneyTransfer]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Request_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_ID] ON [Cashier].[MoneyTransfer]
(
	[Request_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToAccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ToAccountID] ON [Cashier].[MoneyTransfer]
(
	[ToAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToCurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ToCurrencyID] ON [Cashier].[MoneyTransfer]
(
	[ToCurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToRequestID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ToRequestID] ON [Cashier].[MoneyTransfer]
(
	[ToRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [Cashier].[Request]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChequeExchange_ID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChequeExchange_ID] ON [Cashier].[Request]
(
	[ChequeExchange_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountTypeID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountTypeID] ON [ClientAccount].[ClientAccount]
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GuarantorID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_GuarantorID] ON [CreditCard].[CardReceiptFromGuarantor]
(
	[GuarantorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CardID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CardID] ON [CreditCard].[CardReceiptFromGuarantorDetail]
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiptID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReceiptID] ON [CreditCard].[CardReceiptFromGuarantorDetail]
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_BankID] ON [CreditCard].[CreditCard]
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [Currency].[CashierCurrency]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierID] ON [Currency].[CashierCurrency]
(
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Currency].[CashierCurrency]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Currency].[ExchangeRate]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GovernorateID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_GovernorateID] ON [HR].[Employee]
(
	[GovernorateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobID] ON [HR].[Employee]
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [Location].[Governorate]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GovernorateID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_GovernorateID] ON [Location].[Region]
(
	[GovernorateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModuleID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ModuleID] ON [Module].[UserRoleModule]
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoleID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoleID] ON [Module].[UserRoleModule]
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientID] ON [Project].[Project]
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GovernorateID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_GovernorateID] ON [Project].[Project]
(
	[GovernorateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [Project].[ProjectEmplyee]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectID] ON [Project].[ProjectEmplyee]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectID] ON [Project].[ProjectGroup]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobID] ON [Project].[ProjectJobRate]
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectID] ON [Project].[ProjectJobRate]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SectionID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_SectionID] ON [Template].[Template]
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [Treasury].[Transaction]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RequestID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_RequestID] ON [Treasury].[Transaction]
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TokenID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_TokenID] ON [User].[AutoLoginRequest]
(
	[TokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProviderID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProviderID] ON [User].[ExternalLoginRequest]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [User].[ExternalLoginRequest]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ModuleID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ModuleID] ON [User].[Page]
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentPageID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ParentPageID] ON [User].[Page]
(
	[ParentPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageActionID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_PageActionID] ON [User].[PageActionRole]
(
	[PageActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_PageID] ON [User].[PageActionRole]
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleID] ON [User].[PageActionRole]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [User].[ResetPasswordRequest]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProviderID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProviderID] ON [User].[Token]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [User].[Token]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TokenID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_TokenID] ON [User].[TokenLog]
(
	[TokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProviderID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProviderID] ON [User].[User]
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleID] ON [User].[UserRole]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 1/21/2019 2:30:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [User].[UserRole]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Entry] ADD  DEFAULT ((0)) FOR [FinancialYearID]
GO
ALTER TABLE [Currency].[Currency] ADD  DEFAULT ((0)) FOR [IsDefaultCurrency]
GO
ALTER TABLE [User].[Page] ADD  DEFAULT ('') FOR [Link]
GO
ALTER TABLE [User].[Page] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [Accounting].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.Account_Accounting.Account_ParentID] FOREIGN KEY([ParentID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Accounting].[Account] CHECK CONSTRAINT [FK_Accounting.Account_Accounting.Account_ParentID]
GO
ALTER TABLE [Accounting].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.Account_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Accounting].[Account] CHECK CONSTRAINT [FK_Accounting.Account_Currency.Currency_CurrencyID]
GO
ALTER TABLE [Accounting].[AccountSetting]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.AccountSetting_Accounting.Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Accounting].[AccountSetting] CHECK CONSTRAINT [FK_Accounting.AccountSetting_Accounting.Account_AccountID]
GO
ALTER TABLE [Accounting].[AccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.AccountTransaction_Accounting.Account_FromAccountID] FOREIGN KEY([FromAccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Accounting].[AccountTransaction] CHECK CONSTRAINT [FK_Accounting.AccountTransaction_Accounting.Account_FromAccountID]
GO
ALTER TABLE [Accounting].[AccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.AccountTransaction_Accounting.Account_ToAccountID] FOREIGN KEY([ToAccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Accounting].[AccountTransaction] CHECK CONSTRAINT [FK_Accounting.AccountTransaction_Accounting.Account_ToAccountID]
GO
ALTER TABLE [Accounting].[AccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.AccountTransaction_Accounting.Entry_EntryID] FOREIGN KEY([EntryID])
REFERENCES [Accounting].[Entry] ([ID])
GO
ALTER TABLE [Accounting].[AccountTransaction] CHECK CONSTRAINT [FK_Accounting.AccountTransaction_Accounting.Entry_EntryID]
GO
ALTER TABLE [Accounting].[Entry]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.Entry_Accounting.FinancialYear_FinancialYearID] FOREIGN KEY([FinancialYearID])
REFERENCES [Accounting].[FinancialYear] ([ID])
GO
ALTER TABLE [Accounting].[Entry] CHECK CONSTRAINT [FK_Accounting.Entry_Accounting.FinancialYear_FinancialYearID]
GO
ALTER TABLE [Accounting].[EntryDetail]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.EntryDetail_Accounting.Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Accounting].[EntryDetail] CHECK CONSTRAINT [FK_Accounting.EntryDetail_Accounting.Account_AccountID]
GO
ALTER TABLE [Accounting].[EntryDetail]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.EntryDetail_Accounting.Entry_EntryID] FOREIGN KEY([EntryID])
REFERENCES [Accounting].[Entry] ([ID])
GO
ALTER TABLE [Accounting].[EntryDetail] CHECK CONSTRAINT [FK_Accounting.EntryDetail_Accounting.Entry_EntryID]
GO
ALTER TABLE [Accounting].[EntryDetail]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.EntryDetail_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Accounting].[EntryDetail] CHECK CONSTRAINT [FK_Accounting.EntryDetail_Currency.Currency_CurrencyID]
GO
ALTER TABLE [Accounting].[EntryGuidanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.EntryGuidanceDetail_Accounting.Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Accounting].[EntryGuidanceDetail] CHECK CONSTRAINT [FK_Accounting.EntryGuidanceDetail_Accounting.Account_AccountID]
GO
ALTER TABLE [Accounting].[EntryGuidanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.EntryGuidanceDetail_Accounting.EntryGuidance_EntryGuidanceID] FOREIGN KEY([EntryGuidanceID])
REFERENCES [Accounting].[EntryGuidance] ([ID])
GO
ALTER TABLE [Accounting].[EntryGuidanceDetail] CHECK CONSTRAINT [FK_Accounting.EntryGuidanceDetail_Accounting.EntryGuidance_EntryGuidanceID]
GO
ALTER TABLE [Accounting].[PendingEntryRequest]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.PendingEntryRequest_Accounting.Entry_EntryID] FOREIGN KEY([EntryID])
REFERENCES [Accounting].[Entry] ([ID])
GO
ALTER TABLE [Accounting].[PendingEntryRequest] CHECK CONSTRAINT [FK_Accounting.PendingEntryRequest_Accounting.Entry_EntryID]
GO
ALTER TABLE [Accounting].[PendingEntryRequest]  WITH CHECK ADD  CONSTRAINT [FK_Accounting.PendingEntryRequest_User.User_UserID] FOREIGN KEY([UserID])
REFERENCES [User].[User] ([ID])
GO
ALTER TABLE [Accounting].[PendingEntryRequest] CHECK CONSTRAINT [FK_Accounting.PendingEntryRequest_User.User_UserID]
GO
ALTER TABLE [Bank].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_Bank.BankAccount_Bank.Bank_BankID] FOREIGN KEY([BankID])
REFERENCES [Bank].[Bank] ([ID])
GO
ALTER TABLE [Bank].[BankAccount] CHECK CONSTRAINT [FK_Bank.BankAccount_Bank.Bank_BankID]
GO
ALTER TABLE [Bank].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_Bank.BankAccount_ClientAccount.ClientAccount_ID] FOREIGN KEY([ID])
REFERENCES [ClientAccount].[ClientAccount] ([ID])
GO
ALTER TABLE [Bank].[BankAccount] CHECK CONSTRAINT [FK_Bank.BankAccount_ClientAccount.ClientAccount_ID]
GO
ALTER TABLE [Cashier].[Cashier]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.Cashier_Accounting.Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Cashier].[Cashier] CHECK CONSTRAINT [FK_Cashier.Cashier_Accounting.Account_AccountID]
GO
ALTER TABLE [Cashier].[Cashier]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.Cashier_User.User_ID] FOREIGN KEY([ID])
REFERENCES [User].[User] ([ID])
GO
ALTER TABLE [Cashier].[Cashier] CHECK CONSTRAINT [FK_Cashier.Cashier_User.User_ID]
GO
ALTER TABLE [Cashier].[CashierAccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.CashierAccountTransaction_Cashier.Request_ID] FOREIGN KEY([ID])
REFERENCES [Cashier].[Request] ([ID])
GO
ALTER TABLE [Cashier].[CashierAccountTransaction] CHECK CONSTRAINT [FK_Cashier.CashierAccountTransaction_Cashier.Request_ID]
GO
ALTER TABLE [Cashier].[CashierAccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.CashierAccountTransaction_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Cashier].[CashierAccountTransaction] CHECK CONSTRAINT [FK_Cashier.CashierAccountTransaction_Currency.Currency_CurrencyID]
GO
ALTER TABLE [Cashier].[ChequeExchange]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.ChequeExchange_Bank.BankAccount_BankAccountID] FOREIGN KEY([BankAccountID])
REFERENCES [Bank].[BankAccount] ([ID])
GO
ALTER TABLE [Cashier].[ChequeExchange] CHECK CONSTRAINT [FK_Cashier.ChequeExchange_Bank.BankAccount_BankAccountID]
GO
ALTER TABLE [Cashier].[ChequeExchange]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.ChequeExchange_Cashier.MoneyExchange_ID] FOREIGN KEY([ID])
REFERENCES [Cashier].[MoneyExchange] ([ID])
GO
ALTER TABLE [Cashier].[ChequeExchange] CHECK CONSTRAINT [FK_Cashier.ChequeExchange_Cashier.MoneyExchange_ID]
GO
ALTER TABLE [Cashier].[MoneyExchange]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyExchange_Cashier.Request_ID] FOREIGN KEY([ID])
REFERENCES [Cashier].[Request] ([ID])
GO
ALTER TABLE [Cashier].[MoneyExchange] CHECK CONSTRAINT [FK_Cashier.MoneyExchange_Cashier.Request_ID]
GO
ALTER TABLE [Cashier].[MoneyExchange]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyExchange_Currency.Currency_FromCurrencyID] FOREIGN KEY([FromCurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Cashier].[MoneyExchange] CHECK CONSTRAINT [FK_Cashier.MoneyExchange_Currency.Currency_FromCurrencyID]
GO
ALTER TABLE [Cashier].[MoneyExchange]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyExchange_Currency.Currency_ToCurrencyID] FOREIGN KEY([ToCurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Cashier].[MoneyExchange] CHECK CONSTRAINT [FK_Cashier.MoneyExchange_Currency.Currency_ToCurrencyID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_Cashier.Request_ID] FOREIGN KEY([ID])
REFERENCES [Cashier].[Request] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_Cashier.Request_ID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_Cashier.Request_Request_ID] FOREIGN KEY([Request_ID])
REFERENCES [Cashier].[Request] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_Cashier.Request_Request_ID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_Cashier.Request_ToRequestID] FOREIGN KEY([ToRequestID])
REFERENCES [Cashier].[Request] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_Cashier.Request_ToRequestID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_ClientAccount.ClientAccount_FromAccountID] FOREIGN KEY([FromAccountID])
REFERENCES [ClientAccount].[ClientAccount] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_ClientAccount.ClientAccount_FromAccountID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_ClientAccount.ClientAccount_ToAccountID] FOREIGN KEY([ToAccountID])
REFERENCES [ClientAccount].[ClientAccount] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_ClientAccount.ClientAccount_ToAccountID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_Currency.Currency_CurrencyID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_Currency.Currency_FromCurrencyID] FOREIGN KEY([FromCurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_Currency.Currency_FromCurrencyID]
GO
ALTER TABLE [Cashier].[MoneyTransfer]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.MoneyTransfer_Currency.Currency_ToCurrencyID] FOREIGN KEY([ToCurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Cashier].[MoneyTransfer] CHECK CONSTRAINT [FK_Cashier.MoneyTransfer_Currency.Currency_ToCurrencyID]
GO
ALTER TABLE [Cashier].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.Request_Cashier.ChequeExchange_ChequeExchange_ID] FOREIGN KEY([ChequeExchange_ID])
REFERENCES [Cashier].[ChequeExchange] ([ID])
GO
ALTER TABLE [Cashier].[Request] CHECK CONSTRAINT [FK_Cashier.Request_Cashier.ChequeExchange_ChequeExchange_ID]
GO
ALTER TABLE [Cashier].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Cashier.Request_ClientAccount.ClientAccount_AccountID] FOREIGN KEY([AccountID])
REFERENCES [ClientAccount].[ClientAccount] ([ID])
GO
ALTER TABLE [Cashier].[Request] CHECK CONSTRAINT [FK_Cashier.Request_ClientAccount.ClientAccount_AccountID]
GO
ALTER TABLE [ClientAccount].[ClientAccount]  WITH CHECK ADD  CONSTRAINT [FK_ClientAccount.ClientAccount_ClientAccount.ClientAccountType_AccountTypeID] FOREIGN KEY([AccountTypeID])
REFERENCES [ClientAccount].[ClientAccountType] ([ID])
GO
ALTER TABLE [ClientAccount].[ClientAccount] CHECK CONSTRAINT [FK_ClientAccount.ClientAccount_ClientAccount.ClientAccountType_AccountTypeID]
GO
ALTER TABLE [CreditCard].[CardReceiptFromGuarantor]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard.CardReceiptFromGuarantor_CreditCard.Guarantor_GuarantorID] FOREIGN KEY([GuarantorID])
REFERENCES [CreditCard].[Guarantor] ([ID])
GO
ALTER TABLE [CreditCard].[CardReceiptFromGuarantor] CHECK CONSTRAINT [FK_CreditCard.CardReceiptFromGuarantor_CreditCard.Guarantor_GuarantorID]
GO
ALTER TABLE [CreditCard].[CardReceiptFromGuarantorDetail]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard.CardReceiptFromGuarantorDetail_CreditCard.CardReceiptFromGuarantor_ReceiptID] FOREIGN KEY([ReceiptID])
REFERENCES [CreditCard].[CardReceiptFromGuarantor] ([ID])
GO
ALTER TABLE [CreditCard].[CardReceiptFromGuarantorDetail] CHECK CONSTRAINT [FK_CreditCard.CardReceiptFromGuarantorDetail_CreditCard.CardReceiptFromGuarantor_ReceiptID]
GO
ALTER TABLE [CreditCard].[CardReceiptFromGuarantorDetail]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard.CardReceiptFromGuarantorDetail_CreditCard.CreditCard_CardID] FOREIGN KEY([CardID])
REFERENCES [CreditCard].[CreditCard] ([ID])
GO
ALTER TABLE [CreditCard].[CardReceiptFromGuarantorDetail] CHECK CONSTRAINT [FK_CreditCard.CardReceiptFromGuarantorDetail_CreditCard.CreditCard_CardID]
GO
ALTER TABLE [CreditCard].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard.CreditCard_Bank.Bank_BankID] FOREIGN KEY([BankID])
REFERENCES [Bank].[Bank] ([ID])
GO
ALTER TABLE [CreditCard].[CreditCard] CHECK CONSTRAINT [FK_CreditCard.CreditCard_Bank.Bank_BankID]
GO
ALTER TABLE [Currency].[CashierCurrency]  WITH CHECK ADD  CONSTRAINT [FK_Currency.CashierCurrency_Accounting.Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [Accounting].[Account] ([ID])
GO
ALTER TABLE [Currency].[CashierCurrency] CHECK CONSTRAINT [FK_Currency.CashierCurrency_Accounting.Account_AccountID]
GO
ALTER TABLE [Currency].[CashierCurrency]  WITH CHECK ADD  CONSTRAINT [FK_Currency.CashierCurrency_Cashier.Cashier_CashierID] FOREIGN KEY([CashierID])
REFERENCES [Cashier].[Cashier] ([ID])
GO
ALTER TABLE [Currency].[CashierCurrency] CHECK CONSTRAINT [FK_Currency.CashierCurrency_Cashier.Cashier_CashierID]
GO
ALTER TABLE [Currency].[CashierCurrency]  WITH CHECK ADD  CONSTRAINT [FK_Currency.CashierCurrency_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Currency].[CashierCurrency] CHECK CONSTRAINT [FK_Currency.CashierCurrency_Currency.Currency_CurrencyID]
GO
ALTER TABLE [Currency].[ExchangeRate]  WITH CHECK ADD  CONSTRAINT [FK_Currency.ExchangeRate_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Currency].[ExchangeRate] CHECK CONSTRAINT [FK_Currency.ExchangeRate_Currency.Currency_CurrencyID]
GO
ALTER TABLE [dbo].[CHILD]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[PARENT] ([PID])
GO
ALTER TABLE [HR].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_HR.Employee_HR.Job_JobID] FOREIGN KEY([JobID])
REFERENCES [HR].[Job] ([ID])
GO
ALTER TABLE [HR].[Employee] CHECK CONSTRAINT [FK_HR.Employee_HR.Job_JobID]
GO
ALTER TABLE [HR].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_HR.Employee_Location.Governorate_GovernorateID] FOREIGN KEY([GovernorateID])
REFERENCES [Location].[Governorate] ([ID])
GO
ALTER TABLE [HR].[Employee] CHECK CONSTRAINT [FK_HR.Employee_Location.Governorate_GovernorateID]
GO
ALTER TABLE [Location].[Governorate]  WITH CHECK ADD  CONSTRAINT [FK_Location.Governorate_Location.Country_CountryID] FOREIGN KEY([CountryID])
REFERENCES [Location].[Country] ([ID])
GO
ALTER TABLE [Location].[Governorate] CHECK CONSTRAINT [FK_Location.Governorate_Location.Country_CountryID]
GO
ALTER TABLE [Location].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Location.Region_Location.Governorate_GovernorateID] FOREIGN KEY([GovernorateID])
REFERENCES [Location].[Governorate] ([ID])
GO
ALTER TABLE [Location].[Region] CHECK CONSTRAINT [FK_Location.Region_Location.Governorate_GovernorateID]
GO
ALTER TABLE [Module].[UserRoleModule]  WITH CHECK ADD  CONSTRAINT [FK_Module.UserRoleModule_Module.Module_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [Module].[Module] ([ID])
GO
ALTER TABLE [Module].[UserRoleModule] CHECK CONSTRAINT [FK_Module.UserRoleModule_Module.Module_ModuleID]
GO
ALTER TABLE [Module].[UserRoleModule]  WITH CHECK ADD  CONSTRAINT [FK_Module.UserRoleModule_User.UserRole_UserRoleID] FOREIGN KEY([UserRoleID])
REFERENCES [User].[UserRole] ([ID])
GO
ALTER TABLE [Module].[UserRoleModule] CHECK CONSTRAINT [FK_Module.UserRoleModule_User.UserRole_UserRoleID]
GO
ALTER TABLE [Project].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project.Project_Location.Governorate_GovernorateID] FOREIGN KEY([GovernorateID])
REFERENCES [Location].[Governorate] ([ID])
GO
ALTER TABLE [Project].[Project] CHECK CONSTRAINT [FK_Project.Project_Location.Governorate_GovernorateID]
GO
ALTER TABLE [Project].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project.Project_Project.Client_ClientID] FOREIGN KEY([ClientID])
REFERENCES [Project].[Client] ([ID])
GO
ALTER TABLE [Project].[Project] CHECK CONSTRAINT [FK_Project.Project_Project.Client_ClientID]
GO
ALTER TABLE [Project].[ProjectEmplyee]  WITH CHECK ADD  CONSTRAINT [FK_Project.ProjectEmplyee_HR.Employee_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [HR].[Employee] ([ID])
GO
ALTER TABLE [Project].[ProjectEmplyee] CHECK CONSTRAINT [FK_Project.ProjectEmplyee_HR.Employee_EmployeeID]
GO
ALTER TABLE [Project].[ProjectEmplyee]  WITH CHECK ADD  CONSTRAINT [FK_Project.ProjectEmplyee_Project.Project_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [Project].[Project] ([ID])
GO
ALTER TABLE [Project].[ProjectEmplyee] CHECK CONSTRAINT [FK_Project.ProjectEmplyee_Project.Project_ProjectID]
GO
ALTER TABLE [Project].[ProjectGroup]  WITH CHECK ADD  CONSTRAINT [FK_Project.ProjectGroup_Project.Project_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [Project].[Project] ([ID])
GO
ALTER TABLE [Project].[ProjectGroup] CHECK CONSTRAINT [FK_Project.ProjectGroup_Project.Project_ProjectID]
GO
ALTER TABLE [Project].[ProjectJobRate]  WITH CHECK ADD  CONSTRAINT [FK_Project.ProjectJobRate_HR.Job_JobID] FOREIGN KEY([JobID])
REFERENCES [HR].[Job] ([ID])
GO
ALTER TABLE [Project].[ProjectJobRate] CHECK CONSTRAINT [FK_Project.ProjectJobRate_HR.Job_JobID]
GO
ALTER TABLE [Project].[ProjectJobRate]  WITH CHECK ADD  CONSTRAINT [FK_Project.ProjectJobRate_Project.Project_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [Project].[Project] ([ID])
GO
ALTER TABLE [Project].[ProjectJobRate] CHECK CONSTRAINT [FK_Project.ProjectJobRate_Project.Project_ProjectID]
GO
ALTER TABLE [Template].[Template]  WITH CHECK ADD  CONSTRAINT [FK_Template.Template_Template.TemplateSection_SectionID] FOREIGN KEY([SectionID])
REFERENCES [Template].[TemplateSection] ([ID])
GO
ALTER TABLE [Template].[Template] CHECK CONSTRAINT [FK_Template.Template_Template.TemplateSection_SectionID]
GO
ALTER TABLE [Treasury].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Treasury.Transaction_Cashier.Request_RequestID] FOREIGN KEY([RequestID])
REFERENCES [Cashier].[Request] ([ID])
GO
ALTER TABLE [Treasury].[Transaction] CHECK CONSTRAINT [FK_Treasury.Transaction_Cashier.Request_RequestID]
GO
ALTER TABLE [Treasury].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Treasury.Transaction_Currency.Currency_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [Currency].[Currency] ([ID])
GO
ALTER TABLE [Treasury].[Transaction] CHECK CONSTRAINT [FK_Treasury.Transaction_Currency.Currency_CurrencyID]
GO
ALTER TABLE [User].[AutoLoginRequest]  WITH CHECK ADD  CONSTRAINT [FK_User.AutoLoginRequest_User.Token_TokenID] FOREIGN KEY([TokenID])
REFERENCES [User].[Token] ([ID])
GO
ALTER TABLE [User].[AutoLoginRequest] CHECK CONSTRAINT [FK_User.AutoLoginRequest_User.Token_TokenID]
GO
ALTER TABLE [User].[ExternalLoginRequest]  WITH CHECK ADD  CONSTRAINT [FK_User.ExternalLoginRequest_User.Provider_ProviderID] FOREIGN KEY([ProviderID])
REFERENCES [User].[Provider] ([ID])
GO
ALTER TABLE [User].[ExternalLoginRequest] CHECK CONSTRAINT [FK_User.ExternalLoginRequest_User.Provider_ProviderID]
GO
ALTER TABLE [User].[ExternalLoginRequest]  WITH CHECK ADD  CONSTRAINT [FK_User.ExternalLoginRequest_User.User_UserID] FOREIGN KEY([UserID])
REFERENCES [User].[User] ([ID])
GO
ALTER TABLE [User].[ExternalLoginRequest] CHECK CONSTRAINT [FK_User.ExternalLoginRequest_User.User_UserID]
GO
ALTER TABLE [User].[Page]  WITH CHECK ADD  CONSTRAINT [FK_User.Page_Module.Module_Module_ID] FOREIGN KEY([ModuleID])
REFERENCES [Module].[Module] ([ID])
GO
ALTER TABLE [User].[Page] CHECK CONSTRAINT [FK_User.Page_Module.Module_Module_ID]
GO
ALTER TABLE [User].[Page]  WITH CHECK ADD  CONSTRAINT [FK_User.Page_User.Page_ParentPageID] FOREIGN KEY([ParentPageID])
REFERENCES [User].[Page] ([ID])
GO
ALTER TABLE [User].[Page] CHECK CONSTRAINT [FK_User.Page_User.Page_ParentPageID]
GO
ALTER TABLE [User].[PageActionRole]  WITH CHECK ADD  CONSTRAINT [FK_User.PageActionRole_User.Page_PageID] FOREIGN KEY([PageID])
REFERENCES [User].[Page] ([ID])
GO
ALTER TABLE [User].[PageActionRole] CHECK CONSTRAINT [FK_User.PageActionRole_User.Page_PageID]
GO
ALTER TABLE [User].[PageActionRole]  WITH CHECK ADD  CONSTRAINT [FK_User.PageActionRole_User.PageAction_PageActionID] FOREIGN KEY([PageActionID])
REFERENCES [User].[PageAction] ([ID])
GO
ALTER TABLE [User].[PageActionRole] CHECK CONSTRAINT [FK_User.PageActionRole_User.PageAction_PageActionID]
GO
ALTER TABLE [User].[PageActionRole]  WITH CHECK ADD  CONSTRAINT [FK_User.PageActionRole_User.Role_RoleID] FOREIGN KEY([RoleID])
REFERENCES [User].[Role] ([ID])
GO
ALTER TABLE [User].[PageActionRole] CHECK CONSTRAINT [FK_User.PageActionRole_User.Role_RoleID]
GO
ALTER TABLE [User].[ResetPasswordRequest]  WITH CHECK ADD  CONSTRAINT [FK_User.ResetPasswordRequest_User.User_UserID] FOREIGN KEY([UserID])
REFERENCES [User].[User] ([ID])
GO
ALTER TABLE [User].[ResetPasswordRequest] CHECK CONSTRAINT [FK_User.ResetPasswordRequest_User.User_UserID]
GO
ALTER TABLE [User].[Token]  WITH CHECK ADD  CONSTRAINT [FK_User.Token_User.Provider_ProviderID] FOREIGN KEY([ProviderID])
REFERENCES [User].[Provider] ([ID])
GO
ALTER TABLE [User].[Token] CHECK CONSTRAINT [FK_User.Token_User.Provider_ProviderID]
GO
ALTER TABLE [User].[Token]  WITH CHECK ADD  CONSTRAINT [FK_User.Token_User.User_UserID] FOREIGN KEY([UserID])
REFERENCES [User].[User] ([ID])
GO
ALTER TABLE [User].[Token] CHECK CONSTRAINT [FK_User.Token_User.User_UserID]
GO
ALTER TABLE [User].[TokenLog]  WITH CHECK ADD  CONSTRAINT [FK_User.TokenLog_User.Token_TokenID] FOREIGN KEY([TokenID])
REFERENCES [User].[Token] ([ID])
GO
ALTER TABLE [User].[TokenLog] CHECK CONSTRAINT [FK_User.TokenLog_User.Token_TokenID]
GO
ALTER TABLE [User].[User]  WITH CHECK ADD  CONSTRAINT [FK_User.User_User.Provider_ProviderID] FOREIGN KEY([ProviderID])
REFERENCES [User].[Provider] ([ID])
GO
ALTER TABLE [User].[User] CHECK CONSTRAINT [FK_User.User_User.Provider_ProviderID]
GO
ALTER TABLE [User].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_User.UserRole_User.Role_RoleID] FOREIGN KEY([RoleID])
REFERENCES [User].[Role] ([ID])
GO
ALTER TABLE [User].[UserRole] CHECK CONSTRAINT [FK_User.UserRole_User.Role_RoleID]
GO
ALTER TABLE [User].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_User.UserRole_User.User_UserID] FOREIGN KEY([UserID])
REFERENCES [User].[User] ([ID])
GO
ALTER TABLE [User].[UserRole] CHECK CONSTRAINT [FK_User.UserRole_User.User_UserID]
GO
USE [master]
GO
ALTER DATABASE [ERPDB] SET  READ_WRITE 
GO
