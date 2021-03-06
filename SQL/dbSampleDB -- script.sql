USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SampleDB')
drop database SampleDB

IF not EXISTS (SELECT name FROM sys.databases WHERE name = N'SampleDB')
BEGIN
CREATE DATABASE [SampleDB] ON  PRIMARY 
( NAME = N'SampleDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\SampleDB.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SampleDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\SampleDB_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [SampleDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SampleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SampleDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SampleDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SampleDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SampleDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SampleDB] SET ARITHABORT OFF
GO
ALTER DATABASE [SampleDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SampleDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SampleDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SampleDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SampleDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SampleDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SampleDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SampleDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SampleDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SampleDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SampleDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [SampleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SampleDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SampleDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SampleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SampleDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SampleDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SampleDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SampleDB] SET  READ_WRITE
GO
ALTER DATABASE [SampleDB] SET RECOVERY FULL
GO
ALTER DATABASE [SampleDB] SET  MULTI_USER
GO
ALTER DATABASE [SampleDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SampleDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SampleDB', N'ON'
GO
USE [SampleDB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spSelectEmp]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spSelectEmp1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toptest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toptest](
	[col1] [varchar](150) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[datecalendar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[datecalendar](
	[id] [int] NULL,
	[field1] [varchar](255) NULL,
	[field2] [varchar](255) NULL,
	[field3] [varchar](255) NULL,
	[field4] [varchar](255) NULL,
	[field5] [varchar](255) NULL,
	[field6] [varchar](255) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuplicateRcordTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DuplicateRcordTable](
	[Col1] [int] NULL,
	[Col2] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emp](
	[empid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[empname] [varchar](30) NULL,
	[mgrid] [numeric](18, 0) NULL,
	[city] [varchar](30) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[Id] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [varbinary](max) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileStorage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FileStorage](
	[RowNum] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[FileAttachment] [varbinary](max) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IQs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IQs](
	[sno] [bigint] NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer] [nvarchar](max) NULL,
	[chapter] [nvarchar](50) NULL,
	[subject] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'VIRUS\Srinivas')
DROP SCHEMA [VIRUS\Srinivas]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\cnu')
DROP USER [VIRUS\cnu]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Ramya')
DROP USER [VIRUS\Ramya]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Shanker')
DROP USER [VIRUS\Shanker]
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Srinivas')
DROP USER [VIRUS\Srinivas]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Srinivas')
CREATE USER [VIRUS\Srinivas] FOR LOGIN [VIRUS\Srinivas] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Shanker')
CREATE USER [VIRUS\Shanker] FOR LOGIN [VIRUS\Shanker] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Ramya')
CREATE USER [VIRUS\Ramya] FOR LOGIN [VIRUS\Ramya] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\cnu')
CREATE USER [VIRUS\cnu] FOR LOGIN [VIRUS\cnu] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'VIRUS\Srinivas')
EXEC sys.sp_executesql N'CREATE SCHEMA [VIRUS\Srinivas] AUTHORIZATION [VIRUS\Srinivas]'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IQs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IQs](
	[sno] [bigint] NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer] [nvarchar](max) NULL,
	[chapter] [nvarchar](50) NULL,
	[subject] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileStorage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FileStorage](
	[RowNum] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[FileAttachment] [varbinary](max) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[Id] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [varbinary](max) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emp](
	[empid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[empname] [varchar](30) NULL,
	[mgrid] [numeric](18, 0) NULL,
	[city] [varchar](30) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuplicateRcordTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DuplicateRcordTable](
	[Col1] [int] NULL,
	[Col2] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[datecalendar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[datecalendar](
	[id] [int] NULL,
	[field1] [varchar](255) NULL,
	[field2] [varchar](255) NULL,
	[field3] [varchar](255) NULL,
	[field4] [varchar](255) NULL,
	[field5] [varchar](255) NULL,
	[field6] [varchar](255) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toptest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toptest](
	[col1] [varchar](150) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spSelectEmp1] 
with execute as ''VIRUS\ramya''
as
begin
select * from StorageDB.dbo.emp;
end
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[spSelectEmp] 
with execute as ''VIRUS\srinivas''
as
begin
select * from sampledb.dbo.emp;
end
' 
END
GO
