-- Multiple subqueries
-- return happiness scores for 2015 - 2024

select * from happiness_scores;
select * from happiness_scores_current;
-- return a countrys happiness score for the year as well
-- as the average happiness score for the country accross years

select h.country, h.happiness_score, 
grouped_all_year_average.year,
grouped_all_year_average.avg_happiness_score
 from happiness_scores h
 inner join
(
select avg(happiness_score) as avg_happiness_score,
 country, year
 from happiness_scores group by country, year
 UNION 
select avg(ladder_score) as avg_happiness_score, country,
 2024
 from happiness_scores_current group by country) 
 as grouped_all_year_average 
 ON grouped_all_year_average.country=h.country
 order by year desc
 
 
 
select h.country, h.happiness_score, 
grouped_all_year_average.year,
grouped_all_year_average.avg_happiness_score
 from (
select year, country, happiness_score from happiness_scores 
 UNION 
select 2024, country, ladder_score from happiness_scores_current 
 )  h 
 inner join
(
select avg(happiness_score) as avg_happiness_score,
 country, year
 from happiness_scores group by country, year
 UNION 
select avg(ladder_score) as avg_happiness_score, country,
 2024
 from happiness_scores_current group by country) 
 as grouped_all_year_average 
 ON grouped_all_year_average.country=h.country
 order by year desc