USE [master]
GO
/****** Object:  Database [VacationManager]    Script Date: 11/25/2022 1:16:03 AM ******/
CREATE DATABASE [VacationManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VacationManager', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VacationManager_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VacationManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VacationManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VacationManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VacationManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VacationManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VacationManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VacationManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VacationManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VacationManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VacationManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VacationManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VacationManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VacationManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VacationManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VacationManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VacationManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VacationManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VacationManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VacationManager] SET  MULTI_USER 
GO
ALTER DATABASE [VacationManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VacationManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VacationManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VacationManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VacationManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VacationManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VacationManager', N'ON'
GO
ALTER DATABASE [VacationManager] SET QUERY_STORE = OFF
GO
USE [VacationManager]
GO
/****** Object:  User [bruh]    Script Date: 11/25/2022 1:16:03 AM ******/
CREATE USER [bruh] FOR LOGIN [bruh] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bruh]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [bruh]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11/25/2022 1:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/25/2022 1:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 11/25/2022 1:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](255) NOT NULL,
	[ProjectId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/25/2022 1:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[CompanyName] [nvarchar](255) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK__Users__3214EC077C2CD275] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 11/25/2022 1:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTeams](
	[TeamId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsLeader] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacations]    Script Date: 11/25/2022 1:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[IsHalfDay] [bit] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[SickSheet] [image] NOT NULL,
	[IsHospitalized] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'CEO')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (3, N'Developer')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'Team Lead')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (4, N'Unassigned')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (9, N'AzSum', N'㈱㐳', N'Hell', N'hee', N'Heloo', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (10, N'weauiodh', N'獩桵楦u', N'awd', N'awdaw', N'sdfuih', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (11, N'hello', N'扡晣', N'abcd', N'abcd', N'abcd', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (12, N'ddd', N'摤d', N'ddd', N'ddd', N'ddd', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (13, N'sss', N'獳s', N'sss', N'sss', N'sss', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (14, N'qqq', N'煱q', N'qqq', N'qqq', N'qqq', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (17, N'user', N'獡d', N'sss', N'sss', N'qqq', 3)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (18, N'qw', N'煱', N'Strefan', N'sdwio', N'qqq', 3)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (21, N'qqqq', N'獡晤', N'Stefan', N'user', N'qqq', 3)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [CompanyName], [RoleId]) VALUES (22, N'sssss', N'獳s', N'sss', N'sss', N'sss', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Roles]    Script Date: 11/25/2022 1:16:04 AM ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [UK_Roles] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Username]    Script Date: 11/25/2022 1:16:04 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams.ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams.ProjectId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams.TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams.TeamId]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams.UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams.UserId]
GO
ALTER TABLE [dbo].[Vacations]  WITH CHECK ADD  CONSTRAINT [FK_Vacations.UserID] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Vacations] CHECK CONSTRAINT [FK_Vacations.UserID]
GO
/****** Object:  StoredProcedure [dbo].[returnHashPassword]    Script Date: 11/25/2022 1:16:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[returnHashPassword]
	 @pass as varchar(max)
	AS
BEGIN

	SET NOCOUNT ON;

    SELECT CONVERT(varbinary(max),HASHBYTES( 'SHA2_512',@pass),2)
END
GO
USE [master]
GO
ALTER DATABASE [VacationManager] SET  READ_WRITE 
GO
