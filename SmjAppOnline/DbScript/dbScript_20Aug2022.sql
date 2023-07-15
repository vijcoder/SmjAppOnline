USE [master]
GO
/****** Object:  Database [SmjApp]    Script Date: 8/20/2022 4:52:18 PM ******/
CREATE DATABASE [SmjApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmjApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CGVD24\MSSQL\DATA\SmjApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmjApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CGVD24\MSSQL\DATA\SmjApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SmjApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmjApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmjApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmjApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmjApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmjApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmjApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmjApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmjApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmjApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmjApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmjApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmjApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmjApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmjApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmjApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmjApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmjApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmjApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmjApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmjApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmjApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmjApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmjApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmjApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmjApp] SET  MULTI_USER 
GO
ALTER DATABASE [SmjApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmjApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmjApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmjApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmjApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SmjApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SmjApp] SET QUERY_STORE = OFF
GO
USE [SmjApp]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContributionAmount] [int] NOT NULL,
	[RegistrationAmount] [int] NOT NULL,
	[SeniorRegistrationAmount] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContributionTransactions]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContributionTransactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MID] [nvarchar](250) NULL,
	[MemberCode] [nvarchar](50) NULL,
	[exMemberCode] [nvarchar](50) NULL,
	[ORDERID] [nvarchar](50) NOT NULL,
	[CURRENCY] [nvarchar](50) NULL,
	[TXNAMOUNT] [nvarchar](50) NULL,
	[STATUS] [nvarchar](50) NULL,
	[TXNID] [nvarchar](50) NULL,
	[BANKTXNID] [nvarchar](50) NULL,
	[RESPCODE] [nvarchar](50) NULL,
	[RESPMSG] [nvarchar](max) NULL,
	[TXNDATE] [nvarchar](250) NULL,
	[GATEWAYNAME] [nvarchar](250) NULL,
	[BANKNAME] [nvarchar](250) NULL,
	[PAYMENTMODE] [nvarchar](50) NULL,
	[IsPaid] [bit] NULL,
	[PaymentBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PaymentTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembersContribution]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembersContribution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [nvarchar](50) NOT NULL,
	[ExMemberCode] [nvarchar](50) NOT NULL,
	[OrderId] [nvarchar](50) NOT NULL,
	[OrderAmount] [decimal](18, 2) NOT NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[PaymentBy] [nvarchar](50) NULL,
	[IsArchived] [bit] NOT NULL,
	[IsPaid] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MembersContribution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembersRegistration]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembersRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [int] NULL,
	[Initials] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](12) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[PasswordSaltKey] [nvarchar](50) NULL,
	[Villagename] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[ProfileImage] [nvarchar](150) NULL,
	[AgeProofImage] [nvarchar](150) NULL,
	[Amount] [decimal](18, 2) NULL,
	[IsPaid] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[Role] [nvarchar](50) NULL,
	[Token] [nvarchar](350) NULL,
	[IsActive] [bit] NOT NULL,
	[IsApproved] [bit] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MembersRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembersRegistration_bk_16Aug]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembersRegistration_bk_16Aug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [int] NULL,
	[Initials] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](12) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[PasswordSaltKey] [nvarchar](50) NULL,
	[Villagename] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[ProfileImage] [nvarchar](150) NULL,
	[AgeProofImage] [nvarchar](150) NULL,
	[Amount] [decimal](18, 2) NULL,
	[IsPaid] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[Role] [nvarchar](50) NULL,
	[Token] [nvarchar](350) NULL,
	[IsActive] [bit] NOT NULL,
	[IsApproved] [bit] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembersRegistration_bk_20Aug]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembersRegistration_bk_20Aug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [int] NULL,
	[Initials] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](12) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[PasswordSaltKey] [nvarchar](50) NULL,
	[Villagename] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[ProfileImage] [nvarchar](150) NULL,
	[AgeProofImage] [nvarchar](150) NULL,
	[Amount] [decimal](18, 2) NULL,
	[IsPaid] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[Role] [nvarchar](50) NULL,
	[Token] [nvarchar](350) NULL,
	[IsActive] [bit] NOT NULL,
	[IsApproved] [bit] NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationTransactions]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationTransactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MID] [nvarchar](250) NULL,
	[MemberCode] [nvarchar](50) NOT NULL,
	[ORDERID] [nvarchar](50) NOT NULL,
	[CURRENCY] [nvarchar](50) NULL,
	[TXNAMOUNT] [nvarchar](50) NULL,
	[STATUS] [nvarchar](50) NULL,
	[TXNID] [nvarchar](50) NULL,
	[BANKTXNID] [nvarchar](50) NULL,
	[RESPCODE] [nvarchar](50) NULL,
	[RESPMSG] [nvarchar](max) NULL,
	[TXNDATE] [nvarchar](250) NULL,
	[GATEWAYNAME] [nvarchar](250) NULL,
	[BANKNAME] [nvarchar](250) NULL,
	[PAYMENTMODE] [nvarchar](50) NULL,
	[IsPaid] [bit] NULL,
	[PaymentBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_RegistrationTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Configuration] ADD  CONSTRAINT [DF_Configuration_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ContributionTransactions] ADD  CONSTRAINT [DF_ContributionTransactions_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[ContributionTransactions] ADD  CONSTRAINT [DF_ContributionTransactions_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_IsArchived]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsExpired]  DEFAULT ((0)) FOR [IsExpired]
GO
ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[RegistrationTransactions] ADD  CONSTRAINT [DF_RegistrationTransactions_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[RegistrationTransactions] ADD  CONSTRAINT [DF_RegistrationTransactions_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [dbo].[proc_GetAllMembers]    Script Date: 8/20/2022 4:52:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vijay darji
-- Create date: getdate()
-- Description:	getAllMembers method call in Memebrs controller
-- =============================================
CREATE PROCEDURE [dbo].[proc_GetAllMembers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, T0.MemberCode, CONCAT(T0.Initials, ' ', T0.Firstname, ' ', T0.Middlename, ' ',T0.Lastname) AS MemberName , T0.MobileNo, T0.EmailId,
	T0.Address, T0.AgeProofImage, T0.Villagename,T0.DOB,T0.IsPaid, T0.IsExpired, T0.IsActive, T0.CreatedOn, T0.CreatedBy,
	T0.ModifiedBy, T0.ModifiedOn from MembersRegistration T0 with(nolock)
	where T0.IsActive=1 and T0.IsExpired=0
END
GO
USE [master]
GO
ALTER DATABASE [SmjApp] SET  READ_WRITE 
GO
