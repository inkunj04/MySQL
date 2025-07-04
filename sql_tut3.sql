-- constraints 	CHECK
create database tut3;
use tut3;

create table city(
	id int primary key,
	city varchar(20),
	age int,
	constraint age_check check (age>=18 and city="Delhi")
);

create table newTab(
	age int check (age>=18)
);