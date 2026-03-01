select country, year, happiness_score from happiness_scores
order by country, year
select country, year, happiness_score,Row_number()  over()
as roww_num
from happiness_scores 


select country, year, happiness_score,Row_number()  
over(partition by country order by happiness_score desc)
as roww_num
from happiness_scores 

-- assignment

select order_id, customer_id, transaction_id,order_date 
from orders 
order by customer_id, transaction_id;

select order_id, customer_id, transaction_id,order_date ,
row_number() over(
partition by customer_id order by order_date asc) 
as transaction_num 
from orders -- order by transaction_num asc



