-- return each countries happiness score for the year along 
-- with countries average happiness score
select * from happiness_scores;


select avg(happiness_score) as avg_happiness_score
, country  from happiness_scores
group by country


select hs.year,hs.happiness_score,
country_hs_grouped.avg_happiness_score
 from happiness_scores hs left join (
select avg(happiness_score) as avg_happiness_score
, country  from happiness_scores
group by country ) as country_hs_grouped
on hs.country=country_hs_grouped.country
where hs.country='United States';