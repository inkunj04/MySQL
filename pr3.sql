create database pr3;
use pr3;

create table customers(
	customer_id int primary key,
    name varchar(50) not null,
    city varchar(50)
);

create table orders(
	order_id int primary key,
    customer_id int,
    order_date date,
    amount decimal(10,2),
    foreign key (customer_id) references customers (customer_id)
);

create table products(
	product_id int primary key,
    product_name varchar(50) not null,
    price decimal(10,2),
    stock int check (stock>=0)
);

insert into customers
(customer_id, name, city)
values
(1, 'Kunal', 'Mumbai'),
(2, 'Sneha', 'Delhi'),
(3, 'Ravi', 'Mumbai'),
(4, 'Megha', 'Bangalore');

insert into orders
(order_id, customer_id, order_date, amount)
values
(101, 1, '2024-06-01', 1200.00),
(102, 2, '2024-06-03', 1500.00),
(103, 1, '2024-06-05', 800.00),
(104, 3, '2024-06-10', 600.00);

insert into products
(product_id, product_name,price,stock)
values
(201, 'Laptop Bag', 1500.00, 5),
(202, 'Mouse', 500.00, 0),
(203, 'Keyboard', 800.00, 10),
(204, 'Charger', 1200.00, 2);


-- 1. List all customers from 'Mumbai'.
select * from customers where city="Mumbai";

-- 2. Show all products with price > 1000, sorted by price descending.
select * from products where price>1000 order by price desc;

-- 3. Display orders placed after June 2, 2024.
select * from orders where order_date>2024-06-02;


-- 4. Show the total number of orders placed by each customer.
select 
	c.name,
    count(o.order_id) as total_order
from
	customers as c
join
	orders as o
on
	c.customer_id=o.customer_id
group by
	c.name;
-- in this output megha will not show as she orderded nothing but if you want to include all customers
-- even if orders 0 then here you can use left join

-- 5. Show the average order amount per city
select
	c.city,
    avg(o.amount) as average_amount
from
	orders as o
join
	customers as c
on
	o.customer_id=c.customer_id
group by
	c.city;
-- output Bangalore (Megha) has no orders → not shown in INNER JOIN, if want to show no orders here use left join

-- 6. List customers who placed more than 1 order.
select
	c.name as customer_name,
    count(c.customer_id) as total_oders -- u can also use o.order_id
from
	customers as c
join
	orders as o
on
	c.customer_id=o.customer_id
group by
	c.name
having	
	count(c.customer_id)>1;

-- 7. Find customers whose total order amount exceeds ₹1500.
select
	c.name,
    sum(o.amount) as total_amount
from
	customers as c
join
	orders as o
on
	c.customer_id=o.customer_id
group by
	c.name
having
	sum(o.amount)>1500;

-- 8. Display customer name, order ID, and order amount using INNER JOIN.
select
	o.order_id,
	c.name,
    o.amount as order_amount
from
	orders as o
inner join
	customers as c
on
	o.customer_id=c.customer_id;

-- 9. List all customers and their orders
select
	c.customer_id,
	c.name as customer_name,
    o.order_id,
    o.order_date,
    o.amount
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id;

-- 10. Show customers who haven't placed any orders.
select
	c.customer_id,
	c.name as customer_name,
    o.order_id,
    o.order_date,
    o.amount
from
	customers as c
left join
	orders as o
on
	c.customer_id=o.customer_id
where
	o.order_id is null;
    
-- 11. List all orders including customer names, and show 'No Name' if customer is missing.
SELECT 
    o.order_id,
    o.order_date,
    o.amount,
    COALESCE(c.name, 'No Name') AS customer_name
FROM 
    customers AS c
RIGHT JOIN 
    orders AS o
ON 
    c.customer_id = o.customer_id;
    -- COALESCE(c.name, 'No Name')	Replaces NULL names with 'No Name'
-- INSERT INTO orders VALUES (105, 999, '2024-06-12', 2000.00);

