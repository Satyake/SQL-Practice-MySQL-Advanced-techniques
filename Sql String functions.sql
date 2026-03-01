-- string functions

select * from my_events;

select event_name, upper(event_name),
lower(event_name)
from my_events;


-- combine the type and description columns

with cte_clean as (
select event_name, event_type, event_desc,
REPLACE(TRIM(event_type), '!','') as event_type_clean
from my_events)
select event_name, TRIM(concat(event_type_clean ,'|',event_desc)) as concat_descrip,
LENGTH(TRIM(concat(event_type_clean ,'|',event_desc))) as length_of_desc_concat
 from cte_clean
 
 
 select product_id, factory from products;
 
 select product_id, factory,
 TRIM(concat(replace(factory, "'","-"),'-',product_id))  as factory_product_id
 from products;
 