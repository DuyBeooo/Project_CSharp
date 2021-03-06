USE [master]
GO
/****** Object:  Database [ProjectCSharp1]    Script Date: 7/22/2021 10:33:37 PM ******/
CREATE DATABASE [ProjectCSharp1] ON  PRIMARY 
( NAME = N'ProjectCSharp1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectCSharp1.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectCSharp1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectCSharp1_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectCSharp1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectCSharp1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectCSharp1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectCSharp1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectCSharp1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectCSharp1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectCSharp1] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectCSharp1] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectCSharp1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectCSharp1] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectCSharp1', N'ON'
GO
USE [ProjectCSharp1]
GO
/****** Object:  Table [dbo].[Mark]    Script Date: 7/22/2021 10:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[StudentID] [nvarchar](50) NOT NULL,
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ExamCode] [nvarchar](50) NOT NULL,
	[TotalMark] [float] NULL,
	[ExamDate] [datetime] NULL,
 CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mark_Detail]    Script Date: 7/22/2021 10:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark_Detail](
	[StudentID] [nvarchar](50) NOT NULL,
	[RecordID] [int] NOT NULL,
	[QuestionID] [nvarchar](50) NOT NULL,
	[Mark] [float] NULL,
	[Comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/22/2021 10:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 7/22/2021 10:33:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[Test1] [nchar](10) NOT NULL,
	[Test2] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Test1] ASC,
	[Test2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Mark] ON 

INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140198', 1, N'De1', 6, CAST(N'2021-07-01 21:05:00.000' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140200', 4, N'De1', 4, CAST(N'2021-07-02 21:22:00.000' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140199', 7, N'De2', 2, CAST(N'2021-07-02 21:10:00.000' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140123', 8, N'PRN292', 0, CAST(N'2021-07-22 21:23:26.360' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140124', 9, N'PRN292', 0, CAST(N'2021-07-22 21:23:31.917' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140125', 10, N'PRN292', 0, CAST(N'2021-07-22 21:23:34.780' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140126', 11, N'PRN292', 0, CAST(N'2021-07-22 21:23:38.563' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140130', 12, N'PRN292', 0, CAST(N'2021-07-22 21:23:41.513' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140123', 13, N'PRN292', 0, CAST(N'2021-07-22 21:27:00.697' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140124', 14, N'PRN292', 0, CAST(N'2021-07-22 21:27:04.883' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140125', 15, N'PRN292', 0, CAST(N'2021-07-22 21:27:07.703' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140126', 16, N'PRN292', 0, CAST(N'2021-07-22 21:27:12.080' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140130', 17, N'PRN292', 0, CAST(N'2021-07-22 21:27:14.690' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140123', 18, N'PRN292', 0, CAST(N'2021-07-22 21:34:28.147' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140124', 19, N'PRN292', 0, CAST(N'2021-07-22 21:34:30.923' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140125', 20, N'PRN292', 0, CAST(N'2021-07-22 21:34:32.750' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140126', 21, N'PRN292', 0, CAST(N'2021-07-22 21:34:35.433' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140130', 22, N'PRN292', 0, CAST(N'2021-07-22 21:34:37.157' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140123', 23, N'PRN292', 0, CAST(N'2021-07-22 21:40:06.800' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140124', 24, N'PRN292', 4.5, CAST(N'2021-07-22 21:40:09.463' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140125', 25, N'PRN292', 0, CAST(N'2021-07-22 21:40:11.183' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140126', 26, N'PRN292', 0, CAST(N'2021-07-22 21:40:13.767' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140130', 27, N'PRN292', 0, CAST(N'2021-07-22 21:40:15.550' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140123', 28, N'PRN292', 0.5, CAST(N'2021-07-22 21:57:15.133' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140124', 29, N'PRN292', 4.5, CAST(N'2021-07-22 21:57:18.787' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140125', 30, N'PRN292', 0.5, CAST(N'2021-07-22 21:57:21.430' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140126', 31, N'PRN292', 4.5, CAST(N'2021-07-22 21:57:24.853' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140130', 32, N'PRN292', 1.5, CAST(N'2021-07-22 21:57:27.857' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140123', 33, N'PRN292', 0.5, CAST(N'2021-07-22 22:01:31.097' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140124', 34, N'PRN292', 4.5, CAST(N'2021-07-22 22:01:35.823' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140125', 35, N'PRN292', 0.5, CAST(N'2021-07-22 22:01:38.633' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140126', 36, N'PRN292', 4.5, CAST(N'2021-07-22 22:01:42.997' AS DateTime))
INSERT [dbo].[Mark] ([StudentID], [RecordID], [ExamCode], [TotalMark], [ExamDate]) VALUES (N'HE140130', 37, N'PRN292', 1.5, CAST(N'2021-07-22 22:01:45.790' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mark] OFF
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140198', 1, N'Q1', 1, N'good')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140198', 1, N'Q2', 3, N'good')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140198', 1, N'Q3', 2, N'good')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140199', 7, N'Q1', 2, N'good')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140199', 7, N'Q2', 0, N'very bad')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140199', 7, N'Q3', 0, N'very very bad')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140200', 4, N'Q1', 0, N'bad')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140200', 4, N'Q2', 0, N'very bad')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140200', 4, N'Q3', 4, N'good')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140123', 8, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140123', 8, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140125', 10, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140123', 8, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140123', 23, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 27, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140123', 28, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 32, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 32, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140123', 33, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140125', 35, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 37, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 37, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140125', 10, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140125', 10, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q1', 0.5, N'GOOD')
GO
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140125', 25, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 27, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 27, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140125', 30, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 37, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 9, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 11, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 24, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 26, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q10', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 32, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140130', 12, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 29, N'Q2', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 31, N'Q7', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140124', 34, N'Q1', 0.5, N'GOOD')
INSERT [dbo].[Mark_Detail] ([StudentID], [RecordID], [QuestionID], [Mark], [Comment]) VALUES (N'HE140126', 36, N'Q9', 0.5, N'GOOD')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140123', N'DuyNQ')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140124', N'HungDV')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140125', N'HoangNH')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140126', N'LongTV')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140130', N'HoanNV')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140196', N'DUYYYY')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140198', N'DuyNQ')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140199', N'HoangNH')
INSERT [dbo].[Student] ([StudentID], [StudentName]) VALUES (N'HE140200', N'HungDV')
INSERT [dbo].[Table_1] ([Test1], [Test2]) VALUES (N'a         ', N'a         ')
INSERT [dbo].[Table_1] ([Test1], [Test2]) VALUES (N'a         ', N'c         ')
INSERT [dbo].[Table_1] ([Test1], [Test2]) VALUES (N'b         ', N'a         ')
INSERT [dbo].[Table_1] ([Test1], [Test2]) VALUES (N'b         ', N'b         ')
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Student]
GO
ALTER TABLE [dbo].[Mark_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Detail_Mark] FOREIGN KEY([RecordID])
REFERENCES [dbo].[Mark] ([RecordID])
GO
ALTER TABLE [dbo].[Mark_Detail] CHECK CONSTRAINT [FK_Mark_Detail_Mark]
GO
ALTER TABLE [dbo].[Mark_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Detail_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Mark_Detail] CHECK CONSTRAINT [FK_Mark_Detail_Student]
GO
USE [master]
GO
ALTER DATABASE [ProjectCSharp1] SET  READ_WRITE 
GO
