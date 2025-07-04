create database tut2;
use tut2;
create table temp(
cust_id int primary key,
name varchar(20)
);

-- foreign key --> prevent actions that would destroy link between tables
/*
create table temp1(
temp_id int,
foreign key (temp_id) references temp (cust_id),
age int
);
*/
-- in above error will come because the age column is placed after the FOREIGN KEY declaration, which is not allowed. 
-- In MySQL, all column definitions must come before any constraints (like FOREIGN KEY).

CREATE TABLE temp1 (
    temp_id INT,
    age INT,
    FOREIGN KEY (temp_id) REFERENCES temp(cust_id)
);