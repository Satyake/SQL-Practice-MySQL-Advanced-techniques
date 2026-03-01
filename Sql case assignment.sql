
select * from students

select* from student_grades

select s.id, s.student_name, sg.class_name, 
sg.final_grade

 from students s
left join student_grades sg
on s.id=sg.student_id;

-- columns of interest
select s.grade_level, sg.department, 
sg.final_grade
 from students s
left join student_grades sg
on s.id=sg.student_id;
-- pivot the grade level column

select s.grade_level, sg.department, 
sg.final_grade,
case when grade_level=9 then 1 else 0 end as 'freshman',
case when grade_level=10 then 1 else 0 end as 'sophomore',
case when grade_level=11 then 1 else 0 end as 'junior',
case when grade_level=12 then 1 else 0 end as 'senior'

 from students s
left join student_grades sg
on s.id=sg.student_id;


-- update two grades
select s.grade_level, sg.department, 
sg.final_grade,
case when grade_level=9 then sg.final_grade else 0 end as 'freshman',
case when grade_level=10 then sg.final_grade else 0 end as 'sophomore',
case when grade_level=11 then sg.final_grade else 0 end as 'junior',
case when grade_level=12 then sg.final_grade else 0 end as 'senior'

 from students s
left join student_grades sg
on s.id=sg.student_id;
-- final summary table average

select  sg.department, 
AVG(case when grade_level=9 then sg.final_grade else 0 end) as 'freshman',
AVG(case when grade_level=10 then sg.final_grade else 0 end) as 'sophomore',
AVG(case when grade_level=11 then sg.final_grade else 0 end )as 'junior',
AVG(case when grade_level=12 then sg.final_grade else 0 end) as 'senior'
 from students s
left join student_grades sg
on s.id=sg.student_id
where sg.department is not null
group by department
;

-- remove 0s to null

select  sg.department, 
AVG(case when grade_level=9 then sg.final_grade  end) as 'freshman',
AVG(case when grade_level=10 then sg.final_grade end) as 'sophomore',
AVG(case when grade_level=11 then sg.final_grade  end )as 'junior',
AVG(case when grade_level=12 then sg.final_grade  end) as 'senior'
 from students s
left join student_grades sg
on s.id=sg.student_id
where sg.department is not null
group by department
;



















