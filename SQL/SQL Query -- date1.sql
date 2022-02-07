/*
select GETDATE(),DAY(getdate()),MONTH(getdate()),YEAR(GETDATE())
select GETDATE(),DATENAME(W,GETDATE()),DATENAME(WK,GETDATE()),DATENAME(Q,GETDATE())

*/

update datecalendar set field3 = DATEPART(q,field1)
select * from datecalendar

SET DATEFIRST 7
select @@DATEFIRST



