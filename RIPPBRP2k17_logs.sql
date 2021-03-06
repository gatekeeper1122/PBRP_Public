USE [master]
GO
/****** Object:  Database [pb-rp_logs]    Script Date: 8/7/2017 10:00:49 PM ******/
CREATE DATABASE [pb-rp_logs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pb-rp_logs', FILENAME = N'S:\SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\pb-rp_logs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pb-rp_logs_log', FILENAME = N'S:\SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\pb-rp_logs_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pb-rp_logs] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pb-rp_logs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pb-rp_logs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pb-rp_logs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pb-rp_logs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pb-rp_logs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pb-rp_logs] SET ARITHABORT OFF 
GO
ALTER DATABASE [pb-rp_logs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pb-rp_logs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pb-rp_logs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pb-rp_logs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pb-rp_logs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pb-rp_logs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pb-rp_logs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pb-rp_logs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pb-rp_logs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pb-rp_logs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pb-rp_logs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pb-rp_logs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pb-rp_logs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pb-rp_logs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pb-rp_logs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pb-rp_logs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pb-rp_logs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pb-rp_logs] SET RECOVERY FULL 
GO
ALTER DATABASE [pb-rp_logs] SET  MULTI_USER 
GO
ALTER DATABASE [pb-rp_logs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pb-rp_logs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pb-rp_logs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pb-rp_logs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pb-rp_logs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pb-rp_logs', N'ON'
GO
ALTER DATABASE [pb-rp_logs] SET QUERY_STORE = OFF
GO
USE [pb-rp_logs]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [pb-rp_logs]
GO
/****** Object:  User [smallyhome]    Script Date: 8/7/2017 10:00:50 PM ******/
CREATE USER [smallyhome] FOR LOGIN [smallyhome] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PB-RP\Web]    Script Date: 8/7/2017 10:00:50 PM ******/
CREATE USER [PB-RP\Web] FOR LOGIN [PB-RP\Web] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PB-RP\game]    Script Date: 8/7/2017 10:00:50 PM ******/
CREATE USER [PB-RP\game] FOR LOGIN [PB-RP\game] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PB-RP\donovan]    Script Date: 8/7/2017 10:00:50 PM ******/
CREATE USER [PB-RP\donovan] FOR LOGIN [PB-RP\donovan] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [smallyhome]
GO
ALTER ROLE [db_owner] ADD MEMBER [PB-RP\Web]
GO
ALTER ROLE [db_owner] ADD MEMBER [PB-RP\game]
GO
ALTER ROLE [db_owner] ADD MEMBER [PB-RP\donovan]
GO
/****** Object:  Table [dbo].[armoury]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[armoury](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[DateOfTransaction] [datetime] NOT NULL,
	[TakenBy] [int] NOT NULL,
 CONSTRAINT [PK_armoury] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attack]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InjuredId] [int] NOT NULL,
	[AcceptedDeath] [bit] NOT NULL,
	[AttackData] [varchar](max) NULL,
	[StartOfAttack] [datetime2](7) NOT NULL,
	[TimeOfDeath] [datetime2](7) NULL,
	[RevivalTime] [datetime2](7) NULL,
	[DownedTime] [datetime2](7) NULL,
 CONSTRAINT [PK_death] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[audit_masters]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audit_masters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MasterAccount] [int] NOT NULL,
	[User] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cash]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MoneyTransferredFrom] [int] NOT NULL,
	[MoneyTransferredTo] [int] NOT NULL,
	[Amount] [bigint] NOT NULL,
	[TransferMethod] [int] NOT NULL,
	[DateOfTransfer] [datetime] NULL,
 CONSTRAINT [PK_cash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commands]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
	[Command] [nvarchar](max) NULL,
	[CommandTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.commands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[connections]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[connections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
	[ConnectTime] [datetime] NOT NULL,
	[ConnectionIP] [nvarchar](max) NULL,
	[DisconnectTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.connections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weapon]    Script Date: 8/7/2017 10:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrentOwnerId] [int] NOT NULL,
	[CurrentOwnerType] [int] NOT NULL,
	[WeaponId] [int] NOT NULL,
	[WeaponType] [int] NOT NULL,
	[NewOwnerType] [int] NOT NULL,
	[NewOwnerId] [int] NOT NULL,
	[DateOfTransaction] [datetime] NOT NULL,
 CONSTRAINT [PK_weapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[attack] ADD  CONSTRAINT [DF_Table_1_AcceptDeath]  DEFAULT ((0)) FOR [AcceptedDeath]
GO
ALTER TABLE [dbo].[weapon] ADD  CONSTRAINT [DF_weapon_CurrentOwnerType]  DEFAULT ((0)) FOR [CurrentOwnerType]
GO
ALTER TABLE [dbo].[weapon] ADD  CONSTRAINT [DF_weapon_NewOwnerType]  DEFAULT ((0)) FOR [NewOwnerType]
GO
USE [master]
GO
ALTER DATABASE [pb-rp_logs] SET  READ_WRITE 
GO
