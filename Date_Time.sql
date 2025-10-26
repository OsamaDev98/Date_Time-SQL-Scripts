USE SalesDB;

-- DAY, MONTH, YEAR
SELECT
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime,
	YEAR(CreationTime) AS Year,
	MONTH(CreationTime) AS MONTH,
	DAY(CreationTime) AS DAY
FROM
	Sales.Orders;

-- DATEPART
SELECT
	OrderID,
	CreationTime,
	DATEPART(QUARTER, CreationTime) AS QuarterPart,
	DATEPART(WEEK, CreationTime) AS WeekPart,
	DATEPART(WEEKDAY, CreationTime) AS WeekdayPart,
	DATEPART(HOUR, CreationTime) AS HoursPart
FROM
	Sales.Orders;

-- DATENAME
SELECT
	OrderID,
	CreationTime,
	DATENAME(QUARTER, CreationTime) AS QuarterPart,
	DATENAME(MONTH, CreationTime) AS MonthPart,
	DATENAME(WEEK, CreationTime) AS WeekPart,
	DATENAME(WEEKDAY, CreationTime) AS WeekdayPart,
	DATENAME(HOUR, CreationTime) AS HoursPart
FROM
	Sales.Orders;

-- DATETRUNC
SELECT
	OrderID,
	CreationTime,
	DATETRUNC(YEAR, CreationTime) AS YearPart,
	DATETRUNC(MONTH, CreationTime) AS MonthPart,
	DATETRUNC(HOUR, CreationTime) AS HoursPart
FROM
	Sales.Orders;

-- EOMONTH
SELECT
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS MonthPart
FROM
	Sales.Orders;

-- How many orders were placed each year?
SELECT
	YEAR(CreationTime) AS YEAR,
	COUNT(*) AS NoOfOrders
FROM
	Sales.Orders
GROUP BY
	YEAR(CreationTime);

-- How many orders were placed each month?
SELECT
	DATENAME(month, CreationTime) AS Month,
	COUNT(*) AS NoOfOrders
FROM
	Sales.Orders
GROUP BY
	DATENAME(month, CreationTime);

-- Show all orders that were placed during the month of february.
SELECT
	*
FROM
	Sales.Orders
WHERE
	MONTH(OrderDate) = 2;

-- FORAMT
SELECT
	OrderID,
	FORMAT(CreationTime, 'dd') dd,
	FORMAT(CreationTime, 'MMM') MMM,
	FORMAT(CreationTime, 'yyyy') yyyy,
	FORMAT(CreationTime, 'MM-dd-yyyy') MMddyyyy
FROM
	Sales.Orders;
/*
	Show creationTime using the following format:
	DAY Wed Jan Q1 2025 12:34:56 PM	
*/
SELECT
	OrderID,
	CreationTime,
	'Day ' +
	FORMAT(CreationTime, 'ddd MMM ') +
	'Q' +
	DATENAME(QUARTER, CreationTime) +
	FORMAT(CreationTime, ' yyyy hh:mm:ss tt')
	AS CustomDate
FROM
	Sales.Orders;




