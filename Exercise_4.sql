USE Sparta_Global_Test;

--4.1
--This completed to the best of my ability in the set-up of the tables

--4.2
ALTER TABLE Trainer 
ADD TrainerType VARCHAR(1) CHECK (TrainerType IN ('T', 'A'))
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
SET EmployeeType = 'S'
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

