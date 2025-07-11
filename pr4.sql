create database pr4;
use pr4;

create table student(
	student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    gpa decimal(3,2),
    enrollment_date datetime,
    major varchar(100)
);

insert into student
(student_id,first_name,last_name,gpa,enrollment_date,major)
values
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:00', 'Computer Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:00', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.60, '2021-09-01 10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.20, '2021-09-01 12:45:00', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');

select * from student;

-- 1. Write a SQL query to print details of the Students with the FIRST_NAME as 'Prem' and 'Shivansh' from Student table

select * from student where first_name in ("Prem","Shivansh");

-- 2. Write a SQL query to print details of the Students excluding FIRST_NAME as 'Prem' and 'Shivansh' from Student table

select * from student where first_name not in ("Prem","Shivansh");

-- 3. Write a SQL query to print details of the Students whose FIRST_NAME ends with 'a'

select * from student where first_name like "%a";

-- 4. Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains five alphabets.

select * from student where first_name like "____%a";

-- 5. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.

select * from student where gpa between 9.00 and 9.99;

-- 6. Write a SQL query to fetch unique values of MAJOR Subjects from Student table

select distinct major from student;

-- 7. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length

select distinct major, length(major) as subject_length from student;

-- 8. Write a SQL query to fetch "FIRST_NAME" from the Student table in upper case and use ALIAS nameas STUDENT_NAME.

select upper(first_name) as student_name from student;

-- 9. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.

select left(first_name, 3) as first_3_char from student; -- first 3 charachters
select right(first_name, 3) as last_3_char from student; -- last 3 charachters

-- 10. Write a SQL query to print FIRST_NAME from the Student table after replacing 'a' with 'A'.

select replace(first_name,'a','A') as replaced_name from student;

-- 11. Write a SQL query to print the FIRST_NAME and LAST_NAMEfrom Student table into single column COMPLETE_NAME

select concat(first_name,' ',last_name) as complete_name from student;

-- 12. What is the difference between SQL's WHER and HAVING clauses?

/*
| Feature                   | `WHERE` Clause                                 | `HAVING` Clause                              |
| ------------------------- | ---------------------------------------------- | -------------------------------------------- |
| ✅ **Purpose**             | Filters rows **before** grouping/aggregation   | Filters groups **after** aggregation         |
| ✅ **Used with**           | Regular SELECT queries (no aggregation needed) | Always used with **GROUP BY** and aggregates |
| ✅ **Can use aggregates?** | ❌ No (e.g., can't use `AVG()`, `SUM()` here)   | ✅ Yes (e.g., `HAVING AVG(GPA) > 8`)          |
| ✅ **Query stage**         | Acts **before** grouping                       | Acts **after** grouping                      |


*/

