CREATE TABLE toptest (col1 VARCHAR(150));

Insert Into TopTest Values('1');
Insert Into TopTest Values('2');
Insert Into TopTest Values('3');
Insert Into TopTest Values('4');
Insert Into TopTest Values('5');

SELECT TOP(2) * FROM toptest;

New of 2005

UPDATE TOP(2) toptest SET col1 = '100';

select * from toptest;


UPDATE TOP (50)  percent  toptest SET col1 = '500';

select * from toptest;

DELETE TOP(2) toptest;

select * from toptest;

Delete from toptest;

Insert Into TopTest Values('1');
Insert Into TopTest Values('2');
Insert Into TopTest Values('3');
Insert Into TopTest Values('4');
Insert Into TopTest Values('5');
Insert Into TopTest Values('6');
Insert Into TopTest Values('7');
Insert Into TopTest Values('8');
Insert Into TopTest Values('9');
Insert Into TopTest Values('10');



Expression in the Top clause


select top(select count(*) from toptest where col1 <=5) *
from emp
