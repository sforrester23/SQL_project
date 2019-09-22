USE Northwind;

--1.1
--SELECT CustomerID, CompanyName, Address, City, Region, PostalCode, Country
--FROM Customers
--WHERE City = 'Paris' OR City = 'London'

--1.2
--SELECT ProductName 
--FROM Products
--WHERE QuantityPerUnit LIKE '%bottles%'

--1.3
--SELECT ProductName, CompanyName, Country
--FROM Products P
--JOIN Suppliers S
--ON S.SupplierID=P.SupplierID
--WHERE QuantityPerUnit LIKE '%bottles%'

--1.4 
--SELECT C.CategoryName, COUNT(C.CategoryID) AS 'How many in category'
--FROM Categories C
--JOIN Products P
--ON P.CategoryID=C.CategoryID
--GROUP BY CategoryName
--ORDER BY 'How many in category' DESC;

--1.5
--SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Category Name', City AS 'City of Residence'
--FROM Employees 

--1.6
--SELECT TerritoryDescription, ROUND(SUM(UnitPrice * Quantity), 2) 
--FROM [Order Details]
--JOIN Orders O			 
--ON [Order Details].OrderID=O.OrderID
--JOIN Region R			 
--ON R.RegionID=O.ShipVia	 
--JOIN Territories T
--ON T.RegionID=R.RegionID
--GROUP BY TerritoryDescription
--HAVING SUM(UnitPrice * Quantity) > 1000000.00

--1.7
--SELECT COUNT(Distinct OrderID) 
--FROM Orders 
--WHERE Freight > 100.00 
--AND ShipCountry IN ('USA', 'UK')

----1.8
--SELECT TOP 1 O.OrderID, ROUND(MAX((UnitPrice * Quantity)*(1-Discount)),2) AS 'Discount Applied'
--FROM Orders O
--JOIN [Order Details] OD
--ON O.OrderID = OD.OrderID
--GROUP BY O.OrderID
--ORDER BY MAX((UnitPrice * Quantity)*(1-Discount)) DESC

