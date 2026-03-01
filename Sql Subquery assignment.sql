use maven_advanced_sql;

select product_id, product_name, unit_price,
(select avg(unit_price) from products) as avg_price,
unit_price-(select avg(unit_price) from products) 
as diff_from_avg
from products order by unit_price-(select avg(unit_price) from products) 
desc 

