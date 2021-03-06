USE [master]
GO
/****** Object:  Database [TodoLists]    Script Date: 14.9.2013 г. 02:43:03 ч. ******/
CREATE DATABASE [TodoLists]
GO
ALTER DATABASE [TodoLists] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TodoLists].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TodoLists] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TodoLists] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TodoLists] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TodoLists] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TodoLists] SET ARITHABORT OFF 
GO
ALTER DATABASE [TodoLists] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TodoLists] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TodoLists] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TodoLists] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TodoLists] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TodoLists] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TodoLists] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TodoLists] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TodoLists] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TodoLists] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TodoLists] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TodoLists] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TodoLists] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TodoLists] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TodoLists] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TodoLists] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TodoLists] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TodoLists] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TodoLists] SET RECOVERY FULL 
GO
ALTER DATABASE [TodoLists] SET  MULTI_USER 
GO
ALTER DATABASE [TodoLists] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TodoLists] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TodoLists] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TodoLists] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TodoLists', N'ON'
GO
USE [TodoLists]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14.9.2013 г. 02:43:04 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TodoLists]    Script Date: 14.9.2013 г. 02:43:04 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TodoLists](
	[TodoListId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[LastChangeDate] [date] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_TodoLists] PRIMARY KEY CLUSTERED 
(
	[TodoListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (1, N'Entertainment')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Homeworks')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[TodoLists] ON 

INSERT [dbo].[TodoLists] ([TodoListId], [Title], [Text], [LastChangeDate], [CategoryId]) VALUES (1, N'Pesho''s birthday', N'Go to Pesho''s birthday party', CAST(0x90370B00 AS Date), 1)
INSERT [dbo].[TodoLists] ([TodoListId], [Title], [Text], [LastChangeDate], [CategoryId]) VALUES (2, N'Cinema', N'Go to cinema with friends', CAST(0x8F370B00 AS Date), 1)
INSERT [dbo].[TodoLists] ([TodoListId], [Title], [Text], [LastChangeDate], [CategoryId]) VALUES (4, N'Web Development', N'To finish the Data binding homework', CAST(0x8F370B00 AS Date), 2)
INSERT [dbo].[TodoLists] ([TodoListId], [Title], [Text], [LastChangeDate], [CategoryId]) VALUES (7, N'Teamwork', N'Add "insert" functionality for countries', CAST(0x90370B00 AS Date), 2)
INSERT [dbo].[TodoLists] ([TodoListId], [Title], [Text], [LastChangeDate], [CategoryId]) VALUES (8, N'Binding', N'Practice data binding in ASP.NET', CAST(0x93370B00 AS Date), 2)
INSERT [dbo].[TodoLists] ([TodoListId], [Title], [Text], [LastChangeDate], [CategoryId]) VALUES (9, N'New Title', N'Some Text', CAST(0x93370B00 AS Date), 2)
SET IDENTITY_INSERT [dbo].[TodoLists] OFF
ALTER TABLE [dbo].[TodoLists] ADD  CONSTRAINT [DF_TodoLists_LastChangeDate]  DEFAULT (getdate()) FOR [LastChangeDate]
GO
ALTER TABLE [dbo].[TodoLists]  WITH CHECK ADD  CONSTRAINT [FK_TodoLists_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[TodoLists] CHECK CONSTRAINT [FK_TodoLists_Categories]
GO
USE [master]
GO
ALTER DATABASE [TodoLists] SET  READ_WRITE 
GO
