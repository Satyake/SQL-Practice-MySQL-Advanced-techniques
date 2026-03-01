-- assignment
select COUNT(DISTINCT product_id) from orders;

select COUNT(DISTINCT product_id) from products

select count(*)
from orders o 
left join products p
 on p.product_id=o.product_id
 
 select count(*)
from orders o 
right join products p
 on p.product_id=o.product_id

-- view the products that exist in one table but not the other
select *
from orders o 
left join products p
 on p.product_id=o.product_id
 where p.product_id is NULL
 
select *
from orders o 
right join products p
 on p.product_id=o.product_id
 where o.product_id is NULL
 
 -- final query 
 select p.product_id, p.product_name from products p 
 left join orders o 
 on o.product_id=p.product_id
 where o.product_id is NULL
