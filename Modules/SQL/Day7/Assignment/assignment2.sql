CREATE TABLE Employees1
	(EMPLOYEE_ID INT NOT NULL,
	FIRST_NAME VARCHAR(20) NOT NULL,
	LAST_NAME VARCHAR(20)NOT NULL,
	SALARY DECIMAL(10,0)NOT NULL,
	JOINING_DATE DATETIME NOT NULL,
	DEPARTMENT VARCHAR(15),
	MANAGER_ID INT )
INSERT INTO Employees1(EMPLOYEE_ID, FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT,MANAGER_ID)
VALUES(1,'John','Abraham', 1000000, '2013-JAN-01 12:00:00','Banking',NULL),
(2,'Michael','Clarke',800000,'2013-JAN-01 12:00:00', 'Insurance', 1),
(3,'Roy','Thomas',700000,'2013-FEB-01 12:00:00','Banking',1),
(4,'Tom','Jose',600000,'2013-FEB-01 12:00:00','Insurance',2),
(5,'Jerry','Pinto',650000,'2013-FEB-01 12:00:00','Insurance',3),
(6,'Philip','Mathew',750000,'2013-JAN-01 12:00:00','Servicee',3),
(7,'TestName1','123',650000,'2013-JAN-01 12:00:00','Services',2),
(8,'TestName2','Lname%',600000,'2013-FEB-01 12:00:00','Insurance',2)

SELECT * FROM Employees1

CREATE TABLE INCENTIVES
	( EMPLOYEE_REF_ID INT NOT NULL,
	INCENTIVE_DATE DATETIME NOT NULL,
	INCENTIVE_AMOUNT INT NOT NULL
	)

INSERT INTO INCENTIVES(EMPLOYEE_REF_ID, INCENTIVE_DATE, INCENTIVE_AMOUNT)
VALUES (1,'2013-02-01',5000),
(2,'2013-02-01',3000),
(3,'2013-02-01',4000),
(1,'2013-01-01',4500),
(2,'2013-01-01',3500)

SELECT * FROM INCENTIVES


WITH EMP_CTE(FIRSTNAME, DOJ)
AS
(
SELECT E.FIRST_NAME,I.INCENTIVE_DATE-E.JOINING_DATE FROM Employees1 E JOIN INCENTIVES I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
)
SELECT * FROM EMP_CTE
GO

WITH EMP_CTE(FNAME, AMOUNT)
AS
(
SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT FROM Employees1 E JOIN INCENTIVES I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID WHERE INCENTIVE_AMOUNT>3000
)
SELECT * FROM EMP_CTE
GO

WITH EMP_CTE(FNAME, AMOUNT)
AS
(
SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT FROM Employees1 E LEFT JOIN INCENTIVES I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
)
SELECT * FROM EMP_CTE
GO

WITH EMP_CTE(FNAME, AMOUNT)
AS
(
SELECT E1.FIRST_NAME AS EMPLOYEE_NAME, E2.FIRST_NAME AS MANAGER_NAME FROM Employees1 E1 JOIN Employees1 E2 ON E1.MANAGER_ID=E2.EMPLOYEE_ID
)
SELECT * FROM EMP_CTE
GO


