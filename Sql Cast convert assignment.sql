select o.customer_id, o.product_id, o.units,
p.product_id, p.unit_price
 from orders o
left join products p 
on p.product_id=o.product_id

with bin as(
select o.customer_id, 
sum(p.unit_price* o.units) as total_price,
FLOOR(sum(p.unit_price*o.units)/10)*10 as total_spend_bin
 from orders o
left join products p 
on p.product_id=o.product_id
group by customer_id
)
select count(customer_id) as customer_count, total_spend_bin 
from bin
group by total_spend_bin order by total_spend_bin

select p.product_id, p.unit_price from products p;

