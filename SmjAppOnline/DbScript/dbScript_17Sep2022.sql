USE [master]
GO
/****** Object:  Database [SmjApp]    Script Date: 9/17/2022 2:11:16 PM ******/
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
/****** Object:  Table [dbo].[ContributionTransactions]    Script Date: 9/17/2022 2:11:16 PM ******/
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
/****** Object:  Table [dbo].[MembersContribution]    Script Date: 9/17/2022 2:11:16 PM ******/
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
	[IsPaymentApproved] [bit] NULL,
	[PaymentApprovedBy] [int] NULL,
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
/****** Object:  Table [dbo].[MembersRegistration]    Script Date: 9/17/2022 2:11:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembersRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [int] NOT NULL,
	[Initials] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](12) NULL,
	[EmailId] [nvarchar](50) NULL,
	[Villagename] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DOB] [datetime] NULL,
	[ProfileImage] [nvarchar](150) NULL,
	[AgeProofImage] [nvarchar](150) NULL,
	[Amount] [decimal](18, 2) NULL,
	[IsPaid] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[ExpiryDate] [datetime] NULL,
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
/****** Object:  Table [dbo].[MembersRegistration_bk_16Aug]    Script Date: 9/17/2022 2:11:16 PM ******/
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
/****** Object:  Table [dbo].[MembersRegistration_bk_20Aug]    Script Date: 9/17/2022 2:11:16 PM ******/
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
/****** Object:  Table [dbo].[RegistrationTransactions]    Script Date: 9/17/2022 2:11:16 PM ******/
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
	[IsPaymentApproved] [bit] NULL,
	[PaymentApprovedBy] [int] NULL,
 CONSTRAINT [PK_RegistrationTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegTransactionOffline]    Script Date: 9/17/2022 2:11:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegTransactionOffline](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [int] NOT NULL,
	[OrderId] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentBy] [varchar](50) NOT NULL,
	[IsPaid] [bit] NULL,
	[IsPaymentApproved] [bit] NULL,
	[PaymentApprovedBy] [varchar](50) NULL,
	[PaymentApprovedDate] [datetime] NULL,
	[CreatedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_RegTransactionOffline] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMembersMapping]    Script Date: 9/17/2022 2:11:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMembersMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MemberCode] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_UserMembersMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/17/2022 2:11:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[PasswordSalt] [nvarchar](400) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[ActivationCode] [nvarchar](50) NULL,
	[ResetPasswordCode] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContributionTransactions] ON 
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (1, N'XXjGJp79519699543840', N'1', N'2', N'12771_1_2', N'INR', N'100.00', N'TXN_SUCCESS', N'20220903111212800110168430104013037', N'12756040185', N'01', N'Txn Success', N'2022-09-03 11:59:14.0', N'SBI', N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-09-03T06:29:31.360' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ContributionTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[MembersContribution] ON 
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsPaymentApproved], [PaymentApprovedBy], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, N'1', N'2', N'12771_1_2', CAST(100.00 AS Decimal(18, 2)), N'NB', N'1', 0, 1, NULL, NULL, 0, CAST(N'2022-09-03T06:29:29.113' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsPaymentApproved], [PaymentApprovedBy], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, N'1', N'1', N'59124_1_1', CAST(100.00 AS Decimal(18, 2)), N'Offline', N'1', 0, 1, NULL, NULL, 0, CAST(N'2022-09-13T04:47:56.797' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsPaymentApproved], [PaymentApprovedBy], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, N'3', N'1', N'75749_3_1', CAST(100.00 AS Decimal(18, 2)), N'Offline', N'1', 0, 1, NULL, NULL, 0, CAST(N'2022-09-13T14:03:15.767' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MembersContribution] OFF
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration] ON 
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (12, 1, N'Mr', N'Amritbhai Babaldas Darji ', N'', N'', N'Nana Chekhla', N'Nana Chekhla', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-09-12T20:01:02.593' AS DateTime), 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:29.560' AS DateTime), N'Null', CAST(N'2022-09-12T14:31:02.593' AS DateTime), N'1')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (13, 2, N'Mr', N'Brijeshbhai Dahyabhai Darji ', N'', N'', N'Punsary', N'Punsary', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:39.943' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (14, 3, N'Mrs', N'Bhagwatiben Brijeshbhai Darji ', N'', N'', N'Punsary', N'Punsary', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:39.987' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (15, 4, N'Mr', N'Rameshbhai Revandas Darji ', N'', N'', N'Modhuka', N'Modhuka', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:40.060' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (16, 5, N'Mr', N'Vasantbhai Maganbhai Darji ', N'', N'', N'Tajpur', N'Tajpur', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:40.100' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, 6, N'Mr', N'Girishbhai Maganbhai Darji ', N'', N'', N'Tajpur', N'Tajpur', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:40.160' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (18, 7, N'Mr', N'Dasharathbhai Maganbhai Darji ', N'', N'', N'Punsary', N'Punsary', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:40.217' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (19, 8, N'Mr', N'Narsihbhai Somabhai Solanki ', N'', N'', N'Lavary', N'Lavary', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:40.600' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (20, 9, N'Mr', N'Sanjaybhai Amritbhai Darji ', N'', N'', N'Nana Chekhla', N'Nana Chekhla', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:40.983' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (21, 10, N'Mr', N'Indravadan Babubhai Darji', N'', N'', N'Ramos', N'Ramos', NULL, NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'Null', NULL, CAST(N'2022-09-10T12:37:41.333' AS DateTime), N'Null', NULL, N'Null')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (22, 11, N'Mr', N'N B Darji', N'9969379174', N'vijay27darji@gmail.com', N'Talod', N'Malad east', CAST(N'1966-06-01T11:12:00.000' AS DateTime), N'542f0428-a78b-4a43-bed7-45399d796f00_pexels-photo-259915.jpeg', N'22756562-1f66-4ec2-a4ee-1203fbc7029a_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T05:43:23.060' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (23, 12, N'Mr', N'N B Darji', N'9969379174', N'vijay27darji@gmail.com', N'Talod', N'Malad east', CAST(N'1966-06-01T11:12:00.000' AS DateTime), N'a473ad93-d674-42ed-9154-cba7a9f6770c_pexels-photo-259915.jpeg', N'1a725f35-b2a2-45c7-bd51-7d8372e2278d_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T06:07:51.793' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (24, 13, N'Mr', N'Ritesh a prajapati', N'9029509624', N'ritesh.p@gmail.com', N'Surat', N'Malad East', CAST(N'2010-01-13T16:27:00.000' AS DateTime), N'8996cdc1-5260-4ef6-b5f2-1be87ea2cdc6_pexels-photo-1591447.jpeg', N'783ee17c-4ab5-428c-bbf3-31ca2808c62f_download.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T10:57:46.630' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (25, 14, N'Mr', N'Ritesh a prajapati', N'9029509624', N'ritesh.p@gmail.com', N'Surat', N'Malad East', CAST(N'2010-01-13T16:27:00.000' AS DateTime), N'c31813ea-8578-4707-8149-58da98a4b30f_pexels-photo-1591447.jpeg', N'1a21c778-7028-427c-8316-11c8470d531f_download.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T11:00:28.437' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (26, 15, N'Mr', N'Ritesh a prajapati2', N'9029509624', N'ritesh.p2@gmail.com', N'Talod', N'Malad East', CAST(N'2006-02-07T16:33:00.000' AS DateTime), N'1a20d02d-f99a-4731-ac9d-0f95e95a21d8_woodland-road-falling-leaf-natural-38537.jpeg', N'242978db-8948-497f-85bb-8ccf47bf984c_download.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T11:03:57.103' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (27, 16, N'Mr', N'Karasn shanghavi2', N'9029509624', N'Karan.s@gmail.com', N'Talod', N'Malad East', CAST(N'2017-03-01T16:36:00.000' AS DateTime), N'4c67344a-fc16-4ab8-893f-fc4abe79c9a2_pexels-photo-235986.jpeg', N'b5d334dc-2ab7-4b31-a9f6-dbaf65b456fe_pexels-photo-259915.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T11:06:48.130' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (28, 17, N'Mr', N'Karasn shanghavi2', N'9029509624', N'Karan.s2@gmail.com', N'Udwada', N'Malad East', CAST(N'2009-02-04T17:02:00.000' AS DateTime), N'4b0375fa-6d28-49e3-955d-fd40da93bbe9_pexels-photo-235986.jpeg', N'34034dfa-9fde-4e50-97b2-ad9e1e812493_pexels-photo-1591447.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T11:32:53.917' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (29, 18, N'Mr', N'vijay n darji3', N'9029509624', N'vijay.darji3@gmail.com', N'Talod', N'Malad East', CAST(N'2001-02-01T17:11:00.000' AS DateTime), N'83de83a0-5e7e-4132-82b5-cdaa3b4983e7_pexels-photo-1591447.jpeg', N'7a209d18-2a00-48f1-b2ed-ca05bbd0a60c_pexels-photo-235986.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T11:42:05.880' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (30, 19, N'Mr', N'Ritesh a prajapati', N'9029509624', N'ritesh.p3@gmail.com', N'Talod', N'Malad East', CAST(N'2017-02-13T17:18:00.000' AS DateTime), N'6e714f4f-079c-41c5-833a-1c89b15d3dce_download.jpg', N'0656c986-e385-462d-8ff2-1305a05e2bfe_pexels-photo-259915.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T11:48:46.307' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (31, 20, N'Mr', N'Ritesh a prajapati', N'9029509624', N'nbdarji@gmail.com', N'Talod2', N'Malad east', CAST(N'2006-02-15T17:29:00.000' AS DateTime), N'c9d06899-e50f-4a8a-85d6-1b9760a027aa_pexels-photo-235986.jpeg', N'01e830c8-3134-4ac7-8e9d-d136fa929da1_pexels-photo-259915.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T12:00:07.590' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (32, 21, N'Mr', N'Ritesh a prajapati', N'9029509624', N'ritesh.p@gmail.com', N'Talod', N'Malad East', CAST(N'2003-02-01T17:43:00.000' AS DateTime), N'68665133-4e72-4635-b98d-b9d2f8ef0c09_woodland-road-falling-leaf-natural-38537.jpeg', N'ca2e4e4a-86be-4f2f-b8e2-4448a831115c_pexels-photo-1591447.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T12:13:35.313' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (33, 22, N'Mr', N'Ritesh a prajapati', N'9029509624', N'ritesh.p@gmail.com', N'Talod', N'Malad East', CAST(N'2003-02-01T17:43:00.000' AS DateTime), N'bf280f92-8192-4de4-840b-7150b1137c83_woodland-road-falling-leaf-natural-38537.jpeg', N'f6e22b5e-e470-4b25-a198-07cc8d10a4ca_pexels-photo-1591447.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T12:16:09.820' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (34, 23, N'Mr', N'Ritesh a prajapati', N'9029509624', N'ritesh.p4@gmail.com', N'Talod', N'Malad East', CAST(N'2018-02-03T18:26:00.000' AS DateTime), N'5881f439-baa0-4e9b-9f4b-d67b23e3f95f_pexels-photo-235986.jpeg', N'c80b6fc9-5e85-4737-9bcf-bcf7bab5a5e8_pexels-photo-259915.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T13:35:56.727' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (35, 24, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2018-02-13T19:09:00.000' AS DateTime), N'1103dd15-f16a-4f6d-b6e2-22a41bd831cb_pexels-photo-259915.jpeg', N'837ccdf9-799b-4f85-bfd8-bbf777c952a2_download.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T13:39:43.197' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (36, 25, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2022-09-01T19:10:00.000' AS DateTime), N'2394c0f3-4e5e-4d4b-a873-2ab298489286_pexels-photo-235986.jpeg', N'10b6d781-b533-4ee9-8896-0d655c9f02a0_pexels-photo-259915.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T13:41:03.940' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (37, 26, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2022-09-08T19:13:00.000' AS DateTime), N'2596c462-6980-48c7-9281-4dec9b8d38f2_pexels-photo-1591447.jpeg', N'c7ef970b-fae0-4333-bbee-24ae5ba1d335_pexels-photo-235986.jpeg', CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'1', CAST(N'2022-09-13T14:01:47.907' AS DateTime), CAST(N'2022-09-13T13:43:39.820' AS DateTime), N'1', CAST(N'2022-09-13T14:01:47.907' AS DateTime), N'1')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (38, 27, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2006-03-01T19:29:00.000' AS DateTime), N'c3dc9e15-be1b-4fe4-99c9-27711d264e98_pexels-photo-235986.jpeg', N'ae673612-3ad6-4f6e-88e1-c0c70880428a_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, 1, 1, N'1', CAST(N'2022-09-13T14:01:24.350' AS DateTime), CAST(N'2022-09-13T13:59:43.660' AS DateTime), N'1', CAST(N'2022-09-13T14:01:24.350' AS DateTime), N'1')
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (39, 28, N'Mr', N'Karasn shanghavi', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad east', CAST(N'2021-01-13T20:20:00.000' AS DateTime), N'5799a331-8e8e-4240-8b39-026e458212bb_pexels-photo-235986.jpeg', N'eae7fdc8-cb8f-48f0-8802-4c0e0c82b354_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T14:50:54.170' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (40, 29, N'Mr', N'Karasn shanghavi3', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2016-03-09T20:22:00.000' AS DateTime), N'6d66f0e5-93da-409e-9500-2e8eb43cc50e_pexels-photo-259915.jpeg', N'378e52a4-593b-4387-9e97-a39f2e1bffdc_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T14:52:24.637' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (41, 30, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2016-05-03T20:26:00.000' AS DateTime), N'370bfa21-c9b2-4e1e-ad02-0e6fd064f02d_pexels-photo-259915.jpeg', N'22522afc-960c-4eb1-bf35-10ebf9e7d21e_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T14:56:21.300' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (42, 31, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2022-09-13T20:27:00.000' AS DateTime), N'29096a59-3b92-4e49-8258-42a45aea0570_pexels-photo-235986.jpeg', N'9868ef9f-af25-4d98-b7fa-39cd93ba4a00_woodland-road-falling-leaf-natural-38537.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T14:57:13.853' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (43, 32, N'Mrs', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2018-01-08T20:37:00.000' AS DateTime), N'7efcab1f-0f07-4315-8f8a-d42860126279_pexels-photo-259915.jpeg', N'5a08a741-4b5a-4958-af55-bb49b1eaadbe_download.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T15:07:42.677' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (44, 33, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2020-01-13T20:40:00.000' AS DateTime), N'447ea4b1-22c8-4ab1-a51e-92f624056aa4_pexels-photo-235986.jpeg', N'e905ba6a-d697-421c-9aa5-757e18ed6719_pexels-photo-1591447.jpeg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T15:10:37.720' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (45, 34, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2020-02-13T20:43:00.000' AS DateTime), NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T15:14:03.873' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (46, 35, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2016-05-03T20:47:00.000' AS DateTime), NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T15:17:18.133' AS DateTime), N'1', NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (47, 36, N'Mr', N'Ritesh a prajapati', N'9029509624', N'vijay.darji2404@gmail.com', N'Talod', N'Malad East', CAST(N'2016-05-03T20:51:00.000' AS DateTime), NULL, NULL, CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, 1, 0, NULL, NULL, CAST(N'2022-09-13T15:21:10.557' AS DateTime), N'1', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration_bk_16Aug] ON 
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, 1, N'Mr', N'Natwarbhai B Darji B Darji', N'9969379174', N'nbdarji@gmail.com', N'123456', N'123456', N'Talod', N'Malad-E', CAST(N'1966-01-06T00:00:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-08-10T15:27:06.353' AS DateTime), N'User', NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, 2, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, N'Admin', NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, 3, N'Mr', N'vimal A Parmar', N'453534343', N'vijay.darji2@gmail.com', NULL, NULL, N'Ranasan', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-08-15T17:30:02.613' AS DateTime), NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (5, 4, N'Mr', N'Ajay n Chauhan', N'32423ewr', N'vijay.darji3@gmail.com', NULL, NULL, N'Tajpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, 5, N'Mr', N'Sanjay c Solanky', N'234243', N'vijay.darji4@gmail.com', NULL, NULL, N'Kaipur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2022-08-10T19:08:18.337' AS DateTime), NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, 6, N'Mr', N'Rahul d Darji', N'78687686', N'vijay.darj5@gmail.com', NULL, NULL, N'Ratanpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (8, 7, N'Mr', N'Paresh e Parmar', N'342545345', N'vijay.darji6@gmail.com', NULL, NULL, N'Kanpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'Admin', CAST(N'2022-08-15T12:35:48.380' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (9, 8, N'Mr', N'Amit f Solanky', N'4564564', N'vijay.darji7@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10, 9, N'Mr', N'Arjun g Chauhan', N'8788767', N'vijay.darji8@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (11, 10, N'Mr', N'Karan h Parmar', N'65678867', N'vijay.darji9@gmail.com', NULL, NULL, N'Salatpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (12, 11, N'Mr', N'Hitesh i Chauhan', N'345567', N'vijay.darji11@gmail.com', NULL, NULL, N'Tajup', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (13, 12, N'Mr', N'Amit j Solanky', N'3464567', N'vijay.darji12@gmail.com', NULL, NULL, N'Harsol', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (14, 13, N'Mr', N'Akshay k Parmar', N'878678', N'vijay.darji13@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (15, 14, N'Mr', N'vijay N Darji', N'123123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T19:42:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:13:58.277' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (16, 15, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:01:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:32:30.230' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, 16, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:06:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:37:10.180' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (18, 17, N'Mr', N'vijay N Darji', N'12121', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:08:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:39:40.840' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (19, 18, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:41:36.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (20, 19, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:42:07.113' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (21, 20, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:42:12.697' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (22, 21, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:42:57.280' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (23, 22, N'Mr', N'vijay N Darji', N'232323', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:13:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:43:50.743' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (24, 23, N'Mr', N'vijay N Darji', N'234234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:44:55.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (25, 24, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'1988-04-24T10:16:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T04:47:59.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (26, 25, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'1966-02-24T10:20:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T04:51:43.153' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (27, 26, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-06-12T11:02:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T05:33:10.833' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (28, 27, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-06-12T11:02:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T05:40:06.313' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (29, 28, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T15:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T07:38:26.627' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (30, 29, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T15:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T07:51:38.260' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (31, 30, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T13:39:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:09:54.293' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (32, 31, N'Mr', N'vijay N Darji', N'2435', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2019-01-12T13:45:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:15:31.620' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (33, 32, N'Mr', N'vijay N Darji', N'4343', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-01T13:47:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:18:01.407' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (34, 33, N'Mr', N'vijay N Darji', N'567567', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-01-03T13:53:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:23:51.663' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (35, 34, N'Mr', N'vijay N Darji', N'3424234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T14:57:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T09:28:16.847' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (36, 35, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2017-01-15T18:20:00.000' AS DateTime), N'98f1c6dc-471b-4625-bd57-daeb9b9fafb1_Passport-Size-Pics.jpg', N'43a8ff57-39cd-4893-9f7f-ac8d6938c025_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T12:50:45.627' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (37, 36, N'Mr', N'vijay N Darji', N'3453534', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T18:24:00.000' AS DateTime), N'89e763ca-5170-4f83-9a78-fb40e955e238_Passport-Size-Pics.jpg', N'260644f8-ba56-411a-a3bd-b3e4bef742e8_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T12:54:28.327' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (38, 37, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T18:49:00.000' AS DateTime), N'a561d973-b3b0-4b15-8c6a-c5033e74376a_Passport-Size-Pics.jpg', N'29d10337-4d54-4432-874b-01db50dc37fa_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:19:43.157' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (39, 38, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T18:52:00.000' AS DateTime), N'5e659e5f-ca6e-4262-930f-f903239b5ab7_Passport-Size-Pics.jpg', N'50f8a451-69d5-4221-85ed-3909e5ccb7a2_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:23:07.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (40, 39, N'Mr', N'vijay N Darji', N'1231321', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-01-04T19:04:00.000' AS DateTime), N'd6fd1776-82d8-4118-a96d-942f8986d232_Passport-Size-Pics.jpg', N'a6bebf08-104c-4dc3-b1c0-70e81d2b630f_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:34:33.860' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (41, 40, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-03-01T19:07:00.000' AS DateTime), N'45ed627b-6cd3-4c23-a9bb-8a7115c6712f_Passport-Size-Pics.jpg', N'd1f978a5-ae51-45e4-94e0-36e076c49c4d_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:38:07.760' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (42, 41, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T19:12:00.000' AS DateTime), N'e8b85c79-7b4e-49c6-b410-cb86bf299de9_Passport-Size-Pics.jpg', N'5fbf3321-2488-4e41-a5f8-1536ce7fa0cf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:42:57.943' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (43, 42, N'Mr', N'vijay N Darji', N'121213', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-05T19:17:00.000' AS DateTime), N'77f7a2bd-58e5-4fa9-b0f2-6fc46118afdc_Passport-Size-Pics.jpg', N'0dc8008e-2814-41fe-b0be-64358b705ea4_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:48:12.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_16Aug] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (44, 43, N'Mr', N'vijay N Darji', N'567576', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T19:27:00.000' AS DateTime), N'095b865d-ecb5-436b-a50b-4503faaf18e3_Passport-Size-Pics.jpg', N'6e60ffd0-0bfc-476e-81a5-2d0bcdc63a0d_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:57:32.660' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration_bk_16Aug] OFF
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration_bk_20Aug] ON 
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, 1, N'Mr', N'Natwarbhai', N'B', N'Darji', N'9969379174', N'nbdarji@gmail.com', N'123456', N'123456', N'Talod', N'Malad-E', CAST(N'1966-01-06T00:00:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-08-10T15:27:06.353' AS DateTime), N'User', NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, 2, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, N'Admin', NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, 3, N'Mr', N'vimal', N'A', N'Parmar', N'453534343', N'vijay.darji2@gmail.com', NULL, NULL, N'Ranasan', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-08-15T17:30:02.613' AS DateTime), NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (5, 4, N'Mr', N'Ajay', N'n', N'Chauhan', N'32423ewr', N'vijay.darji3@gmail.com', NULL, NULL, N'Tajpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, 5, N'Mr', N'Sanjay', N'c', N'Solanky', N'234243', N'vijay.darji4@gmail.com', NULL, NULL, N'Kaipur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2022-08-10T19:08:18.337' AS DateTime), NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, 6, N'Mr', N'Rahul', N'd', N'Darji', N'78687686', N'vijay.darj5@gmail.com', NULL, NULL, N'Ratanpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (8, 7, N'Mr', N'Paresh', N'e', N'Parmar', N'342545345', N'vijay.darji6@gmail.com', NULL, NULL, N'Kanpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'Admin', CAST(N'2022-08-15T12:35:48.380' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (9, 8, N'Mr', N'Amit', N'f', N'Solanky', N'4564564', N'vijay.darji7@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10, 9, N'Mr', N'Arjun', N'g', N'Chauhan', N'8788767', N'vijay.darji8@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (11, 10, N'Mr', N'Karan', N'h', N'Parmar', N'65678867', N'vijay.darji9@gmail.com', NULL, NULL, N'Salatpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (12, 11, N'Mr', N'Hitesh', N'i', N'Chauhan', N'345567', N'vijay.darji11@gmail.com', NULL, NULL, N'Tajup', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (13, 12, N'Mr', N'Amit', N'j', N'Solanky', N'3464567', N'vijay.darji12@gmail.com', NULL, NULL, N'Harsol', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (14, 13, N'Mr', N'Akshay', N'k', N'Parmar', N'878678', N'vijay.darji13@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (15, 14, N'Mr', N'vijay', N'N', N'Darji', N'123123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T19:42:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:13:58.277' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (16, 15, N'Mr', N'vijay', N'N', N'Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:01:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:32:30.230' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, 16, N'Mr', N'vijay', N'N', N'Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:06:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:37:10.180' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (18, 17, N'Mr', N'vijay', N'N', N'Darji', N'12121', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:08:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:39:40.840' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (19, 18, N'Mr', N'vijay', N'N', N'Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:41:36.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (20, 19, N'Mr', N'vijay', N'N', N'Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:42:07.113' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (21, 20, N'Mr', N'vijay', N'N', N'Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:42:12.697' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (22, 21, N'Mr', N'vijay', N'N', N'Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:42:57.280' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (23, 22, N'Mr', N'vijay', N'N', N'Darji', N'232323', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:13:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:43:50.743' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (24, 23, N'Mr', N'vijay', N'N', N'Darji', N'234234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:44:55.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (25, 24, N'Mr', N'vijay', N'N', N'Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'1988-04-24T10:16:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T04:47:59.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (26, 25, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'1966-02-24T10:20:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T04:51:43.153' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (27, 26, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-06-12T11:02:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T05:33:10.833' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (28, 27, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-06-12T11:02:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T05:40:06.313' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (29, 28, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T15:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T07:38:26.627' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (30, 29, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T15:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T07:51:38.260' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (31, 30, N'Mr', N'vijay', N'N', N'Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T13:39:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:09:54.293' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (32, 31, N'Mr', N'vijay', N'N', N'Darji', N'2435', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2019-01-12T13:45:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:15:31.620' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (33, 32, N'Mr', N'vijay', N'N', N'Darji', N'4343', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-01T13:47:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:18:01.407' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (34, 33, N'Mr', N'vijay', N'N', N'Darji', N'567567', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-01-03T13:53:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:23:51.663' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (35, 34, N'Mr', N'vijay', N'N', N'Darji', N'3424234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T14:57:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T09:28:16.847' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (36, 35, N'Mr', N'vijay', N'N', N'Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2017-01-15T18:20:00.000' AS DateTime), N'98f1c6dc-471b-4625-bd57-daeb9b9fafb1_Passport-Size-Pics.jpg', N'43a8ff57-39cd-4893-9f7f-ac8d6938c025_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T12:50:45.627' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (37, 36, N'Mr', N'vijay', N'N', N'Darji', N'3453534', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T18:24:00.000' AS DateTime), N'89e763ca-5170-4f83-9a78-fb40e955e238_Passport-Size-Pics.jpg', N'260644f8-ba56-411a-a3bd-b3e4bef742e8_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T12:54:28.327' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (38, 37, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T18:49:00.000' AS DateTime), N'a561d973-b3b0-4b15-8c6a-c5033e74376a_Passport-Size-Pics.jpg', N'29d10337-4d54-4432-874b-01db50dc37fa_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:19:43.157' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (39, 38, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T18:52:00.000' AS DateTime), N'5e659e5f-ca6e-4262-930f-f903239b5ab7_Passport-Size-Pics.jpg', N'50f8a451-69d5-4221-85ed-3909e5ccb7a2_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:23:07.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (40, 39, N'Mr', N'vijay', N'N', N'Darji', N'1231321', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-01-04T19:04:00.000' AS DateTime), N'd6fd1776-82d8-4118-a96d-942f8986d232_Passport-Size-Pics.jpg', N'a6bebf08-104c-4dc3-b1c0-70e81d2b630f_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:34:33.860' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (41, 40, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-03-01T19:07:00.000' AS DateTime), N'45ed627b-6cd3-4c23-a9bb-8a7115c6712f_Passport-Size-Pics.jpg', N'd1f978a5-ae51-45e4-94e0-36e076c49c4d_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:38:07.760' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (42, 41, N'Mr', N'vijay', N'N', N'Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T19:12:00.000' AS DateTime), N'e8b85c79-7b4e-49c6-b410-cb86bf299de9_Passport-Size-Pics.jpg', N'5fbf3321-2488-4e41-a5f8-1536ce7fa0cf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:42:57.943' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (43, 42, N'Mr', N'vijay', N'N', N'Darji', N'121213', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-05T19:17:00.000' AS DateTime), N'77f7a2bd-58e5-4fa9-b0f2-6fc46118afdc_Passport-Size-Pics.jpg', N'0dc8008e-2814-41fe-b0be-64358b705ea4_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:48:12.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration_bk_20Aug] ([Id], [MemberCode], [Initials], [Firstname], [Middlename], [Lastname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (44, 43, N'Mr', N'vijay', N'N', N'Darji', N'567576', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T19:27:00.000' AS DateTime), N'095b865d-ecb5-436b-a50b-4503faaf18e3_Passport-Size-Pics.jpg', N'6e60ffd0-0bfc-476e-81a5-2d0bcdc63a0d_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-15T13:57:32.660' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration_bk_20Aug] OFF
GO
SET IDENTITY_INSERT [dbo].[RegTransactionOffline] ON 
GO
INSERT [dbo].[RegTransactionOffline] ([Id], [MemberCode], [OrderId], [Amount], [PaymentBy], [IsPaid], [IsPaymentApproved], [PaymentApprovedBy], [PaymentApprovedDate], [CreatedOn]) VALUES (1, 32, N'43-32-23559', CAST(500.00 AS Decimal(18, 2)), N'1', 1, NULL, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[RegTransactionOffline] ([Id], [MemberCode], [OrderId], [Amount], [PaymentBy], [IsPaid], [IsPaymentApproved], [PaymentApprovedBy], [PaymentApprovedDate], [CreatedOn]) VALUES (2, 33, N'44-33-37268', CAST(500.00 AS Decimal(18, 2)), N'1', 1, NULL, NULL, NULL, CAST(N'2022-09-13T15:10:44.1506432' AS DateTime2))
GO
INSERT [dbo].[RegTransactionOffline] ([Id], [MemberCode], [OrderId], [Amount], [PaymentBy], [IsPaid], [IsPaymentApproved], [PaymentApprovedBy], [PaymentApprovedDate], [CreatedOn]) VALUES (3, 36, N'47-36-30355', CAST(500.00 AS Decimal(18, 2)), N'1', 1, NULL, NULL, NULL, CAST(N'2022-09-13T15:21:17.1077666' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[RegTransactionOffline] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMembersMapping] ON 
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, 1, N'1', CAST(N'2022-09-03T05:52:35.203' AS DateTime), 0, CAST(N'2022-09-03T04:20:50.740' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 2, 2, 1, N'1', CAST(N'2022-09-03T05:53:49.227' AS DateTime), 0, CAST(N'2022-09-03T05:29:39.880' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 1, 3, 1, N'1', CAST(N'2022-09-13T04:58:24.783' AS DateTime), 0, CAST(N'2022-09-12T14:32:03.223' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserMembersMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [MobileNo], [Password], [PasswordSalt], [Role], [ActivationCode], [ResetPasswordCode], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'SuperAdmin', N'vijay.darji2404@gmail.com', N'9029509624', N'uqfycgemJ/LZPwgrq2uj55WRriHI5lletTBjFyV06hg=', N'XCCrFnWxDWmjn4R3K7tIcKGMv6/Pl2/IQASHko5qhVEnVJnVHk2KnunvleeZKSgfZ4PPCAFXJ8RoDJXhiYqgfU3NXqD4JfKF30b761vPG9dhRZhrn8Jxras6WIzHA/9owTdXsTsI00CLoXTB8sjNVSeR5LTPD4V7WWlhhomkNvk=', N'Admin', N'9d6e08ba-ac96-4350-89bd-3ebcb263e53c', N'77fdf9da-0d5e-43fc-87f2-2768a4662e9f', 1, CAST(N'2022-09-11T09:10:29.983' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ContributionTransactions] ADD  CONSTRAINT [DF_ContributionTransactions_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[ContributionTransactions] ADD  CONSTRAINT [DF_ContributionTransactions_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_IsArchived]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_IsPaymentApprovedByAdmin]  DEFAULT ((0)) FOR [IsPaymentApproved]
GO
ALTER TABLE [dbo].[MembersContribution] ADD  CONSTRAINT [DF_MembersContribution_IsActive]  DEFAULT ((1)) FOR [IsActive]
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
ALTER TABLE [dbo].[RegistrationTransactions] ADD  CONSTRAINT [DF_RegistrationTransactions_IsPaymentApproved]  DEFAULT ((0)) FOR [IsPaymentApproved]
GO
ALTER TABLE [dbo].[RegTransactionOffline] ADD  CONSTRAINT [DF_RegTransactionOffline_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[RegTransactionOffline] ADD  CONSTRAINT [DF_RegTransactionOffline_IsPaymentApproved]  DEFAULT ((0)) FOR [IsPaymentApproved]
GO
ALTER TABLE [dbo].[RegTransactionOffline] ADD  CONSTRAINT [DF_RegTransactionOffline_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserMembersMapping] ADD  CONSTRAINT [DF_UserMembersMapping_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[UserMembersMapping] ADD  CONSTRAINT [DF_UserMembersMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserMembersMapping] ADD  CONSTRAINT [DF_UserMembersMapping_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedOn]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
USE [master]
GO
ALTER DATABASE [SmjApp] SET  READ_WRITE 
GO
