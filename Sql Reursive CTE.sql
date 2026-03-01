-- return reporting chain for each emmployee
select * from employees;


with recursive employee_hiearchy as (
select employee_id, employee_name, manager_id,
employee_name as hiearchy
from employees 
where manager_id is NULL

union all

select  e.employee_id, e.employee_name, e.manager_id,
concat(eh.hiearchy,'>', e.employee_name) as hiearchy
from employees e inner join employee_hiearchy eh
on e.manager_id=eh.employee_id)
select * from employee_hiearchy order by employee_id

-- Generate numbers 1 to 10
with recursive nums as (
select 1 as n
union all
select n+1 from nums
where n<10)
select * from nums

with Recursive d as (
select CURRENT_DATE as dt
union all 
select dt+INTERVAL 1 day
from d 
where dt<CURRENT_DATE + INTERVAL 12 day
)  select * from d
