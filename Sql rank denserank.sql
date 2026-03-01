select * from orders;

select order_id, customer_id, product_id, order_date, units
from orders;

select 
order_id, 
customer_id, 
product_id,
 order_date, 
 units,
 DENSE_RANK() over(partition by order_id order by units desc) 
 as ranked
 from orders;
