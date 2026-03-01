-- subqueries in the where and having

-- average happiness score

select avg(happiness_score) from happiness_scores
-- get above happiness score (WHERE)
select * from happiness_scores
where happiness_score> (select avg(happiness_score) 
from happiness_scores);


-- above average happiness scores for each region  (HAVING)
select region , avg(happiness_score) as avg_happiness_score
from happiness_scores 
group by region
having avg_happiness_score > (select avg(happiness_score) 
from happiness_scores);
