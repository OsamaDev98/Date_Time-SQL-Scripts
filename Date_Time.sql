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

-- CONVERT
SELECT
	CONVERT(INT, '123') AS [String to Int],
	CreationTime,
	CONVERT(DATE, CreationTime) AS Date
FROM
	Sales.Orders;

-- CAST
SELECT
	CAST('123' AS INT) AS [String to Int],
	CAST('2025-08-20' AS DATE) AS [String to Date],
	CreationTime,
	CAST(CreationTime AS DATE)
from
	Sales.Orders;

--DATEADD
SELECT
	OrderID,
	OrderDate,
	DATEADD(YEAR, 2, OrderDate),
	DATEADD(MONTH, 5, OrderDate),
	DATEADD(DAY, -10, OrderDate)
FROM
	Sales.Orders;

--DATEDIFF
-- Calculate the age of employees.
SELECT
	EmployeeID,
	BirthDate,
	DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM
	Sales.Employees;

-- Find the average shipping duration in days for each month.
SELECT
	DATENAME(MONTH, OrderDate) AS Month,
	AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS AVG
FROM
	Sales.Orders
GROUP BY
	DATENAME(MONTH, OrderDate);

-- Time gap analysis.
-- Find the number of days between each order and previous order.
SELECT
	OrderID,
	OrderDate AS CurrentOrder,
	LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrder,
	DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate)
FROM
	Sales.Orders;

-- ISDATE
SELECT
	ISDATE('123') DATECHECK1,
	ISDATE('2025-08-20') DATECHECK2, -- Only International Standard (SQL Server)
	ISDATE('20-08-2025') DATECHECK3,
	ISDATE('2025') DATECHECK4,
	ISDATE('08') DATECHECK5
