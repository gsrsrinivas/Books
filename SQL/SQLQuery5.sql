#region
select * from sys.tables
select * from emp
select * from dbo.DuplicateRcordTable
select * from dbo.FileStorage
select * from dbo.tblQAs order by Sno
select * from dbo.tbl_Dot_Net_1
select * from dbo.tbl_Dot_Net_2
select * from dbo.Table1
select * from dbo.IQs

insert into IQs(Question,Answer,Chapter,Subject) 
select t1.Question,t1.Answer,t1.Chapter,t1.Subject from Table1 t1
union all 
select dn1.Question,dn1.Ans,dn1.Chapter,dn1.Subject from tbl_Dot_Net_1 dn1
union all
select dn2.Question,dn2.Ans,dn2.Chapter,dn2.Subject from tbl_Dot_Net_2 dn2
union all
select q.Question,q.Ans,q.Chapter,q.Subject from tblQAs q

with cteIQs as (
select ROW_NUMBER() over(partition by question,answer,chapter,subject order by question,answer,chapter,subject) as rowid
,question,Answer,Chapter,Subject
from IQs )
select * from cteiqs 
where rowid =1

select COUNT(*) from dbo.IQs
select COUNT(*) from dbo.table1
sp_spaceused 'IQs'

select top 1 * from dbo.table1

with cte as (
select 
	ROW_NUMBER() over(partition by question,answer,chapter,subject 
	order by question,answer,chapter,subject) as rowid
	,question,Answer,Chapter,Subject
from table1 
)
select * from cte 
where rowid > 1

select * from IQs
union all
select * from Table1
order by 1

alter table iqs drop column sno
select * from IQs

alter table iqs add sno bigint null
select * from IQs

declare @intCounter bigint = 0
update IQs SET @intCounter = sno = @intCounter + 1

select * from IQs

select sno,question,answer,chapter,subject into iqs1 from IQs 

select * from iqs1 order by sno

drop table iqs

insert into IQs1 (sno,question,answer,chapter,subject) 
select sno,question,answer,chapter,subject from Table1

exec sp_rename 'IQs1','IQs' 
select * from IQs
drop table table1

with cte as (
select 
	ROW_NUMBER() over(partition by question,answer,chapter,subject 
	order by question,answer,chapter,subject) as rowid
	,question,Answer,Chapter,Subject
from dbo.IQs
)
delete from cte 
where rowid > 1

select COUNT(*) from IQs

select sno from IQs
group by sno 
having COUNT(*)>1


alter table iqs alter column sno bigint not null
alter table iqs add constraint pk_sno primary key(sno)
 
select * from sys.sysfiles

select * from dbo.dotnet
drop table dotnet

insert into IQs (sno,question,answer)
select txtsno,txtquestion,txtans from dbo.DotNet

alter table iqs drop constraint pk_sno

tempdb
#endregion

