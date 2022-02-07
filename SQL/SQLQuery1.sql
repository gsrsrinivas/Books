select a.*
--a.sno,dn.sno,a.Question,dn.Question 
from tblQAs a
join tbl_Dot_Net dn
on a.Question = dn.Question
and a.Ans = dn.Ans 
and a.Chapter = dn.Chapter 
and a.Subject = dn.Subject

insert into tblQAs(Question,Ans,Chapter,Subject)
select dn.Question,dn.Ans,dn.Chapter,dn.Subject from tbl_Dot_Net dn

alter table tblQAs alter column sno bigint null


