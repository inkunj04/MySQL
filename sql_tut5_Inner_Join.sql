-- JOIN
/*
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
*/

/*
Inner Joincombines rows from two or more tables only where a match exists between the columns being joined.
Imagine two tables:

🧑‍💼 Employees – contains employee names and their department IDs.

🏢 Departments – contains department IDs and department names.

INNER JOIN will give us:
➡️ “Show me all employees who are assigned to a valid department.”

Syntax:
SELECT table1.column1, table2.column2, ...
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;

*/
create database JoinPractice;
use JoinPractice;

create table employees(
	emp_id int primary key,
    name varchar(50),
    department_id int,
    salary int
);

create table departments(
	department_id int primary key,
    department_name varchar(50)
);

insert into departments
(department_id, department_name)
values
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

insert into employees
(emp_id, name, department_id, salary)
values
(101, 'Anil', 2, 60000),
(102, 'Bhavna', 1, 75000),
(103, 'Chetan', 2, 50000),
(104, 'Divya', 3, 90000),
(105, 'Eshan', NULL, 40000),   -- No department
(106, 'Fatima', 5, 65000);     -- Invalid department_id

-- task: Show employee names with their department names

select 
	e.emp_id,
    e.name as employee_name,
    d.department_name
from
	employees as e -- table alias 'e'
inner join
	departments as d -- table alias 'd'
on 
	e.department_id=d.department_id;

-- ON defines the join condition — i.e., how the two tables should be connected.
-- Returns only matching rows in both tables
-- NULLs in JOIN column	Eliminated
-- as is use to give clear or custom column names in output.

-- 1. Write a query to list all employee names with their department names.

SELECT 
    e.name AS employee_name,
    d.department_name
FROM 
    employees AS e
INNER JOIN 
    departments AS d
ON 
    e.department_id = d.department_id;

-- 2. Find all employees who work in the “IT” department.
select 
    e.emp_id,
    e.name as employee_name,
    d.department_name
from 
    employees as e
inner join
    departments as d
ON 
    e.department_id = d.department_id
WHERE 
    d.department_name = 'IT';


-- 3. Show only employees whose salary is more than 60000, along with their department names.

select
	e.salary,
    d.department_name
from
	employees as e
inner join
	departments as d
on
	e.department_id=d.department_id
where 
	salary>60000;

-- 4. Display department names and names of employees working in them, sorted by salary in descending order.

select
	e.name as employee_name,
	e.salary,
    d.department_name
from
	employees as e
inner join
	departments as d
on
	e.department_id=d.department_id
order by
	salary desc;

-- 5. Find number of employees in each department (use GROUP BY with INNER JOIN).
select
    d.department_name,
    count(e.emp_id) as total_employees
from
	employees as e
inner join
	departments as d
on
	e.department_id=d.department_id
group by
	d.department_name;

-- 6. how employee names and their department names where the department is either IT or Finance.

select
	e.name as employee_name,
    d.department_name
from
	employees as e
inner join
	departments as d
on
	e.department_id=d.department_id
where
	department_name="IT" or department_name="Finance";
	
-- 7. Show all employees whose department name starts with 'F'
select
	e.emp_id,
    d.department_name
from
	employees as e
inner join
	departments as d
on
	e.department_id=d.department_id
where
	department_name like 'F%' and department_name like '%e';

-- F% -> meaning startswith letter F
-- %F -> meaning endswith letter F


