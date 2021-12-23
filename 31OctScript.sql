USE [master]
GO
/****** Object:  Database [indianlotus]    Script Date: 31-10-2020 22:06:14 ******/
CREATE DATABASE [indianlotus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'indianlotus', FILENAME = N'D:\microsoft sql server\data\indianlotus.mdf' , SIZE = 8192KB , MAXSIZE = 5242880KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'indianlotus_log', FILENAME = N'D:\microsoft sql server\data\indianlotus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [indianlotus] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [indianlotus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [indianlotus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [indianlotus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [indianlotus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [indianlotus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [indianlotus] SET ARITHABORT OFF 
GO
ALTER DATABASE [indianlotus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [indianlotus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [indianlotus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [indianlotus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [indianlotus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [indianlotus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [indianlotus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [indianlotus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [indianlotus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [indianlotus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [indianlotus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [indianlotus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [indianlotus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [indianlotus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [indianlotus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [indianlotus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [indianlotus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [indianlotus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [indianlotus] SET  MULTI_USER 
GO
ALTER DATABASE [indianlotus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [indianlotus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [indianlotus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [indianlotus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [indianlotus] SET DELAYED_DURABILITY = DISABLED 
GO
USE [indianlotus]
GO
/****** Object:  User [indianlo]    Script Date: 31-10-2020 22:06:18 ******/
CREATE USER [indianlo] FOR LOGIN [indianlo] WITH DEFAULT_SCHEMA=[indianlo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [indianlo]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [indianlo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [indianlo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [indianlo]
GO
/****** Object:  Schema [indianlo]    Script Date: 31-10-2020 22:06:20 ******/
CREATE SCHEMA [indianlo]
GO
/****** Object:  Table [dbo].[BookingRequest]    Script Date: 31-10-2020 22:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingRequest](
	[Id] [bigint] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NOT NULL,
	[People] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Time] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BookingRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactRequest]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactRequest](
	[Id] [bigint] IDENTITY(101,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContactRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mtbAlbum]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mtbAlbum](
	[id] [bigint] IDENTITY(101,1) NOT NULL,
	[AlbumName] [varchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__mtbAlbum__isactive]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__mtbAlbum__CreatedDate]  DEFAULT (getdate()),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF__mtbAlbum__ModifiedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[AlbumImage] [varchar](max) NULL,
 CONSTRAINT [PK__mtbAlbum__Id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mtbCity]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mtbCity](
	[id] [bigint] IDENTITY(101,1) NOT NULL,
	[CityName] [varchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__mtbCity__isactive]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__mtbCity__CreatedDate]  DEFAULT (getdate()),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF__mtbCity__ModifiedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK__mtbCity__Id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ShippingDetailId] [int] NULL,
	[Spices] [varchar](20) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[Tbl_Cart] ADD [Flavour] [varchar](50) NULL
 CONSTRAINT [PK_Tbl_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](100) NULL,
 CONSTRAINT [PK_Tbl_CartStatus] PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[Image] [varchar](max) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_Tbl_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_PaymentDetails]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_PaymentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[Response] [varchar](max) NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ShippingDetailId] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_PaymentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Description] [varchar](max) NULL,
	[ProductImage] [varchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsFeatured] [bit] NULL,
 CONSTRAINT [PK_Tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderMode] [varchar](max) NULL,
 CONSTRAINT [PK_Tbl_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGallery]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGallery](
	[id] [bigint] IDENTITY(101,1) NOT NULL,
	[GalleryName] [varchar](250) NOT NULL,
	[GalleryPath] [varchar](max) NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__tblGallery__isactive]  DEFAULT ((1)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__tblGallery__CreatedDate]  DEFAULT (getdate()),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF__tblGallery__ModifiedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[tblGallery] ADD [Title] [varchar](250) NULL
 CONSTRAINT [PK__tblGallery__Id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMenu]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[MenuDescription] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubMenu]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MainMenuId] [int] NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[MenuText] [varchar](max) NOT NULL,
	[MenuDescription] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblSubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [int] NULL,
	[CurCountry] [int] NULL,
	[CurState] [int] NULL,
	[CurCity] [int] NULL,
	[CurZipCode] [varchar](50) NULL,
	[CurAddress1] [varchar](700) NULL,
	[CurAddress2] [varchar](700) NULL,
	[ProfileUrl] [varchar](max) NULL,
	[UserId] [bigint] NOT NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF__UserDetai__IsDef__73BA3083]  DEFAULT ((0)),
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserTypeId] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[WorkPhone] [varchar](50) NULL,
	[UserName] [nvarchar](100) NULL,
	[SaltKey] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](250) NULL,
	[DefaultPassword] [bit] NULL,
	[LastLoginDate] [datetime] NULL,
	[IsOnLine] [bit] NULL,
	[AccountStatus] [int] NULL,
	[ReportingTo] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AssignedRegionId] [bigint] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 31-10-2020 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BookingRequest] ON 

GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (101, N'raman', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-05-06 00:00:00.000' AS DateTime), N'6 : 30 PM', 1, CAST(N'2020-05-06 02:37:33.940' AS DateTime), CAST(N'2020-05-06 02:37:33.940' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (102, N'Kate Gardiner', N'kl.gardiner01@gmail.com', N'0273272161', 3, 0, CAST(N'2020-05-30 00:00:00.000' AS DateTime), N'6 : 00 PM', 1, CAST(N'2020-05-29 23:55:07.760' AS DateTime), CAST(N'2020-05-29 23:55:07.760' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (103, N'Megan', N'megymo1@gmail.com', N'0273587589', 2, 0, CAST(N'2020-06-05 00:00:00.000' AS DateTime), N'7 : 00 PM', 1, CAST(N'2020-06-05 06:18:54.647' AS DateTime), CAST(N'2020-06-05 06:18:54.647' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (106, N'Nicole Taikato-Wheeler ', N'nicoletw2@xtra.co.nz', N'+6421642653', 2, 0, CAST(N'2020-06-12 00:00:00.000' AS DateTime), N'6 : 00 PM', 1, CAST(N'2020-06-11 21:28:53.053' AS DateTime), CAST(N'2020-06-11 21:28:53.053' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (107, N'Troy Groom', N'troy_groom@yahoo.co.nz', N'0276993069', 3, 0, CAST(N'2020-06-21 00:00:00.000' AS DateTime), N'5 : 30 PM', 1, CAST(N'2020-06-20 05:13:06.407' AS DateTime), CAST(N'2020-06-20 05:13:06.407' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (113, N'Elizabeth', N'elizabethprasad31@gmail.com', N'0223173915', 3, 0, CAST(N'2020-06-27 00:00:00.000' AS DateTime), N'7 : 30 PM', 1, CAST(N'2020-06-27 05:14:54.503' AS DateTime), CAST(N'2020-06-27 05:14:54.503' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (114, N'Garry', N'mahalamandeep9@gmail.com', N'0223116631', 2, 0, CAST(N'2020-06-29 00:00:00.000' AS DateTime), N'7 : 30 PM', 1, CAST(N'2020-06-27 21:41:35.187' AS DateTime), CAST(N'2020-06-27 21:41:35.187' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (115, N'Raman', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-06-29 00:00:00.000' AS DateTime), N'8 : 59 AM', 1, CAST(N'2020-06-27 23:00:23.317' AS DateTime), CAST(N'2020-06-27 23:00:23.317' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (116, N'brajesh kumar', N'indialotusresturant@gmail.com', N'7878787878', 1, 0, CAST(N'2020-07-02 00:00:00.000' AS DateTime), N'11 : 00 PM', 1, CAST(N'2020-07-01 16:31:10.817' AS DateTime), CAST(N'2020-07-01 16:31:10.817' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (117, N'raman', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'5 : 55 PM', 1, CAST(N'2020-07-02 22:59:45.273' AS DateTime), CAST(N'2020-07-02 22:59:45.273' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (118, N'raman', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-07-04 00:00:00.000' AS DateTime), N'6 : 04 AM', 1, CAST(N'2020-07-02 23:08:01.777' AS DateTime), CAST(N'2020-07-02 23:08:01.777' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (121, N'brajesh', N'brajeshkr18@gmail.com', N'7878747485', 2, 0, CAST(N'2020-07-31 00:00:00.000' AS DateTime), N'2 : 46 AM', 1, CAST(N'2020-07-03 21:15:47.583' AS DateTime), CAST(N'2020-07-03 21:15:47.583' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (122, N'Raman', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'5 : 47 PM', 1, CAST(N'2020-07-04 01:48:43.620' AS DateTime), CAST(N'2020-07-04 01:48:43.620' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (123, N'Faye', N'faye.max@outlook.co.nz', N'0274690944', 2, 0, CAST(N'2020-07-30 00:00:00.000' AS DateTime), N'5 : 30 PM', 1, CAST(N'2020-07-30 04:20:08.237' AS DateTime), CAST(N'2020-07-30 04:20:08.237' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (124, N'Maddy Pottinger', N'philandmad@gmail.com', N'0273274040', 3, 0, CAST(N'2020-08-08 00:00:00.000' AS DateTime), N'6 : 59 PM', 1, CAST(N'2020-08-04 10:47:36.037' AS DateTime), CAST(N'2020-08-04 10:47:36.037' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (125, N'Ben', N'drenzyme@gmail.com', N'0272348120', 2, 0, CAST(N'2020-08-09 00:00:00.000' AS DateTime), N'6 : 40 PM', 1, CAST(N'2020-08-05 22:23:48.700' AS DateTime), CAST(N'2020-08-05 22:23:48.700' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (126, N'Sukh ', N'mahalamandeep9@gmail.com', N'0223116631', 2, 0, CAST(N'2020-08-07 00:00:00.000' AS DateTime), N'5 : 00 PM', 1, CAST(N'2020-08-06 06:12:38.433' AS DateTime), CAST(N'2020-08-06 06:12:38.433' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (127, N'Lucy Clark', N'lucy.sara.clark73@gmail.com', N'0211438346', 3, 0, CAST(N'2020-08-22 00:00:00.000' AS DateTime), N'6 : 30 PM', 1, CAST(N'2020-08-17 20:05:48.073' AS DateTime), CAST(N'2020-08-17 20:05:48.073' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (128, N'Leone Evans', N'Leone.evans@xtra.co.nz', N'0221083319', 2, 0, CAST(N'2020-08-28 00:00:00.000' AS DateTime), N'6 : 30 PM', 1, CAST(N'2020-08-28 03:37:32.987' AS DateTime), CAST(N'2020-08-28 03:37:32.987' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (129, N'Joanne', N'joleighrodgers@hotmail.co.uk', N'0220657398', 2, 0, CAST(N'2020-08-29 00:00:00.000' AS DateTime), N'7 : 30 PM', 1, CAST(N'2020-08-28 06:11:07.553' AS DateTime), CAST(N'2020-08-28 06:11:07.553' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (130, N'Sukh', N'mahalamdeep9@gmail.com', N'0223116631', 2, 0, CAST(N'2020-09-01 00:00:00.000' AS DateTime), N'6 : 20 PM', 1, CAST(N'2020-08-30 22:29:16.023' AS DateTime), CAST(N'2020-08-30 22:29:16.023' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (131, N'Raman', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-08-31 00:00:00.000' AS DateTime), N'5 : 35 PM', 1, CAST(N'2020-08-30 22:36:07.107' AS DateTime), CAST(N'2020-08-30 22:36:07.107' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (132, N'Sukh', N'mahalamandeep9@gmail.com', N'0223116631', 2, 0, CAST(N'2020-09-01 00:00:00.000' AS DateTime), N'6 : 20 PM', 1, CAST(N'2020-08-30 22:42:37.033' AS DateTime), CAST(N'2020-08-30 22:42:37.033' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (133, N'Gia Romano', N'gentilessa@gmail.com', N'02108113933', 2, 0, CAST(N'2020-10-01 00:00:00.000' AS DateTime), N'7 : 00 PM', 1, CAST(N'2020-10-01 05:37:22.163' AS DateTime), CAST(N'2020-10-01 05:37:22.163' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (134, N'Karen ', N'stoatygirl@gmail.com', N'0212959702', 3, 0, CAST(N'2020-10-04 00:00:00.000' AS DateTime), N'7 : 00 PM', 1, CAST(N'2020-10-04 05:47:24.197' AS DateTime), CAST(N'2020-10-04 05:47:24.197' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[BookingRequest] ([Id], [Name], [Email], [PhoneNo], [People], [Status], [Date], [Time], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (135, N'Ramanpreet Kaur Mahal', N'sandhuramanamritsar@gmail.com', N'0221998651', 2, 0, CAST(N'2020-10-06 00:00:00.000' AS DateTime), N'7 : 58 AM', 1, CAST(N'2020-10-04 09:05:53.757' AS DateTime), CAST(N'2020-10-04 09:05:53.757' AS DateTime), N'101', N'101')
GO
SET IDENTITY_INSERT [dbo].[BookingRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] ON 

GO
INSERT [dbo].[ContactRequest] ([Id], [Name], [Email], [PhoneNo], [Message], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (101, N'yhjjhj', N'doctor@doctor.com', N'4545454545', N'bggfbgf', 1, CAST(N'2020-03-17 00:25:41.487' AS DateTime), CAST(N'2020-03-17 00:25:41.487' AS DateTime), N'101', N'101')
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[mtbAlbum] ON 

GO
INSERT [dbo].[mtbAlbum] ([id], [AlbumName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [AlbumImage]) VALUES (101, N'Home Page Gallery', 1, CAST(N'2020-03-15 16:15:07.777' AS DateTime), CAST(N'2020-03-15 16:19:09.693' AS DateTime), N'101', N'101', N'http://indianlotus.co.nz/Assets/images/Gallery/d1.jpg')
GO
INSERT [dbo].[mtbAlbum] ([id], [AlbumName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [AlbumImage]) VALUES (102, N'Mange Page Gallery', 1, CAST(N'2020-03-15 16:15:25.260' AS DateTime), CAST(N'2020-03-15 16:19:17.450' AS DateTime), N'101', N'101', N'http://indianlotus.co.nz/Assets/images/Gallery/d1.jpg')
GO
SET IDENTITY_INSERT [dbo].[mtbAlbum] OFF
GO
SET IDENTITY_INSERT [dbo].[mtbCity] ON 

GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (101, N'christchurch', 1, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (102, N'Test1', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (103, N'Test2', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (104, N'Test3', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (105, N'Test4', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (106, N'Test5', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (107, N'Test6', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (108, N'Test7', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (109, N'Test8', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (110, N'Test9', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (111, N'Test10', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (112, N'Test11', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
INSERT [dbo].[mtbCity] ([id], [CityName], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (113, N'Test12', 0, CAST(N'2020-02-19 23:48:16.087' AS DateTime), CAST(N'2020-02-19 23:48:16.087' AS DateTime), N'1', N'1')
GO
SET IDENTITY_INSERT [dbo].[mtbCity] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Cart] ON 

GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (1, 12, 55, 3, CAST(N'2020-07-04 02:05:30.633' AS DateTime), CAST(N'2020-07-04 02:08:23.357' AS DateTime), 1, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (2, 12, 55, 3, CAST(N'2020-07-04 02:05:31.617' AS DateTime), CAST(N'2020-07-04 02:08:23.357' AS DateTime), 1, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (3, 13, 55, 3, CAST(N'2020-07-04 02:05:38.460' AS DateTime), CAST(N'2020-07-04 02:08:23.357' AS DateTime), 1, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (10, 14, 55, 3, CAST(N'2020-07-06 01:19:29.027' AS DateTime), CAST(N'2020-07-06 01:20:24.310' AS DateTime), 2, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (11, 14, 55, 3, CAST(N'2020-07-06 01:19:30.197' AS DateTime), CAST(N'2020-07-06 01:20:24.310' AS DateTime), 2, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (12, 18, 55, 3, CAST(N'2020-07-06 01:19:36.963' AS DateTime), CAST(N'2020-07-06 01:20:24.310' AS DateTime), 2, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (14, 47, 57, 3, CAST(N'2020-07-11 06:32:04.277' AS DateTime), CAST(N'2020-07-11 06:40:13.937' AS DateTime), 3, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (15, 71, 57, 3, CAST(N'2020-07-11 06:32:12.233' AS DateTime), CAST(N'2020-07-11 06:40:13.937' AS DateTime), 3, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (16, 12, 58, 3, CAST(N'2020-07-14 07:02:08.160' AS DateTime), CAST(N'2020-07-14 07:11:23.727' AS DateTime), 4, N'indian hot', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (17, 83, 58, 3, CAST(N'2020-07-14 07:02:36.253' AS DateTime), CAST(N'2020-07-14 07:11:23.727' AS DateTime), 4, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (18, 13, 58, 3, CAST(N'2020-07-14 07:02:50.600' AS DateTime), CAST(N'2020-07-14 07:11:23.727' AS DateTime), 4, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (19, 13, 59, 3, CAST(N'2020-07-21 06:03:38.350' AS DateTime), CAST(N'2020-07-21 06:13:29.817' AS DateTime), 5, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (20, 52, 59, 3, CAST(N'2020-07-21 06:03:53.383' AS DateTime), CAST(N'2020-07-21 06:13:29.817' AS DateTime), 5, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (21, 65, 59, 3, CAST(N'2020-07-21 06:04:22.243' AS DateTime), CAST(N'2020-07-21 06:13:29.817' AS DateTime), 5, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (22, 71, 59, 3, CAST(N'2020-07-21 06:04:45.367' AS DateTime), CAST(N'2020-07-21 06:13:29.817' AS DateTime), 5, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (23, 71, 59, 3, CAST(N'2020-07-21 06:04:48.727' AS DateTime), CAST(N'2020-07-21 06:13:29.817' AS DateTime), 5, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (26, 61, 61, 3, CAST(N'2020-07-26 06:43:03.327' AS DateTime), CAST(N'2020-07-26 06:48:20.617' AS DateTime), 6, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (27, 47, 61, 3, CAST(N'2020-07-26 06:44:05.907' AS DateTime), CAST(N'2020-07-26 06:48:20.617' AS DateTime), 6, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (28, 71, 61, 3, CAST(N'2020-07-26 06:44:54.393' AS DateTime), CAST(N'2020-07-26 06:48:20.617' AS DateTime), 6, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (68, 48, 68, 3, CAST(N'2020-08-26 06:37:42.860' AS DateTime), CAST(N'2020-08-26 06:46:05.930' AS DateTime), 7, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (69, 73, 68, 3, CAST(N'2020-08-26 06:40:49.080' AS DateTime), CAST(N'2020-08-26 06:46:05.930' AS DateTime), 7, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (70, 71, 68, 3, CAST(N'2020-08-26 06:40:55.113' AS DateTime), CAST(N'2020-08-26 06:46:05.930' AS DateTime), 7, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (71, 51, 68, 3, CAST(N'2020-08-26 06:41:58.003' AS DateTime), CAST(N'2020-08-26 06:46:05.930' AS DateTime), 7, N'medium', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (73, 19, 70, 3, CAST(N'2020-08-29 05:41:21.840' AS DateTime), CAST(N'2020-08-29 05:42:50.323' AS DateTime), 8, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (74, 35, 70, 3, CAST(N'2020-08-29 05:48:59.110' AS DateTime), CAST(N'2020-08-29 05:49:39.067' AS DateTime), 9, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (75, 36, 70, 3, CAST(N'2020-08-29 05:49:03.487' AS DateTime), CAST(N'2020-08-29 05:49:39.067' AS DateTime), 9, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (76, 59, 70, 3, CAST(N'2020-08-29 05:49:17.393' AS DateTime), CAST(N'2020-08-29 05:49:39.067' AS DateTime), 9, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (81, 23, 55, 3, CAST(N'2020-08-29 08:06:27.040' AS DateTime), CAST(N'2020-08-29 08:06:56.243' AS DateTime), 10, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (82, 24, 55, 3, CAST(N'2020-08-29 08:06:31.680' AS DateTime), CAST(N'2020-08-29 08:06:56.243' AS DateTime), 10, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (84, 13, 45, 3, CAST(N'2020-08-30 05:31:05.437' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (85, 47, 45, 3, CAST(N'2020-08-30 05:31:28.843' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (86, 47, 45, 3, CAST(N'2020-08-30 05:37:31.457' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (87, 63, 45, 3, CAST(N'2020-08-30 05:37:42.910' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (90, 70, 45, 3, CAST(N'2020-08-30 05:39:07.520' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (92, 73, 45, 3, CAST(N'2020-08-30 05:43:46.103' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (94, 70, 45, 3, CAST(N'2020-08-30 05:44:28.510' AS DateTime), CAST(N'2020-08-30 05:45:26.713' AS DateTime), 11, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (105, 70, 74, 3, CAST(N'2020-09-30 05:45:10.270' AS DateTime), CAST(N'2020-09-30 05:50:02.667' AS DateTime), 12, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (106, 71, 74, 3, CAST(N'2020-09-30 05:45:21.267' AS DateTime), CAST(N'2020-09-30 05:50:02.667' AS DateTime), 12, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (107, 47, 74, 3, CAST(N'2020-09-30 05:45:37.593' AS DateTime), CAST(N'2020-09-30 05:50:02.667' AS DateTime), 12, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (108, 23, 75, 3, CAST(N'2020-10-04 10:13:40.090' AS DateTime), CAST(N'2020-10-04 10:15:57.840' AS DateTime), 13, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (109, 90, 75, 3, CAST(N'2020-10-04 10:14:09.760' AS DateTime), CAST(N'2020-10-04 10:15:57.840' AS DateTime), 13, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (110, 86, 75, 3, CAST(N'2020-10-04 10:14:17.230' AS DateTime), CAST(N'2020-10-04 10:15:57.840' AS DateTime), 13, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (111, 20, 77, 3, CAST(N'2020-10-14 05:07:49.340' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (113, 47, 77, 3, CAST(N'2020-10-14 05:09:44.460' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (114, 12, 77, 3, CAST(N'2020-10-14 05:10:08.163' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (115, 40, 77, 3, CAST(N'2020-10-14 05:10:28.523' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (116, 81, 77, 3, CAST(N'2020-10-14 05:10:44.773' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (120, 71, 77, 3, CAST(N'2020-10-14 05:13:34.897' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (121, 43, 77, 3, CAST(N'2020-10-14 05:13:45.477' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (123, 73, 77, 3, CAST(N'2020-10-14 05:17:01.100' AS DateTime), CAST(N'2020-10-14 05:18:48.910' AS DateTime), 14, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (129, 16, 2, 1, CAST(N'2020-10-31 21:50:24.127' AS DateTime), CAST(N'2020-10-31 21:50:24.127' AS DateTime), NULL, N'mild', N'beef')
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (130, 18, 2, 1, CAST(N'2020-10-31 21:50:27.967' AS DateTime), CAST(N'2020-10-31 21:50:27.967' AS DateTime), NULL, N'mild', NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId], [Spices], [Flavour]) VALUES (131, 22, 2, 1, CAST(N'2020-10-31 21:50:33.967' AS DateTime), CAST(N'2020-10-31 21:50:33.967' AS DateTime), NULL, N'mild', N'lamb')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_CartStatus] ON 

GO
INSERT [dbo].[Tbl_CartStatus] ([CartStatusId], [CartStatus]) VALUES (1, N'Added to cart')
GO
INSERT [dbo].[Tbl_CartStatus] ([CartStatusId], [CartStatus]) VALUES (2, N'Removed from cart')
GO
INSERT [dbo].[Tbl_CartStatus] ([CartStatusId], [CartStatus]) VALUES (3, N'Purchased the item')
GO
SET IDENTITY_INSERT [dbo].[Tbl_CartStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] ON 

GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [Image], [CreatedDate], [ModifiedDate]) VALUES (1, N'Veg ', 1, 0, N'../Images/No Photo.png', CAST(N'2020-02-19' AS Date), CAST(N'2020-02-19' AS Date))
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [Image], [CreatedDate], [ModifiedDate]) VALUES (2, N'Non Veg', 1, 0, N'../Images/No Photo.png', CAST(N'2020-02-19' AS Date), CAST(N'2020-02-19' AS Date))
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [Image], [CreatedDate], [ModifiedDate]) VALUES (3, N'Seafood', 1, 0, N'../Images/No Photo.png', CAST(N'2020-02-19' AS Date), CAST(N'2020-02-19' AS Date))
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [Image], [CreatedDate], [ModifiedDate]) VALUES (4, N'Appetizers
', 1, 0, N'../Images/No Photo.png', CAST(N'2020-02-19' AS Date), CAST(N'2020-02-19' AS Date))
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [Image], [CreatedDate], [ModifiedDate]) VALUES (5, N'Naan
', 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_PaymentDetails] ON 

GO
INSERT [dbo].[Tbl_PaymentDetails] ([Id], [MemberId], [AmountPaid], [Response], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [ShippingDetailId]) VALUES (1, 59, CAST(46 AS Decimal(18, 0)), N'{
  "id": "ch_1H7EiyJtBkP0bh4JLnSyBdqm",
  "object": "charge",
  "amount": 4580,
  "amount_refunded": 0,
  "application": null,
  "application_fee": null,
  "application_fee_amount": null,
  "balance_transaction": "txn_1H7EizJtBkP0bh4JIwEof4Ut",
  "billing_details": {
    "address": {
      "city": null,
      "country": null,
      "line1": null,
      "line2": null,
      "postal_code": null,
      "state": null
    },
    "email": null,
    "name": "c.pattinson@hotmail.co.nz",
    "phone": null
  },
  "calculated_statement_descriptor": "INDIAN LOTUS",
  "captured": true,
  "created": 1595311992,
  "currency": "nzd",
  "customer": "cus_HgbwcDBMQLzLS9",
  "description": "Food Order Charge",
  "destination": null,
  "dispute": null,
  "disputed": false,
  "failure_code": null,
  "failure_message": null,
  "fraud_details": {
  },
  "invoice": null,
  "livemode": true,
  "metadata": {
  },
  "on_behalf_of": null,
  "order": null,
  "outcome": {
    "network_status": "approved_by_network",
    "reason": null,
    "risk_level": "normal",
    "seller_message": "Payment complete.",
    "type": "authorized"
  },
  "paid": true,
  "payment_intent": null,
  "payment_method": "card_1H7EisJtBkP0bh4J6LzKFOzM",
  "payment_method_details": {
    "card": {
      "brand": "mastercard",
      "checks": {
        "address_line1_check": null,
        "address_postal_code_check": null,
        "cvc_check": "pass"
      },
      "country": "NZ",
      "exp_month": 11,
      "exp_year": 2021,
      "fingerprint": "vCeD3AiNXHQl4wnw",
      "funding": "debit",
      "installments": null,
      "last4": "0050",
      "network": "mastercard",
      "three_d_secure": null,
      "wallet": null
    },
    "type": "card"
  },
  "receipt_email": null,
  "receipt_number": null,
  "receipt_url": "https://pay.stripe.com/receipts/acct_1GeIIfJtBkP0bh4J/ch_1H7EiyJtBkP0bh4JLnSyBdqm/rcpt_Hgbw33kSrBWEhRphneMErLu1xUzNYAe",
  "refunded": false,
  "refunds": {
    "object": "list",
    "data": [

    ],
    "has_more": false,
    "total_count": 0,
    "url": "/v1/charges/ch_1H7EiyJtBkP0bh4JLnSyBdqm/refunds"
  },
  "review": null,
  "shipping": null,
  "source": {
    "id": "card_1H7EisJtBkP0bh4J6LzKFOzM",
    "object": "card",
    "address_city": null,
    "address_country": null,
    "address_line1": null,
    "address_line1_check": null,
    "address_line2": null,
    "address_state": null,
    "address_zip": null,
    "address_zip_check": null,
    "brand": "MasterCard",
    "country": "NZ",
    "customer": "cus_HgbwcDBMQLzLS9",
    "cvc_check": "pass",
    "dynamic_last4": null,
    "exp_month": 11,
    "exp_year": 2021,
    "fingerprint": "vCeD3AiNXHQl4wnw",
    "funding": "debit",
    "last4": "0050",
    "metadata": {
    },
    "name": "c.pattinson@hotmail.co.nz",
    "tokenization_method": null
  },
  "source_transfer": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "transfer_data": null,
  "transfer_group": null
}
', 59, CAST(N'2020-07-21 06:13:31.067' AS DateTime), NULL, NULL, 1, 0, 5)
GO
INSERT [dbo].[Tbl_PaymentDetails] ([Id], [MemberId], [AmountPaid], [Response], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [ShippingDetailId]) VALUES (2, 61, CAST(36 AS Decimal(18, 0)), N'{
  "id": "ch_1H93eWJtBkP0bh4J6vpU6Zz3",
  "object": "charge",
  "amount": 3629,
  "amount_refunded": 0,
  "application": null,
  "application_fee": null,
  "application_fee_amount": null,
  "balance_transaction": "txn_1H93eYJtBkP0bh4J5h4UUO0Y",
  "billing_details": {
    "address": {
      "city": null,
      "country": null,
      "line1": null,
      "line2": null,
      "postal_code": null,
      "state": null
    },
    "email": null,
    "name": "kmsmith2203@gmail.com",
    "phone": null
  },
  "calculated_statement_descriptor": "INDIAN LOTUS",
  "captured": true,
  "created": 1595746088,
  "currency": "nzd",
  "customer": "cus_HiUdMpCkctG4bH",
  "description": "Food Order Charge",
  "destination": null,
  "dispute": null,
  "disputed": false,
  "failure_code": null,
  "failure_message": null,
  "fraud_details": {
  },
  "invoice": null,
  "livemode": true,
  "metadata": {
  },
  "on_behalf_of": null,
  "order": null,
  "outcome": {
    "network_status": "approved_by_network",
    "reason": null,
    "risk_level": "normal",
    "seller_message": "Payment complete.",
    "type": "authorized"
  },
  "paid": true,
  "payment_intent": null,
  "payment_method": "card_1H93eQJtBkP0bh4J8Wiw9q1O",
  "payment_method_details": {
    "card": {
      "brand": "mastercard",
      "checks": {
        "address_line1_check": null,
        "address_postal_code_check": null,
        "cvc_check": "pass"
      },
      "country": "NZ",
      "exp_month": 8,
      "exp_year": 2023,
      "fingerprint": "C2ayyIXFwtU99XET",
      "funding": "debit",
      "installments": null,
      "last4": "2562",
      "network": "mastercard",
      "three_d_secure": null,
      "wallet": null
    },
    "type": "card"
  },
  "receipt_email": null,
  "receipt_number": null,
  "receipt_url": "https://pay.stripe.com/receipts/acct_1GeIIfJtBkP0bh4J/ch_1H93eWJtBkP0bh4J6vpU6Zz3/rcpt_HiUdBIy3DLJEXyJ5Vsh6mxnEx7p5dY7",
  "refunded": false,
  "refunds": {
    "object": "list",
    "data": [

    ],
    "has_more": false,
    "total_count": 0,
    "url": "/v1/charges/ch_1H93eWJtBkP0bh4J6vpU6Zz3/refunds"
  },
  "review": null,
  "shipping": null,
  "source": {
    "id": "card_1H93eQJtBkP0bh4J8Wiw9q1O",
    "object": "card",
    "address_city": null,
    "address_country": null,
    "address_line1": null,
    "address_line1_check": null,
    "address_line2": null,
    "address_state": null,
    "address_zip": null,
    "address_zip_check": null,
    "brand": "MasterCard",
    "country": "NZ",
    "customer": "cus_HiUdMpCkctG4bH",
    "cvc_check": "pass",
    "dynamic_last4": null,
    "exp_month": 8,
    "exp_year": 2023,
    "fingerprint": "C2ayyIXFwtU99XET",
    "funding": "debit",
    "last4": "2562",
    "metadata": {
    },
    "name": "kmsmith2203@gmail.com",
    "tokenization_method": null
  },
  "source_transfer": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "transfer_data": null,
  "transfer_group": null
}
', 61, CAST(N'2020-07-26 06:48:21.710' AS DateTime), NULL, NULL, 1, 0, 6)
GO
INSERT [dbo].[Tbl_PaymentDetails] ([Id], [MemberId], [AmountPaid], [Response], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [ShippingDetailId]) VALUES (3, 68, CAST(42 AS Decimal(18, 0)), N'{
  "id": "ch_1HKIOvJtBkP0bh4JW7FGJ7cB",
  "object": "charge",
  "amount": 4180,
  "amount_refunded": 0,
  "application": null,
  "application_fee": null,
  "application_fee_amount": null,
  "balance_transaction": "txn_1HKIOxJtBkP0bh4JrTvfA873",
  "billing_details": {
    "address": {
      "city": null,
      "country": null,
      "line1": null,
      "line2": null,
      "postal_code": null,
      "state": null
    },
    "email": null,
    "name": "naomih@xtra.co.nz",
    "phone": null
  },
  "calculated_statement_descriptor": "INDIAN LOTUS",
  "captured": true,
  "created": 1598424389,
  "currency": "nzd",
  "customer": "cus_Hu6c1JA6KUUM74",
  "description": "Food Order Charge",
  "destination": null,
  "dispute": null,
  "disputed": false,
  "failure_code": null,
  "failure_message": null,
  "fraud_details": {
  },
  "invoice": null,
  "livemode": true,
  "metadata": {
  },
  "on_behalf_of": null,
  "order": null,
  "outcome": {
    "network_status": "approved_by_network",
    "reason": null,
    "risk_level": "normal",
    "seller_message": "Payment complete.",
    "type": "authorized"
  },
  "paid": true,
  "payment_intent": null,
  "payment_method": "card_1HKIOoJtBkP0bh4Jn0KPMpy3",
  "payment_method_details": {
    "card": {
      "brand": "visa",
      "checks": {
        "address_line1_check": null,
        "address_postal_code_check": null,
        "cvc_check": "pass"
      },
      "country": "NZ",
      "exp_month": 6,
      "exp_year": 2023,
      "fingerprint": "hZEfTxNhC39ZLBnP",
      "funding": "debit",
      "installments": null,
      "last4": "1443",
      "network": "visa",
      "three_d_secure": null,
      "wallet": null
    },
    "type": "card"
  },
  "receipt_email": null,
  "receipt_number": null,
  "receipt_url": "https://pay.stripe.com/receipts/acct_1GeIIfJtBkP0bh4J/ch_1HKIOvJtBkP0bh4JW7FGJ7cB/rcpt_Hu6cndhmuSbYeYWeH63tG8i2LvmV1mh",
  "refunded": false,
  "refunds": {
    "object": "list",
    "data": [

    ],
    "has_more": false,
    "total_count": 0,
    "url": "/v1/charges/ch_1HKIOvJtBkP0bh4JW7FGJ7cB/refunds"
  },
  "review": null,
  "shipping": null,
  "source": {
    "id": "card_1HKIOoJtBkP0bh4Jn0KPMpy3",
    "object": "card",
    "address_city": null,
    "address_country": null,
    "address_line1": null,
    "address_line1_check": null,
    "address_line2": null,
    "address_state": null,
    "address_zip": null,
    "address_zip_check": null,
    "brand": "Visa",
    "country": "NZ",
    "customer": "cus_Hu6c1JA6KUUM74",
    "cvc_check": "pass",
    "dynamic_last4": null,
    "exp_month": 6,
    "exp_year": 2023,
    "fingerprint": "hZEfTxNhC39ZLBnP",
    "funding": "debit",
    "last4": "1443",
    "metadata": {
    },
    "name": "naomih@xtra.co.nz",
    "tokenization_method": null
  },
  "source_transfer": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "transfer_data": null,
  "transfer_group": null
}
', 68, CAST(N'2020-08-26 06:46:07.133' AS DateTime), NULL, NULL, 1, 0, 7)
GO
INSERT [dbo].[Tbl_PaymentDetails] ([Id], [MemberId], [AmountPaid], [Response], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [ShippingDetailId]) VALUES (4, 45, CAST(68 AS Decimal(18, 0)), N'{
  "id": "ch_1HLjMTJtBkP0bh4JnKQMw9NC",
  "object": "charge",
  "amount": 6820,
  "amount_refunded": 0,
  "application": null,
  "application_fee": null,
  "application_fee_amount": null,
  "balance_transaction": "txn_1HLjMXJtBkP0bh4JzMYrZumT",
  "billing_details": {
    "address": {
      "city": null,
      "country": null,
      "line1": null,
      "line2": null,
      "postal_code": null,
      "state": null
    },
    "email": null,
    "name": "megymo1@gmail.com",
    "phone": null
  },
  "calculated_statement_descriptor": "INDIAN LOTUS",
  "captured": true,
  "created": 1598766353,
  "currency": "nzd",
  "customer": "cus_HvaXwzbO6E6vBe",
  "description": "Food Order Charge",
  "destination": null,
  "dispute": null,
  "disputed": false,
  "failure_code": null,
  "failure_message": null,
  "fraud_details": {
  },
  "invoice": null,
  "livemode": true,
  "metadata": {
  },
  "on_behalf_of": null,
  "order": null,
  "outcome": {
    "network_status": "approved_by_network",
    "reason": null,
    "risk_level": "normal",
    "seller_message": "Payment complete.",
    "type": "authorized"
  },
  "paid": true,
  "payment_intent": null,
  "payment_method": "card_1HLjMNJtBkP0bh4JfR1OqAhw",
  "payment_method_details": {
    "card": {
      "brand": "visa",
      "checks": {
        "address_line1_check": null,
        "address_postal_code_check": null,
        "cvc_check": "pass"
      },
      "country": "NZ",
      "exp_month": 9,
      "exp_year": 2023,
      "fingerprint": "1c6pakFlU4YW8uNx",
      "funding": "credit",
      "installments": null,
      "last4": "7302",
      "network": "visa",
      "three_d_secure": null,
      "wallet": null
    },
    "type": "card"
  },
  "receipt_email": null,
  "receipt_number": null,
  "receipt_url": "https://pay.stripe.com/receipts/acct_1GeIIfJtBkP0bh4J/ch_1HLjMTJtBkP0bh4JnKQMw9NC/rcpt_HvaXQk0Qw4Nwl8Pdz8amGukf2gIbKa4",
  "refunded": false,
  "refunds": {
    "object": "list",
    "data": [

    ],
    "has_more": false,
    "total_count": 0,
    "url": "/v1/charges/ch_1HLjMTJtBkP0bh4JnKQMw9NC/refunds"
  },
  "review": null,
  "shipping": null,
  "source": {
    "id": "card_1HLjMNJtBkP0bh4JfR1OqAhw",
    "object": "card",
    "address_city": null,
    "address_country": null,
    "address_line1": null,
    "address_line1_check": null,
    "address_line2": null,
    "address_state": null,
    "address_zip": null,
    "address_zip_check": null,
    "brand": "Visa",
    "country": "NZ",
    "customer": "cus_HvaXwzbO6E6vBe",
    "cvc_check": "pass",
    "dynamic_last4": null,
    "exp_month": 9,
    "exp_year": 2023,
    "fingerprint": "1c6pakFlU4YW8uNx",
    "funding": "credit",
    "last4": "7302",
    "metadata": {
    },
    "name": "megymo1@gmail.com",
    "tokenization_method": null
  },
  "source_transfer": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "transfer_data": null,
  "transfer_group": null
}
', 45, CAST(N'2020-08-30 05:45:27.713' AS DateTime), NULL, NULL, 1, 0, 11)
GO
INSERT [dbo].[Tbl_PaymentDetails] ([Id], [MemberId], [AmountPaid], [Response], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [ShippingDetailId]) VALUES (5, 77, CAST(88 AS Decimal(18, 0)), N'{
  "id": "ch_1Hc2PIJtBkP0bh4J9gOFr6zx",
  "object": "charge",
  "amount": 8820,
  "amount_captured": 8820,
  "amount_refunded": 0,
  "application": null,
  "application_fee": null,
  "application_fee_amount": null,
  "balance_transaction": "txn_1Hc2PJJtBkP0bh4JPTSkr0bq",
  "billing_details": {
    "address": {
      "city": null,
      "country": null,
      "line1": null,
      "line2": null,
      "postal_code": null,
      "state": null
    },
    "email": null,
    "name": "nessie.bond@hotmail.com",
    "phone": null
  },
  "calculated_statement_descriptor": "INDIAN LOTUS",
  "captured": true,
  "created": 1602652812,
  "currency": "nzd",
  "customer": "cus_ICRH1ILN1iG1Tg",
  "description": "Food Order Charge",
  "destination": null,
  "dispute": null,
  "disputed": false,
  "failure_code": null,
  "failure_message": null,
  "fraud_details": {
  },
  "invoice": null,
  "livemode": true,
  "metadata": {
  },
  "on_behalf_of": null,
  "order": null,
  "outcome": {
    "network_status": "approved_by_network",
    "reason": null,
    "risk_level": "normal",
    "seller_message": "Payment complete.",
    "type": "authorized"
  },
  "paid": true,
  "payment_intent": null,
  "payment_method": "card_1Hc2PBJtBkP0bh4JQbjNBHvD",
  "payment_method_details": {
    "card": {
      "brand": "visa",
      "checks": {
        "address_line1_check": null,
        "address_postal_code_check": null,
        "cvc_check": "pass"
      },
      "country": "NZ",
      "exp_month": 10,
      "exp_year": 2022,
      "fingerprint": "5C04skMywX2YaXc0",
      "funding": "debit",
      "installments": null,
      "last4": "5492",
      "network": "visa",
      "three_d_secure": null,
      "wallet": null
    },
    "type": "card"
  },
  "receipt_email": null,
  "receipt_number": null,
  "receipt_url": "https://pay.stripe.com/receipts/acct_1GeIIfJtBkP0bh4J/ch_1Hc2PIJtBkP0bh4J9gOFr6zx/rcpt_ICRH7WMVDQiqbknGLOZ3DuhsueGEIX5",
  "refunded": false,
  "refunds": {
    "object": "list",
    "data": [

    ],
    "has_more": false,
    "total_count": 0,
    "url": "/v1/charges/ch_1Hc2PIJtBkP0bh4J9gOFr6zx/refunds"
  },
  "review": null,
  "shipping": null,
  "source": {
    "id": "card_1Hc2PBJtBkP0bh4JQbjNBHvD",
    "object": "card",
    "address_city": null,
    "address_country": null,
    "address_line1": null,
    "address_line1_check": null,
    "address_line2": null,
    "address_state": null,
    "address_zip": null,
    "address_zip_check": null,
    "brand": "Visa",
    "country": "NZ",
    "customer": "cus_ICRH1ILN1iG1Tg",
    "cvc_check": "pass",
    "dynamic_last4": null,
    "exp_month": 10,
    "exp_year": 2022,
    "fingerprint": "5C04skMywX2YaXc0",
    "funding": "debit",
    "last4": "5492",
    "metadata": {
    },
    "name": "nessie.bond@hotmail.com",
    "tokenization_method": null
  },
  "source_transfer": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "transfer_data": null,
  "transfer_group": null
}
', 77, CAST(N'2020-10-14 05:18:49.457' AS DateTime), NULL, NULL, 1, 0, 14)
GO
SET IDENTITY_INSERT [dbo].[Tbl_PaymentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 

GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (12, N'Vegetable Samosa', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Flakey fried pastry filled with spicy potatoes and green peas.', N'../Assets/Images/UploadImage/ede829e0-d3d8-4d41-9bff-ce2f45d45c55.jpg', CAST(7.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (13, N'Onion Bhaji', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Onion rings dipped in spicy batter, deep fried until crispy', N'../Assets/Images/UploadImage/5339d2fa-2619-43f8-aad8-3553117f378a.jpg', CAST(7.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (14, N'Tandoori Mushrooms ', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Mushroom marinated with herbs spices and cooked in tandoor ', N'../Assets/Images/UploadImage/d9606124-2a1f-4b97-834b-0352b5e0da41.jpg', CAST(12.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (15, N'Mixed platter for two', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-27' AS Date), N'A combination of two pieces each of samosa, veg pakora and chicken tikka with mint yogurt chutney, tan-door chicken.', N'../Assets/Images/UploadImage/331cc27d-ab95-41cd-be18-178e7dbad97c.jpg', CAST(24.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (16, N'Chicken tikka ', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Boneless chicken pieces marinated in spices and yogurt skewered and cooked in tan-door. ', N'../Assets/Images/UploadImage/c41f55db-cced-4898-a49b-ffac1006e171.jpg', CAST(15.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (18, N'Fish Tikka', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Fillet of fish marinated in tangy pickle spices and cooked in tandoor. ', N'../Assets/Images/UploadImage/e334d4b1-d9be-44c7-8bf2-20bdf734fa8f.jpg', CAST(17.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (19, N'Garlic tikka', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Brown garlic pieces in marinated in spices and yogurt skewered and cooked in tandoor. ', N'../Assets/Images/UploadImage/c50b6b3c-d434-4043-a270-b163df3f072e.jpg', CAST(15.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (20, N'Garlic Prawn', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Prawn pieces marinated in spices and yogurt skewered and cooked in tandoor.', N'../Assets/Images/UploadImage/317b6de2-2b61-4c29-a943-4095fc315a87.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (21, N'Tandoori prawns', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Tandoori prawn marinated with herbs, spices and cooked in tandoor.', N'../Assets/Images/UploadImage/a297d735-29aa-433f-846d-fbf4fbc8c1a2.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (22, N'Tandoori Chicken ', 4, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'whole chicken', N'../Assets/Images/UploadImage/579609a2-d2a9-4a84-bdd0-f99eccb8ca67.jpg', CAST(22.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (23, N'Dal Makhni', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-27' AS Date), N'Lentils simmered in a slow fire overnight &tempered with onions, ginger, garlic & tomatoes.', N'../Assets/Images/UploadImage/8889d391-51d0-42cb-a5db-7095f2c16528.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (24, N'Dhal Tadka', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-27' AS Date), N'Split Lentils cooked with turmeric, ginger & tomatoes.', N'../Assets/Images/UploadImage/982331dc-8447-4e56-a43e-8cfaf39f44bd.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (25, N'Dal Basanti', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-27' AS Date), N'Cumin, onion, tomatoes, spices.', N'../Assets/Images/UploadImage/401871b8-577f-469f-bfa0-6825afc266fd.jpg', CAST(14.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (26, N'Yellow Dal fry', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-27' AS Date), N'Cumin, onion, tomatoes, spices.', N'../Assets/Images/UploadImage/17c534b6-2668-4ce6-9d06-9d9acfe9e73b.jpg', CAST(14.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (27, N'Chana Masala', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-27' AS Date), N'A very popular yet traditional preparation of morthern India.', N'../Assets/Images/UploadImage/a7a1fa6c-80fa-4f1e-8fbf-46bb6e061462.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (28, N'Sahi Paneer', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Dish of Royalty cottage cheese cooked in four different spices finished off in creamy almond. ', N'../Assets/Images/UploadImage/4e5114a9-fc1e-4a79-ad8d-6775e2869084.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (29, N'Kadai paneer', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Home made cottage cheese cooked with capsicum, onion, tomato and spices.', N'../Assets/Images/UploadImage/2bf899ee-cea9-4b7c-b207-b95baf89f2e9.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (30, N'Matter paneer', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Diced cottage cheese cooked in masala source with green peas. ', N'../Assets/Images/UploadImage/144d6046-4890-4d97-9fad-c228518a5bd8.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (31, N'Palak paneer', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'home made cottage cheese and fresh blended spinach cooked with aromatic spices.', N'../Assets/Images/UploadImage/86655725-6e63-4e0f-9a01-cbaec69e6598.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (32, N'Paneer chilli', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Paneer fried and saute in garlic flavour  with capsicum onion and spring onion.', N'../Assets/Images/UploadImage/9614d3c4-83b7-4720-961f-f834f7873df0.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (33, N'Malai Kofta', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Home made cottage cheese and potatoes mashed with paisins, formed into a ball, deep fried and prepared in a thick mild gravey', N'../Assets/Images/UploadImage/f42b3af6-2561-419d-9b2e-feb6b86f7d08.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (34, N'Vegetable Korma', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Mixed vegetable prepared in cashew gravy.', N'../Assets/Images/UploadImage/d54d4ea6-d6f9-4f47-b5eb-a643ec654566.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (35, N'Aloo Palak', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Diced potatoes and fresh blended spinach cooked with thick onion source and spices. ', N'../Assets/Images/UploadImage/e05fc977-3073-494f-89ce-dc1ae0dcac3d.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (36, N'Aloo Gobhi', 1, 1, 0, CAST(N'2020-04-26' AS Date), CAST(N'2020-04-26' AS Date), N'Wok steamed cauliflower and potato tempered with cumin seeds in a masala sauce.', N'../Assets/Images/UploadImage/60186ccd-1701-4ff0-ba16-500e4b174c5d.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (37, N'Dil khush ', 1, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Mashed potatoes cottage cheese deep fried.', N'../Assets/Images/UploadImage/0cfc876f-85c2-4904-addb-abe9450ae140.jpg', CAST(15.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (38, N'Veg Makhni', 1, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Cottage cheese, mixed vegetables, butter sauce with yellow sauce.', N'../Assets/Images/UploadImage/c14c8d9d-16bd-44c3-957b-2f917c360721.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (39, N'Lotus veg', 1, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Mixed vegetable spinach, mint.', N'../Assets/Images/UploadImage/9120d058-b11c-42f8-b97d-7665ab593f19.jpg', CAST(15.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (40, N'Bombay Aloo', 1, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Cumin, curry leaves & potato', N'../Assets/Images/UploadImage/c1041e50-e9f3-45a2-a071-78a4ac4f265a.jpg', CAST(14.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (41, N'Mushroom masala dingri', 1, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Mushroom, tomato sauce.', N'../Assets/Images/UploadImage/f8dcdbd9-7b51-42ae-9350-bf6ff2acd298.jpg', CAST(14.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (42, N'kerala fish/ Prawn', 3, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Tasty fillet pieces tempered with curry leaves & mustard seeds simmered in a light coconut cream sauce and homestyle spices ', N'../Assets/Images/UploadImage/a5dfbd99-cd20-4ea3-93a7-ec7d25104a5e.jpg', CAST(18.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (43, N'Prawn/fish malabari', 3, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'A south Indian style curry. prawns cooked in a creamy curry base with capsicum ,tomatoes,onion, and spices', N'../Assets/Images/UploadImage/6926d6eb-1e68-4d3b-9746-9a8d1d4cb0b2.jpg', CAST(18.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (44, N'Prawn Masala', 3, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'prawn delicately cooked in thick onion sauce and ground spices with a touch of cashew nut', N'../Assets/Images/UploadImage/7d276e5e-cabc-42d6-a02b-2a2291b1ca1e.jpg', CAST(18.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (45, N'prawn /fish saagwala', 3, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'creamy spinach with tomato whole and ground spices and a hint of garlic', N'../Assets/Images/UploadImage/69f627ee-998c-46e2-8210-c60eecdce65e.jpg', CAST(18.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (46, N'Butter Prawn ', 3, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'prawn cooked in rich tomato and butter gravey', N'../Assets/Images/UploadImage/7c2135fe-fbc6-40dc-86ac-ba2007d3336b.jpg', CAST(18.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (47, N'Butter chicken '''' All The time Favourite "', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Barbecued boneless chicken cooked with rich tomato and butter gravy', N'../Assets/Images/UploadImage/a2ae75b1-f06d-43f5-b9cd-823f3fab92e2.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (48, N'Mango Chicken ', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Tender Boneless chicken cooked in a mouth watering mango sauce', N'../Assets/Images/UploadImage/5b49fc1a-a6aa-4591-997c-a58df0c5e8be.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (49, N'Chicken Tikka Masala', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'A world popular dish .roasted chicken marinated in special spices cooked in recipe of yogurt cream,spices ', N'../Assets/Images/UploadImage/cabc5bc7-6229-4995-8e5b-4f538dbce146.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (50, N'Chicken Dahiwala', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'with yogurt', N'../Assets/Images/UploadImage/bfceec28-4c47-4b41-ac56-91b214e3ffb7.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (51, N'Chicken Dopiaja', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'onion ,tomato and cooked chicken', N'../Assets/Images/UploadImage/65423e00-a75d-4b72-82b5-342a55930c7a.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (52, N'Chicken Patiya', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Cherry tomato, jaggery and tamarind, onion base', N'../Assets/Images/UploadImage/9fe582a9-9a35-4261-b57d-f66123ffbc69.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (53, N'Chilli Chicken', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Battered boneless cubs of chicken fried and saute in garlic flavour.', N'../Assets/Images/UploadImage/fb0f06f1-9007-461f-97e5-3469bce35987.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (54, N'Chicken Manchurian ', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Battered boneless cubs of chicken fried and saute in garlic celery, ginger with corriander and spring onion.', N'../Assets/Images/UploadImage/869aef05-4756-4b9e-8f55-42c6e1a55af8.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (55, N'Lamb Dahiwala', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'with yogurt', N'../Assets/Images/UploadImage/e2a9f0bf-a0ec-4d47-b499-53c1ef259051.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (56, N'Lamb Dopiaja', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'onion ,tomato and cooked lamb', N'../Assets/Images/UploadImage/6d9fa070-1bb7-4630-acb6-9b4988ce96a4.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (57, N'Lamb Patiya', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Cherry tomato, jaggery and tamarind, onion base', N'../Assets/Images/UploadImage/f16cd82f-fd3e-4019-aaeb-fa4795d82712.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (58, N'Lalmas (Chef''s Special)', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Cherry tomato, jaggery and tamarind, onion base', N'../Assets/Images/UploadImage/22080fb9-db6f-4054-bdef-9fb4cb8940a6.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (59, N'Vegetable Briyani', 1, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Basmati rice cooked with vegetable, fruits, nuts and coriander with mild spices', N'../Assets/Images/UploadImage/c5dede60-2183-4109-99e9-4559b51da7f1.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (60, N'Prawn Biryani', 3, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Curried flavoured rice cooked with tiger prawn garnished with almonds &corriander', N'../Assets/Images/UploadImage/99ba1042-7a84-4e7f-8204-d5e5165103f6.jpg', CAST(18.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (61, N'Chicken/Lamb/Beef Korma', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Dish of royalty, meat cooked in four different spices, finished off in a yoghurt and cashew gravy.', N'../Assets/Images/UploadImage/a57c5fe6-dd03-4a56-be12-cb2fb351e6ca.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (62, N'Chicken/Lamb/Beef Rogan Josh', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'A traditional kashmiri curry, cooked in gravy sauce of yoghurt, cinnamon, cardamoms, cloves, onion, ginger and tomato. ', N'../Assets/Images/UploadImage/cb197fd7-4592-4ef6-a4a3-9275677f3eab.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (63, N'Chicken/Lamb/Beef Saagwala', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Boneless tender meat cooked with spinach, fresh tomato, ginger, garlic & spices.', N'../Assets/Images/UploadImage/f32102a2-7220-4d74-96fe-aa04f0bd6155.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (64, N'Chicken/Lamb/Beef Vindaloo', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Highly spiced boneless tender lamb /beef cooked in hot vindaloo paste with garlic and ginger', N'../Assets/Images/UploadImage/b34709d7-1341-48f2-8d3e-794ef750ab94.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (65, N'Chicken/Lamb/Beef Jalfrezie', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Sweet and sour marinated meat of your choice', N'../Assets/Images/UploadImage/3082871b-fb50-4290-8db2-2072d77f9f69.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (66, N'Chicken/Lamb/Beef Madras ', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Boneless meat cooked with exotic ground spices, coconut milk.', N'../Assets/Images/UploadImage/298be87d-267d-4872-92b1-4c3c0a9f457d.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (67, N'Chicken/Lamb/Beef Bhuna', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'Barbecued boneless meat cooked with ginger, garlic, onion and spices.', N'../Assets/Images/UploadImage/00165a9d-3c18-43c0-a26c-6df6fc27f544.jpg', CAST(15.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (68, N'Chicken/Lamb/Beef Kadai', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'A rich flavorsome curry with crushed tomato, capsicum and green chilies in a thick masala sauce', N'../Assets/Images/UploadImage/aa9405ab-5342-4059-b13d-8f16ab715c9e.jpg', CAST(16.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (69, N'Chicken/Lamb/Beef Biryani', 2, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-04-27' AS Date), N'A traditional indian way of cooking boneless meat with flavoured basmati rice, spices, fragrant with saffron and garnished with almonds & corriander.', N'../Assets/Images/UploadImage/1008486d-1e5e-4a23-bc2a-06bde4dde227.jpg', CAST(17.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (70, N'Plain Naan', 5, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-05-16' AS Date), N'Bread made of refined flour, baked in the tandoor. ', N'../Assets/Images/UploadImage/076a4dc9-8b45-457b-8019-91f3999e317c.jpg', CAST(3.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (71, N'Garlic Naan', 5, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-05-16' AS Date), N'Naan filled with garlic', N'../Assets/Images/UploadImage/8f9f2077-4e6c-46c7-b07a-f44a866c191f.jpg', CAST(3.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (72, N'Cheese naan ', 5, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-05-16' AS Date), N'Naan filled with cheese', N'../Assets/Images/UploadImage/f5c538d5-bca2-4e1f-a9db-cd7e080b92c5.jpg', CAST(6.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (73, N'Cheese and Garlic Naan', 5, 1, 0, CAST(N'2020-04-27' AS Date), CAST(N'2020-05-15' AS Date), N'Naan filled with cheese and garlic on top.', N'../Assets/Images/UploadImage/7b1a23d8-caba-4ad4-9aa7-9c7d43642a16.jpg', CAST(6.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (76, N'Roti', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Whole wheat flour', N'../Assets/Images/UploadImage/c99c053d-a521-4b39-a799-08964943734b.jpg', CAST(3.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (77, N'Keema Naan ', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Bread stuffed with spiced lamb mince', N'../Assets/Images/UploadImage/d97bfd24-e33f-4732-a28f-2aa5b0c99186.jpg', CAST(6.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (78, N'Chicken Naan', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Naan with spiced chicken filling', N'../Assets/Images/UploadImage/22e00eb5-7068-4d5c-93b5-9bf5901bd4b8.jpg', CAST(6.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (79, N'Peshawari Naan', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Naan filled with chopped dried fruit and nuts', N'../Assets/Images/UploadImage/71ffa457-68da-4a2f-b7de-84a02870a0d6.jpg', CAST(6.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (80, N'Chilli Naan', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Chilli flakes', N'../Assets/Images/UploadImage/dfdad12a-46e7-4476-b51a-e78f16d7bf36.jpg', CAST(4.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (81, N'Chocolate Naan ', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Stuffed chocolate', N'../Assets/Images/UploadImage/8e3877e7-cf97-4b16-82bb-e295875aab13.jpg', CAST(5.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (82, N'Fifty Fifty', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Cheese, black pepper, chilli flakes', N'../Assets/Images/UploadImage/30485fa9-1a88-4bf3-a463-44656aebd846.jpg', CAST(5.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (83, N'Poppadums (5 pieces)', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), NULL, N'../Assets/Images/UploadImage/caa537ec-9551-4edc-a07e-b9cada2cbbfa.jpg', CAST(3.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (84, N'Mango Chutney', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), NULL, N'../Assets/Images/UploadImage/08aa5f32-c107-4304-82f2-8588f9c4a367.jpg', CAST(4.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (85, N'Mix Hot Pickle', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), NULL, N'../Assets/Images/UploadImage/9cdcdba6-217c-4f09-80b8-767b0a94061d.jpg', CAST(3.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (86, N'Raita', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Yoghurt mixed with cucumber, carrot and mild spices', N'../Assets/Images/UploadImage/21c692a7-588f-455d-9df7-87d0e7ef67de.jpg', CAST(4.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (87, N'Fresh Garden Salad ', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Diced Onions, tomatoes, carrots and cucumber', N'../Assets/Images/UploadImage/17c8d7ac-e88b-478d-a74e-1dd0c4f9c9e7.jpg', CAST(6.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (88, N'Jeera Rice', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Basmati rice with roasted cumin, garnished with corriander and almonds. ', N'../Assets/Images/UploadImage/70a81f8b-c819-4f4d-998e-9156c7409814.jpg', CAST(5.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (89, N'Peas Pulao', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Basmati Rice with peas, garnished with corriander and almonds.', N'../Assets/Images/UploadImage/ac7af726-5d53-49c4-9e37-8bd18015f620.jpg', CAST(5.90 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (90, N'Kashmiri Pulao', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Dry fruits', N'../Assets/Images/UploadImage/6876ec10-4498-4aa9-98a2-f3ea9b75bae3.jpg', CAST(7.50 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (91, N'Gulab Jamun', 5, 1, 0, CAST(N'2020-05-16' AS Date), CAST(N'2020-05-16' AS Date), N'Creamed milk dumpling served in vanilla ice -cream', N'../Assets/Images/UploadImage/cb7ec3f4-7c69-49bd-b753-686bcb80513c.jpg', CAST(6.50 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShippingDetails] ON 

GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (1, 55, 8, CAST(21 AS Decimal(18, 0)), N'PayOndelivery', 55, CAST(N'2020-07-04 02:08:23.340' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (2, 55, 8, CAST(44 AS Decimal(18, 0)), N'PayOndelivery', 55, CAST(N'2020-07-06 01:20:24.120' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (3, 57, 9, CAST(19 AS Decimal(18, 0)), N'PayOndelivery', 57, CAST(N'2020-07-11 06:40:13.920' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (4, 58, 10, CAST(18 AS Decimal(18, 0)), N'PayOndelivery', 58, CAST(N'2020-07-14 07:11:23.697' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (5, 59, 11, CAST(46 AS Decimal(18, 0)), N'Card', 59, CAST(N'2020-07-21 06:13:29.770' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (6, 61, 12, CAST(36 AS Decimal(18, 0)), N'Card', 61, CAST(N'2020-07-26 06:48:20.600' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (7, 68, 14, CAST(42 AS Decimal(18, 0)), N'Card', 68, CAST(N'2020-08-26 06:46:05.897' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (8, 70, 15, CAST(15 AS Decimal(18, 0)), N'PayOndelivery', 70, CAST(N'2020-08-29 05:42:50.310' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (9, 70, 15, CAST(50 AS Decimal(18, 0)), N'PayOndelivery', 70, CAST(N'2020-08-29 05:49:39.033' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (10, 55, 8, CAST(32 AS Decimal(18, 0)), N'PayOndelivery', 55, CAST(N'2020-08-29 08:06:56.210' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (11, 45, 0, CAST(68 AS Decimal(18, 0)), N'Card', 45, CAST(N'2020-08-30 05:45:26.683' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (12, 74, 18, CAST(22 AS Decimal(18, 0)), N'PayOndelivery', 74, CAST(N'2020-09-30 05:50:02.647' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (13, 75, 19, CAST(27 AS Decimal(18, 0)), N'PayOndelivery', 75, CAST(N'2020-10-04 10:15:57.823' AS DateTime), NULL, NULL, 1, 0, N'Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressId], [AmountPaid], [PaymentType], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [OrderMode]) VALUES (14, 77, 20, CAST(88 AS Decimal(18, 0)), N'Card', 77, CAST(N'2020-10-14 05:18:48.897' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShippingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGallery] ON 

GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (101, N'Chicken Biryani', N'../Assets/Images/UploadImage/a057afe3-b7f3-4d8c-92de-67830d2fcb45.jpg', 101, 1, CAST(N'2020-03-15 16:52:36.410' AS DateTime), CAST(N'2020-04-08 16:06:23.183' AS DateTime), N'101', N'2', N'Special')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (102, N'Chiicken Biryani', N'http://indianlotus.co.nz/Assets/images/Gallery/d2.jpg', 101, 1, CAST(N'2020-03-15 16:52:59.983' AS DateTime), CAST(N'2020-03-15 16:55:22.103' AS DateTime), N'101', N'2', N'Chiicken')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (103, N'Drink', N'http://indianlotus.co.nz/Assets/images/Gallery/d3.jpg', 101, 1, CAST(N'2020-03-15 16:53:13.507' AS DateTime), CAST(N'2020-03-19 20:33:09.827' AS DateTime), N'101', N'1', N'Drink')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (104, N'Our Special', N'http://indianlotus.co.nz/Assets/images/Gallery/d4.jpg', 101, 1, CAST(N'2020-03-15 16:53:35.170' AS DateTime), CAST(N'2020-03-15 16:53:30.977' AS DateTime), N'101', N'2', N'sAMOSA')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (105, N'Our Special', N'http://indianlotus.co.nz/Assets/images/Gallery/d5.jpg', 101, 1, CAST(N'2020-03-15 16:56:10.007' AS DateTime), CAST(N'2020-03-15 16:53:50.430' AS DateTime), N'101', N'2', N'Chicken Tikka')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (106, N'avaGado', N'http://indianlotus.co.nz/Assets/images/g2.jpg', 101, 0, CAST(N'2020-03-15 16:56:47.960' AS DateTime), CAST(N'2020-04-08 16:06:11.903' AS DateTime), N'101', N'2', N'avaGado')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (107, N'MockTails', N'http://indianlotus.co.nz/Assets/images/g3.jpg', 101, 0, CAST(N'2020-03-15 16:57:09.340' AS DateTime), CAST(N'2020-03-20 06:48:36.477' AS DateTime), N'101', N'1', N'MockTails')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (108, N'G1', N'../Assets/Images/UploadImage/04a125cf-a732-4668-a9bd-4469f968bb76.jpg', 101, 0, CAST(N'2020-03-15 16:58:57.257' AS DateTime), CAST(N'2020-04-08 16:05:13.853' AS DateTime), N'101', N'2', N'Ice Cream')
GO
INSERT [dbo].[tblGallery] ([id], [GalleryName], [GalleryPath], [TypeId], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Title]) VALUES (109, N'wsd', N'../Assets/Images/UploadImage/e7b2fb0c-08d7-4d15-b7f5-e8f2f5aa3cbc.jpg', 101, 0, CAST(N'2020-03-15 20:43:41.823' AS DateTime), CAST(N'2020-04-08 16:05:36.993' AS DateTime), N'101', N'2', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblGallery] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenu] ON 

GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (1, N'Home', N'aaa', 1, CAST(N'2018-10-28 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (2, N'About', N'bbb', 1, CAST(N'2018-10-20 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (3, N'Ourschool', N'ccc', 1, CAST(N'2018-10-28 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (4, N'Curriculum', N'ddd', 1, CAST(N'2018-10-28 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (5, N'GeneralInfo', N'eee', 1, CAST(N'2018-10-02 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (6, N'Gallery', N'fff', 1, CAST(N'2018-10-28 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
INSERT [dbo].[tblMenu] ([Id], [MenuName], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (7, N'ContactUs', N'ggg', 1, CAST(N'2018-10-28 00:00:00.000' AS DateTime), CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'101', N'101')
GO
SET IDENTITY_INSERT [dbo].[tblMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubMenu] ON 

GO
INSERT [dbo].[tblSubMenu] ([Id], [MainMenuId], [MenuName], [MenuText], [MenuDescription], [IsActive], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy]) VALUES (28, 1, N'f', N'<div class="container">
        <div class="w3ls-title">
            <h3 class="agileits-title">About us</h3>
        </div>
        <p class="about-w3text">
            Indian Lotus team offering latest and innovative dishes On Our tasty menu Indian Lotus team offering latest and innovative dishes On Our tasty menu Indian Lotus team offering latest and innovative dishes On Our tasty menu
            Indian Lotus team offering latest and innovative dishes On Our tasty menu  Indian Lotus team offering latest and innovative dishes On Our tasty menu .
            Indian Lotus team offering latest and innovative dishes On Our tasty menu Indian Lotus team offering latest and innovative dishes On Our tasty menu .
            Indian Lotus team offering latest and innovative dishes On Our tasty menu .
        </p>
        <div class="services-row-agileinfo">
            <div class="col-sm-4 col-xs-4 services-w3grid">
                <span class="glyphicon glyphicon-heart hi-icon" aria-hidden="true"></span>
                <h5>Dal Makhani</h5>
                <p>Chilli Chicken and More delicious dishes </p>
            </div>
            <div class="col-sm-4 col-xs-4 services-w3grid">
                <span class="glyphicon glyphicon-list-alt hi-icon" aria-hidden="true"></span>
                <h5>Dal Tadka</h5>
                <p>Chilli Chicken and More delicious dishes </p>
            </div>
            <div class="col-sm-4 col-xs-4 services-w3grid">
                <span class="glyphicon glyphicon-leaf hi-icon" aria-hidden="true"></span>
                <h5>Korma</h5>
                <p>Chilli Chicken and More delicious dishes </p>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>', N'g', 1, CAST(N'2017-07-30 05:20:32.977' AS DateTime), CAST(N'2020-03-16 19:22:17.140' AS DateTime), N'101', N'101')
GO
SET IDENTITY_INSERT [dbo].[tblSubMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (1, NULL, NULL, NULL, 1, 102, N'e', N'e', N'e', N'1212121211', 2, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (2, NULL, NULL, NULL, 1, 101, N'13444', N'2/224 springfield rd, ', N'st albans', N'0221998651', 32, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (3, NULL, NULL, NULL, 1, 101, N'13444', N'2/224 springfield rd, ', N'st albans', N'0221998651', 31, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (4, NULL, NULL, NULL, 1, 101, N'232232', N'new ', N'new ', N'323232', 3, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (8, NULL, NULL, NULL, 1, 101, N'8014', N'1/224 springfield rd, ', N'St Albans', N'0221998651', 55, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (9, NULL, NULL, NULL, 1, 101, N'7630', N'16 Durells crescent ', N'Kaiapoi', N'0273377137', 57, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (10, NULL, NULL, NULL, 1, 101, N'8014', N'224 Springfield road ', N'224 Springfield road ', N'0223116631', 58, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (11, NULL, NULL, NULL, 1, 101, N'7630', N'3 wooten place', N'Kaiapoi', N'0273205256', 59, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (12, NULL, NULL, NULL, 1, 101, N'7630', N'10 lock crescent ', N'Kaiapoi ', N'0273133099', 61, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (13, NULL, NULL, NULL, 1, 101, N'7630', N'132 Otaki Street', N'Kaiapoi', N'0279753297', 66, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (14, NULL, NULL, NULL, 1, 101, N'7630', N'14 Evans Place', N'Kaiapoi', N'0275703703', 68, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (15, NULL, NULL, NULL, 1, 101, N'8014', N'1/224 Springfield Road, ', N'st albans', N'+64221998651', 70, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (16, NULL, NULL, NULL, 1, 101, N'7630', N'255B Williams Street', N'Kaiapoi', N'0273587589', 45, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (17, NULL, NULL, NULL, 1, 101, NULL, NULL, NULL, NULL, 45, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (18, NULL, NULL, NULL, 1, 101, N'7630', N'10A Glenvale Drive, Kaiapoi 7630', N'10a glenvale drive', N'0221052467', 74, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (19, NULL, NULL, NULL, 1, 101, N'8014', N'1/224 Springfield Road', N'Saint Albans', N'+64221998651', 75, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (20, NULL, NULL, NULL, 1, 101, N'7630', N'41 Storer Street', N'Kaiapoi', N'0278431891', 77, 1)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [ProfileUrl], [UserId], [IsDefault]) VALUES (21, NULL, NULL, NULL, 1, 101, N'232323', N'brajesh', N'kumar', N'85858585', 54, 1)
GO
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (1, 1, N'SuperAdmin', N'SuperAdmin', N'SuperAdmin@SuperAdmin.com', NULL, NULL, NULL, NULL, N'5f4dcc3b5aa765d61d8327deb882cf99', 0, CAST(N'2020-07-01 12:56:27.340' AS DateTime), 1, 1, NULL, NULL, CAST(N'2018-01-31 23:40:11.900' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (2, 2, N'Admin', N'Admin', N'Admin@Admin.com', N'9026457896', NULL, NULL, NULL, N'5f4dcc3b5aa765d61d8327deb882cf99', 0, CAST(N'2020-10-31 15:19:01.223' AS DateTime), 1, 1, 1, 1, CAST(N'2018-01-31 23:42:06.370' AS DateTime), 1, CAST(N'2018-06-06 14:56:47.337' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (3, 3, N'User', N'User', N'User@User.com', N'8767897890', NULL, NULL, NULL, N'5f4dcc3b5aa765d61d8327deb882cf99', 0, CAST(N'2020-05-10 15:01:40.793' AS DateTime), 1, 1, 1, 1, CAST(N'2018-03-12 19:38:38.227' AS DateTime), 1, CAST(N'2018-06-06 14:57:15.747' AS DateTime), 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (30, 3, N'NATRAJ', N'Nirala', N'Hello@gmail.com', N'6200685610', NULL, NULL, NULL, N'e20f517179e9cd52ae29dae43c121b95', 1, NULL, NULL, 1, NULL, 0, CAST(N'2020-04-20 14:24:31.863' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (31, 3, N'Pardeep', N'Mahal', N'pardeepsindhi3610@gmail.com', N'0221998651', NULL, NULL, NULL, N'27cbe97ddcb60f35588c8d0d51417c5e', 1, CAST(N'2020-04-26 05:13:55.617' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-04-26 05:13:55.617' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (32, 3, N'pardeep ', N'mahal', N'sandhuramanamritsar@gmail.com', N'0221998651', NULL, NULL, NULL, N'27cbe97ddcb60f35588c8d0d51417c5e', 1, CAST(N'2020-04-26 07:18:45.197' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-04-26 07:18:45.197' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (33, 3, N'UDHAM', N'MADRA', N'udhammadra@gmail.com', N'0220947045', NULL, NULL, NULL, N'fea2f9acd3829f2bbd517ec8a5f15dcf', 1, CAST(N'2020-04-27 10:04:10.030' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-04-27 10:04:10.030' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (34, 3, N'Jemma', N'Appleton', N'jemma.appleton@gmail.com', N'0212502515', NULL, NULL, NULL, N'544293cccea14e0863f09e58a8c9592f', 1, CAST(N'2020-05-01 03:56:22.353' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-01 03:56:22.353' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (35, 3, N'Nathan', N'Lines', N'nath.lines@gmail.com', N'6421585227', NULL, NULL, NULL, N'bb4a82684f7c55a78fc029d7d9700e4b', 1, CAST(N'2020-05-02 05:25:55.037' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-02 05:25:55.037' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (36, 3, N'Delia', N'Canning', N'delia.c@talk21.com', N'0212398969', NULL, NULL, NULL, N'b48adc8f63d57bee1601ca6b9b3281c7', 1, CAST(N'2020-05-05 04:16:45.367' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-05 04:16:45.367' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (37, 3, N'PAVITAR', N'Mahal', N'Pavitarsindhi1988@yahoo.com', N'0487928845', NULL, NULL, NULL, N'd35f8a9ed55d0b3dee2506aadaee2c48', 1, CAST(N'2020-05-06 05:10:32.417' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-06 05:10:32.417' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (38, 3, N'Daniel', N'Allan', N'da.mrfixit@gmail.com', N'0279153776', NULL, NULL, NULL, N'8e6b8fab2d91f21282cbdef3357db861', 1, CAST(N'2020-05-07 06:15:17.827' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-07 06:15:17.827' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (39, 3, N'Aleysha', N'Nevin', N'leash.nev@gmail.com', N'0273238758', NULL, NULL, NULL, N'94d2415c95f50b644e13f08d03a15db5', 1, CAST(N'2020-05-10 05:46:07.790' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-10 05:46:07.790' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (40, 3, N'Carolyn', N'Higgs', N'higgsemail@gmail.com', N'0220817320', NULL, NULL, NULL, N'eb796eda712555eaf98272e8c06be828', 1, CAST(N'2020-05-12 04:48:16.557' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-12 04:48:16.557' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (41, 3, N'Amanda', N'Wilson', N'Mazzmtazz@hotmail.com', N'0272654632', NULL, NULL, NULL, N'32407b2a0ba8d198e09426a5821f4985', 1, CAST(N'2020-05-14 23:15:39.567' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-14 23:15:39.567' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (43, 3, N'Karyn', N'Viney', N'karyn@whiskersatwoodend.co.nz', N'0220534166', NULL, NULL, NULL, N'7c7509bd046f4afe5dee44eaf4b61782', 1, CAST(N'2020-05-28 01:50:05.013' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-28 01:50:05.013' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (44, 3, N'Stef', N'Knight', N'stefknight@live.com', N'0374646002', NULL, NULL, NULL, N'2beca1ccf7214e9c8d10877ef9ba0f62', 1, CAST(N'2020-05-29 07:18:13.940' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-29 07:18:13.940' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (45, 3, N'Megan', N'Mouranga', N'Megymo1@gmail.com', N'0273587589', NULL, NULL, NULL, N'5a8ae241f5bbcf4e017257ce70bb132a', 1, CAST(N'2020-05-31 05:17:38.947' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-31 05:17:38.947' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (46, 3, N'Grant', N'Hughes', N'grantandnicola@hotmail.com', N'0212447262', NULL, NULL, NULL, N'50572dec71b7242224b7db488768e6f5', 1, CAST(N'2020-05-31 05:48:11.657' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-05-31 05:48:11.657' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (47, 3, N'Bill', N'Sawyer ', N'Wsawyer84@yahoo.co.nz', N'0275322286', NULL, NULL, NULL, N'f03cd5c39d0472108ac1b60690d15f45', 1, CAST(N'2020-06-03 05:45:28.343' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-06-03 05:45:28.343' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (48, 3, N'Samantha', N'Weusten', N'samanthaweusten@gmail.com', N'0274690829', NULL, NULL, NULL, N'439595528133f771b80e062bdb7c2b5e', 1, CAST(N'2020-06-09 06:28:39.003' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-06-09 06:28:39.003' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (49, 3, N'Shanlee', N'Barnes', N'shanlee2010@hotmail.co.nz', N'0274875114', NULL, NULL, NULL, N'cd08d4b7c136769cfba2f37ae5bf3402', 1, CAST(N'2020-06-16 04:32:02.210' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-06-16 04:32:02.210' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (50, 3, N'Toni', N'Andrews', N'tmandrews71@gmail.com', N'0272659388', NULL, NULL, NULL, N'f326dc20e10d84f064be19f343fdc64b', 1, CAST(N'2020-06-20 06:09:38.817' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-06-20 06:09:38.817' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (51, 3, N'Colin', N'Lippert ', N'colellie@gmail.com', N'0220100174', NULL, NULL, NULL, N'8659e0b31b94143b2410a58d7341df89', 1, CAST(N'2020-06-21 05:39:51.717' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-06-21 05:39:51.717' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (52, 3, N'Jane', N'Dalzell', N'mjdalzell@xtra.co.nz', N'0274279550', NULL, NULL, NULL, N'a7247047e3526b9a79468904b95f581e', 1, CAST(N'2020-06-26 06:31:44.117' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-06-26 06:31:44.117' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (54, 3, N'brajesh ', N'kumar', N'brajeshkr18@gmail.com', N'9696969696', NULL, NULL, NULL, N'4388cb6024dacc300e7b5661d3c46654', 1, CAST(N'2020-07-01 20:05:14.737' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-01 20:05:14.737' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (55, 3, N'Rmana', N'sandhu', N'pardeepmahal3630@gmail.com', N'0221998651', NULL, NULL, NULL, N'ad96a8048bd00715bcf2f169fdba12f8', 1, CAST(N'2020-07-02 23:25:14.793' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-02 23:25:14.793' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (56, 3, N'Craig', N'Young ', N'Kayleighquinlivannz@outlook.com', N'0272752666', NULL, NULL, NULL, N'f4653183c8e17591bc9cd60f630e2df9', 1, CAST(N'2020-07-04 08:33:10.300' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-04 08:33:10.300' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (57, 3, N'Emma', N'Quantock', N'emma.6084@yahoo.co.nz', N'0273377137', NULL, NULL, NULL, N'5c6a4a10f9c810ebbc05bfb5d4c47fd4', 1, CAST(N'2020-07-11 06:31:45.513' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-11 06:31:45.513' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (58, 3, N'Sukh ', N'Singh', N'Mahalamandeep9@gmail.com', N'0223116631', NULL, NULL, NULL, N'8ad92b1af7e1d426219a319d4f9853ff', 1, CAST(N'2020-07-14 07:02:00.220' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-14 07:02:00.220' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (59, 3, N'Christopher', N'Pattinson', N'c.pattinson@hotmail.co.nz', N'0273205256', NULL, NULL, NULL, N'8686332b8669cbf2033e7f1743a9e013', 1, CAST(N'2020-07-21 06:03:11.600' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-21 06:03:11.600' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (60, 3, N'Alexia', N'Kotzikas', N'lexia.k@hotmail.com', N'0277383008', NULL, NULL, NULL, N'06abccad1df519715bfe862f96149778', 1, CAST(N'2020-07-21 06:44:33.870' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-21 06:44:33.870' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (61, 3, N'Katie', N'Smith', N'kmsmith2203@gmail.com', N'0273133099', NULL, NULL, NULL, N'b9c153ecf3cbd5eb4a9832651888ae2a', 1, CAST(N'2020-07-26 06:41:58.997' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-07-26 06:41:58.997' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (62, 3, N'Alex', N'Shuttleworth', N'alex.shuttleworth@xtra.co.nz', N'0272383666', NULL, NULL, NULL, N'203889c3a4ee65f31799262de9a115dc', 1, CAST(N'2020-08-04 06:40:59.693' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-04 06:40:59.693' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (63, 3, N'Jess', N'White', N'jess.hernandez@gmx.com', N'0273800848', NULL, NULL, NULL, N'7fe99345fc69e758f51ec4240c79271b', 1, CAST(N'2020-08-06 05:15:20.127' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-06 05:15:20.127' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (64, 3, N'Leeandra', N'Werner', N'Leeandrajwerner@hotmail.com', N'0226048822', NULL, NULL, NULL, N'f642d64eae6d6e9ab67cadb44f6bc53f', 1, CAST(N'2020-08-14 06:33:34.320' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-14 06:33:34.320' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (65, 3, N'Patty', N'Wunder', N'patty1dr@me.com', N'0273327791', NULL, NULL, NULL, N'eaf3dedeaa0ea387ff288689ab6553d8', 1, CAST(N'2020-08-15 05:57:15.723' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-15 05:57:15.723' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (66, 3, N'Katie', N'Rex', N'caiti.rex97@gmail.com', N'0279753197', NULL, NULL, NULL, N'0c0cf99296f8df5de24658ecb0c2b6e1', 1, CAST(N'2020-08-18 05:30:44.973' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-18 05:30:44.973' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (67, 3, N'Kirstie ', N'Dobson ', N'Ck2mac@gmail.com', N'0221220105', NULL, NULL, NULL, N'dbe4db805b5de051b49bb15500fb459d', 1, CAST(N'2020-08-21 05:53:29.397' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-21 05:53:29.397' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (68, 3, N'Naomi ', N'Henley', N'naomih@xtra.co.nz', N'0275703703', NULL, NULL, NULL, N'3787d4e1c2f49293f312bf7da667722a', 1, CAST(N'2020-08-26 06:37:21.610' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-26 06:37:21.610' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (69, 3, N'JOHN', N'EVANS', N'johnevans2704@gmail.com', N'0272658675', NULL, NULL, NULL, N'cec8db54c0799d55a31741261b1c1a0c', 1, CAST(N'2020-08-27 04:17:25.037' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-27 04:17:25.037' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (70, 3, N'Ramanpreet', N'Mahal', N'ramanmahal006@gmail.com', N'0221998651', NULL, NULL, NULL, N'ad96a8048bd00715bcf2f169fdba12f8', 1, CAST(N'2020-08-29 05:41:08.247' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-29 05:41:08.247' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (71, 3, N'Chris ', N'Dempsey ', N'chris_dempsey_93@hotmail.com', N'0278284360', NULL, NULL, NULL, N'a2fd8ab8ec8828e04f4784479831cbdf', 1, CAST(N'2020-08-29 07:00:39.257' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-08-29 07:00:39.257' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (72, 3, N'Mandy', N'Jamieson', N'mandymjamieson@gmail.com', N'0210274296', NULL, NULL, NULL, N'd2c43e47a99dbc740fe30a88a2dba7fd', 1, CAST(N'2020-09-04 06:59:55.680' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-09-04 06:59:55.680' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (73, 3, N'Maria', N'Turchenkova', N'mariaturchenkova@hotmail.com', N'2102779293', NULL, NULL, NULL, N'22097dedc023f96c3a9c5d258108a540', 1, CAST(N'2020-09-11 05:57:02.647' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-09-11 05:57:02.647' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (74, 3, N'Paige', N'Sadler', N'Paigenatalya@outlook.com', N'0221052467', NULL, NULL, NULL, N'05522e5444944a42eb8f4cbd47107e88', 1, CAST(N'2020-09-30 05:44:58.510' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-09-30 05:44:58.510' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (75, 3, N'Ramanpreet', N'Mahal', N'ramanmahal666@gmail.com', N'0221998651', NULL, NULL, NULL, N'3e8961306a7d9c49c15e97d4943b2529', 1, CAST(N'2020-10-04 10:13:29.667' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-10-04 10:13:29.667' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (76, 3, N'Meg', N'McBeth', N'meg.mcbeth@gmail.com', N'0279612644', NULL, NULL, NULL, N'd4729f25712a8fee01d4ba8d031f5aa9', 1, CAST(N'2020-10-14 04:18:45.637' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-10-14 04:18:45.637' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (77, 3, N'Vanessa', N'Bond ', N'nessie.bond@hotmail.com', N'0278431891', NULL, NULL, NULL, N'c72c424cb79c21b8b1808cadb797c82e', 1, CAST(N'2020-10-14 05:06:37.340' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-10-14 05:06:37.340' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId]) VALUES (78, 3, N'jade', N'morgan', N'jade.m0rgan@icloud.com', N'0275371992', NULL, NULL, NULL, N'd614b11b69c609d6facf7663a698e0a1', 1, CAST(N'2020-10-17 07:38:13.110' AS DateTime), NULL, 1, NULL, 0, CAST(N'2020-10-17 07:38:13.110' AS DateTime), NULL, NULL, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (1, N'SuperAdmin', N'SuperAdmin', CAST(N'2018-01-31 23:40:11.807' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (2, N'Admin', N'Admin', CAST(N'2018-01-31 23:40:11.883' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (3, N'User', N'User', CAST(N'2018-01-31 23:40:11.883' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[Tbl_CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Category_Tbl_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Tbl_Category_Tbl_Product]
GO
ALTER TABLE [dbo].[tblSubMenu]  WITH CHECK ADD  CONSTRAINT [FK_tblSubMenu_tblMenu] FOREIGN KEY([MainMenuId])
REFERENCES [dbo].[tblMenu] ([Id])
GO
ALTER TABLE [dbo].[tblSubMenu] CHECK CONSTRAINT [FK_tblSubMenu_tblMenu]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK__UserId__User__Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK__UserId__User__Id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__UserTypeId__UserType__Id] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__UserTypeId__UserType__Id]
GO
/****** Object:  StoredProcedure [dbo].[GetGalleryItem]    Script Date: 31-10-2020 22:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetGalleryItem] 
@Id as Bigint
AS
BEGIN
SET NOCOUNT OFF;
If(@Id ='' or @Id=null or @Id=0 )
				BEGIN
				select g.id,GalleryName,	GalleryPath,TypeId
				,	g.IsActive	,g.CreatedDate	,g.ModifiedDate,	g.CreatedBy	,g.ModifiedBy ,m.AlbumName,g.Title
				from  tblGallery g join mtbAlbum m on m.id=g.TypeId
				
				END
	else
		BEGIN
				select g.id,GalleryName,GalleryPath,TypeId
				,	g.IsActive	,g.CreatedDate	,g.ModifiedDate,	g.CreatedBy	,g.ModifiedBy ,m.AlbumName,g.Title
				from  tblGallery g join mtbAlbum m on m.id=g.TypeId where g.Id=@Id
				
					
				END	
End


GO
/****** Object:  StoredProcedure [dbo].[GetOrdersByShippingId]    Script Date: 31-10-2020 22:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetOrdersByShippingId] 
@Id as Bigint
AS
BEGIN
SET NOCOUNT OFF;

		BEGIN
		select TS.ShippingDetailId
,TS.MemberId,AddressId	,AmountPaid	,PaymentType,	CartId	,	TP.ProductId,	ProductName,	Description	,
ProductImage,	Price ,FirstName	,LastName	,Email,	UserName,TC.Spices	
from [dbo].[Tbl_ShippingDetails] TS
join [dbo].[Tbl_Cart] TC on TC.ShippingDetailId=Ts.ShippingDetailId
join [dbo].[Tbl_Product] TP on TP.ProductId=TC.ProductId
join [dbo].[Users] U on U.Id=Ts.MemberId
Where TS.ShippingDetailId=@Id
				
					
End

End
GO
/****** Object:  StoredProcedure [dbo].[GetPaidOrderDetail]    Script Date: 31-10-2020 22:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPaidOrderDetail] 

AS
BEGIN
SET NOCOUNT OFF;

		BEGIN
		select TS.ShippingDetailId
,TS.MemberId,AddressId	,TS.AmountPaid	,PaymentType,	CartId	,	TP.ProductId,	ProductName,	Description	,
ProductImage,	Price ,FirstName	,LastName	,Email,	UserName,P.Response	
from [dbo].[Tbl_ShippingDetails] TS
join [dbo].[Tbl_Cart] TC on TC.ShippingDetailId=Ts.ShippingDetailId
join [dbo].[Tbl_Product] TP on TP.ProductId=TC.ProductId
join [dbo].[Users] U on U.Id=Ts.MemberId
join  [dbo].[Tbl_PaymentDetails] P on P.ShippingDetailId=TS.ShippingDetailId

				
			
End

End

GO
/****** Object:  StoredProcedure [dbo].[GetPlacedOrders]    Script Date: 31-10-2020 22:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPlacedOrders] 
@Id as Bigint
AS
BEGIN
SET NOCOUNT OFF;
If(@Id ='' or @Id=null or @Id=0 )
				BEGIN
			select  count(TS.ShippingDetailId) Items , TS.ShippingDetailId,sum(Price) Amount,Email,TS.CreatedOn,[PhoneNumber],U.UserName,TS.PaymentType

from [dbo].[Tbl_ShippingDetails] TS
join [dbo].[Tbl_Cart] TC on TC.ShippingDetailId=Ts.ShippingDetailId
join [dbo].[Tbl_Product] TP on TP.ProductId=TC.ProductId
join [dbo].[Users] U on U.Id=Ts.MemberId
group by TS.ShippingDetailId,Email,TS.CreatedOn,[PhoneNumber],U.UserName,TS.PaymentType
				
				END
	else
		BEGIN
		select TS.ShippingDetailId
,TS.MemberId,AddressId	,AmountPaid	,PaymentType,	CartId	,	TP.ProductId,	ProductName,	Description	,
ProductImage,	Price ,FirstName	,LastName	,Email,	UserName	
from [dbo].[Tbl_ShippingDetails] TS
join [dbo].[Tbl_Cart] TC on TC.ShippingDetailId=Ts.ShippingDetailId
join [dbo].[Tbl_Product] TP on TP.ProductId=TC.ProductId
join [dbo].[Users] U on U.Id=Ts.MemberId
Where TS.ShippingDetailId=@Id
				
					
				END	
End


GO
/****** Object:  StoredProcedure [dbo].[SaveUserDetails]    Script Date: 31-10-2020 22:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[SaveUserDetails]  
(  
   @Id INTEGER,  
  @CurCountry int,
  @CurState  int,
  @CurCity  int,
  @CurZipCode VARCHAR(max),
  @CurAddress1  VARCHAR(max),
  @CurAddress2  VARCHAR(max),
  @ProfileUrl  VARCHAR(max),
  @UserId  bigint,
  @IsDefault  bit
)  
AS  
BEGIN  
IF (@Id !=0) 
BEGIN  
UPDATE UserDetails SET  
CurCountry = @CurCountry, CurState = @CurState
WHERE id = @Id  
END  
Else  

BEGIN  
insert into UserDetails(CurCountry,CurState,CurCity,CurZipCode,CurAddress1,CurAddress2,ProfileUrl,UserId,IsDefault)
 values(@CurCountry,@CurState,@CurCity,@CurZipCode,@CurAddress1,@CurAddress2,@ProfileUrl,@UserId,@IsDefault)  
END  
end  



GO
/****** Object:  StoredProcedure [indianlo].[SaveUserDetails]    Script Date: 31-10-2020 22:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [indianlo].[SaveUserDetails]  
(  
   @Id INTEGER,  
  @CurCountry int,
  @CurState  int,
  @CurCity  int,
  @CurZipCode VARCHAR(max),
  @CurAddress1  VARCHAR(max),
  @CurAddress2  VARCHAR(max),
  @ProfileUrl  VARCHAR(max),
  @UserId  bigint,
  @IsDefault  bit
)  
AS  
BEGIN  
IF (@Id !=0) 
BEGIN  
UPDATE UserDetails SET  
CurCountry = @CurCountry, CurState = @CurState
WHERE id = @Id  
END  
Else  

BEGIN  
insert into UserDetails(CurCountry,CurState,CurCity,CurZipCode,CurAddress1,CurAddress2,ProfileUrl,UserId,IsDefault)
 values(@CurCountry,@CurState,@CurCity,@CurZipCode,@CurAddress1,@CurAddress2,@ProfileUrl,@UserId,@IsDefault)  
END  
end  

GO
USE [master]
GO
ALTER DATABASE [indianlotus] SET  READ_WRITE 
GO
