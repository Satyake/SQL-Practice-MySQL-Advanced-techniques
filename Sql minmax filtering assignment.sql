select * from students

select * from student_grades

-- for each student return the classes they  took and their final grades
select s.id, s.student_name, sg.class_name, 
sg.final_grade

 from students s
left join student_grades sg
on s.id=sg.student_id;


-- return each students top grade and class

with max_grade as (
select s.id, s.student_name, max(final_grade) as top_grade
 from students s
inner  join student_grades sg
on s.id=sg.student_id
group by 1,2 order by s.id
) select * from max_grade m left join 
student_grades s
on m.id=s.student_id and
m.top_grade=s.final_grade;

-- window function

select * from (
select s.id, s.student_name, sg.class_name, 
sg.final_grade,
DENSE_RANK() over(partition by student_name
order by final_grade desc) as grade_rank
 from students s
left join student_grades sg
on s.id=sg.student_id
) g
where g.grade_rank=1












