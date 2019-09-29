-- EXERCISE 1
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

-- EXERCISE 2
CREATE DATABASE Sparta_Global_Test;

USE Sparta_Global_Test;

--2.1
--Executed on a piece of paper - visualisation of how tables link together.

--2.2
CREATE TABLE CourseName 
--Creates the CourseName Table
(
CourseID INT IDENTITY PRIMARY KEY, --Sets primary key (PK) on CourseID and the data type
CourseName VARCHAR(15) --Course name column and data time
)
INSERT INTO CourseName
(CourseName)
VALUES ('BA-Test'), ('Engineering') 
--Inserts the values of the data 


CREATE TABLE StartDate
(
StartDateID INT IDENTITY PRIMARY KEY, 
StartDate DATE
)
--More table building and data type setting including PK

ALTER TABLE CourseName
ADD StartDateID INT FOREIGN KEY REFERENCES StartDate(StartDateID) 
--Adding a column as a foreign key (FK) in CourseName to designate the link between the tables
INSERT INTO StartDate
(StartDate)
VALUES 
('2018-01-15'), ('2018-01-22') 
--Input values

UPDATE CourseName
SET StartDateID = 1
WHERE CourseID = 1
UPDATE CourseName
SET StartDateID = 2
WHERE CourseID = 2 
--Input values for StartDateID in CourseName table, for linking FK
 
CREATE TABLE EndDate
(EndDateID INT IDENTITY PRIMARY KEY,
EndDate DATE)
INSERT INTO EndDate
(EndDate)
VALUES ('2018-03-02'), ('2018-03-03')
--Create Table for end date with PK, data types and values

ALTER TABLE CourseName
ADD EndDateID INT
ALTER TABLE CourseName
ADD CONSTRAINT FK_EndDateID
FOREIGN KEY (EndDateID) REFERENCES EndDate(EndDateID)
--Add column in CourseName for FK EndDateID and set data types

UPDATE CourseName
SET EndDateID = 1
WHERE CourseID =1
UPDATE CourseName
SET EndDateID = 2
WHERE CourseID =2
--Add the FK values in CourseName
 
CREATE TABLE Academy
(AcademyID INT IDENTITY PRIMARY KEY,
AcademyName VARCHAR(20))
INSERT INTO Academy
(AcademyName)
Values
('Richmond')
ALTER TABLE CourseName
ADD AcademyID INT
ALTER TABLE CourseName
ADD CONSTRAINT FK_AcademyID
FOREIGN KEY (AcademyID) REFERENCES Academy(AcademyID)
--Creates table for Academy and adds the only value for Richmond.
--Adds a FK for CourseName to refer to this table.

UPDATE CourseName
SET AcademyID = 1
WHERE CourseID = 1 OR CourseID=2
--Input Values for FK in CourseName

CREATE TABLE RoomName
(RoomID INT IDENTITY PRIMARY KEY,
RoomNumber VARCHAR(15)
)
--Set up table for Rooms with PK

INSERT INTO RoomName
(RoomNumber)
VALUES
('Room 1'), ('Room 3')
--Input values

ALTER TABLE CourseName
ADD RoomID INT
--Adds column for roomID

ALTER TABLE CourseName
ADD CONSTRAINT FK_RoomID
FOREIGN KEY (RoomID) REFERENCES RoomName(RoomID)
--Set up FK for CourseName and Rooms

UPDATE CourseName
SET RoomID=1
WHERE CourseID=1
UPDATE CourseName
SET RoomID=2
WHERE CourseID=2
--Input the values for the FK in CourseName

CREATE TABLE Trainer
(TrainerID INT IDENTITY PRIMARY KEY,
TrainerName VARCHAR(30)
)
--Create table for trainers with PK

INSERT INTO Trainer
(TrainerName)
VALUES
('Tim Cawte'),('Richard Gurney')
--Input Values

ALTER TABLE CourseName
ADD TrainerID INT 
--Add column for trainer in Coursename

ALTER TABLE CourseName
ADD CONSTRAINT FK_TrainerID
FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
--Give it a FK

UPDATE CourseName
SET TrainerID = 1
WHERE CourseID = 1
UPDATE CourseName
SET TrainerID = 2
WHERE CourseID = 2
--Values

CREATE TABLE Spartans
(SpartanID INT IDENTITY PRIMARY KEY,
SpartanName VARCHAR(30))
--Table for spartans

INSERT INTO Spartans
(SpartanName)
VALUES
('Adam Smith'),
('John Williams'),
('Nick Willis'),
('Jenny Jones'),
('Katie Prince'),
('Peter Brown'),
('Mo Khan'),
('Juan Carlos'),
('Jan Miller'),
('Kyle Carpenter'),
('Alvarao Carlos'),
('Margaret Baker'),
('Oti Mwase')
--Values

ALTER TABLE Spartans
ADD CourseID INT 
--Add column for Course ID in spartans

UPDATE Spartans
SET CourseID = 1 WHERE SpartanID = 1
UPDATE Spartans
SET CourseID = 1 WHERE SpartanID = 2
UPDATE Spartans
SET CourseID = 1 WHERE SpartanID = 3
UPDATE Spartans
SET CourseID = 1 WHERE SpartanID = 4
UPDATE Spartans
SET CourseID = 1 WHERE SpartanID = 5
UPDATE Spartans
SET CourseID = 1 WHERE SpartanID = 6
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 7
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 8
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 9
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 10
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 11
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 12
UPDATE Spartans
SET CourseID = 2 WHERE SpartanID = 13
--Add values for spartans courses. Realised I could've done this with a WHERE SpartanID >/< number next time.

ALTER TABLE Spartans
ADD CONSTRAINT FK_CourseID
FOREIGN KEY (CourseID) REFERENCES CourseName(CourseID)
--Give it a FK

--2.3
INSERT INTO Trainer
(TrainerName)
VALUES 
('Filipe Paiva')
--Add Filipe to the trainer list

INSERT INTO Spartans
(SpartanName, CourseID)
VALUES 
('Sam Forrester', 2),
('David Naim', 2), 
('Abror Ilkhamov', 2), 
('Ben Morgan', 2), 
('Francis Thevipagan', 2), 
('Jack Wallace', 2), 
('Jillian Guillen', 2), 
('Lennox Bampoe-Addo', 2), 
('Miles Eastwood', 2), 
('Moustafa Akanmu', 2), 
('Rory Stokes', 2), 
('Sharik Gurung', 2), 
('Vinuzan Ratnasingam', 2), 
('Vishnu Jeyarathnam', 2)
--Add Engineering42 to the spartans list under Engineering general course, CourseID=2.

INSERT INTO StartDate
(StartDate)
VALUES ('2019-09-09')
INSERT INTO EndDate
(EndDate)
VALUES ('2019-11-15')
INSERT INTO Academy
(AcademyName)
VALUES ('London Wall')
INSERT INTO RoomName
(RoomNumber)
VALUES ('Room 2')
--Add miscellaneous values for the Engineering 42 course in support tables

INSERT INTO CourseName
(CourseName, StartDateID, EndDateID, AcademyID, RoomID, TrainerID)
VALUES
('Engineering 42', 3, 3, 2, 3, 3) 
--Add miscellaneous values for the Engineering 42 course in Course table
--We now have a course with its own ID called explicitly 'Engineering 42'
 
DELETE FROM Spartans 
WHERE SpartanID >=14 --Delete the old spartans Data (I realise now I should have used 'UPDATE' to change, rather than delete and re-add).

INSERT INTO Spartans
(SpartanName, CourseID)
VALUES 
('Sam Forrester', 3),
('David Naim', 3), 
('Abror Ilkhamov', 3), 
('Ben Morgan', 3), 
('Francis Thevipagan', 3), 
('Jack Wallace', 3), 
('Jillian Guillen', 3), 
('Lennox Bampoe-Addo', 3), 
('Miles Eastwood', 3), 
('Moustafa Akanmu', 3), 
('Rory Stokes', 3), 
('Sharik Gurung', 3), 
('Vinuzan Ratnasingam', 3), 
('Vishnu Jeyarathnam', 3) --Using CourseID as '3' because that is the autoassigned key given to that course, after I made various mistakes in trial and set up, deleted several other course entries which took up the other IDs...
--In re-implementation, this courseID value could possibly be a different value, if mistakes were made somewhere down the line.
--Adding the new Spartan data so that we can separate new Engineering 42 students from older ones, they are on a different course in a new building.
 
 -- EXERCISE 3
USE Sparta_Global_Test;

--3.1
SELECT CourseName AS 'Course Name', 
StartDate AS 'Start Date', 
EndDate AS 'End Date', 
AcademyName AS 'Academy Name', 
RoomNumber AS 'Room Name', 
TrainerName AS 'Trainer', 
SpartanName AS 'Spartan' 
--Add the relevant columns to re-create the table 
FROM CourseName CN
JOIN StartDate SD ON CN.StartDateID=SD.StartDateID
JOIN EndDate ED ON CN.EndDateID=ED.EndDateID
JOIN Academy A ON CN.AcademyID=A.AcademyID
JOIN RoomName RN ON RN.RoomID=CN.RoomID
JOIN Trainer T ON T.TrainerID=CN.TrainerID
JOIN Spartans S ON S.CourseID=CN.CourseID
--Join them all together
WHERE CourseName != 'Engineering 42' 
--This excludes all of the new data added about class of engineering 42 that was added in EX2.3, it needs to be excluded or it won't look the same as the exercise

--3.2
SELECT CourseName AS 'Course Name', 
StartDate AS 'Start Date', 
EndDate AS 'End Date', 
AcademyName AS 'Academy Name', 
RoomNumber AS 'Room Name', 
TrainerName AS 'Trainer', 
SUBSTRING(SpartanName, 1, 1) + ' ' + SUBSTRING(SpartanName, CHARINDEX(' ',SpartanName)+1, 1) AS 'Spartan Initials'
--Selecting the relevant data, mostly the same as before.
--The Final column is a way of extracting initials from the SpartanName column. 
--It uses CHARINDEX to locate the position of the space, then only outputs the letter after it, using SUBSTRING, for the second intial.
--It would have been easier to set up two columns of First and Last name in the original data, but I fancied this method better rather than going back and altering the tables.
FROM CourseName CN
JOIN StartDate SD ON CN.StartDateID=SD.StartDateID
JOIN EndDate ED ON CN.EndDateID=ED.EndDateID
JOIN Academy A ON CN.AcademyID=A.AcademyID
JOIN RoomName RN ON RN.RoomID=CN.RoomID
JOIN Trainer T ON T.TrainerID=CN.TrainerID
JOIN Spartans S ON S.CourseID=CN.CourseID 
--Join all the tables together.
WHERE CourseName != 'Engineering 42' --this excludes all of the new data added about class of engineering 42 that is unwanted.

--3.3
SELECT CourseName AS 'Course Name',
StartDate AS 'Start Date',
EndDate AS 'End Date', 
CASE 
--Case added to define a new column that will contain a check for the end date
WHEN CN.CourseID=1 THEN DATEADD(dd, 56, StartDate) 
--For Business courses (CourseID=1), add 7 weeks, i.e. 56 days, to the date, put it in another column to check
ELSE DATEADD(dd, 84, StartDate) 
--For all other courses, add 12 weeks for the column that checks
END AS 'Check Date',
--Call the column 'Check Date'
AcademyName AS 'Academy Name', 
RoomNumber AS 'Room Name', 
TrainerName AS 'Trainer', 
SpartanName AS 'Spartan Name'
FROM CourseName CN
JOIN StartDate SD ON CN.StartDateID=SD.StartDateID
JOIN EndDate ED ON CN.EndDateID=ED.EndDateID
JOIN Academy A ON CN.AcademyID=A.AcademyID
JOIN RoomName RN ON RN.RoomID=CN.RoomID
JOIN Trainer T ON T.TrainerID=CN.TrainerID
JOIN Spartans S ON S.CourseID=CN.CourseID
--Join all the tables together.
WHERE CourseName != 'Engineering 42' 
--this excludes all of the new data added about class of engineering 42 that is not wanted.

-- EXERCISE 4
USE Sparta_Global_Test;

--4.1
--This completed to the best of my ability in the set-up of the tables

--4.2
ALTER TABLE Trainer 
ADD TrainerType VARCHAR(1) CHECK (TrainerType IN ('T','A'))
--Add a new column for trainer type and make it so it can only be valued as T or A for Trainer or Assisstant.

UPDATE Trainer
SET TrainerType='T'
WHERE TrainerID=1 OR TrainerID=2 OR TrainerID=3 --Should have used TrainerID>0
--Add the value 'T' for trainer type to all 3 trainers in the table

ALTER TABLE Spartans
ADD EmployeeType VARCHAR(1) CHECK (EmployeeType IN ('S','T'))
--Add a column for Spartans employee type, it can either be S for Spartan, or T for Trainer. 
--This list is not necessarily practical unless other data points are added that are non-spartans.

UPDATE Spartans
SET EmployeeType='S'
WHERE SpartanID>0
--Set all spartans to have employee type 'S'.

ALTER TABLE RoomName
ADD RoomCapacity INT CHECK (RoomCapacity<=25)
--Add a column for rooms capacity in the rooms table and make it so that it cannot be greater than 25.

UPDATE RoomName
SET RoomCapacity=20
WHERE RoomID=1

UPDATE RoomName
SET RoomCapacity=25
WHERE RoomID=2

UPDATE RoomName
SET RoomCapacity=22
WHERE RoomID=3
--Add some room capacities for each room.

