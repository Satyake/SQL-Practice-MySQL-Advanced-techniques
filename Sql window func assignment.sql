-- assignment:3 

select 
order_id, 
customer_id, 
product_id,
 order_date, 
 units,
 DENSE_RANK() over(partition by order_id order by units desc) 
 as ranked
 from orders;
 
 with cte_ranker as (
 select 
order_id, 
customer_id, 
product_id,
 order_date, 
 units,
 NTH_VALUE(product_id,2) over(partition by order_id order by units desc) 
 as product_ranked
 from orders)
 select * from cte_ranker where product_id=product_ranked


select * from happiness_scores;

with lagger as(
select country, year, happiness_score,
LAG(happiness_score) over(partition by country order by year)
as lagged_score
from happiness_scores)
select country, (happiness_score-lagged_score)
as difference_score,year,
 happiness_score, lagged_score
 from lagger
 
 
 -- assignment lead and lag
 
 select customer_id, order_id, transaction_id,
 order_date,
 product_id, units from orders;
 
 -- for each customer return the total units within each order
 
  select customer_id, order_id, sum(units) 
  as total_units 
  from orders group by customer_id, order_id
  order by customer_id
  ;

  select customer_id, order_id,min(transaction_id) as min_tid
  , sum(units) 
  as total_units 
  from orders 
  group by customer_id, order_id
  order by customer_id
  ;

 with mycte as (
  select customer_id, order_id,min(transaction_id) as min_tid
  , sum(units) 
  as total_units 
  from orders 
  group by customer_id, order_id
  order by customer_id
)
select customer_id, order_id, total_units,min_tid,
LAG(total_units) over(partition by customer_id order by
min_tid) as previous_total_unit
from myct
 
with mycte as (
  select customer_id, order_id,min(transaction_id) as min_tid
  , sum(units) 
  as total_units 
  from orders 
  group by customer_id, order_id
),
mycte2 as (
select customer_id, order_id, total_units,min_tid,
LAG(total_units) over(partition by customer_id order by
min_tid) as previous_total_unit
from mycte)
select  customer_id, order_id, total_units,min_tid,
(total_units-previous_total_unit) as diff
from mycte2
 
 
 
 