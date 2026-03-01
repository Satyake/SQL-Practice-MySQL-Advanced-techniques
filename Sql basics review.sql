use maven_advanced_sql;

-- View the students table

select * from students;
-- The big 6
select avg(gpa) as avg_gpa, grade_level  from students
where school_lunch="yes"
group by 2 
having avg(gpa>3.3)
order by grade_level

-- distinct
select distinct(grade_level) from students;

-- count
select count(distinct grade_level) from students;

-- max and min
select max(gpa)-min(gpa) as gpa_range from students;

-- AND
select * from students 
where grade_level <12 and school_lunch='Yes';

-- IN
select * from students 
where grade_level IN (9,10,11);
-- IS NULL
select * from students where email is not null;
-- LIKE
select * from students where email LIKE '%edu%';
-- ORDER BY 
select * from students 
ORDER BY GPA desc LIMIT 5
-- CASE statements
SELECT student_name, grade_level ,
CASE WHEN grade_level=9 THEN  'FRESHMAN'
      WHEN grade_level=10 THEN 'SOPHOMORE'
	  WHEN grade_level=11 THEN 'JUNIOR'
ELSE 'SENIOR' END AS STUDENT_CLASSIFIER
from students;
