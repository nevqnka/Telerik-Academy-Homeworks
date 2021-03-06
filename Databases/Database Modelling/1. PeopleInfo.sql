USE [master]
GO
/****** Object:  Database [PeopleInfo]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
CREATE DATABASE [PeopleInfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeopleInfo', FILENAME = N'E:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PeopleInfo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PeopleInfo_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PeopleInfo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PeopleInfo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeopleInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeopleInfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeopleInfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeopleInfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeopleInfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeopleInfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeopleInfo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PeopleInfo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleInfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeopleInfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleInfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeopleInfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeopleInfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeopleInfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeopleInfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeopleInfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeopleInfo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PeopleInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeopleInfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeopleInfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeopleInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeopleInfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeopleInfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PeopleInfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeopleInfo] SET RECOVERY FULL 
GO
ALTER DATABASE [PeopleInfo] SET  MULTI_USER 
GO
ALTER DATABASE [PeopleInfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeopleInfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeopleInfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeopleInfo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PeopleInfo', N'ON'
GO
USE [PeopleInfo]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](max) NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (1, N'18, Tsar Osvoboditel Str.', 2)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (3, N'55, Bergmannstrasse', 3)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (5, N'83, San Ignacio Str.', 4)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (3, N'Africa')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (4, N'North America')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (5, N'South America')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (6, N'Australia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (7, N'Antarctida')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (2, N'Bulgaria', 1)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (3, N'Germany', 1)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (4, N'Chile', 5)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'Petar', N'Ivanov', 1)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (8, N'Maria', N'Müller', 3)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (11, N'Antonio', N'Sanchez', 5)
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (2, N'Sofia', 2)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (3, N'Berlin', 3)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (4, N'Santiago', 4)
SET IDENTITY_INSERT [dbo].[Towns] OFF
/****** Object:  Index [IX_Countries]    Script Date: 14.7.2013 г. 01:50:02 ч. ******/
CREATE NONCLUSTERED INDEX [IX_Countries] ON [dbo].[Countries]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [PeopleInfo] SET  READ_WRITE 
GO
