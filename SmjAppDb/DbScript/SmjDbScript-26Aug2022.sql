USE [master]
GO
/****** Object:  Database [SmjApp]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[ContributionTransactions]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[MembersContribution]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[MembersRegistration]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[MembersRegistration_bk_16Aug]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[MembersRegistration_bk_20Aug]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[RegistrationTransactions]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[UserMembersMapping]    Script Date: 8/26/2022 2:37:28 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 8/26/2022 2:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PasswordSalt] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
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
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (1, N'XXjGJp79519699543840', N'43,8', N'1,3', N'44231_43|8_1|3', N'INR', N'400.00', N'TXN_FAILURE', NULL, NULL, N'317', N'Invalid payment mode', NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-08-20T10:19:49.050' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (2, N'XXjGJp79519699543840', N'43,8', N'1,3', N'44231_43|8_1|3', N'INR', N'400.00', N'TXN_FAILURE', NULL, NULL, N'317', N'Invalid payment mode', NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-08-20T10:19:51.403' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (3, N'XXjGJp79519699543840', N'43', N'1,3', N'19825_43_1|3', N'INR', N'200.00', N'TXN_FAILURE', NULL, NULL, N'317', N'Invalid payment mode', NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-08-20T10:22:07.713' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (4, N'XXjGJp79519699543840', N'43', N'1,3', N'315_43_1|3', N'INR', N'200.00', N'TXN_FAILURE', NULL, NULL, N'317', N'Invalid payment mode', NULL, NULL, NULL, NULL, 0, NULL, CAST(N'2022-08-20T10:23:37.643' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (5, N'XXjGJp79519699543840', N'43', N'1,3', N'21077_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168104803980355', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 11:52:51.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T06:23:55.547' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (6, N'XXjGJp79519699543840', N'43', N'1,3', N'77546_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168725604025174', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 20:26:22.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T14:57:20.287' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (7, N'XXjGJp79519699543840', N'43', N'1,3', N'99616_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168207903983842', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:03:53.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T15:36:17.940' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (8, N'XXjGJp79519699543840', N'43', N'1,3', N'32773_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168132404022242', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:07:41.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T15:38:41.253' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (9, N'XXjGJp79519699543840', N'43', N'1,3', N'37639_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168338704001606', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:09:04.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T15:40:06.960' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (10, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:11:37.937' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (11, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:14:48.090' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (12, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:16:41.353' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (13, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:17:41.553' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (14, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:18:01.180' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (15, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:18:15.960' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (16, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:18:39.913' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (17, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:19:10.980' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (18, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:19:25.223' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (19, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:21:02.197' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (20, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:22:18.570' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (21, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:22:30.557' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (22, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:23:16.840' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (23, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:25:27.503' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (24, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:25:52.160' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (25, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:26:14.810' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (26, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:27:24.300' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (27, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:27:45.170' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (28, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:28:04.607' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (29, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:28:37.667' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (30, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:29:26.490' AS DateTime))
GO
INSERT [dbo].[ContributionTransactions] ([Id], [MID], [MemberCode], [exMemberCode], [ORDERID], [CURRENCY], [TXNAMOUNT], [STATUS], [TXNID], [BANKTXNID], [RESPCODE], [RESPMSG], [TXNDATE], [GATEWAYNAME], [BANKNAME], [PAYMENTMODE], [IsPaid], [PaymentBy], [CreatedOn]) VALUES (31, N'XXjGJp79519699543840', N'43', N'1,3', N'78442_43_1|3', N'INR', N'200.00', N'PENDING', N'20220822111212800110168702203996601', NULL, N'402', N'Looks like the payment is not complete. Please wait while we confirm the status with your bank.', N'2022-08-22 21:40:07.0', NULL, N'State Bank of India', N'NB', 0, NULL, CAST(N'2022-08-22T16:30:17.713' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ContributionTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[MembersContribution] ON 
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, N'43', N'3', N'21077_43_1|3', CAST(200.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T06:23:55.280' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, N'43', N'3', N'77546_43_1|3', CAST(200.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T14:57:20.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, N'43', N'3', N'99616_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T15:36:09.260' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, N'43', N'3', N'32773_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T15:38:40.987' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (5, N'43', N'3', N'37639_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T15:40:05.313' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:11:35.020' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:14:47.273' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (8, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:16:40.293' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (9, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:17:41.547' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:18:01.167' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (11, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:18:15.950' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (12, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:18:39.900' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (13, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:19:10.963' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (14, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:19:25.207' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (15, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:21:02.183' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (16, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:22:18.563' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:22:30.547' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (18, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:23:16.827' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (19, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:25:27.490' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (20, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:25:52.150' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (21, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:26:14.797' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (22, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:27:24.277' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (23, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:27:45.167' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (24, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:28:04.580' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (25, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:28:37.653' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (26, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:29:26.480' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersContribution] ([Id], [MemberCode], [ExMemberCode], [OrderId], [OrderAmount], [PaymentMode], [PaymentBy], [IsArchived], [IsPaid], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (27, N'43', N'3', N'78442_43_1|3', CAST(100.00 AS Decimal(18, 2)), N'NB', N'LoggedInUserNameOrId', 0, 0, 0, CAST(N'2022-08-22T16:30:17.700' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MembersContribution] OFF
GO
SET IDENTITY_INSERT [dbo].[MembersRegistration] ON 
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, 1, N'Mr', N'Natwarbhai B Darji B Darji', N'9969379174', N'nbdarji@gmail.com', N'123456', N'123456', N'Talod', N'Malad-E', CAST(N'1966-01-06T00:00:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-08-10T15:27:06.353' AS DateTime), N'User', NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, 2, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, N'Admin', NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, 3, N'Mr', N'vimal A Parmar', N'453534343', N'vijay.darji2@gmail.com', NULL, NULL, N'Ranasan', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(N'2022-08-15T17:30:02.613' AS DateTime), NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, 4, N'Mr', N'Ajay n Chauhan', N'32423ewr', N'vijay.darji3@gmail.com', NULL, NULL, N'Tajpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (5, 5, N'Mr', N'Sanjay c Solanky', N'234243', N'vijay.darji4@gmail.com', NULL, NULL, N'Kaipur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2022-08-10T19:08:18.337' AS DateTime), NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, 6, N'Mr', N'Rahul d Darji', N'78687686', N'vijay.darj5@gmail.com', NULL, NULL, N'Ratanpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, 7, N'Mr', N'Paresh e Parmar', N'342545345', N'vijay.darji6@gmail.com', NULL, NULL, N'Kanpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'Admin', CAST(N'2022-08-15T12:35:48.380' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (8, 8, N'Mr', N'Amit f Solanky', N'4564564', N'vijay.darji7@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 1, N'vijay.darji2404', CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (9, 9, N'Mr', N'Arjun g Chauhan', N'8788767', N'vijay.darji8@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10, 10, N'Mr', N'Karan h Parmar', N'65678867', N'vijay.darji9@gmail.com', NULL, NULL, N'Salatpur', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (11, 11, N'Mr', N'Hitesh i Chauhan', N'345567', N'vijay.darji11@gmail.com', NULL, NULL, N'Tajup', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (12, 12, N'Mr', N'Amit j Solanky', N'3464567', N'vijay.darji12@gmail.com', NULL, NULL, N'Harsol', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (13, 13, N'Mr', N'Akshay k Parmar', N'878678', N'vijay.darji13@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-09T16:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-09T10:42:39.227' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (14, 14, N'Mr', N'vijay N Darji', N'123123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T19:42:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:13:58.277' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (15, 15, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:01:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:32:30.230' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (16, 16, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:06:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:37:10.180' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, 17, N'Mr', N'vijay N Darji', N'12121', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:08:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:39:40.840' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (18, 18, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:41:36.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (19, 19, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 1, NULL, CAST(N'2022-08-14T07:21:03.560' AS DateTime), CAST(N'2022-08-11T14:42:07.113' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (20, 20, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:42:12.697' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (21, 21, N'Mr', N'vijay N Darji', N'34546', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:11:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:42:57.280' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (22, 22, N'Mr', N'vijay N Darji', N'232323', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:13:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:43:50.743' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (23, 23, N'Mr', N'vijay N Darji', N'234234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-11T20:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-11T14:44:55.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (24, 24, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'1988-04-24T10:16:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T04:47:59.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (25, 25, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'1966-02-24T10:20:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T04:51:43.153' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (26, 26, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-06-12T11:02:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T05:33:10.833' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (27, 27, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-06-12T11:02:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T05:40:06.313' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (28, 28, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T15:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T07:38:26.627' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (29, 29, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T15:14:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T07:51:38.260' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (30, 30, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T13:39:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:09:54.293' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (31, 31, N'Mr', N'vijay N Darji', N'2435', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2019-01-12T13:45:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:15:31.620' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (32, 32, N'Mr', N'vijay N Darji', N'4343', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-08-01T13:47:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:18:01.407' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (33, 33, N'Mr', N'vijay N Darji', N'567567', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2022-01-03T13:53:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T08:23:51.663' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (34, 34, N'Mr', N'vijay N Darji', N'3424234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T14:57:00.000' AS DateTime), N'cd8f9a9a-f5af-4209-9ede-2f18c11d1a34_Passport-Size-Pics.jpg', N'ae0a0e2c-aaed-4c0f-8764-4cfb7d95acdf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-12T09:28:16.847' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (35, 35, N'Mr', N'vijay N Darji', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2017-01-15T18:20:00.000' AS DateTime), N'98f1c6dc-471b-4625-bd57-daeb9b9fafb1_Passport-Size-Pics.jpg', N'43a8ff57-39cd-4893-9f7f-ac8d6938c025_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T12:50:45.627' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (36, 36, N'Mr', N'vijay N Darji', N'3453534', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T18:24:00.000' AS DateTime), N'89e763ca-5170-4f83-9a78-fb40e955e238_Passport-Size-Pics.jpg', N'260644f8-ba56-411a-a3bd-b3e4bef742e8_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T12:54:28.327' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (37, 37, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T18:49:00.000' AS DateTime), N'a561d973-b3b0-4b15-8c6a-c5033e74376a_Passport-Size-Pics.jpg', N'29d10337-4d54-4432-874b-01db50dc37fa_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:19:43.157' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (38, 38, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T18:52:00.000' AS DateTime), N'5e659e5f-ca6e-4262-930f-f903239b5ab7_Passport-Size-Pics.jpg', N'50f8a451-69d5-4221-85ed-3909e5ccb7a2_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:23:07.550' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (39, 39, N'Mr', N'vijay N Darji', N'1231321', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-01-04T19:04:00.000' AS DateTime), N'd6fd1776-82d8-4118-a96d-942f8986d232_Passport-Size-Pics.jpg', N'a6bebf08-104c-4dc3-b1c0-70e81d2b630f_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:34:33.860' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (40, 40, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2018-03-01T19:07:00.000' AS DateTime), N'45ed627b-6cd3-4c23-a9bb-8a7115c6712f_Passport-Size-Pics.jpg', N'd1f978a5-ae51-45e4-94e0-36e076c49c4d_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:38:07.760' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (41, 41, N'Mr', N'vijay N Darji', N'1234', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T19:12:00.000' AS DateTime), N'e8b85c79-7b4e-49c6-b410-cb86bf299de9_Passport-Size-Pics.jpg', N'5fbf3321-2488-4e41-a5f8-1536ce7fa0cf_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:42:57.943' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (42, 42, N'Mr', N'vijay N Darji', N'121213', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-05T19:17:00.000' AS DateTime), N'77f7a2bd-58e5-4fa9-b0f2-6fc46118afdc_Passport-Size-Pics.jpg', N'0dc8008e-2814-41fe-b0be-64358b705ea4_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:48:12.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (43, 43, N'Mr', N'vijay N Darji', N'567576', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-03-03T19:27:00.000' AS DateTime), N'095b865d-ecb5-436b-a50b-4503faaf18e3_Passport-Size-Pics.jpg', N'6e60ffd0-0bfc-476e-81a5-2d0bcdc63a0d_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 1, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-15T13:57:32.660' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (44, 44, N'Mr', N'Ritesh a prajapati', N'123', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-05-03T14:19:00.000' AS DateTime), N'20c2c95b-81f8-4091-af3c-02ada3570324_Passport-Size-Pics.jpg', N'a5189678-5919-4177-92cb-01b3dd5ff2ef_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-20T08:49:41.567' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (45, 45, N'Widow', N'Ritesh a prajapati', N'1231231231', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-02-21T11:27:00.000' AS DateTime), N'99a9c338-449f-4694-82d8-26a5d2c6aeb6_Passport-Size-Pics.jpg', N'952314b4-b9e0-4329-be34-25a38ac82318_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-21T05:57:33.193' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[MembersRegistration] ([Id], [MemberCode], [Initials], [Fullname], [MobileNo], [EmailId], [Password], [PasswordSaltKey], [Villagename], [Address], [DOB], [ProfileImage], [AgeProofImage], [Amount], [IsPaid], [IsExpired], [ExpiryDate], [Role], [Token], [IsActive], [IsApproved], [ApprovedBy], [ApprovedDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (46, 46, N'Widow', N'Ritesh a prajapati', N'1231231231', N'vijay.darji2404@gmail.com', NULL, NULL, N'Talod', N'Malad East', CAST(N'2016-02-21T11:27:00.000' AS DateTime), N'083a18c1-ec24-4a08-9814-5298646d4c0a_Passport-Size-Pics.jpg', N'3dace9b0-ce79-45ca-a7a4-0a9b6ac6270f_Passport-Size-Pics.jpg', CAST(500.00 AS Decimal(18, 2)), 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, CAST(N'2022-08-21T05:59:53.347' AS DateTime), NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[UserMembersMapping] ON 
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 2, 43, 0, NULL, NULL, 0, CAST(N'2022-08-25T05:23:52.160' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, 2, 3, 0, NULL, NULL, 0, CAST(N'2022-08-25T05:28:08.987' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, 2, 4, 0, NULL, NULL, 0, CAST(N'2022-08-25T05:39:48.700' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, 2, 5, 0, NULL, NULL, 0, CAST(N'2022-08-25T05:52:10.440' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, 2, 8, 0, NULL, NULL, 0, CAST(N'2022-08-25T07:20:23.313' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, 43, 0, NULL, NULL, 0, CAST(N'2022-08-25T12:00:53.230' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, 1, 3, 0, NULL, NULL, 0, CAST(N'2022-08-25T12:01:24.320' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[UserMembersMapping] ([Id], [UserId], [MemberCode], [IsApproved], [ApprovedBy], [ApprovedOn], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (8, 5, 43, 0, NULL, NULL, 0, CAST(N'2022-08-26T06:34:16.160' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserMembersMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [MobileNo], [Password], [PasswordSalt], [Role], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'SuperAdmin', N'vijay.darji2404@gmail.com', N'9029509624', N'Abcd@12345', N'f782bd6d-d398-443f-83fb-fcdbb481837a', N'Admin', 1, CAST(N'2022-08-25T11:56:18.440' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [MobileNo], [Password], [PasswordSalt], [Role], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'vijay n darji', N'vijay.darji2@gmail.com', N'9029509624', N'Abcd@12345', N'fdb0b2d1-0cc1-4ad0-a3d4-97af6939662a', N'User', 1, CAST(N'2022-08-25T13:11:03.017' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [MobileNo], [Password], [PasswordSalt], [Role], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (4, N'vijay n darji', N'vijay.darji3@gmail.com', N'9029509624', N'Abcd@12345', N'd95fd19e-9cbd-493b-b33f-2497fb87f4ce', N'User', 1, CAST(N'2022-08-26T03:49:40.737' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [MobileNo], [Password], [PasswordSalt], [Role], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'vijay n darji24', N'vijay.darji24@gmail.com', N'9029509624', N'Abcd@12345', N'38b625d3-6245-432d-b91e-91b86d23ef55', N'User', 1, CAST(N'2022-08-26T06:24:30.513' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [MobileNo], [Password], [PasswordSalt], [Role], [IsActive], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (6, N'vijay n darji', N'vijay.darji4@gmail.com', N'9029509624', N'Abcd@12345', N'f03b87af-aa3f-4626-8676-694f293fdd04', N'User', 1, CAST(N'2022-08-26T06:42:41.403' AS DateTime), NULL, NULL)
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
/****** Object:  StoredProcedure [dbo].[proc_GetAllMembers]    Script Date: 8/26/2022 2:37:28 PM ******/
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
