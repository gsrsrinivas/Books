declare @sql nvarchar(max), @tableName nvarchar(2000)
,@schemaName nvarchar(2000)
set @tableName = 'Ramya'
set @schemaName = '' 
select @schemaName = s.name 
from sys.schemas s
inner join sys.tables t
on s.schema_id = t.schema_id
where t.name = @tableName

set @sql = 'Create table ' + @schemaName + '.' + @tableName + ' 
   ( 
' 
select @sql = @sql + '     [' + c.name + ']     [' + t.name + ']' 
+ 
case when t.user_type_id in (106,108) then
'(' 
-- + convert(nvarchar,c.max_length) 
--	+ ',' 
	+ convert(nvarchar,c.precision) 
	+ ',' 
	+ convert(nvarchar,c.scale) 
	+ ')'
when t.user_type_id in (165,167,231) and c.max_length = -1 then
'(MAX)' 
 --+ convert(nvarchar,c.max_length) 
	--+ ',' 
	--+ convert(nvarchar,c.precision) 
	--+ ',' 
	--+ convert(nvarchar,c.scale) 
	--+ ')'
when t.user_type_id in (173,175,42,43,106,239,108,231,41,165,167) then
	'(' + convert(nvarchar,c.max_length) 
	--+ ',' 
	--+ convert(nvarchar,c.precision) 
	--+ ',' 
	--+ convert(nvarchar,c.scale) 
	+ ')'
else '' 
end
+ 
case when c.is_nullable = 1 then '     NULL ,
' else '     NOT NULL ,
' end
from sys.columns c
inner join sys.types t
on c.system_type_id = t.system_type_id
and c.user_type_id = t.user_type_id
where c.object_id = object_id('Ramya') 
order by c.column_id asc

set @sql = SUBSTRING(@sql,1,LEN(@sql)-3) + ' 
   )'

print @sql



/*
select * from sys.types
order by name

select * 
from sys.columns c
inner join sys.types t
on c.system_type_id = t.system_type_id
and c.user_type_id = t.user_type_id
where c.object_id = object_id('Ramya') 
order by c.column_id asc
*/

