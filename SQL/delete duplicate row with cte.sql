drop table #duplicate
create table #Duplicate (
ID INT,
FNAME VARCHAR(10),
MNAME VARCHAR(10)
)

INSERT INTO #Duplicate VALUES(1, 'AAA','CCC')
INSERT INTO #Duplicate VALUES(2, 'BBB','DDD')
INSERT INTO #Duplicate VALUES(1, 'AAA','CCC')
INSERT INTO #Duplicate VALUES(2, 'BBB','DDD')
INSERT INTO #Duplicate VALUES(1, 'AAA','CCC')
INSERT INTO #Duplicate VALUES(2, 'BBB','DDD')
INSERT INTO #Duplicate VALUES(3, 'BCB','DGD') 

-- FOR SQL SERVER 2005 and above
;WITH CTE as(
SELECT ROW_NUMBER() OVER(PARTITION BY ID, FName, MName ORDER BY (SELECT 1)) AS RowID,
*
FROM #Duplicate
)
delete FROM CTE
WHERE RowID <> 1

select * from #Duplicate