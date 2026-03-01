use maven_advanced_sql;

drop table tops;
drop table sizes;
drop table outwear;
create table tops(
id int,
item varchar(50)
);

create table  sizes(
id int,
size varchar(50)
);


create table outerwear(
id int,
item varchar(50)
);

INSERT INTO tops (id, item) VALUES
  (1, 'T-Shirt'),
  (2, 'Hoodie');

INSERT INTO sizes (id, size) VALUES
  (101, 'Small'),
  (102, 'Medium'),
  (103, 'Large');

INSERT INTO outerwear (id, item) VALUES
  (2, 'Hoodie'),
  (3, 'Jacket'),
  (4, 'Coat');
-- Cross Joins
select * from tops cross join sizes ;

-- union and union all

select * from tops 
UNION ALL 
select * from outerwear
-- union with different column names
select * from happiness_scores_current;

select year, country, happiness_score from happiness_scores
UNION ALL
select 2024, country, ladder_score from happiness_scores_current;