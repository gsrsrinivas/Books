CREATE TABLE DuplicateRcordTable (Col1 INT, Col2 INT)
INSERT INTO DuplicateRcordTable
SELECT 1, 1
UNION ALL
SELECT 1, 1 --duplicate
UNION ALL
SELECT 1, 1 --duplicate
UNION ALL
SELECT 1, 2
UNION ALL
SELECT 1, 2 --duplicate
UNION ALL
SELECT 1, 3
UNION ALL
SELECT 1, 4
GO 

/* It should give you 7 rows */
SELECT *
FROM DuplicateRcordTable
GO

/* Delete Duplicate records */
WITH CTE (COl1,Col2, DuplicateCount)
AS
(
SELECT COl1,Col2,
ROW_NUMBER() OVER(PARTITION BY COl1,Col2 ORDER BY Col1) AS DuplicateCount
FROM DuplicateRcordTable
)
select * --DELETE
FROM CTE
WHERE DuplicateCount > 1
GO 
