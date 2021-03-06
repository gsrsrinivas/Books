USE [SampleDB_test]
GO
/****** Object:  StoredProcedure [dbo].[spSelectEmp]    Script Date: 09/12/2011 21:57:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spSelectEmp]
GO
/****** Object:  StoredProcedure [dbo].[spSelectEmp1]    Script Date: 09/12/2011 21:57:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spSelectEmp1]
GO
/****** Object:  Table [dbo].[toptest]    Script Date: 09/12/2011 21:57:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toptest]') AND type in (N'U'))
DROP TABLE [dbo].[toptest]
GO
/****** Object:  Table [dbo].[datecalendar]    Script Date: 09/12/2011 21:57:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[datecalendar]') AND type in (N'U'))
DROP TABLE [dbo].[datecalendar]
GO
/****** Object:  Table [dbo].[DuplicateRcordTable]    Script Date: 09/12/2011 21:57:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DuplicateRcordTable]') AND type in (N'U'))
DROP TABLE [dbo].[DuplicateRcordTable]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 09/12/2011 21:57:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp]') AND type in (N'U'))
DROP TABLE [dbo].[emp]
GO
USE [StorageDB]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 09/12/2011 21:58:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emp]') AND type in (N'U'))
DROP TABLE [dbo].[emp]
GO
USE [SampleDB_test]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 09/12/2011 21:57:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[FileStorage]    Script Date: 09/12/2011 21:57:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileStorage]') AND type in (N'U'))
DROP TABLE [dbo].[FileStorage]
GO
/****** Object:  Table [dbo].[IQs]    Script Date: 09/12/2011 21:57:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IQs]') AND type in (N'U'))
DROP TABLE [dbo].[IQs]
GO
/****** Object:  Schema [VIRUS\Srinivas]    Script Date: 09/12/2011 21:57:23 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'VIRUS\Srinivas')
DROP SCHEMA [VIRUS\Srinivas]
GO
/****** Object:  User [VIRUS\cnu]    Script Date: 09/12/2011 21:57:57 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\cnu')
DROP USER [VIRUS\cnu]
GO
/****** Object:  User [VIRUS\Ramya]    Script Date: 09/12/2011 21:57:58 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Ramya')
DROP USER [VIRUS\Ramya]
GO
/****** Object:  User [VIRUS\Shanker]    Script Date: 09/12/2011 21:57:58 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Shanker')
DROP USER [VIRUS\Shanker]
GO
/****** Object:  User [VIRUS\Srinivas]    Script Date: 09/12/2011 21:57:58 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Srinivas')
DROP USER [VIRUS\Srinivas]
GO
/****** Object:  User [VIRUS\cnu]    Script Date: 09/12/2011 21:57:57 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\cnu')
CREATE USER [VIRUS\cnu] FOR LOGIN [VIRUS\cnu] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VIRUS\Ramya]    Script Date: 09/12/2011 21:57:58 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Ramya')
CREATE USER [VIRUS\Ramya] FOR LOGIN [VIRUS\Ramya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VIRUS\Shanker]    Script Date: 09/12/2011 21:57:58 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Shanker')
CREATE USER [VIRUS\Shanker] FOR LOGIN [VIRUS\Shanker] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [VIRUS\Srinivas]    Script Date: 09/12/2011 21:57:58 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'VIRUS\Srinivas')
CREATE USER [VIRUS\Srinivas] FOR LOGIN [VIRUS\Srinivas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [VIRUS\Srinivas]    Script Date: 09/12/2011 21:57:23 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'VIRUS\Srinivas')
EXEC sys.sp_executesql N'CREATE SCHEMA [VIRUS\Srinivas] AUTHORIZATION [VIRUS\Srinivas]'
GO
/****** Object:  Table [dbo].[IQs]    Script Date: 09/12/2011 21:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IQs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IQs](
	[sno] [bigint] NOT NULL,
	[question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[answer] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[chapter] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subject] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FileStorage]    Script Date: 09/12/2011 21:57:56 ******/
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
	[Subject] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FileAttachment] [varbinary](max) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 09/12/2011 21:57:55 ******/
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
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Photo] [varbinary](max) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
USE [StorageDB]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 09/12/2011 21:58:04 ******/
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
	[empname] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mgrid] [numeric](18, 0) NULL,
	[city] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
USE [SampleDB_test]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 09/12/2011 21:57:54 ******/
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
	[empname] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mgrid] [numeric](18, 0) NULL,
	[city] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DuplicateRcordTable]    Script Date: 09/12/2011 21:57:53 ******/
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
/****** Object:  Table [dbo].[datecalendar]    Script Date: 09/12/2011 21:57:53 ******/
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
	[field1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[field2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[field3] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[field4] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[field5] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[field6] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[toptest]    Script Date: 09/12/2011 21:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toptest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toptest](
	[col1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spSelectEmp1]    Script Date: 09/12/2011 21:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'alter proc [dbo].[spSelectEmp1] 
with execute as ''VIRUS\ramya''
as
begin
select * from StorageDB.dbo.emp;
end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectEmp]    Script Date: 09/12/2011 21:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
declare @statement1 nvarchar(2000)
set @statement1 = N''
IF not EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSelectEmp]') AND type in (N'P', N'PC'))
	set  @statement1 = 'Create '
else
	set @statement1 = 'Alter '

set @statement1  = @statement1 + N' proc [dbo].[spSelectEmp] 
with execute as ''VIRUS\srinivas''
as
begin
select * from SampleDB_test.dbo.emp;
end
' 
EXEC dbo.sp_executesql @statement = @statement1
GO
