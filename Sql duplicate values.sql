-- Duplicate values 
use maven_advanced_sql;
CREATE TABLE employee_details (
    region VARCHAR(50),
    employee_name VARCHAR(50),
    salary INT,
    manager_id INT
);
INSERT INTO employee_details (region, employee_name, salary, manager_id) VALUES
('East', 'Ava', 85000, 1),
('East', 'Ava', 85000, 1),
('East', 'Bob', 72000, 1),
('East', 'Cat', 59000, 2),
('West', 'Cat', 63000, 3),
('West', 'Dan', 85000, 3),
('West', 'Eve', 72000, 4),
('West', 'Eve', 75000, 4);


select * from employee_details;
-- view duplicate rows 
select employee_name, count(*)
 as dup_count  from employee_details group by 1
 having count(*) >1
 
 select employee_name, region, count(*)
 as dup_count  from employee_details group by 1,2
 having count(*) >1
 
  select employee_name, region,salary, count(*)
 as dup_count  from employee_details group by 1,2,3
 having count(*) >1
 
 
 select distinct region, employee_name, salary 
 from employee_details;
 
 -- exclude partially duplicate 
 -- rows unique employee name for each row
 select * from 
 (
 select region, employee_name, salary,
 row_number() over(partition by employee_name 
 order by salary desc) as ranker
 from employee_details) as ts 
 where ts.ranker=1
 -- unique region + employee name
  select * from 
 (
 select region, employee_name, salary,
 row_number() over(partition by region,
 employee_name 
 order by salary desc) as ranker
 from employee_details) as ts 
 where ts.ranker=1
 
 -- duplciates assignment
 
 select * from students;
 
 -- create a column that counts
 -- the number of times a student appears
 -- in the table
 with cte_ranker as ( 
 select* ,
 ROW_NUMBER()
 OVER(PARTITION BY student_name) as student_count
 
 from students
 )
 
 select * from cte_ranker 
 where student_count=1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 