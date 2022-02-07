/* AdventureWorksLT2008 */
/*
sp_help [saleslt.product]

select max(standardcost) from saleslt.product 
where standardcost < (select max(standardcost) from saleslt.product)
*/

select distinct top 5 standardcost from saleslt.product order by 1 desc

select	* 
from	saleslt.product p
where	1 = (
	select	 count(distinct standardCost) 
	from	saleslt.product p1 
	where	p.StandardCost < P1.StandardCost )

