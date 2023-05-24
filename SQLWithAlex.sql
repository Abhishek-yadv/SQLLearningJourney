-- Table 1 Query:Create EmployeeDemographic table
DROP TABLE IF EXISTS EmployeeDemographics 
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

-- Table 2 Query: Create EmployeeSalary table
DROP TABLE IF EXISTS EmployeeSalary
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)



-- Table 1 Insert:Insert into EmployeeDemographics
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

-- Table 2 Insert: Insert into EmployeeSalary
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)



/****** Script For SelectTopRows command from SSMS ******/
/* Select Statement
* Top, Distinct, Count, As, Max, Min, Avg
*/

SELECT *
FROM EmployeeDemographics


/****** TOP statement ******/
SELECT TOP 5 *
FROM EmployeeDemographics


/****** COUNT CLAUSE ******/
SELECT COUNT(LastName)
FROM EmployeeDemographics


/****** AS CLAUSE ******/
SELECT COUNT(LastName) AS numb_lastname
FROM EmployeeDemographics


/****** MAX CLAUSE ******/
SELECT MAX(Salary) AS max_salary
FROM EmployeeSalary



/****** MIN CLAUSE ******/
SELECT MIN(Salary) AS min_salary
FROM EmployeeSalary



/****** AVG CLAUSE ******/
SELECT AVG(Salary) AS avg_salary
FROM EmployeeSalary


-- WE can specify Database in another way
SELECT *
FROM Bootcamp..EmployeeSalary

--OR
SELECT *
FROM Bootcamp.dbo.EmployeeSalary


/*
WHERE STATEMENT
=, <>, <, >, AND, OR, Like, NULL, NOT NULL, IN
*/

/****** WHERE ******/
SELECT * 
FROM EmployeeDemographics
WHERE FirstName = 'Jim'


/******Does not equal to Jim (<>) ******/
SELECT * 
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'


/******   >  ******/
SELECT *
FROM EmployeeDemographics
WHERE Age > 30


/******  >= ******/
SELECT *
FROM EmployeeDemographics
WHERE Age >=  30


/****** < ******/
SELECT *
FROM EmployeeDemographics
WHERE Age <  30



/******  <= AND ******/
SELECT *
FROM EmployeeDemographics
WHERE Age <= 30 AND Gender = 'Male'


/******  <= OR******/
SELECT *
FROM EmployeeDemographics
WHERE Age <= 30 OR Gender = 'Male'


/****** LIKE CLAUSE ******/
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'


/********/
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%O%'


/********/
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%Ott%'


/********/
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%Ott%c%'


/****** LIKE start With  any specific character or letter ******/
/* Like start with Firstname M */
SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%'


/****** LIKE END with any specific character or letter ******/
/* Like Lastname end with r */
SELECT *
FROM EmployeeDemographics
WHERE LastName Like '%n'


/****** NULL ******/
SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NULL 


/****** NOT NULL ******/
SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL


/****** IN ******/
-- IN is kind like eqaul statement but like multiple equal statement
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim','Michael')



/*
GROUP BY, ORDER BY
*/              
--  the group by statement is similar to distinct in the Select statement and that it's gonna show the unique values in a column .

SELECT DISTINCT(Gender)
FROM EmployeeDemographics
GROUP BY Gender


/******/
SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender


/* Both will show output like
GENDER
Female
Male
*/

/******/
SELECT DISTINCT(Gender),COUNT(Gender) AS Gend_numb
FROM EmployeeDemographics
GROUP BY Gender


/******/
SELECT Gender ,COUNT(Gender) AS Gend_numb
FROM EmployeeDemographics
GROUP BY Gender


/******/      
SELECT Gender,Age ,COUNT(Gender) AS Gend_numb
FROM EmployeeDemographics
GROUP BY Gender-- Column 'EmployeeDemographics.Age' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.


/* SO We must have contained in agrregate function or in group by clause */
SELECT Gender,Age ,COUNT(Gender) AS Gend_numb
FROM EmployeeDemographics
GROUP BY Gender,Age


/******/
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY COUNT(Gender)


/* By Default myslq has Asending order */
/* If we wanna change we can change Descending order */
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY Gender DESC


/******/
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY COUNT(Gender)


/******/
SELECT Gender, COUNT(Gender) AS Gender_count
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender


/******/
SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender


-- OR
SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 ASC


/******/
SELECT *
FROM EmployeeDemographics
ORDER BY 1,2,3,4,5
;




/*************************************/
/****** INTERMEDIATE SQL LEVEL ******/
/***********************************/

/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics

SELECT *
FROM Bootcamp.dbo.EmployeeSalary


/******/
UPDATE Bootcamp..EmployeeDemographics
SET EmployeeID = 1013
WHERE FirstName = 'Darryl'



/******/
INSERT INTO EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)


/****** INNER JOIN  ******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
INNER JOIN Bootcamp.dbo.EmployeeSalary  /* INNER JOIN BY DEFAULT CALLABLE JOIN */
     ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/******  OUTER JOIN   ******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
FULL OUTER JOIN Bootcamp.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/******  LEFT OUTER JOIN  ******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
LEFT OUTER JOIN Bootcamp.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/****** RIGHT OUTER JOIN ******/
SELECT *
FROM Bootcamp..EmployeeDemographics
RIGHT OUTER JOIN Bootcamp..EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID




/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
FULL OUTER JOIN Bootcamp.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/******/
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM Bootcamp..EmployeeDemographics
INNER JOIN Bootcamp..EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/******/
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM Bootcamp..EmployeeDemographics
INNER JOIN Bootcamp..EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC




/******/
SELECT  Jobtitle, AVG(Salary) AS Avg_salary
FROM Bootcamp..EmployeeDemographics
INNER JOIN Bootcamp..EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Jobtitle =  'Salesman'
GROUP BY JobTitle
-- Salesman	52000


/******************************************/
/*****************************************/
/****************************************/
/*** today's Topic: Union, Union All ***/


/*
A join combined both table based on common coloumn

With a union you're actually able to select all the data from both tables and put it into one output where all the data is in in each column and not separate it out .

*/


/* Create Table WareHouseEmployeeDemographics  */
DROP TABLE IF EXISTS WareHouseEmployeeDemographics
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

/* Insert Valuein WareHouseEmployeeDemographics */
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')



/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics

SELECT *
FROM Bootcamp.dbo.WareHouseEmployeeDemographics



/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
FULL OUTER JOIN Bootcamp.dbo.WareHouseEmployeeDemographics
    ON EmployeeDemographics.EmployeeID = 
	 WareHouseEmployeeDemographics.EmployeeID


/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
UNION
SELECT *
FROM Bootcamp.dbo.WareHouseEmployeeDemographics


-- If we want to see all regardless it's duolicate or not
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM Bootcamp.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID


/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics

SELECT *
FROM Bootcamp.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID



/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics

SELECT *
FROM Bootcamp.dbo.EmployeeSalary
ORDER BY EmployeeID


/******/
SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics

SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID


/* It works bcz data type and number of column are same */

/******/
SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID


/***************************************/
/**************************************/
/*** today's Topic: Case Statement ***/
/* it's allow us toSpecify condition and also allow what do we want to return */
SELECT FirstName, LastName, Age
FROM Bootcamp.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY AGE


/******/
SELECT FirstName, LastName, Age,
CASE
    WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'YOUNG'
	ELSE 'Baby'
END
FROM Bootcamp.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


/******/
SELECT FirstName, LastName, Age,
CASE
    WHEN Age > 30 THEN 'OLD'
	WHEN Age =38 THEN 'Stanley'
	ELSE 'Baby'
END
FROM Bootcamp.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

/* WHEN THERE ARE MANY CASES THEN FIRST QUERRY RESILTED FIRST */

/******/
SELECT FirstName, LastName, Age,
CASE
    WHEN Age =38 THEN 'Stanley'
    WHEN Age > 30 THEN 'OLD'
	ELSE 'Baby'
END
FROM Bootcamp.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


/******/
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
JOIN Bootcamp.dbo.EmployeeSalary
   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/************************************/
SELECT FirstName, LastName, JobTitle, Salary,
CASE
    WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)

END AS Salary_after_raise
FROM Bootcamp.dbo.EmployeeDemographics
JOIN Bootcamp.dbo.EmployeeSalary
   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/********************************/
SELECT FirstName, LastName, JobTitle, Salary,
CASE
    WHEN JobTitle = 'Salesman' THEN ROUND(Salary + (Salary * .10), 2)
	WHEN JobTitle = 'Accountant' THEN ROUND(Salary + (Salary * 0.05), 2)
	WHEN JobTitle = 'HR' THEN ROUND(Salary + (Salary * .000001),2)

END AS Salary_after_raise
FROM Bootcamp.dbo.EmployeeDemographics
JOIN Bootcamp.dbo.EmployeeSalary
   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* OVERALL ROUND DOES NOT AFFECTED */
/***********************************/

SELECT FirstName, LastName, JobTitle, Salary,
CASE
    WHEN JobTitle = 'Salesman' THEN Salary + ROUND((Salary * .10),2)
	WHEN JobTitle = 'Accountant' THEN Salary + ROUND((Salary * 0.05),2)
	WHEN JobTitle = 'HR' THEN Salary + ROUND((Salary * .000001),2)

END AS Salary_after_raise
FROM Bootcamp.dbo.EmployeeDemographics
JOIN Bootcamp.dbo.EmployeeSalary
   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/*****************************************/
/****************************************/
/***************************************/
/* Having clause */
SELECT JobTitle, COUNT(JobTitle) AS Job_Title
FROM Bootcamp..EmployeeDemographics
JOIN Bootcamp..EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle

/**************************/
SELECT JobTitle, COUNT(JobTitle) AS Job_Title
FROM Bootcamp..EmployeeDemographics
JOIN Bootcamp..EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE COUNT(JobTitle) > 1
GROUP BY JobTitle

-- An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.
/* We can not use this aggregate function in the where statement we need to have "HAVING" Clause ' */

/**************************/
SELECT JobTitle, COUNT(JobTitle) AS Job_Title
FROM Bootcamp..EmployeeDemographics
JOIN Bootcamp..EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
HAVING COUNT(JobTitle) > 1
GROUP BY JobTitle

/* Incorrect syntax. near the keyword 'GROUP' */
/* The reason giving error bcz This HAVING statement is completaly depend upon GROUP BY statement */
/* because we're performing this after it has been aggregated so this having statement actually needs to go after the group by statement because we can't look at the aggregated information before it's actually aggregated in that group by statement */

SELECT JobTitle, COUNT(JobTitle) AS Job_Title
FROM Bootcamp..EmployeeDemographics
JOIN Bootcamp..EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1


/************************************/
SELECT JobTitle, AVG(Salary) AS avg_salary
FROM Bootcamp..EmployeeDemographics
JOIN Bootcamp..EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AvG(Salary) > 45000
ORDER BY AVG(Salary)


/*********************************************/
/********************************************/
/*******************************************/
/* Updating/Deleting Data */

SELECT *
FROM Bootcamp..EmployeeDemographics


/***** UPDATE *******/
UPDATE Bootcamp..EmployeeDemographics
 SET EmployeeID = 1012
 WHERE FirstName = 'Holly' AND LastName = 'Flax'



/******/
UPDATE Bootcamp..dbo.EmployeeDemographics
SET Age = 31 Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'


/***So even more easy specify what do we want to update If table like have unique key or ID ***/
/******/
UPDATE Bootcamp..dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE EmployeeID = 1012


/*************************/
/******** DELETE ********/
DELETE FROM Bootcamp.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

SELECT *
FROM Bootcamp..EmployeeDemographics

/* Note we have to be very carefull to use  delete statement bcz once we run it we never can not get data back  */
/* So it's good to first specify data before deleting data */
/* Make a select statment */
SELECT *
FROM Bootcamp.dbo.EmployeeDemographics
WHERE EmployeeID = 1004



/**************************************/
/*************************************/
/********** Aliasing*****************/
SELECT FirstName + ' ' + LastName AS FullName
FROM Bootcamp..employeeDemographics


/******/
SELECT AVG(Age) AS AvgAge
FROM Bootcamp..EmployeeDemographics


/******/
SELECT Demo.EmployeeID
FROM Bootcamp..EmployeeDemographics AS Demo



/******/
SELECT Demo.EmployeeID, Sal.Salary
FROM Bootcamp..EmployeeDemographics AS Demo
JOIN Bootcamp..EmployeeSalary AS Sal
    ON Demo.EmployeeID = sal.EmployeeID


/******/
SELECT *
FROM Bootcamp..EmployeeDemographics Demo
LEFT JOIN Bootcamp..EmployeeSalary Sal
ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN Bootcamp..WareHouseEmployeeDemographics AS WARE
ON Demo.EmployeeID = Ware.EmployeeID


/****************************************/
/***************************************/
/********** PARTITION BY **************/

/*
By now partition by is often compared to the group by statement the group by statement is a little bit different the group by statement is going to reduce the number of rows in our output by actually rolling them up and then calculating the sums or averages for each group whereas partition by actually divides the result set into partitions and changes how the window function is calculated
00:25
and so the partition by doesn't actually reduce the number of rows returned in our output

*/

/********/
SELECT *
FROM Bootcamp..EmployeeDemographics

SELECT *
FROM Bootcamp.dbo.EmployeeSalary


/********/
SELECT *
FROM Bootcamp..EmployeeDemographics demo
JOIN Bootcamp.dbo.EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID

/********/
SELECT FirstName, LastName, Gender, Salary,
COUNT(GENDER) OVER (PARTITION BY GENDER) AS TotalGender
FROM Bootcamp..EmployeeDemographics demo
JOIN Bootcamp..EmployeeSalary Sal
    ON demo.EmployeeID = Sal.EmployeeID


/********/
SELECT FirstName, LastName, Gender, Salary, COUNT(GENDER)
FROM Bootcamp..EmployeeDemographics demo
JOIN Bootcamp..EmployeeSalary Sal
    ON demo.EmployeeID = Sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary

/* we are not able to see the output for the aggregate function that we were hoping for if we wanted to get the same output that we had before where we're showing three for females and six for males what we'd have to do is get rid of this first and last name and salary */
SELECT  Gender, COUNT(GENDER)
FROM Bootcamp..EmployeeDemographics demo
JOIN Bootcamp..EmployeeSalary Sal
    ON demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender;


/********************************************/
/*******************************************/
/****************  CTE  *****************/
/* cte is a common table expression and it's a named temporary result set which is used to manipulate the complex sub queries data now this only exists within the scope of the statement */
/* cte is also only created in memory rather than a tempdb file like a temp table */
WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary,
  COUNT(GENDER) OVER (PARTITION BY Gender) AS TotalGender,
  AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM Bootcamp..EmployeeDemographics emp
JOIN Bootcamp..EmployeeSalary Sal
    ON emp.EmployeeID = Sal.EmployeeID
WHERE Salary > '45000'
)

SELECT * 
FROM CTE_Employee


/**********/
WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary,
  COUNT(GENDER) OVER (PARTITION BY Gender) AS TotalGender,
  AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM Bootcamp..EmployeeDemographics emp
JOIN Bootcamp..EmployeeSalary Sal
    ON emp.EmployeeID = Sal.EmployeeID
WHERE Salary > '45000'
)
SELECT FirstName, AvgSalary
FROM CTE_Employee
/* Invalid object name 'CTE_Employee'. each time run querry actually it create CTE again, it's giving error bcz cte is not store somewhere */



/************************************************/
/***********************************************/
/***************** Temp Table *****************/

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #temp_Employee


/********/
INSERT INTO #temp_Employee VALUES(
'1001','HR', '45000'
)

/********/
INSERT INTO #temp_Employee
SELECT *
FROM Bootcamp..EmployeeSalary

SELECT *
FROM #temp_Employee


/*********/
/* DROP TABLE IF EXISTS #Temp_Employee2 */
CREATE TABLE #Temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)


/*********/
INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM Bootcamp..EmployeeDemographics emp
JOIN Bootcamp..EmployeeSalary sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2



/**************************************************************/
/*************************************************************/
/* Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower */
-- DROP TABLE EmployeeErrors;
DROP TABLE IF EXISTS EmployeeErrors
CREATE TABLE EmployeeErrors
(EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)

INSERT INTO EmployeeErrors Values
('1001 ', 'Jimboo', 'Halbert'),
('  1002', 'Pamela', 'Baesely'),
('1005', 'Toby', 'Flenderson - Fired')



/******/
SELECT *
FROM EmployeeErrors

/*** TRIM, RTRIM, LTRIM ***/
SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors


-- USING REPLACE 
SELECT LastName, Replace(LastName, '- Fired',' ') as LastNameFixed
FROM EmployeeErrors


-- Using Substring
SELECT SUBSTRING(FirstName, 1,3)
FROM EmployeeErrors


/******/
-- Using Substring
SELECT SUBSTRING(FirstName, 3,3)
FROM EmployeeErrors



/****** FUZZY MATHING ******/
/*  Let's say one table my name is alex and an another table alexander so we try to join together on based of thier name they would't gonnna join bcz alex and alexandar they are not exact match.
 But if we take substring then they may join */
/* ALEX
*
ALEXANDAR */

SELECT err.FirstName, dem.FirstName
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
     ON err.FirstName = dem.FirstName
-- Toby	Toby


/**************************/
SELECT SUBSTRING (err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
      ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName, 1,3)


/***********/
SELECT err.FirstName, SUBSTRING (err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
      ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName, 1,3)

/*
-- Gender
-- LastName
-- Age
-- DOB
*/


/******/
/**** Upper AND Lower *******/
SELECT FirstName, Lower(FirstName)
FROM EmployeeErrors

/******/
SELECT FirstName, UPPER(FirstName)
FROM EmployeeErrors



/******************************************/
/*****************************************/
/********(Stored Procedure) *************/

/*** stored procedure is a group of sql statements that has been created and then stored in that database
     a stored procedure can accept input parameters

 # a single stored procedure can be used over the network by several different users
 # we can all be using different input data a stored procedure will also reduce network traffic and increase the
   performance 
 # if we modify that stored procedure everyone who uses that stored procedure in the future will also get that update
 */

 CREATE PROCEDURE TEST
 AS
 SELECT *
 FROM EmployeeDemographics

 EXEC TEST



 /*************************/
 /*************************/
 DROP TABLE IF EXISTS #temp_Employee


 CREATE Table #temp_Employee(
 JobTitle varchar(100),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )

 INSERT INTO #temp_Employee
 SELECT JobTitle, COUNT(JobTitle), Avg(Age), AVG(salary)
 FROM Bootcamp..EmployeeDemographics emp
JOIN Bootcamp..EmployeeSalary sal
    ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle


DROP PROCEDURE IF EXISTS Temp_Employee;
CREATE PROCEDURE Temp_Employee
 AS
SELECT *
FROM #temp_Employee


EXEC Temp_Employee



/******/
DROP PROCEDURE IF EXISTS Temp_Employee;
DROP TABLE IF EXISTS #temp_Employee
CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM Bootcamp..EmployeeDemographics emp
JOIN Bootcamp..EmployeeSalary sal
    ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee

EXEC Temp_Employee @JobTitle = 'Salesman'



/********************************************/
/*******************************************/
/************** Subquerries ***************/
/* Subqueries in the select, From, and where statement*/

SELECT *
FROM EmployeeSalary

-- Subquerry in Select
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary


-- Hoe to do it with partition by 
SELECT EmployeeID, Salary,  AVG(Salary) over () AS AllAvgSalary
FROM EmployeeSalary

-- Why Group By doesn't work
SELECT EmployeeID, Salary, AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER By 1,2

-- Subquery in From 
SELECT  a.EmployeeID, AllAvgSalary
FROM (Select EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
       FROM EmployeeSalary) a

/* Subqueries quiet slow compare to #CTE OR #Temp Table don't recomended this method */

-- SubQuery in WHERE 
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
        SELECT EmployeeID
		FROM EmployeeDemographics
		WHERE Age > 30)


/**************************************************/
/*************************************************/




