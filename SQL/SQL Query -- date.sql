
if object_id('datecalendar') is not null
	drop table datecalendar

create table datecalendar ( 
id int,
field1 varchar(255),
field2 varchar(255),
field3 varchar(255),
field4 varchar(255),
field5 varchar(255),
field6 varchar(255)
)

begin
insert into datecalendar 
select 1,null,null,null,null,null,null 
end
go 1000

declare @id int
set @id= 0
update datecalendar set @id = ID = @id+1

update datecalendar set field1 = DATEADD(d,id,getdate())

select * from datecalendar












