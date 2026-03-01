create table sample_table(
id int,
str_value char(20)
)

insert into  sample_table (id, str_value)
values
(1,'100.2'),
(2,'200.4'),
(3,'300.6');


select * from sample_table;

select id, str_value,
round(cast(str_value as FLOAT) *2,2) as float_value
from sample_table

select country, population/5 from country_stats;