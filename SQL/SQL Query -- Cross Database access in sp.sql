-- 1) create sp with accessing other database tables.
use StorageDB
go
create proc dbo.spSelectEmp 
with execute as 'VIRUS\srinivas'
as
begin
select * from sampledb.dbo.emp;
end
-- 2) set the trustworthy on for the database where the sp is created
-- alter database storagedb set trustworthy on

-- exec spSelectEmp
/*
sa login with dbo user is 
having access db_owner permissions to storagedb database.

*/ 

-- alter database sampledb set trustworthy off

/*
select Sl.name,sd.name,sl.sid,sd.sid,* 
from sys.sql_logins sl
inner join sys.sysdatabases sd
on sl.sid = sd.sid
*/