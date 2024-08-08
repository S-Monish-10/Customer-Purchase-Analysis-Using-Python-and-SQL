CREATE DATABASE retail_data;
USE retail_data;

CREATE TABLE sales_data(
	InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(10),
    Country VARCHAR(50)
);

SELECT * FROM sales_data;

-- Summary statisstics for numerical columns
SELECT MIN(Quantity) as min_quantity, 
	   MAX(Quantity) as max_quantity, 
       AVG(Quantity) as avg_quantity,
       MIN(UnitPrice) as min_price, 
	   MAX(UnitPrice) as max_price, 
       AVG(UnitPrice) as avg_price
FROM sales_data;

SELECT COUNT(*)
FROM sales_data;

-- Top 10 customers by total spend
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpend
FROM sales_data
GROUP BY CustomerID
ORDER BY TotalSpend DESC
LIMIT 10;


-- Top 10 selling products by quantity
SELECT Description, SUM(Quantity) AS TotalQuantity
FROM sales_data
GROUP BY Description
ORDER BY TotalQuantity DESC
LIMIT 10;

-- Top 10 products generating the most revenue
SELECT Description, SUM(Quantity * UnitPrice) as TotalRevenue
FROM sales_data
GROUP BY Description
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Sales over time
SELECT DATE(InvoiceDate) as Date, SUM(Quantity * UnitPrice) as TotalSales
FROM sales_data
GROUP BY Date
ORDER BY Date;

-- Monthly sales trends
SELECT MONTH(InvoiceDate) as Month, SUM(Quantity * UnitPrice) as MonthlySales
FROM sales_data
GROUP BY Month
ORDER BY MonthlySales DESC;

-- Sales by Country
SELECT Country, SUM(Quantity * UnitPrice) as TotalSales
FROM sales_data
GROUP BY Country
ORDER BY TotalSales DESC;
