drop table emp
create table emp (
	 empid		numeric(18,0) not null identity
	,empname	varchar(30)
	,mgrid		numeric(18,0)
	,city		varchar(30)
)

insert into emp (empname,mgrid,city)
select 'abc',1,'hyd'
go 10

select * from emp

-- update emp set mgrid = null where empid = 3


-- select distinct e1.empid,e1.empname,e1.mgrid,e1.city 
select distinct e3.empid,e3.empname,e3.mgrid,e3.city from emp e3 
join (select distinct e1.empid,e1.city 
from emp e1
join emp e2 on e1.empid = e2.mgrid ) e4
on e3.city=e4.city 
--and e3.mgrid = e4.empid 
--where e3.city = 'hyd'
group by e3.mgrid,e3.city,e3.empid,e3.empname
order by e3.city,e3.empid 


with cte as (
select distinct e1.empid,e1.city 
from emp e1
join emp e2 on e1.empid = e2.mgrid)
select distinct e3.empid,e3.empname,e3.mgrid,e3.city 
from emp e3 
join cte e4 on e3.city=e4.city 
--and e3.mgrid = e4.empid 
where e3.city = 'hyd'
group by e3.mgrid,e3.city,e3.empid,e3.empname 
order by e3.city asc,e3.mgrid asc


 




