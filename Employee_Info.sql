drop database project;
CREATE DATABASE project;
use project;

CREATE TABLE Worker_Info(
Worker_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
First_Name VARCHAR(255),
Last_Name VARCHAR(255),
Salary BIGINT(20),
DateOfJoining DATETIME,
Department CHAR(25)

);

INSERT INTO Worker_Info (Worker_Id, First_Name, Last_Name, Salary, DateOfJoining, Department) VALUES
(001,'Monika', 'Arora', '100000', '2014-02-20 09:00:00', 'HR'),
(002,'Niharika', 'Verma', '80000', '2014-06-11 09:00:00', 'Admin'),
(003,'Vishal', 'Singhal', '300000', '2014-02-20 09:00:00', 'HR'),
(004,'Amitabh', 'Singh', '500000', '2014-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', '500000', '2014-06-11 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', '200000', '2014-06-11 09:00:00', 'Account'),
(007,'Satish', 'Kumar', '75000', '2014-01-20 09:00:00', 'Account'),
(008,'Geetika', 'Chauhan', '90000', '2014-04-11 09:00:00', 'Admin'); 

select * from Worker_Info;

CREATE TABLE Bonus(
Worker_Ref_Id INT,
Bonus_Date DATETIME,
Bonus_Amount BIGINT(15),
FOREIGN KEY(Worker_Ref_Id)
REFERENCES Worker_Info(Worker_Id)
ON DELETE CASCADE
);

INSERT INTO Bonus (Worker_Ref_Id, Bonus_Date, Bonus_Amount) VALUES
(1, '2016-02-20 00:00:00', '5000'),
(2, '2016-06-11 00:00:00', '3000'),
(3, '2016-02-20 00:00:00', '4000'),
(1,'2016-02-20 00:00:00', '4500'),
(2, '2016-06-11 00:00:00', '3500');


select * from Bonus;


CREATE TABLE Title(
Worker_Ref_Id INT,
Worker_Title VARCHAR(50),
Affected_From DATETIME,
FOREIGN KEY (Worker_Ref_Id)
REFERENCES Worker_Info(Worker_Id)
ON DELETE CASCADE
);



INSERT INTO Title(Worker_Ref_Id, Worker_Title, Affected_From) VALUES
(1,'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5,'Manager', '2016-06-11 00:00:00'),
(4, 'Asst.Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

select * from Title;

# Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT First_Name AS WORKER_NAME FROM Worker_Info ;

# Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(First_Name) FROM Worker_Info;

# Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT Department FROM Worker_Info;

# Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table
SELECT SUBSTRING(First_Name,1,3) FROM Worker_Info;

# Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table
SELECT INSTR(First_Name, BINARY"a") FROM Worker_Info WHERE First_Name = "Amitabh";

# Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(First_Name) FROM Worker_Info;

# Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(First_Name) FROM Worker_Info;

# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT(LENGTH (Department)) FROM Worker_Info;

# Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(First_Name, 'a', 'A') FROM Worker_Info;
use project;
# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(First_Name," ",Last_Name) AS COMPLETE_NAME FROM Worker_Info;

# Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker_Info ORDER BY First_Name;

# Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker_Info ORDER BY First_Name ASC, Department DESC;

# Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker_Info WHERE First_Name IN ('Vipul','Satish');

# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker_Info WHERE NOT First_Name IN ('Vipul','Satish');

# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM Worker_Info WHERE Department = 'Admin';

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker_Info WHERE First_Name LIKE'a%';

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker_Info WHERE First_Name LIKE'%a';

# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Worker_Info WHERE LENGTH(First_Name) = 6 AND First_Name LIKE'%h';

# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker_Info WHERE Salary BETWEEN 100000 AND 500000;

# Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker_Info WHERE DateOfJoining  LIKE '2014-02%';

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(Department) FROM Worker_Info WHERE Department = 'Admin';

# Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(First_Name,' ',Last_Name) AS FullName, Salary FROM  Worker_Info WHERE Salary BETWEEN '50000' AND '100000';

# Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT Department, COUNT(Department) FROM Worker_Info GROUP BY Department ORDER BY COUNT( Department) DESC;

# Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT * FROM Worker_Info t1
INNER JOIN Title t2
ON t1.Worker_Id = t2.Worker_Ref_Id
WHERE Worker_Title = 'Manager';

# Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT Department, DateOfJoining, COUNT(*)
FROM Worker_Info
GROUP BY Department, DateOfJoining
HAVING COUNT(*)>1;

SELECT Worker_Ref_Id, Bonus_Date, COUNT(*)
FROM Bonus
GROUP BY Worker_Ref_Id, Bonus_Date
HAVING COUNT(*)>1;

SELECT Worker_Title, Affected_From, COUNT(*)
FROM Title
GROUP BY Worker_Title, Affected_From
HAVING COUNT(*)>1;

# Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker_Info WHERE MOD(Worker_Id, 2 ) <> 0;
SELECT * FROM Worker_Info WHERE Worker_Id %2!= 0;

# Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker_Info WHERE MOD(Worker_Id, 2 ) = 0;
SELECT * FROM Worker_Info WHERE Worker_Id %2= 0;

# Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE Duplicate_Table Select * FROM Worker_Info;
describe Duplicate_Table;

# Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT * FROM Worker_Info t1
INNER JOIN Title t2
ON t1.Worker_Id = t2.Worker_Ref_Id;

# Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker_Info t1
LEFT JOIN Bonus t2
ON t1.Worker_Id = t2.Worker_Ref_Id
WHERE t2.Worker_Ref_Id IS NULL;

# Q-31. Write an SQL query to show the current date and time.
SELECT NOW();

# Q-32. Write an SQL query to show the top n (say 10) records of a table
SELECT * FROM Worker_Info LIMIT 10;

# Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker_Info ORDER BY Salary DESC LIMIT 5;

# Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT Salary
FROM Worker_Info W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker_Info W2
 WHERE W2.Salary >= W1.Salary
 );

# Q-35. Write an SQL query to fetch the list of employees with the same salary.

SELECT  W.Worker_Id, W.First_Name, W.Salary 
FROM Worker_Info W, Worker_Info W1 
WHERE W.Salary = W1.Salary 
AND W.Worker_Id != W1.Worker_Id;

# Q-36. Write an SQL query to show the second highest salary from a table.
SELECT Salary
FROM Worker_Info W1
WHERE 2 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker_Info W2
 WHERE W2.Salary >= W1.Salary
 );
 
SELECT MAX(SALARY) FROM Worker_Info
WHERE SALARY <> (SELECT MAX(SALARY)
FROM Worker_Info);

# Q-37. Write an SQL query to show one row twice in results from a table.
SELECT First_Name, Department FROM Worker_Info  WHERE Department = 'HR'
UNION ALL
SELECT First_Name, Department FROM Worker_Info WHERE Department = 'HR';

# Q-38. Write an SQL query to fetch intersecting records of two tables.
SELECT * FROM Worker_Info t1
INNER JOIN Title t2
ON t1.Worker_Id = t2.Worker_Ref_Id;

# Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker_Info
WHERE Worker_Id <= (SELECT round(count(Worker_Id)/2,0) FROM Worker_Info);

# Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT COUNT(Worker_Id), Department FROM Worker_Info
GROUP BY Department
HAVING COUNT(Worker_Id) < 5;

# Q-41. Write an SQL query to show all departments along with the number of people in there
SELECT COUNT(Worker_Id), Department FROM Worker_Info
GROUP BY Department
HAVING COUNT(Worker_Id);

# Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker_Info ORDER BY Worker_Id DESC LIMIT 1;

# Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker_Info ORDER BY Worker_Id LIMIT 1;

# Q-44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM Worker_Info ORDER BY Worker_Id DESC LIMIT 5;

# Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT Worker_Id,Department, MAX(Salary), CONCAT(First_Name, ' ', Last_Name) AS Full_Name From Worker_Info GROUP BY Department;

# Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT Salary FROM Worker_Info ORDER BY Salary DESC LIMIT 3;

# Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT Salary FROM Worker_Info ORDER BY Salary LIMIT 3;

# Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT Salary FROM Worker_Info ORDER BY Salary DESC;

# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT Department, SUM(Salary) FROM Worker_Info GROUP BY Department;

# Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, Salary FROM Worker_Info WHERE Salary = (SELECT MAX(Salary) FROM Worker_Info);


