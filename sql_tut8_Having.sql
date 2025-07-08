/*
HAVING is used to filter grouped data after the GROUP BY operation has been applied.
| Keyword  | Used to Filter  | Before or After Aggregation? |
| -------- | --------------- | ---------------------------- |
| `WHERE`  | Individual rows | 🔹 Before grouping           |
| `HAVING` | Grouped rows    | 🔸 After grouping            |

Use WHERE for raw data filters
Use HAVING for aggregated/grouped filters (like COUNT(), AVG())


*/

create database SalesDB;
use SalesDB;

create table products(
	product_id int primary key,
    product_name varchar(50)
);

create table sales(
	sales_id int primary key,
    product_id int,
    quantity int
);

insert into products
(product_id,product_name)
values
(1, 'Pen'),
(2, 'Notebook'),
(3, 'Pencil'),
(4, 'Eraser'),
(5, 'Scale');

insert into sales
(sales_id, product_id, quantity)
values
(101, 1, 10),   -- Pen
(102, 2, 5),    -- Notebook
(103, 1, 20),   -- Pen again
(104, 3, 8),    -- Pencil
(105, 2, 15);   -- Notebook again

-- Q) how products that sold more than 20 units in total.
select 
	p.product_name,
    sum(s.quantity) as total_sold
from
	products as p
join
	sales as s
on
	p.product_id=s.product_id
group by
	p.product_name
having 
	sum(s.quantity)>20;

-- 2. Show all products with at least 2 sales entries
SELECT 
    p.product_name,
    COUNT(s.sales_id) AS sale_count
FROM 
    products AS p
JOIN 
    sales AS s
ON 
    p.product_id = s.product_id
GROUP BY 
    p.product_name
HAVING 
    COUNT(s.sales_id) >= 2;
    
-- Joined TABLE
SELECT 
    s.sales_id,
    p.product_name,
    s.quantity
FROM 
    sales s
JOIN 
    products p
ON 
    s.product_id = p.product_id;

-- 3. Show total quantity sold for each product
select
	p.product_name,
    count(s.quantity) as quantity
from
	sales s
join
	products p
on
	s.product_id=p.product_id
group by
	p.product_name,p.product_id;

    
-- 4. Show products where the total sold quantity is less than 10
select
	p.product_name,
    sum(s.quantity) as Quantity
from	
	sales as s
join
	products as p
on
	s.product_id=p.product_id
group by
	p.product_name
having
	sum(s.quantity)<10;
    
    
-- 5. Find products whose average quantity per sale is more than 10.
select
	p.product_name,
    avg(s.quantity) as avg_quantity
from
	sales as s
join
	products as p
on
	s.product_id=p.product_id
group by
	p.product_name
having avg(s.quantity)>10;

-- 6. Display only those products that have more than 1 sale but less than 30 total units sold.
select
	p.product_name,
    sum(s.quantity) as total_quantity
from 
	sales as s
join
	products as p
on
	s.product_id=p.product_id
group by
	p.product_name
having
	sum(s.quantity)>1 and sum(s.quantity)<30;
	
    
-- 7. Show product name, number of sales, and total quantity sold — only for products having:
-- at least 2 sales
-- and average quantity per sale < 15

select
	p.product_name,
    sum(s.quantity) as quantity,
    avg(s.quantity) as avg_quantity
from
	sales as s
join
	products as p
on
	s.product_id=p.product_id
group by
	p.product_name
having
	sum(s.quantity)>=2 and avg(s.quantity)<15;
    
