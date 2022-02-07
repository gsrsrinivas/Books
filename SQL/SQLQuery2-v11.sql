DECLARE @StartDate DateTime
DECLARE @EndDate DateTime
DECLARE @Amount Decimal(6,3)
SET @StartDate = '2009-09-22'
SET @EndDate = '2010-07-13'
SET @Amount = 395.80
SELECT @Amount * (POWER(1.1500, CONVERT(NUMERIC(8,3), DATEDIFF(d, @StartDate, @EndDate)/365.25))) - @Amount as TotalInterest


