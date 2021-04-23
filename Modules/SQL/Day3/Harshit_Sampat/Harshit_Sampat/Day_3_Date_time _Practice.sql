Use AdventureWorks2012

--DATETIME FUNCTION
--1
SELECT DATEADD(mm,3,'2009-01-01')As 'Date And Time'

--2
SELECT DATENAME	(MONTH, CONVERT(DATETIME,'2005-06--06'))AS DATE

--3
SELECT GETDATE()AS DATE

--4
SELECT MONTH('2009-01-07')

--5
SELECT DAY('2009-01-07')

--6
SELECT YEAR('2009-01-07')

--PPT Examples --7--

SELECT NationalIDNumber,DATENAME(MM,hiredate) + ','+CONVERT(VARCHAR, DATEPART(YYYY,hiredate)) as 'Joining' from HumanResources.Employee

--PPT ex 2
SELECT DATENAME(MM,GETDATE())+SPACE(1) +CAST(DATEPART(dd,GETDATE()) AS VARCHAR) + ','+CAST(DATEPART(YYYY,GETDATE()) AS VARCHAR) 
		
--PPT 3--
SELECT	Birthdate,hiredate
from HumanResources.Employee
WHERE HireDate>= '1987-06-01' AND HireDate <='1987-07-30'

--PPT 4
SELECT HireDate,Gender, DATEDIFF(YEAR,HireDate,GETDATE()) [EXPERINCE] FROM HumanResources.Employee