-- NTILE
USE maven_advanced_sql;
select * from happiness_scores;

with HS_percentile_calc as(
select region, country, happiness_score,
NTILE(4) OVER(partition by region order by happiness_score) 
as hs_percentile
from happiness_scores)
select * from HS_percentile_calc 
where hs_percentile=1
order by happiness_score desc
