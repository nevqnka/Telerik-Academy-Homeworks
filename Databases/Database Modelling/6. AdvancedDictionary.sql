USE [master]
GO
/****** Object:  Database [Dictionary]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
CREATE DATABASE [Dictionary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dictionary', FILENAME = N'E:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Dictionary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dictionary_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Dictionary_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dictionary] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Dictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dictionary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dictionary] SET RECOVERY FULL 
GO
ALTER DATABASE [Dictionary] SET  MULTI_USER 
GO
ALTER DATABASE [Dictionary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dictionary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dictionary', N'ON'
GO
USE [Dictionary]
GO
/****** Object:  Table [dbo].[Explanations]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explanations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Explanation] [text] NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Explanations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hyponyms]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hyponyms](
	[WordId] [int] NOT NULL,
	[HypernymId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](75) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartsOfSpeech]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartsOfSpeech](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartOfSpeech] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PartsOfSpeech] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](200) NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsAntonyms]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsAntonyms](
	[WordId] [int] NOT NULL,
	[AntonymId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsExplanations]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsExplanations](
	[WordId] [int] NOT NULL,
	[ExplanationId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsPartsOfSpeech]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsPartsOfSpeech](
	[WordId] [int] NOT NULL,
	[PartOfSpeechId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsSynonyms]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsSynonyms](
	[WordId] [int] NOT NULL,
	[SynonymId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WordsTranslations]    Script Date: 14.7.2013 г. 20:25:44 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordsTranslations](
	[WordId] [int] NOT NULL,
	[TranslationId] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Explanations] ON 

INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (1, N'Cause to have, in the abstract sense or physical sense', 1)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (2, N'Ceder, offrir gratuitement a quelqu''un quelque chose qu''on possedait ou qu''on a soi-meme achete a cet effet, lui en faire cadeau', 2)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (3, N'Accorder quelque chose, un sentiment, une duree, etc., a quelqu''un, a quelque chose', 2)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (4, N'Jemandem etwas reichen bzw. in die Nahe oder Hande legen', 3)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (5, N'The organ of sight', 1)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (6, N'A small hole or loop (as in a needle)', 1)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (7, N'Organo sensible a la luz que permite la vision en los seres vivos', 4)
INSERT [dbo].[Explanations] ([Id], [Explanation], [LanguageId]) VALUES (8, N'Por extension, cualquier aparato de funcion analoga a la del organo de la vista ', 4)
SET IDENTITY_INSERT [dbo].[Explanations] OFF
INSERT [dbo].[Hyponyms] ([WordId], [HypernymId]) VALUES (17, 16)
INSERT [dbo].[Hyponyms] ([WordId], [HypernymId]) VALUES (18, 16)
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([Id], [Language]) VALUES (1, N'English')
INSERT [dbo].[Languages] ([Id], [Language]) VALUES (2, N'French')
INSERT [dbo].[Languages] ([Id], [Language]) VALUES (3, N'German')
INSERT [dbo].[Languages] ([Id], [Language]) VALUES (4, N'Spanish')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[PartsOfSpeech] ON 

INSERT [dbo].[PartsOfSpeech] ([Id], [PartOfSpeech]) VALUES (1, N'Noun')
INSERT [dbo].[PartsOfSpeech] ([Id], [PartOfSpeech]) VALUES (2, N'Adjective')
INSERT [dbo].[PartsOfSpeech] ([Id], [PartOfSpeech]) VALUES (3, N'Adverb')
INSERT [dbo].[PartsOfSpeech] ([Id], [PartOfSpeech]) VALUES (4, N'Verb')
INSERT [dbo].[PartsOfSpeech] ([Id], [PartOfSpeech]) VALUES (5, N'Preposition')
SET IDENTITY_INSERT [dbo].[PartsOfSpeech] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (1, N'give', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (2, N'donner', 2)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (3, N'geben', 3)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (5, N'use', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (6, N'verwenden', 3)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (7, N'utiliser', 2)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (8, N'eye', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (9, N'ojo', 4)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (10, N'oeil', 2)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (11, N'eyeball', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (12, N'middle', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (13, N'apply', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (14, N'employ', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (15, N'utilize', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (16, N'tree', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (17, N'oak-tree', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (18, N'pine', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (20, N'take', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (22, N'beginning', 1)
INSERT [dbo].[Words] ([Id], [Word], [LanguageId]) VALUES (23, N'end', 1)
SET IDENTITY_INSERT [dbo].[Words] OFF
INSERT [dbo].[WordsAntonyms] ([WordId], [AntonymId]) VALUES (1, 20)
INSERT [dbo].[WordsAntonyms] ([WordId], [AntonymId]) VALUES (12, 22)
INSERT [dbo].[WordsAntonyms] ([WordId], [AntonymId]) VALUES (12, 23)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (1, 1)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (2, 2)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (2, 3)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (3, 4)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (8, 5)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (8, 6)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (9, 7)
INSERT [dbo].[WordsExplanations] ([WordId], [ExplanationId]) VALUES (9, 8)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (1, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (2, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (3, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (5, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (6, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (7, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (8, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (9, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (10, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (11, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (12, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (13, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (14, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (15, 4)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (16, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (17, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (18, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (20, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (22, 1)
INSERT [dbo].[WordsPartsOfSpeech] ([WordId], [PartOfSpeechId]) VALUES (23, 1)
INSERT [dbo].[WordsSynonyms] ([WordId], [SynonymId]) VALUES (8, 11)
INSERT [dbo].[WordsSynonyms] ([WordId], [SynonymId]) VALUES (8, 12)
INSERT [dbo].[WordsSynonyms] ([WordId], [SynonymId]) VALUES (5, 13)
INSERT [dbo].[WordsSynonyms] ([WordId], [SynonymId]) VALUES (5, 14)
INSERT [dbo].[WordsSynonyms] ([WordId], [SynonymId]) VALUES (5, 15)
INSERT [dbo].[WordsTranslations] ([WordId], [TranslationId]) VALUES (1, 2)
INSERT [dbo].[WordsTranslations] ([WordId], [TranslationId]) VALUES (1, 3)
INSERT [dbo].[WordsTranslations] ([WordId], [TranslationId]) VALUES (5, 6)
INSERT [dbo].[WordsTranslations] ([WordId], [TranslationId]) VALUES (5, 7)
INSERT [dbo].[WordsTranslations] ([WordId], [TranslationId]) VALUES (8, 9)
INSERT [dbo].[WordsTranslations] ([WordId], [TranslationId]) VALUES (8, 10)
ALTER TABLE [dbo].[Hyponyms]  WITH CHECK ADD  CONSTRAINT [FK_Hyponyms_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Hyponyms] CHECK CONSTRAINT [FK_Hyponyms_Words]
GO
ALTER TABLE [dbo].[Hyponyms]  WITH CHECK ADD  CONSTRAINT [FK_Hyponyms_Words1] FOREIGN KEY([HypernymId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Hyponyms] CHECK CONSTRAINT [FK_Hyponyms_Words1]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
ALTER TABLE [dbo].[WordsAntonyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsAntonyms_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsAntonyms] CHECK CONSTRAINT [FK_WordsAntonyms_Words]
GO
ALTER TABLE [dbo].[WordsAntonyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsAntonyms_Words1] FOREIGN KEY([AntonymId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsAntonyms] CHECK CONSTRAINT [FK_WordsAntonyms_Words1]
GO
ALTER TABLE [dbo].[WordsExplanations]  WITH CHECK ADD  CONSTRAINT [FK_WordsExplanations_Explanations] FOREIGN KEY([ExplanationId])
REFERENCES [dbo].[Explanations] ([Id])
GO
ALTER TABLE [dbo].[WordsExplanations] CHECK CONSTRAINT [FK_WordsExplanations_Explanations]
GO
ALTER TABLE [dbo].[WordsExplanations]  WITH CHECK ADD  CONSTRAINT [FK_WordsExplanations_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsExplanations] CHECK CONSTRAINT [FK_WordsExplanations_Words]
GO
ALTER TABLE [dbo].[WordsPartsOfSpeech]  WITH CHECK ADD  CONSTRAINT [FK_WordsPartsOfSpeech_PartsOfSpeech1] FOREIGN KEY([PartOfSpeechId])
REFERENCES [dbo].[PartsOfSpeech] ([Id])
GO
ALTER TABLE [dbo].[WordsPartsOfSpeech] CHECK CONSTRAINT [FK_WordsPartsOfSpeech_PartsOfSpeech1]
GO
ALTER TABLE [dbo].[WordsPartsOfSpeech]  WITH CHECK ADD  CONSTRAINT [FK_WordsPartsOfSpeech_Words1] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsPartsOfSpeech] CHECK CONSTRAINT [FK_WordsPartsOfSpeech_Words1]
GO
ALTER TABLE [dbo].[WordsSynonyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsSynonyms_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsSynonyms] CHECK CONSTRAINT [FK_WordsSynonyms_Words]
GO
ALTER TABLE [dbo].[WordsSynonyms]  WITH CHECK ADD  CONSTRAINT [FK_WordsSynonyms_Words1] FOREIGN KEY([SynonymId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsSynonyms] CHECK CONSTRAINT [FK_WordsSynonyms_Words1]
GO
ALTER TABLE [dbo].[WordsTranslations]  WITH CHECK ADD  CONSTRAINT [FK_WordsTranslations_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsTranslations] CHECK CONSTRAINT [FK_WordsTranslations_Words]
GO
ALTER TABLE [dbo].[WordsTranslations]  WITH CHECK ADD  CONSTRAINT [FK_WordsTranslations_Words1] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WordsTranslations] CHECK CONSTRAINT [FK_WordsTranslations_Words1]
GO
USE [master]
GO
ALTER DATABASE [Dictionary] SET  READ_WRITE 
GO
