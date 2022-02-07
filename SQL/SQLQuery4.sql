select * from dbo.FileStorage 
select * from dbo.tbl_Dot_Net
select * from dbo.tblQAs
order by Sno

select top 1 * from dbo.tbl_Dot_Net
select top 1 * from dbo.tblQAs

select COUNT(*) from dbo.tbl_Dot_Net


insert into dbo.tblQAs(Sno,Question,Ans,Chapter,Subject)
select Sno,Question,Ans,Chapter,Subject from dbo.tbl_Dot_Net


select qa.sno,d.sno,qa.Question,d.Question,qa.Ans,d.Ans 
from dbo.tblQAs qa
join dbo.tbl_Dot_Net d
on d.Question = qa.Question 
and d.Ans = qa.Ans 

-- drop table tbl_Dot_Net
with cteqas as ( 
select 
	 question
	,row_number() 
		over(PARTITION by sno,question,ans,chapter,[subject] 
		order by sno,question,ans,chapter,[subject]) as rowid
	,ans
	,chapter
	,Subject 
from dbo.tblQAs
)
select rowid,question,ans,chapter,subject
from cteqas
where rowid <> 1


