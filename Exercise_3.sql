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
