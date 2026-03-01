select country, year, happiness_score,
avg(happiness_score) over(partition by country order by 
year ROWS BETWEEN 3 PRECEDING and CURRENT ROW) as three_ma
from happiness_scores


select country, year, happiness_score,
avg(happiness_score) over(partition by country order by 
year ROWS BETWEEN  CURRENT ROW and UNBOUNDED FOLLOWING ) as three_ma_fwd
from happiness_scores