select * from country_stats

-- log function
select country, population,
log(population) as log_pop ,
round(log(population),2) as log_pop_2
from country_stats

-- FLOOR function 
with pm as(
select country, population,
FLOOR(population/1000000) as pop_in_m
from country_stats
)
select pop_in_m, count(*) from pm
group by pop_in_m order by pop_in_m desc

-- max of a column vs max of a row

use maven_advanced_sql;
create table miles_run(
name varchar(50),
q1 int,
q2 int,
q3 int,
q4 int
);

insert into miles_run(name, q1, q2,q3,q4) 
values
('Ali', 100,200,150, NULL),
('Bolt', 350,400,380, 300),
('Jordan', 200,250,300, 320);

select * from miles_run;
-- return greatest for each column
select max(q1), max(q2), max(q3),max(q4) 
from miles_run
-- return greatest value for each row
select greatest(q1, q2, q3,q4) as greatest_row from miles_run


select greatest(q1, q2, q3,COALESCE(q4, 0)) 
as greatest_row from miles_run



