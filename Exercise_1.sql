USE Northwind;

--1.1
SELECT CustomerID, CompanyName, Address, City, Region, PostalCode, Country
FROM Customers
WHERE City='Paris' OR City='London' 
--Outputs only customers in Paris or London

--1.2
SELECT ProductName 
FROM Products
WHERE QuantityPerUnit LIKE '%bottles%' 
--Outputs only products sold in bottles

--1.3
SELECT ProductName, CompanyName AS 'Supplier Name', Country 
--Include extra column names
FROM Products P
--Join table to suppliers to get the extra information
JOIN Suppliers S 
ON S.SupplierID=P.SupplierID --What column do the two tables have in common?
WHERE QuantityPerUnit LIKE '%bottles%'

--1.4 
SELECT C.CategoryName, 
COUNT(C.CategoryID) /*Count how many category ID's we have. These are unique so its the most effective way to do it.*/ AS 'How many in category'
FROM Categories C
JOIN Products P 
--Join to products to get the product information
ON P.CategoryID=C.CategoryID 
--Which column do they have in common?
GROUP BY CategoryName 
--Group the information by category, so that each category only appears once and we can use the aggregated function "Count"
ORDER BY 'How many in category' DESC; 
--Order them by the most to least in each category

--1.5
SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Employee Name', 
--Show The Employees' names combined with their title. This uses concatenation.
City AS 'City of Residence'
FROM Employees 

--1.6
SELECT RegionDescription AS 'Region Description', ROUND(SUM(UnitPrice*Quantity*(1-Discount)),2) AS 'Total Sales (Including Discount)' 
--Show the territory and sum their total sales = unit price * quantity, less any discount. Make sure to round this figure to two decimal places.
FROM [Order Details] OD
JOIN Orders O
ON OD.OrderID=O.OrderID
JOIN EmployeeTerritories ET		 
ON ET.EmployeeID=O.EmployeeID
JOIN Territories T 
ON T.TerritoryID=ET.TerritoryID
JOIN Region R 
ON R.RegionID=T.RegionID
--Four-fold join to connect the territory information with the order details (and hence the information on sales of products)
GROUP BY RegionDescription 
--Grouping by the Region name 
HAVING ROUND(SUM(UnitPrice * Quantity*(1-Discount)),2) > 1000000 
--Only show entries with a total sales of over 1,000,000

--1.7
SELECT COUNT(Distinct OrderID) AS 'How many Orders' 
--Count only order IDs 
FROM Orders 
WHERE Freight>100 
--With freight bigger than 100 
AND ShipCountry IN ('USA','UK');
--and in USA or UK

--1.8
SELECT TOP 1 OD.OrderID, ROUND(MAX((UnitPrice*Quantity)*(1-Discount)),2) AS 'Maximum Discount Applied' 
--Select the order ID and find the maximum cost of all the different orders. 
FROM [Order Details] OD
GROUP BY OD.OrderID 
--Group each order so it only shows each order ID once
ORDER BY MAX((UnitPrice*Quantity)*(1-Discount)) DESC 
--Order the results by each group's maximum. Combined with "TOP 1" in the select part of the query and we can only show one results, the highest maximum.

