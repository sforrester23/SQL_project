USE Sparta_Global;

--4.1
--This completed to the best of my ability in the set-up of the tables

----4.2
--ALTER TABLE Trainer 
--ADD TrainerType VARCHAR(1) CHECK (TrainerType IN ('T', 'A'))
--UPDATE Trainer
--SET TrainerType='T'
--WHERE TrainerID=1 OR TrainerID=2 OR TrainerID=5
--ALTER TABLE Spartans
--ADD EmployeeType VARCHAR(1) CHECK (EmployeeType IN ('S','T'))
--UPDATE Spartans
--SET EmployeeType = 'S'
--WHERE SpartanID>0
--ALTER TABLE RoomName
--ADD RoomCapacity INT CHECK (RoomCapacity<=25)
--UPDATE RoomName
--SET RoomCapacity=20
--WHERE RoomID=1
--UPDATE RoomName
--SET RoomCapacity=25
--WHERE RoomID=2
--UPDATE RoomName
--SET RoomCapacity=22
--WHERE RoomID=3
