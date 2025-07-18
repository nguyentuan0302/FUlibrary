USE [master]
GO
/****** Object:  Database [FuLibrary]    Script Date: 3/12/2025 5:23:58 PM ******/
CREATE DATABASE [FuLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FuLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FuLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FuLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FuLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FuLibrary] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FuLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FuLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FuLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FuLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FuLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FuLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [FuLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FuLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FuLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FuLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FuLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FuLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FuLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FuLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FuLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FuLibrary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FuLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FuLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FuLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FuLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FuLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FuLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FuLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FuLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [FuLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [FuLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FuLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FuLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FuLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FuLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FuLibrary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FuLibrary', N'ON'
GO
ALTER DATABASE [FuLibrary] SET QUERY_STORE = ON
GO
ALTER DATABASE [FuLibrary] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FuLibrary]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/12/2025 5:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[bookname] [varchar](255) NOT NULL,
	[ISBN] [varchar](20) NULL,
	[edition] [int] NULL,
	[author] [varchar](255) NULL,
	[publisher] [varchar](255) NULL,
	[yearofrelease] [datetime] NULL,
	[physicaldescription] [varchar](255) NULL,
	[categoryId] [int] NULL,
	[Image] [varchar](255) NULL,
	[status] [varchar](50) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookBorrow]    Script Date: 3/12/2025 5:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookBorrow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[userId] [int] NULL,
	[borrowdetailId] [int] NULL,
	[createdAt] [datetime] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCategory]    Script Date: 3/12/2025 5:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowDetail]    Script Date: 3/12/2025 5:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[borrowFrom] [datetime] NULL,
	[borrowTo] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[nota] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/12/2025 5:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2025 5:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[roleId] [int] NULL,
	[phonenumber] [varchar](20) NULL,
	[gender] [varchar](10) NULL,
	[dob] [datetime] NULL,
	[identitycard] [varchar](20) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (1, N'The Great Adventure', N'978-3-16-148410-0', 1, N'John Doe', N'XYZ Publisher', CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'A thrilling journey', 1, N'https://gramentheme.com/html/bookle/assets/img/shop-list/01.png', N'Available', 10)
INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (2, N'Learning Python', N'978-1-23-456789-0', 3, N'Jane Smith', N'ABC Press', CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'A guide to Python programming', 4, N'https://gramentheme.com/html/bookle/assets/img/shop-list/02.png', N'Available', 5)
INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (3, N'Science for Beginners', N'978-0-12-345678-9', 2, N'Albert Einstein', N'Science Press', CAST(N'2018-09-15T00:00:00.000' AS DateTime), N'Introduction to science', 3, N'https://gramentheme.com/html/bookle/assets/img/shop-list/03.png', N'Available', 8)
INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (4, N'x', N'c', 23, N'3333', N'3', CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'3333', 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGBr3aLJc386mXyPLwsyBUUGKHeMwbedwaSg&s', N'Available', 3)
INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (9, N'c', N'c', 4, N'4', N'4', CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'', 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR53zC4cpDSR6-1QvFkRaC5M5_cWn3m76I0mA&s', N'Available', 4)
INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (10, N'c', N'c', 4, N'4', N'4', CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'', 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR53zC4cpDSR6-1QvFkRaC5M5_cWn3m76I0mA&s', N'Available', 4)
INSERT [dbo].[Book] ([ID], [bookname], [ISBN], [edition], [author], [publisher], [yearofrelease], [physicaldescription], [categoryId], [Image], [status], [quantity]) VALUES (11, N'c', N'c', 88, N'3', N'1', CAST(N'2025-03-20T00:00:00.000' AS DateTime), N'11', 5, N'https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg', N'Available', 11)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[BookBorrow] ON 

INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (1, 1, 2, 1, CAST(N'2025-02-01T10:05:00.000' AS DateTime), N'borrowed')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (2, 2, 3, 2, CAST(N'2025-02-02T12:10:00.000' AS DateTime), N'borrowed')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (4, 1, 6, 14, CAST(N'2025-03-11T00:00:00.000' AS DateTime), N'Extended')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (5, 1, 6, 4, CAST(N'2025-03-11T00:00:00.000' AS DateTime), N'Rejected')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (6, 1, 6, 5, CAST(N'2025-03-11T00:00:00.000' AS DateTime), N'Extended')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (7, 1, 6, 13, CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (8, 1, 6, 15, CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Cancelled')
INSERT [dbo].[BookBorrow] ([ID], [bookId], [userId], [borrowdetailId], [createdAt], [status]) VALUES (9, 2, 6, 17, CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended')
SET IDENTITY_INSERT [dbo].[BookBorrow] OFF
GO
SET IDENTITY_INSERT [dbo].[BookCategory] ON 

INSERT [dbo].[BookCategory] ([ID], [categoryName]) VALUES (1, N'Fiction')
INSERT [dbo].[BookCategory] ([ID], [categoryName]) VALUES (2, N'Non-Fiction')
INSERT [dbo].[BookCategory] ([ID], [categoryName]) VALUES (3, N'Science')
INSERT [dbo].[BookCategory] ([ID], [categoryName]) VALUES (4, N'Technology')
INSERT [dbo].[BookCategory] ([ID], [categoryName]) VALUES (5, N'Documentary')
SET IDENTITY_INSERT [dbo].[BookCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowDetail] ON 

INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (1, CAST(N'1900-01-02T00:00:00.000' AS DateTime), CAST(N'1900-01-03T00:00:00.000' AS DateTime), CAST(N'2025-02-01T10:00:00.000' AS DateTime), N'Borrowed for 7 days')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (2, CAST(N'1900-01-02T00:00:00.000' AS DateTime), CAST(N'1900-01-04T00:00:00.000' AS DateTime), CAST(N'2025-02-02T12:00:00.000' AS DateTime), N'Borrowed for 14 days')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (3, CAST(N'2025-03-11T00:00:00.000' AS DateTime), CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-03-11T00:00:00.000' AS DateTime), N'supachoke')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (4, CAST(N'2025-03-11T00:00:00.000' AS DateTime), CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-03-11T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (5, CAST(N'2025-03-11T00:00:00.000' AS DateTime), CAST(N'2025-03-28T00:00:00.000' AS DateTime), CAST(N'2025-03-11T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (6, CAST(N'2025-03-28T00:00:00.000' AS DateTime), CAST(N'2025-04-05T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 5')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (7, CAST(N'2025-03-28T00:00:00.000' AS DateTime), CAST(N'2025-04-05T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 5')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (8, CAST(N'2025-04-05T00:00:00.000' AS DateTime), CAST(N'2025-05-24T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 7')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (9, CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-05-24T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 3')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (10, CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-04-04T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 3')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (11, CAST(N'2025-04-05T00:00:00.000' AS DateTime), CAST(N'2025-05-09T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 7')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (12, CAST(N'2025-05-09T00:00:00.000' AS DateTime), CAST(N'2025-06-21T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 11')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (13, CAST(N'2025-06-21T00:00:00.000' AS DateTime), CAST(N'2025-08-23T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 12')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (14, CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 3')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (15, CAST(N'2025-03-12T00:00:00.000' AS DateTime), CAST(N'2025-03-27T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'lmlm')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (16, CAST(N'2025-03-12T00:00:00.000' AS DateTime), CAST(N'2025-03-15T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'muon')
INSERT [dbo].[BorrowDetail] ([ID], [borrowFrom], [borrowTo], [createdAt], [nota]) VALUES (17, CAST(N'2025-03-15T00:00:00.000' AS DateTime), CAST(N'2025-03-18T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), N'Extended from previous borrow period: 16')
SET IDENTITY_INSERT [dbo].[BorrowDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([ID], [roleName]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (1, N'adminuser', N'adminpass', 1, N'1234567890', N'male', CAST(N'1985-05-10T00:00:00.000' AS DateTime), N'123456789', N'admin@example.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (2, N'john_doe', N'userpass', 2, N'9876543210', N'male', CAST(N'1990-07-20T00:00:00.000' AS DateTime), N'987654321', N'john@example.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (3, N'jane_smith', N'userpass', 2, N'1122334455', N'female', CAST(N'1995-03-30T00:00:00.000' AS DateTime), N'112233445', N'jane@example.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (6, N'hoaq139', N'123', 2, N'0987654222', N'Female', CAST(N'2000-07-21T00:00:00.000' AS DateTime), N'0987654321235', N'hoangdn1309@gmail.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (7, N'dr_susan123123', N'123', 2, N'0987654321', N'Male', CAST(N'2006-06-28T00:00:00.000' AS DateTime), N'0987654321235', N'jiyoga3354@oziere.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (10, N'dr_john', N'1111', 2, N'0987654321', N'Male', CAST(N'2013-07-12T00:00:00.000' AS DateTime), N'111111', N'jiyoga3354@oziere.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (11, N'dr_john', N'1111', 2, N'0987654321', N'Male', CAST(N'2013-07-12T00:00:00.000' AS DateTime), N'111111', N'jiyoga3354@oziere.com')
INSERT [dbo].[Users] ([ID], [username], [password], [roleId], [phonenumber], [gender], [dob], [identitycard], [email]) VALUES (12, N'hoaq139admin', N'123', 2, N'0987654321', N'Male', CAST(N'2025-03-05T00:00:00.000' AS DateTime), N'0987654321235', N'bavyryzi@logsmarter.net')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[BookCategory] ([ID])
GO
ALTER TABLE [dbo].[BookBorrow]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[BookBorrow]  WITH CHECK ADD FOREIGN KEY([borrowdetailId])
REFERENCES [dbo].[BorrowDetail] ([ID])
GO
ALTER TABLE [dbo].[BookBorrow]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([ID])
GO
USE [master]
GO
ALTER DATABASE [FuLibrary] SET  READ_WRITE 
GO
