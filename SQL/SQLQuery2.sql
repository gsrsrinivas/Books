USE [SampleDB]
GO
/****** Object:  StoredProcedure [dbo].[spSelectEmp]    Script Date: 09/07/2011 22:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[spSelectEmp] 
with execute as 'VIRUS\srinivas'
as
begin
select * from sampledb.dbo.emp;
end
