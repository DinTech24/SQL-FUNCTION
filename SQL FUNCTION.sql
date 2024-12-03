CREATE TABLE Emp (
	EmpID INT PRIMARY KEY
	,Name VARCHAR(50)
	,Country VARCHAR(50)
	,Age INT
	,Salary INT
	);

INSERT INTO Emp (
	EmpID
	,Name
	,Country
	,Age
	,Salary
	)
VALUES (
	1
	,'Shubham'
	,'India'
	,'23'
	,'30000'
	)
	,(
	2
	,'Aman '
	,'Australia'
	,'21'
	,'45000'
	)
	,(
	3
	,'Naveen'
	,'Sri lanka'
	,'24'
	,'40000'
	)
	,(
	4
	,'Aditya'
	,'Austria'
	,'21'
	,'35000'
	)
	,(
	5
	,'Nishant'
	,'Spain'
	,'22'
	,'25000'
	);

SELECT *
FROM Emp;

--- User Defined Function
CREATE FUNCTION dbo.getEmpNewFunc (@Age INT)
RETURNS VARCHAR(20)
AS
BEGIN
	RETURN (
			SELECT Name AS Name
			FROM Emp
			WHERE Age = @age
			)
END

SELECT dbo.getEmpNewFunc(23)

---Stored Procedure
CREATE PROCEDURE getAgeProcedure @age INT
AS
BEGIN
	SELECT *
	FROM Emp
	WHERE Age = @age
END

EXEC getAgeProcedure @age = 23;

---Trigger
CREATE TRIGGER getEmptrigger ON Emp
AFTER UPDATE
AS
BEGIN
	UPDATE Emp
	SET Age = Age + 10
END

SELECT *
FROM Emp

UPDATE Emp
SET Age = Age + 2

---curser
DECLARE getCursor CURSOR
FOR
SELECT *
FROM Emp;

OPEN getCursor;

FETCH NEXT
FROM getCursor
