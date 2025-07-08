create database tut9;
use tut9;

create table students(
	student_id int primary key,
    name varchar(50),
    marks int
);

insert into students
(student_id,name,marks)
values
(1, 'Kunal', 75),
(2, 'Sneha', 88),
(3, 'Mehul', 40);

-- update marks of mehul to 60
set sql_safe_updates=0; -- turn off safe mode, then only this query will run in workbench or else without this method we can write student_id (use primary key)
-- this temporarily off safe mode
-- to turn on --> SET SQL_SAFE_UPDATES = 1;

update students
set marks=60
where name="Mehul";

-- delete
delete from students
where student_id=3;

-- ALTER
/*
ALTER TABLE table_name
[ADD | DROP | MODIFY | RENAME] column_name column_definition;
*/

-- add new column
alter table students
add age int;
-- Now students has a new column called age with NULL values initially.

-- drop/delete a column
alter table students
drop column age;

-- Modify column data type or size
alter table students
modify name varchar(100);

-- Rename a column
alter table students
rename column name to full_name;

-- Rename a table
rename table students to learners;

-- add a not null constraint
alter table students
modify marks int not null;

-- add default value
alter table students
alter marks set default 50;

-- drop default value
alter table students
alter marks drop default;

-- add a unique constraint
alter table students
add constraint unique_name unique (name);

-- add a check constraint
alter table students
add constraint chk_marks check (marks>=0 and marks<=100);




