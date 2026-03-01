-- Create table
CREATE TABLE pizza_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    pizza_name VARCHAR(100),
    price DECIMAL(5, 2)
);

-- Insert data
INSERT INTO pizza_orders (order_id, customer_name, order_date, pizza_name, price)
VALUES
(1,  'Jack',  '2024-12-01', 'Pepperoni',        18.75),
(2,  'Jack',  '2024-12-02', 'Pepperoni',        18.75),
(3,  'Jack',  '2024-12-03', 'Pepperoni',        18.75),
(4,  'Jack',  '2024-12-04', 'Pepperoni',        18.75),
(5,  'Jack',  '2024-12-05', 'Spicy Italian',    22.75),

(6,  'Jill',  '2024-12-01', 'Five Cheese',      18.50),
(7,  'Jill',  '2024-12-03', 'Margherita',       19.50),
(8,  'Jill',  '2024-12-05', 'Margherita',       19.50),
(9,  'Jill',  '2024-12-08', 'Garden Delight',   21.50),
(10, 'Jill',  '2024-12-09', 'Greek',            21.50),

(11, 'Tom',   '2024-12-02', 'Hawaiian',         19.50),
(12, 'Tom',   '2024-12-04', 'Chicken Pesto',    20.75),
(13, 'Tom',   '2024-12-05', 'Spicy Italian',    22.75),

(14, 'Jerry', '2024-12-01', 'California Chicken', 21.75),
(15, 'Jerry', '2024-12-02', 'Veggie Delight',      19.50),
(16, 'Jerry', '2024-12-04', 'Greek',               21.50);





select customer_name, order_date, sum(price) as total_price 
from pizza_orders
group by 1,2


-- subtotal
select customer_name, order_date, sum(price) as total_price 
from pizza_orders
group by 1,2 WITH ROLLUP;

select customer_name, order_date, COUNT(price) as total_price 
from pizza_orders
group by 1,2 WITH ROLLUP;

select  order_date, COUNT(price) as total_price 
from pizza_orders
group by 1 WITH ROLLUP;


select order_date, sum(price) as total_sales from  pizza_orders
group by 1
order by order_date

with total_sales as (
select order_date, sum(price) as total_sales from  pizza_orders
group by 1
order by order_date) select *,
sum(total_sales) over(order by order_date desc
rows between UNBOUNDED PRECEDING and current row 
) as cumulative_sum from total_sales


-- 3 year MA
select country,year, happiness_score,
AVG(happiness_score) over(partition by country order by year rows between
2 preceding and current row ) as three_MA

 from happiness_scores





















