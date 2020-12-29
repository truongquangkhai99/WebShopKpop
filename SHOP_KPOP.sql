USE [master]
GO
/****** Object:  Database [SHOP_KPOP]    Script Date: 12/29/2020 10:28:52 ******/
CREATE DATABASE [SHOP_KPOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOP_KPOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SHOP_KPOP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SHOP_KPOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SHOP_KPOP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SHOP_KPOP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOP_KPOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOP_KPOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOP_KPOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOP_KPOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SHOP_KPOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOP_KPOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET RECOVERY FULL 
GO
ALTER DATABASE [SHOP_KPOP] SET  MULTI_USER 
GO
ALTER DATABASE [SHOP_KPOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOP_KPOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHOP_KPOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOP_KPOP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SHOP_KPOP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHOP_KPOP', N'ON'
GO
USE [SHOP_KPOP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/29/2020 10:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Caterogy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UN_Caterogy] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/29/2020 10:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProdID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
 CONSTRAINT [PK_OderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/29/2020 10:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Created] [date] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[StatusID] [bigint] NOT NULL,
 CONSTRAINT [PK_Oders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/29/2020 10:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Price] [float] NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](700) NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NOT NULL,
	[Created] [date] NOT NULL,
	[CateID] [bigint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/29/2020 10:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/29/2020 10:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Created] [date] NOT NULL,
	[UserRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UN_User] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OderDetails_Oders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OderDetails_Oders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OderDetails_Products] FOREIGN KEY([ProdID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Oders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Oders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Caterogy] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Caterogy]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_UserRole] CHECK  (([UserRole]='admin' OR [UserRole]='user'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_UserRole]
GO
USE [master]
GO
ALTER DATABASE [SHOP_KPOP] SET  READ_WRITE 
GO
