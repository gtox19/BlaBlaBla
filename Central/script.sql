USE [master]
GO
/****** Object:  Database [SaboresPortugalDB]    Script Date: 27/05/2016 13:58:24 ******/
CREATE DATABASE [SaboresPortugalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaboresPortugalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SaboresPortugalDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaboresPortugalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SaboresPortugalDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaboresPortugalDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaboresPortugalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaboresPortugalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaboresPortugalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaboresPortugalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaboresPortugalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaboresPortugalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SaboresPortugalDB] SET  MULTI_USER 
GO
ALTER DATABASE [SaboresPortugalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaboresPortugalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaboresPortugalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaboresPortugalDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SaboresPortugalDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaboresPortugalDB', N'ON'
GO
ALTER DATABASE [SaboresPortugalDB] SET QUERY_STORE = OFF
GO
USE [SaboresPortugalDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SaboresPortugalDB]
GO
/****** Object:  Table [dbo].[Foto]    Script Date: 27/05/2016 13:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foto](
	[idFoto] [int] NOT NULL,
	[idTarefa] [int] NOT NULL,
 CONSTRAINT [PK_Foto] PRIMARY KEY CLUSTERED 
(
	[idFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 27/05/2016 13:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurante](
	[idRestaurante] [int] NOT NULL,
	[descriçao] [text] NULL,
	[nome] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[codigo postal] [nvarchar](50) NOT NULL,
	[localidade] [nvarchar](50) NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[rua] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Restaurante] PRIMARY KEY CLUSTERED 
(
	[idRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tarefa]    Script Date: 27/05/2016 13:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarefa](
	[idTarefa] [int] NOT NULL,
	[data inicial] [datetime] NOT NULL,
	[data fim] [datetime] NOT NULL,
	[relatorio] [text] NOT NULL,
	[voz] [xml] NOT NULL,
	[idUtilizador] [int] NOT NULL,
	[idRestaurante] [int] NOT NULL,
 CONSTRAINT [PK_Tarefa] PRIMARY KEY CLUSTERED 
(
	[idTarefa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TelefoneRestaurante]    Script Date: 27/05/2016 13:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefoneRestaurante](
	[Número] [int] NOT NULL,
	[idRestaurante] [int] NOT NULL,
 CONSTRAINT [PK_TelefoneRestaurante] PRIMARY KEY CLUSTERED 
(
	[Número] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TelefoneUtilizador]    Script Date: 27/05/2016 13:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefoneUtilizador](
	[Número] [int] NOT NULL,
	[idUtilizador] [int] NOT NULL,
 CONSTRAINT [PK_TelefoneUtilizador] PRIMARY KEY CLUSTERED 
(
	[Número] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 27/05/2016 13:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizador](
	[idUtilizador] [int] NOT NULL,
	[nome] [nvarchar](50) NOT NULL,
	[codigo postal] [nvarchar](50) NOT NULL,
	[localidade] [nvarchar](50) NOT NULL,
	[rua] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Utilizador] PRIMARY KEY CLUSTERED 
(
	[idUtilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Foto]  WITH CHECK ADD  CONSTRAINT [FK_Foto_Tarefa] FOREIGN KEY([idTarefa])
REFERENCES [dbo].[Tarefa] ([idTarefa])
GO
ALTER TABLE [dbo].[Foto] CHECK CONSTRAINT [FK_Foto_Tarefa]
GO
ALTER TABLE [dbo].[Tarefa]  WITH CHECK ADD  CONSTRAINT [FK_Tarefa_Restaurante] FOREIGN KEY([idRestaurante])
REFERENCES [dbo].[Restaurante] ([idRestaurante])
GO
ALTER TABLE [dbo].[Tarefa] CHECK CONSTRAINT [FK_Tarefa_Restaurante]
GO
ALTER TABLE [dbo].[Tarefa]  WITH CHECK ADD  CONSTRAINT [FK_Tarefa_Utilizador] FOREIGN KEY([idUtilizador])
REFERENCES [dbo].[Utilizador] ([idUtilizador])
GO
ALTER TABLE [dbo].[Tarefa] CHECK CONSTRAINT [FK_Tarefa_Utilizador]
GO
ALTER TABLE [dbo].[TelefoneRestaurante]  WITH CHECK ADD  CONSTRAINT [FK_TelefoneRestaurante_Restaurante] FOREIGN KEY([idRestaurante])
REFERENCES [dbo].[Restaurante] ([idRestaurante])
GO
ALTER TABLE [dbo].[TelefoneRestaurante] CHECK CONSTRAINT [FK_TelefoneRestaurante_Restaurante]
GO
ALTER TABLE [dbo].[TelefoneUtilizador]  WITH CHECK ADD  CONSTRAINT [FK_TelefoneUtilizador_Utilizador] FOREIGN KEY([idUtilizador])
REFERENCES [dbo].[Utilizador] ([idUtilizador])
GO
ALTER TABLE [dbo].[TelefoneUtilizador] CHECK CONSTRAINT [FK_TelefoneUtilizador_Utilizador]
GO
USE [master]
GO
ALTER DATABASE [SaboresPortugalDB] SET  READ_WRITE 
GO
