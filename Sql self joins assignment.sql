-- Assignment self joins

select * from products

-- join the products table with itself so each candy is paired with a different candy

select p1.product_name, p1.unit_price, p2.product_name, p2.unit_price 
from products p1 inner join products p2
on p1.product_id<> p2.product_id

--calculate the price difference

select p1.product_name, p1.unit_price, p2.product_name, p2.unit_price ,
(p1.unit_price - p2.unit_price) as price_diff
from products p1 inner join products p2
on p1.product_id<> p2.product_id
where abs(p1.unit_price - p2.unit_price) <0.25 
and p1.product_name<p2.product_name
order by (p1.unit_price - p2.unit_price)  desc