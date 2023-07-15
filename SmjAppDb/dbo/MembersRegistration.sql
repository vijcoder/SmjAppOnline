CREATE TABLE [dbo].[MembersRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberCode] [nvarchar](50) NOT NULL,
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
	[AgeProofImage] [nvarchar](50) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MembersRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
--GO

--ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsExpired]  DEFAULT ((0)) FOR [IsExpired]
--GO

--ALTER TABLE [dbo].[MembersRegistration] ADD  CONSTRAINT [DF_MembersRegistration_IsActive]  DEFAULT ((1)) FOR [IsActive]
--GO


