/*
All rows from the right table
Matching rows from the left table
If no match is found in the left table → NULLs are shown for left table columns

LEFT JOIN: Keep all rows from left table
RIGHT JOIN: Keep all rows from right table

SELECT columns
FROM left_table
RIGHT JOIN right_table
ON left_table.key = right_table.key;

*/

create database RightJoinDB;
use RightJoinDB;

-- right table
create table departments(
	dept_id int primary key,
    dept_name varchar(50)
);

-- left table
create table employees(
	emp_id int primary key,
    name varchar(50),
    dept_id int
);

insert into departments 
(dept_id,dept_name)
values
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

insert into employees 
(emp_id,name,dept_id)
values
(101, 'Anil', 1),
(102, 'Bhavna', 2),
(103, 'Chetan', 2);
-- Note: No employee in Finance or Marketing.

-- List all departments with their employees
select
	d.dept_name,
    e.name as employee_name
from
	employees as e
right join
	departments as d
on
	e.dept_id=d.dept_id;

/*
Inner Join
LEFT TABLE        RIGHT TABLE       RESULT
-----------       ------------      ---------------
 101 🟩             101 🟩           ✅ 101
 102 🟩             102 🟩           ✅ 102
 103 🟩             -   ❌           ❌
 -   ❌             104 🟩           ❌

Left Join
LEFT TABLE        RIGHT TABLE       RESULT
-----------       ------------      ---------------
 101 🟩             101 🟩           ✅ 101
 102 🟩             102 🟩           ✅ 102
 103 🟩             -   ❌           ✅ 103 (NULL)
 -   ❌             104 🟩           ❌

Right Join

LEFT TABLE        RIGHT TABLE       RESULT
-----------       ------------      ---------------
 101 🟩             101 🟩           ✅ 101
 102 🟩             102 🟩           ✅ 102
 103 🟩             -   ❌           ❌
 -   ❌             104 🟩           ✅ NULL + 104


Union
LEFT TABLE        RIGHT TABLE       RESULT
-----------       ------------      ---------------
 101 🟩             101 🟩           ✅ 101
 102 🟩             102 🟩           ✅ 102
 103 🟩             -   ❌           ✅ 103 (NULL)
 -   ❌             104 🟩           ✅ NULL + 104

*/

-- 1. Show all departments and the names of employees in them.
select
	d.dept_name,
    e.name
from
	employees as e
right join
	departments as d
on
	e.dept_id=d.dept_id;

-- 2. List departments that have no employees assigned.
select
	d.dept_name,
    d.dept_id
from
	employees as e
right join
	departments as d
on
	e.dept_id=d.dept_id
where
	e.name is null;


-- 3. Display total number of employees in each department (including 0)
select
	d.dept_id,
	d.dept_name,
    count(e.emp_id) as total_employees
from
	employees as e
right join
	departments as d
on
	e.dept_id=d.dept_id
group by
	d.dept_id,d.dept_name;
    
-- 4. Label departments as "Active" if they have employees, else "Empty" (use CASE).
select
	d.dept_name,
    d.dept_id,
    count(e.emp_id) as total_employees,
    case
		when count(e.emp_id) = 0 then 'Empty'
		else 'Active'
    end as status
from
	employees as e
right join
	departments as d
on 
	e.dept_id=d.dept_id
group by
	d.dept_id,d.dept_name;

-- 5. Find departments where number of employees < 2, including those with 0.
select
	d.dept_id,
    d.dept_name,
    count(e.emp_id) as total_employees
from
	employees as e
right join
	departments as d
on
	e.dept_id=d.dept_id
group by
	d.dept_id,d.dept_name
having
	count(e.emp_id)<2;


