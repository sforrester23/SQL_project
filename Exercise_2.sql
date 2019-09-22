--CREATE DATABASE Sparta_Global_Test;
USE Sparta_Global_Test;

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
--Add Engineering42 to the spartans list under Engineering general course

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
('Vishnu Jeyarathnam', 3) --Using CourseID as '12' because that is the autoassigned key given to that course, after I made various mistakes in set up and deleted several other course entries which took up the IDs 3 to 11.
--In re-implementation, this courseID value would likely be '3', not '12'.
--Adding the new Spartan data so that we can separate new Engineering 42 students from older ones, they are on a different course in a new building.

SELECT * FROM CourseName
SELECT * FROM Spartans 
SELECT * FROM Academy
SELECT * FROM RoomName
SELECT * FROM StartDate
SELECT * FROM EndDate
SELECT * FROM Trainer 