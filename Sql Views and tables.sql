-- Recursive CTE Practice
create view my_view as(
select year, country, happiness_score 
from happiness_scores
union all 
select   2024, country, ladder_score from 
happiness_scores_current
)
select * from my_view


-- generate 1 to 100

with recursive D(dt) as (
select current_date as dt
union all
select dt+INTERVAL 1 day
from D where dt< CURRENT_DATE+INTERVAL 12 day
)
select * from D;


-- generate 1 to 100
with recursive one_to_100 as (
select 1 as n 
union all 
select n+1 from one_to_100
where n<100+5
) select * from one_to_100

