/*
2. Left Join
- left join returns all rows from the left table
- matched rows from the right table
- If there’s no match, the result from the right table is NULL

Imagine:

Table A = All students
Table B = Courses enrolled

If you use LEFT JOIN:
You’ll see all students — even those who haven’t enrolled in any course. 
Their course will be shown as NULL.

SELECT columns
FROM left_table
LEFT JOIN right_table
ON left_table.key = right_table.key;

*/
create database LeftJoinDB;
use LeftJoinDB;

-- table-1 (Left Table)
create table customers(
	customer_id int primary key,
    customer_name varchar(20)
);

-- table-2 (Right Table)
create table orders(
	order_id int primary key,
    customer_id int,
    product varchar(50)
);

insert into customers
(customer_id, customer_name)
values
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

insert into orders
(order_id,customer_id, product)
values
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Tablet');

select * from customers;

select 
    c.customer_id,
    c.customer_name,
    o.product
from 
    customers as c
left join 
    orders as o
on 
    c.customer_id = o.customer_id;

/*
When to Use LEFT JOIN
Show customers even if they didn’t buy anything
List employees even if they don’t have assigned projects
Find what’s missing between two related tables
*/

-- 1. Show all customers with their order details (as shown above).
-- LEFT JOIN brings all customers (left table)

select
	c.customer_id,
	c.customer_name,
    o.product
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id;


-- 2. Find all customers who didn’t place any order.

select
	c.customer_name,
	c.customer_id
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id
where 
	product is null;
    
-- 3. Display only customer names who placed orders
select
	c.customer_name,
	c.customer_id
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id
where 
	product is not null;
 

-- 4. Show how many products each customer bought.
select
	count(o.product),
    c.customer_name
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id
group by 
	customer_name;

-- the above code is right but
-- Always group by a unique identifier, e.g., customer_id, especially if customer names might not be unique.

-- efficient code of this would be
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.product) AS total_orders
FROM
    customers AS c
LEFT JOIN
    orders AS o
ON
    c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name;

-- This ensures it works even if two customers are named "Alice".

-- 5. Find customers who placed more than 1 order.
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.product) AS total_orders
FROM
    customers AS c
LEFT JOIN
    orders AS o
ON
    c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name
having
	count(o.product)>1;
	
-- WHERE filters before grouping.
-- HAVING filters after grouping — so you must use it with aggregates like COUNT().

-- 6. List customers and orders, sorted by customer name.
select
	c.customer_id,
    c.customer_name,
    o.product
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id
order by
	c.customer_name;
-- by defaults sorts ascending

-- 7.  Show each customer's name along with: Number of products they ordered
-- If they ordered nothing, show "No Orders" in a new column called order_status
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) = 0 THEN 'No Orders'
        ELSE 'Ordered'
    END AS order_status
FROM 
    customers AS c
LEFT JOIN 
    orders AS o
ON 
    c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.customer_name;
 
    
    
    
    


