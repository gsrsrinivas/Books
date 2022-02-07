create table abc ( p int, q int)
create table xyz ( x int, y int)

drop trigger trxyz
create trigger trxyz on abc 
for insert  as
insert into xyz select * from inserted

drop trigger trxyz1
create trigger trxyz1 on abc
instead of update as 
insert into xyz select * from deleted
insert into xyz select * from inserted


exec sp_settriggerorder 
	 @triggername = 'trxyz'
	,@order = 'last'
	,@stmttype= 'insert'

exec sp_settriggerorder 
	 @triggername = 'MyTrigger' 
	,@order = 'first' 
	,@stmttype = 'UPDATE'

insert into abc select 1,2
insert into abc select 2,1

update abc set p=3,q=4 where p=2

select * from abc
select * from xyz

delete from abc
delete from xyz

/*
instead of trigger are fired on the table or view before a row is inserted into 
the table so we cannot set any trigger order to be first or last or none for the 
instead of trigger if we alter any trigger then its attribute first or last is 
droped and the order value is set to None; the order must be reset with 
sp_settriggerorder the syntax is as follows

exec sp_settriggerorder 
	 @triggername	= 'MyTrigger'
	,@order			= 'first'
	,@stmttype		= 'UPDATE'

*/