-- Null functions assignment

select product_name, factory, division ,
coalesce(division,'Other') as division_other
from products

-- find most common division for each factory
select count(product_name) as num_products, factory, division 
from products
where division is not null
group by factory, division
order by factory, division


with num_products as (
select count(product_name) as num_prod, factory, division 
from products
where division is not null
group by factory, division
order by factory, division
),
np_rank as (
select *, row_number() over(partition by factory order by num_prod desc) as ranker
from num_products),
top_div as (
select * from np_rank 
where ranker=1
), top_div_selector as (
select * from top_div)
select p.product_name, p.factory, p.division, t.division as division_top,
coalesce(p.division, t.division) as top_div_replacer
 from products p left join top_div_selector t
 on t.factory=p.factory

