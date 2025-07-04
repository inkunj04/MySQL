create database college;
use college;

create table student(
 rollno int primary key,
 name varchar(50)
);

/*
for adding multiple data at once in MySQL we can use below syntax
*/
insert into student
(rollno, name)
values
(101,"Karan"),
(102,"Arjun"),
(103,"Ram");

-- single line comment --> for adding one data at time we can use below syntax

insert into student values(104,"Shyam");

