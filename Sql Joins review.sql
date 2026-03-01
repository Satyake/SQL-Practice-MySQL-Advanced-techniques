use maven_advanced_sql;

select  hs.happiness_score, hs.country from happiness_scores as hs 
inner join country_stats as cs
on hs.country=cs.country


-- left
select cs.country, hs.country,hs.happiness_score from happiness_scores as hs 
left join country_stats as cs
on hs.country=cs.country

-- right
select cs.country, hs.country,hs.happiness_score from happiness_scores as hs 
right join country_stats as cs
on hs.country=cs.country

-- union 
select cs.country, hs.country,hs.happiness_score from happiness_scores as hs 
left join country_stats as cs
on hs.country=cs.country
UNION 
select cs.country, hs.country,hs.happiness_score from happiness_scores as hs 
right join country_stats as cs
on hs.country=cs.country

-- joining on multiple columns
select * from happiness_scores h
inner join inflation_rates  i
on i.country_name=h.country and 
i.year=h.year

-- joining multiple tables
--  year country hapiness_score continent inflation_rate

select i.inflation_rate, h.country, h.year, c.continent from happiness_scores h left join country_stats as c
on h.country=c.country left join inflation_rates i 
on h.year=i.year order by inflation_rate desc

-- self join
create table if not exists employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
salary INT,
manager_id INT
);

INSERT INTO employees (employee_id, employee_name, salary, manager_id) values
  (1, 'Ava', 85000, NULL),
    (2, 'Bob', 72000, 1),
    (3, 'Cat', 59000, 1),
    (4, 'Dan', 85000, 2);

select * from employees;

select e.employee_name, e.salary, f.employee_name, f.salary 
 from employees e join employees f 
on e.salary=f.salary
where  e.employee_id> f.employee_id
-- employees that have a greater salary 

select e.employee_name, e.salary, f.employee_name, f.salary 
 from employees e join employees f 
on e.salary>f.salary
where  e.employee_id> f.employee_id

-- employees and their managers
select e.employee_id, e.manager_id, e.employee_name,
 f.employee_name as manager_name
from employees e 
left join employees f
 on e.manager_id=f.employee_id