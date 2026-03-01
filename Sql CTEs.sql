-- CTEs

use maven_advanced_sql;
with country_hs as(
select country, avg(happiness_score) as avg_hs_by_country
from happiness_scores group by country)
select hs.year, hs.country, hs.happiness_score,
country_hs.avg_hs_by_country from happiness_scores hs 
left join country_hs
on hs.country=country_hs.country; 

-- not CTE 
select h.country, h.happiness_score, hsg.avg_hs_by_country
from happiness_scores h
inner join (
select country ,avg(happiness_score) as avg_hs_by_country
from happiness_scores group by country) as hsg
on hsg.country= h.country;

-- #compare the happiness cores within each region in 2023
select * from happiness_scores where year=2023;


select hs1.region, hs1.country, hs1.happiness_score,
hs2.country, hs2.happiness_score
from happiness_scores hs1
inner join happiness_scores hs2
on hs1.region=hs2.region

-- CTE method
with hs as (
select * from happiness_scores where year=2023
)

select hs1.region, hs1.country, hs1.happiness_score,
hs.country, hs.happiness_score
from happiness_scores hs1
inner join  hs
on hs1.region=hs.region














