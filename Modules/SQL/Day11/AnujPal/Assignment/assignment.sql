/*  1)  Create a Store Procedure which will accept name of the customer as input parameter and product the following output, 
List Names of Customers who are Depositors and have Same Branch City as that of input parameter customerís Name.*/


	CREATE PROCEDURE p1 @Cname VARCHAR(50)
	AS

	SELECT Cname FROM DepositTable d JOIN BranchTable b ON (d.BranchName=b.BranchName)  
	WHERE b.City=(SELECT b.City  FROM 
	DepositTable d JOIN BranchTable b ON (d.BranchName=b.BranchName) WHERE Cname =@Cname ) 

	EXEC p1 'Anil'

/*  2)  Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format,
		All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account*/


		SELECT * FROM DepositTable

/*  3)  Create a Store Procedure that will accept city name and returns the number of customers in that city.*/


	CREATE PROCEDURE p3 @CityName VARCHAR(30)
	AS
	SELECT City,COUNT(d.Cname) NoOfCustomers FROM BranchTable b JOIN  DepositTable d  ON (d.BranchName=b.BranchName)
	WHERE b.City=@CityName GROUP BY b.City 

	EXEC p3 'Delhi'  

/*  4)  Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format 
	List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI*/

	ALTER PROCEDURE p4 @LivingCityName VARCHAR(30)
	AS
	SELECT Cname FROM  CustomerTable WHERE
	Cname IN ( SELECT c.Cname FROM DepositTable d join BranchTable b 
	ON(b.BranchName = d.BranchName) JOIN CustomerTable c ON(c.Cname = d.Cname) 
	WHERE b.City IN ('MUMBAI','DELHI') AND c.City = @LivingCityName) FOR JSON PATH

	EXEC p4'Mumbai'  

/*  5)  Count the Number of Customers Living in the City where Branch is Located*/

	CREATE PROCEDURE p5
	AS
	SELECT COUNT(C.Cname) BranchLocatedInHomeTown FROM  
	BranchTable b JOIN  DepositTable d  ON (d.BranchName=b.BranchName) 
	JOIN CustomerTable c ON (c.Cname = d.Cname) WHERE c.City = b.City

	EXEC p5


/*	6)	Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
		And insert these record in the Deposit table. Before inserting some validation should be done like 
		amount should be greater than 10Rs. and date should always be current date.*/

	ALTER PROCEDURE p6  @json NVARCHAR(MAX)
		AS
		BEGIN
		DECLARE @ACTNO INT,@CustomerName VARCHAR(40),@BranchaName VARCHAR(60),@Amount INT,@Adate DATE;
		SELECT * FROM OPENJSON(@JSON)
		WITH(ACTNO INT '$.ACTNO',
		CustomerName VARCHAR(40)  '$.CustomerName',
		BranchName VARCHAR(40)  '$.BranchName',
		Amount INT  '$.Amount',
		Adate DATE  '$.Adate')

		INSERT INTO Deposit1 VALUES(@ACTNO,@CustomerName,@BranchaName,@Amount,@Adate)
		END

		DECLARE @json NVARCHAR(MAX)
		SET @json = '[{"ACTNO" : "101",
					  "CustomerName": "ANUJ",
					  "BranchName" : " VATVA I.E.",
					  "Amount" : "5000",
						"Adate"	: "06-03-1998"}]'
		EXEC p6 @json





