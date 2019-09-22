USE Sparta_Global;

--CREATE TABLE CourseName
--(
--CourseID INT IDENTITY PRIMARY KEY,
--CourseName VARCHAR(15)
--)
--INSERT INTO CourseName
--(CourseName)
--VALUES ('BA-Test'), ('Engineering')
--SELECT * FROM CourseName

--CREATE TABLE StartDate
--(
--StartDateID INT IDENTITY PRIMARY KEY,
--StartDate DATETIME
--)

--ALTER TABLE CourseName
--ADD StartDateID INT FOREIGN KEY REFERENCES StartDate(StartDateID)
--INSERT INTO StartDate
--(StartDate)
--VALUES 
--('2018-01-15'), ('2018-01-22')
--ALTER TABLE StartDate ADD CourseID INT FOREIGN KEY REFERENCES CourseName(CourseID)
 --UPDATE CourseName
 --SET StartDateID = 1
 --WHERE CourseID = 1
 --UPDATE CourseName
 --SET StartDateID = 2
 --WHERE CourseID = 2
 --UPDATE StartDate 
 --SET CourseID =1
 --WHERE StartDateID =1
 --UPDATE StartDate 
 --SET CourseID =2
 --WHERE StartDateID =2
 --CREATE TABLE EndDate
 --(EndDateID INT IDENTITY PRIMARY KEY,
 --EndDate DATE)
 --INSERT INTO EndDate
 --(EndDate)
 --VALUES ('2018-03-02'), ('2018-03-03')
 --ALTER TABLE CourseName
 --ADD EndDateID INT
 --ALTER TABLE CourseName
 --ADD CONSTRAINT FK_EndDateID
 --FOREIGN KEY (EndDateID) REFERENCES EndDate(EndDateID)
 --INSERT INTO CourseName
 --(EndDateID)
 --VALUES (1), (2)
 --UPDATE CourseName
 --SET EndDateID = 1
 --WHERE CourseID =1
 --UPDATE CourseName
 --SET EndDateID = 2
 --WHERE CourseID =2
 
 --CREATE TABLE Academy
 --(AcademyID INT IDENTITY PRIMARY KEY,
 --AcademyName VARCHAR(20))
 --INSERT INTO Academy
 --(AcademyName)
 --Values
 --('Richmond')
--ALTER TABLE CourseName
--ADD AcademyID INT
--ALTER TABLE CourseName
--ADD CONSTRAINT FK_AcademyID
--FOREIGN KEY (AcademyID) REFERENCES Academy(AcademyID)

--UPDATE CourseName
--SET AcademyID = 1
--WHERE CourseID = 1 OR CourseID=2

--CREATE TABLE RoomName
--(RoomID INT IDENTITY PRIMARY KEY,
--RoomNumber VARCHAR(15)
--)

--INSERT INTO RoomName
--(RoomNumber)
--VALUES
--('Room 1'), ('Room 3')

--ALTER TABLE CourseName
--ADD RoomID INT

--ALTER TABLE CourseName
--ADD CONSTRAINT FK_RoomID
--FOREIGN KEY (RoomID) REFERENCES RoomName(RoomID)

--UPDATE CourseName
--SET RoomID=1
--WHERE CourseID=1
--UPDATE CourseName
--SET RoomID=2
--WHERE CourseID=2

--CREATE TABLE Trainer
--(TrainerID INT IDENTITY PRIMARY KEY,
--TrainerName VARCHAR(30)
--)

--INSERT INTO Trainer
--(TrainerName)
--VALUES
--('Tim Cawte'),('Richard Gurney')

--ALTER TABLE CourseName
--ADD TrainerID INT 

--ALTER TABLE CourseName
--ADD CONSTRAINT FK_TrainerID
--FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)

--UPDATE CourseName
--SET TrainerID = 1
--WHERE CourseID = 1
--UPDATE CourseName
--SET TrainerID = 2
--WHERE CourseID = 2


--CREATE TABLE Spartans
--(SpartanID INT IDENTITY PRIMARY KEY,
--SpartanName VARCHAR(30))

--INSERT INTO Spartans
--(SpartanName)
--VALUES
--('Adam Smith'),
--('John Williams'),
--('Nick Willis'),
--('Jenny Jones'),
--('Katie Prince'),
--('Peter Brown'),
--('Mo Khan'),
--('Juan Carlos'),
--('Jan Miller'),
--('Kyle Carpenter'),
--('Alvarao Carlos'),
--('Margaret Baker'),
--('Oti Mwase')

--ALTER TABLE Spartans
--ADD CourseID INT 

--UPDATE Spartans
--SET CourseID = 1 WHERE SpartanID = 1
--UPDATE Spartans
--SET CourseID = 1 WHERE SpartanID = 2
--UPDATE Spartans
--SET CourseID = 1 WHERE SpartanID = 3
--UPDATE Spartans
--SET CourseID = 1 WHERE SpartanID = 4
--UPDATE Spartans
--SET CourseID = 1 WHERE SpartanID = 5
--UPDATE Spartans
--SET CourseID = 1 WHERE SpartanID = 6
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 7
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 8
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 9
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 10
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 11
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 12
--UPDATE Spartans
--SET CourseID = 2 WHERE SpartanID = 13

--ALTER TABLE Spartans
--ADD CONSTRAINT FK_CourseID
--FOREIGN KEY (CourseID) REFERENCES CourseName(CourseID)

--INSERT INTO Trainer
--(TrainerName)
--VALUES 
--('Filipe Paiva')

--INSERT INTO Spartans
--(SpartanName, CourseID)
--VALUES 
--('Sam Forrester', 2),
--('David Naim', 2), 
--('Abror Ilkhamov', 2), 
--('Ben Morgan', 2), 
--('Francis Thevipagan', 2), 
--('Jack Wallace', 2), 
--('Jillian Guillen', 2), 
--('Lennox Bampoe-Addo', 2), 
--('Miles Eastwood', 2), 
--('Moustafa Akanmu', 2), 
--('Rory Stokes', 2), 
--('Sharik Gurung', 2), 
--('Vinuzan Ratnasingam', 2), 
--('Vishnu Jeyarathnam', 2)

--INSERT INTO StartDate
--(StartDate)
--VALUES ('2019-09-09')
--INSERT INTO EndDate
--(EndDate)
--VALUES ('2019-11-15')
--INSERT INTO Academy
--(AcademyName)
--VALUES ('London Wall')
--INSERT INTO RoomName
--(RoomNumber)
--VALUES ('Room 2')

--INSERT INTO CourseName
--(CourseName, StartDateID, EndDateID, AcademyID, RoomID, TrainerID)
--VALUES
--('Engineering 42', 3, 3, 2, 3, 5)

--DELETE FROM Spartans 
--WHERE SpartanID >=14

--INSERT INTO Spartans
--(SpartanName, CourseID)
--VALUES 
--('Sam Forrester', 12),
--('David Naim', 12), 
--('Abror Ilkhamov', 12), 
--('Ben Morgan', 12), 
--('Francis Thevipagan', 12), 
--('Jack Wallace', 12), 
--('Jillian Guillen', 12), 
--('Lennox Bampoe-Addo', 12), 
--('Miles Eastwood', 12), 
--('Moustafa Akanmu', 12), 
--('Rory Stokes', 12), 
--('Sharik Gurung', 12), 
--('Vinuzan Ratnasingam', 12), 
--('Vishnu Jeyarathnam', 12)
--Editing the new data so that we can separate new students from older ones, they are on a different course in a new building.
