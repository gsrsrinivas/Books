/*
SET @variable = column = expression 

sets the variable to the same value as the column. This differs from 

SET @variable = column, column = expression, which sets the variable to 
the pre-update value of the column.
*/

declare @intCounter int
set @intCounter = 0
update Yaks
SET @intCounter = YakSequenceNumber = @intCounter + 1
/*
After running this statement, the field YakSequenceNumber 
will hold nicely incremented values
-----------------------------------------------------------
Ok, this has to be one of the coolest things I've discoverd about SQL Server 
in quite a while. It is a way to create a sequential record number field 
on a table using a single update statement. Until I discovered this, 
I would have said this was impossible. Read on for the solution. 
While digging around in SQL Server recently I discovered something very 
interesting. There is a quote from Books Online for the 
UPDATE statement that says:

SET @variable = column = expression 

sets the variable to the same value as the column. This differs from 

SET @variable = column, column = expression, 

which sets the variable to the pre-update value of the column. This led me to 
believe I might be able to use a single update statement to increment a value 
in a table. Before this trick, if you wanted to create a sequential record number 
you had two bad choices. You could create a cursor and move through the records, 
setting the values one at a time to counter value that you incrememented. 
That was slow and not a set-oriented operation like SQL Server likes.
The second option was to create a temp table with an identity column and a column 
for the primary key of the table you wanted to number. Insert all the records into 
the temp table and the temp table identity column becomes the sequential record 
counter. You can join back to the original table and update the sequential record 
number. The only reason you'd still choose this option is if you want a custom 
sort order. This little trick won't give you that.
This little piece of code will run through a table and sequentially number the 
field you specify. The only drawback is that it will determine the order based 
on the physical order of the table.
*/

declare @intCounter int
set @intCounter = 0
update Yaks
SET @intCounter = YakSequenceNumber = @intCounter + 1

/*
After running this statement, the field YakSequenceNumber 
will hold nicely incremented values.
*/
