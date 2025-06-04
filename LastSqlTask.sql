--1. Create a new database named "CompanyDB."
create database CompanyDB
use CompanyDB
go

--2. Create a schema named "Sales" within the "CompanyDB" database.
create schema Sales
go

/*3. Create a table named "employees" with columns: 
employee_id (INT) - use sequence instead of identity,
first_name (VARCHAR),
last_name (VARCHAR),
salary (DECIMAL)
Within the "Sales" schema.*/
create table Sales.Employees(
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2)
)

--4. Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
alter table Sales.Employees
add hire_date date

/*5. Add mock data to this table using Mockaroo.
//done

---------------------------------------------------
DATA MANIPULATION Exercises:
1. Select all columns from the "employees" table.*/
select* 
from Sales.Employees;

--2. Retrieve only the "first_name" and "last_name" columns from the "employees" table.
select first_name,last_name
from Sales.Employees

--3. Retrieve "full name" as a one column from "first_name" and "last_name" columns from the "employees" table.
select concat(first_name,last_name)as full_name
from Sales.Employees

--4. Show the average salary of all employees. (Use AVG() function)
select avg(salary)
from Sales.Employees

--5. Select employees whose salary is greater than 50000.
select*
from Sales.Employees
where salary>50000


--6. Retrieve employees hired in the year 2020.
select*
from Sales.Employees
where year(hire_date)=2020


--7. List employees whose last names start with 'S'.
select*
from Sales.Employees
where last_name like's%';


--8. Display the top 10 highest-paid employees.
select top (10) *
from Sales.Employees
order by salary desc

--9. Find employees with salaries between 40000 and 60000.
select *
from Sales.Employees
where salary between 40000 and 60000

--10. Show employees with names containing the substring 'man'.
select *
from Sales.Employees
where first_name like '%man%' or last_name like '%man%'

--11. Display employees with a NULL value in the "hire_date" column.
select *
from Sales.Employees
where hire_date is null

--12. Select employees with a salary in the set (40000, 45000, 50000).
select *
from Sales.Employees
where salary in (40000,45000,50000)

--13. Retrieve employees hired between '2020-01-01' and '2021-01-01'.
select *
from Sales.Employees
where hire_date between '2020-01-01' and '2021-01-01'


--14. List employees with salaries in descending order.
select *
from Sales.Employees
order by salary desc


--15.Show the first 5 employees ordered by "last_name" in ascending order.
select top(5) *
from Sales.Employees
order by last_name Asc


--16. Display employees with a salary greater than 55000 and hired in 2020.
SELECT * 
FROM Sales.employees
WHERE salary > 55000 AND YEAR(hire_date) = 2020;

--17. Select employees whose first name is 'John' or 'Jane'.
SELECT * 
FROM Sales.employees
WHERE first_name in('John' , 'Jane')

--18. List employees with a salary ≤ 55000 and a hire date after '2022-01-01'.
SELECT * 
FROM Sales.employees
WHERE salary <= 55000 AND hire_date > '2022-01-01'

--19. Retrieve employees with a salary greater than the average salary.
SELECT * 
FROM Sales.employees
WHERE salary>(select avg(salary) from Sales.Employees)

--20. Display the 3rd to 7th highest-paid employees. (Use OFFSET and FETCH)
SELECT * 
FROM Sales.employees
ORDER BY salary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;

--21. List employees hired after '2021-01-01' in alphabetical order.
SELECT * 
FROM Sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY first_name ASC;

--22. Retrieve employees with a salary > 50000 and last name not starting with 'A'.
SELECT * 
FROM Sales.employees
WHERE salary > 50000 AND last_name NOT LIKE 'A%';

--23. Display employees with a salary that is not NULL.
SELECT * 
FROM Sales.employees
WHERE salary is not null

--24. Show employees with names containing 'e' or 'i' and a salary > 45000.
SELECT * 
FROM Sales.employees
WHERE (first_name LIKE '%e%' OR first_name LIKE '%i%' 
    OR last_name LIKE '%e%' OR last_name LIKE '%i%')
    AND salary > 45000;


	--------------------------------------
--JOIN-RELATED EXERCISES
/*--25. Create a new table named "departments" with columns:
department_id (Primary Key, INT),
department_name (VARCHAR),
manager_id (INT, references "employees".employee_id).*/
CREATE TABLE Sales.departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Sales.Employees(employee_id)
);

--26. Assign each employee to a department by creating a "department_id" column in "employees" and making it a foreign key referencing "departments".department_id.
ALTER TABLE Sales.Employees
ADD department_id INT  ;

ALTER TABLE Sales.Employees
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY (department_id) REFERENCES Sales.departments(department_id);


--27. Retrieve all employees with their department names (Use INNER JOIN).
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM Sales.Employees e
INNER JOIN Sales.departments d
ON e.employee_id =d.department_id

--28. Retrieve employees who don’t belong to any department (Use LEFT JOIN and check for NULL).
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name
FROM Sales.employees e
LEFT JOIN Sales.departments d
    ON e.employee_id = d.department_id
WHERE d.department_id IS NULL;

Show all departments and their employee count (Use JOIN and GROUP BY).
Retrieve the highest-paid employee in each department (Use JOIN and MAX(salary)).
31. Group employees by their department and calculate the average salary for each department.
32. Insert a new employee into the "employees" table with a salary and hire date.
33. Update the salary of employees who earn less than 45000 to 46000.
34. Delete employees who have a NULL hire date.
35. Create an index on the salary column in the "employees" table to optimize queries filtering by salary.

--لان فى ايرور ببيظهر معايا معملتش باقى 

