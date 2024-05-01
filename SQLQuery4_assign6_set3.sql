--query1
select first_name,last_name,d.department_id,department_name  
from employees e
left join 
departments d
on e.department_id = d.department_id

--query2
select first_name,last_name,department_name,city,state_province
from employees e
left join
departments d
on e.department_id = d.department_id
left join
locations l
on d.location_id = l.location_id

--query3
select first_name,last_name,salary,grade_level
from employees e
left join
job_grades jg
on e.salary between jg.lowest_sal and jg.highest_sal


--query4
select first_name,last_name,d.department_id,department_name
from employees e
left join
departments d
on e.department_id = d.department_id
where e.department_id =4 or e.department_id=8

--query5
select first_name,last_name,department_name,city,state_province
from employees e
left join
departments d
on e.department_id = d.department_id
left join
locations l
on d.location_id = l.location_id
where first_name like '%a%'

--query6
select [first_name],
[last_name],
[departments].department_name,
[employees].[department_id]
 
 
from [employees]
left join [departments] 
on [employees].[department_id]=[departments].department_id
 
where [departments].department_name <> 'IT'

--query7
select first_name,last_name,salary 
from employees
where salary <(select salary from employees where employee_id=122)

--query8
/*
select first_name,
from employees
where */

--query9
select department_name,city,state_province
from departments d
inner join
locations l
on d.location_id=l.location_id

--query10
select first_name,last_name,d.department_name,e.department_id
from employees e
left join
departments d
on e.department_id=d.department_id

--query11
select  e.first_name,ei.first_name manager_name
from employees e
  join
employees ei
on e.manager_id = ei.employee_id 

--query12
select first_name,last_name,department_id
from employees 
where department_id = (select department_id from employees where last_name='taylor')

--query13
/*
select job_title, first_name+' '+last_name full_name,start_date,department_name
from employees e
inner join
departments d
on e.department_id=d.department_id
inner join
jobs jo
on e.job_id=jo.job_id 
inner join
jobs_history jh
on e.employee_id= jh.employee_id and start_date between '1993-01-01' and '1997-08-31'

*/

--query14
select job_title, first_name+' '+last_name full_name,max_salary-salary salary_diffrence
from employees e
inner join
jobs jo
on e.job_id=jo.job_id 


--query15
/*
select count(e.employee_id) as count_i, first_name+' '+last_name full_name,department_name,AVG(e.salary) as avg_salary
from employees e
inner join
departments d
on e.department_id=d.department_id
group by e.department_id
*/
--query16
select j.job_title, e.first_Name +' '+e.last_name as EmployeeName, (j.max_salary - e.salary) as salarydiff
	from employees e
	left join jobs j on e.job_id = j.job_id and e.department_id = 5

--query17
select department_name,c.country_name,l.city
from departments d
inner join locations l

on d.location_id=l.location_id
inner join countries c
on c.country_id=l.country_id

--query18

select  ei.first_name manager_name,department_name
from employees e
  join
employees ei
on e.manager_id = ei.employee_id 
inner join departments d
on e.department_id=d.department_id

--query19
select job_title,AVG(salary)
from jobs j
inner join 
employees e
on j.job_id=e.job_id
GROUP BY job_title
--QUERY20
/*
select e.employee_id,jh.start_date,jh.end_date,jh.job_id,jh.department_id 
from employees e
right join
job_history
on e.employee_id= jh.department_id
*/
