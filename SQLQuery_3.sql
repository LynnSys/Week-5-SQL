--Tables in the database
SELECT table_name
FROM INFORMATION_SCHEMA.TABLES

describe table_name
FROM INFORMATION_SCHEMA.TABLES

--1. Write a SQL query to find the total number of employees in each department
SELECT * 
FROM Employees;

select departmentId as Department, count(departmentID) AS NoOfEmployees
from Employees
group by DepartmentID;

--2. To find the average salary of employees in the company
select avg(salary) as AvgSalary
from Employees;

--3. To find the total number of projects assigned to each department
SELECT table_name
FROM INFORMATION_SCHEMA.TABLES

SELECT * From Projects
SELECT * FROM Assignments
select p.DepartmentID, count(a.ProjectID) as "Number Of Projects"
FROM Projects p INNER JOIN Assignments a
ON p.ProjectID = a.ProjectID
GROUP BY a.ProjectID

--4. To find the total expenses incurred by each employee
SELECT * FROM Expenses
SELECT * FROM Employees
SELECT EmployeeId, sum(Amount) as Expenses
FROM Expenses 
GROUP BY EmployeeID

--5. To find the number porjects assigned to each employee
SELECT * FROM Assignments

SELECT EmployeeID, count(ProjectID) as "No Of Projects"
FROM Assignments
GROUP BY EmployeeID

--6. To find the average salary of employees hired in each year 
SELECT table_name
FROM INFORMATION_SCHEMA.TABLES

select * from Employees

SELECT YEAR(HireDate) as "Year", avg(salary) as "Average Salary"
from Employees
GROUP BY YEAR(HireDate)

--7. Find the department with the highest avg salary
Select * From Employees
SELECT d.DepartmentName, max(avg(e.salary)) as "Max Average"
FROM Departments d INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY (d.DepartmentID)

--10. To find the employees who have not beeen assigned to any project.
SELECT p.DepartmentID, COUNT(*) AS NumProjects
FROM Projects p
INNER JOIN Assignments a ON p.ProjectID = a.ProjectID
GROUP BY p.DepartmentID;
