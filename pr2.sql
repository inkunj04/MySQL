create database placementdb;
use placementdb;

create table employees(
	emp_id int primary key,
    name varchar(20) not null,
    age int check (age>=21),
    city varchar(30),
    salary int not null
);

create table departments(
	dept_id int primary key,
    dept_name varchar(30) not null
);

create table emp_dept(
	emp_id int,
    dept_id int,
    foreign key (emp_id) references employees(emp_id),
    foreign key (dept_id) references departments(dept_id)
);

insert into employees
(emp_id, name, age, city, salary)
values
(101, 'Anil', 25, 'Mumbai', 60000),
(102, 'Bhavna', 32, 'Delhi', 85000),
(103, 'Chetan', 28, 'Bangalore', 45000),
(104, 'Divya', 35, 'Pune', 92000),
(105, 'Eshan', 23, 'Delhi', 40000),
(106, 'Fatima', 30, 'Mumbai', 75000);

insert into departments
(dept_id, dept_name)
values
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

insert into emp_dept
(emp_id, dept_id)
values
(101, 2),  -- Anil → IT
(102, 1),  -- Bhavna → HR
(103, 3),  -- Chetan → Sales
(104, 2),  -- Divya → IT
(105, 3),  -- Eshan → Sales
(106, 1);  -- Fatima → HR

-- 1. Display all employees who live in ‘Mumbai’.
select * from employees;
select * from employees where city = "Mumbai";

-- 2. Show employees with salary > 50,000 and age < 30.
select * from employees where salary>50000 and age <30;

-- 3. Find the average salary of employees from each city.
select city, avg(salary) from employees group by city;

-- 4. Find employees whose salary is not between 50,000 and 90,000.
select * from employees where salary not between 50000 and 90000;

-- 5. List employees who live in either 'Mumbai' or 'Delhi'.
select * from employees where city="Mumbai" or city="Delhi";

-- 6. Display employees whose salary is more than 60000 and who live in ‘Pune’.
select * from employees where salary > 60000 and city="Pune";

-- 7. Find the maximum and minimum salary from the employees table.
select max(salary), min(salary) from employees;

-- 8. Count how many employees live in the city ‘Mumbai’
select count(*) from employees where city ="Mumbai";

-- 9. Show total salary paid to employees from each city.
select city, sum(salary) from employees group by city;

-- 10. Show the top 3 highest paid employees (based on salary).
select * from employees order by salary desc limit 3;

