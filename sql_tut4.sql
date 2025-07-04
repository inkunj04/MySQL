create database tut4;
use tut4;

create table student(
	rollno int primary key,
	name varchar(50),
    marks int not null,
	grade varchar(2),
    city varchar(20)
);

insert into student 
(rollno, name, marks, grade,city)
values
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select * from student;

select city from student;

select distinct city from student; -- shows unique values from column city

select * from student where marks>80;

select * from student where city="Mumbai";

select * from student where marks>80 and city="Mumbai"; -- both condn should be fulfilled

select * from student where marks>90 or city="Mumbai"; -- any one condn should be fulfilled

select * from student where marks between 80 and 90;

select * from student where city in ("Delhi","Mumbai");

select * from student where city not in ("Delhi","Mumbai");

-- LIMIT --> put limit on number of rows
select * from student limit 3;  -- it will show 1st 3 rows 

-- ORDER By --> to sort in ascending (ASC) or in Descending (DESC), 1,2,3,4,5-> Ascending, 5,4,3,2,1-> descending
select * from student order by city asc;
select * from student order by marks asc;
select * from student order by marks desc limit 3; -- top 3

-- aggregate functions

select max(marks) from student;
select min(marks) from student;
select avg(marks) from student;
select count(marks) from student;
select sum(marks) from student;

-- GROUP By -- groups that have the same values into summary rows
-- collects data from multiple records and groups the result by one or more column
-- generally we use group by with some aggregation function

select city from student group by city;
select city, count(rollno) from student group by city;
select city,name, count(rollno) from student group by city, name;
select city,name, avg(marks) from student group by city, name;

-- Q) write the query to find avg marks in each city in ascending order
select city, avg(marks) from student group by city order by city;
select city, avg(marks) from student group by city order by avg(marks) desc;









