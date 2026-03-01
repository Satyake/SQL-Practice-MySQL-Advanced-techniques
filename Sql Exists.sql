-- EXISTS

select * from happiness_scores;
select * from inflation_rates;

-- return happiness scores of countries
-- that exist in the inflation rate

select count(*) from happiness_scores h 
where  exists(
select 1 from inflation_rates i
where i.country_name=h.country
)

-- inner join 
