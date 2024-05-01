--query1
select first_name,last_name 
from employees
where salary>(select salary from employees where employee_id='176')

--query2
select first_name,last_name,salary,department_id,job_id
from employees
where job_id = (select job_id from employees where employee_id='176')

--query3
select first_name,last_name,salary,department_id
from employees
where salary in (select distinct min(salary) from employees GROUP BY  department_id )
--query4
select employee_id,first_name,last_name,salary 
from employees
where salary >(select  avg(salary) from employees)

--query5

select first_name,last_name,employee_id,salary 
from employees
where manager_id='103'

--query6

select e.department_id,e.first_name,e.job_id,d.department_name
from employees e
left join 
departments d
on  e.department_id=d.department_id
where department_name='Finance'

--query7
select * from employees 
where manager_id='205'

--query8

select * 
from employees
where employee_id in (123,126,145)

--query9
select * from employees where salary between 1000 and 3000

--query10

select *
from employees 
where salary between (select min(salary) from employees) and 2500

--query11
select * from employees where manager_id not between 100 and 200

--query12
select max(salary) from employees
where salary <
(select max(salary) from employees) 


select *from [employees]
where salary = (select   max (salary)from [employees]
where salary < (select max (salary) from  [employees]))
order by[first_name]
--query13

select first_name,last_name,hire_date from employees
where (department_id=(select department_id from employees where first_name='steven')) AND first_name !='steven'

--QUERY14
select employee_id,first_name,last_name from employees
where first_name like '%T%'

--query15
select  employee_id,first_name,salary from employees 
where salary> (select avg(salary) from employees) and department_id in
(select department_id from employees where first_name like '%j%')

--query16
select first_name,last_name,employee_id,job_id
from employees e
left join 
departments d
on e.department_id =d.department_id
left join
locations l
on d.location_id=l.location_id
where city='Toronto'

--query17
select  employee_id,first_name,last_name,job_id from employees 
where salary < (select max(salary) from employees where job_id=9)

--query18
select  employee_id,first_name,last_name,job_id from employees 
where salary < (select max(salary) from employees where job_id=9) and job_id <>9

--query19
select  employee_id,first_name,last_name,job_id from employees 
where salary > (select max(salary) from employees where job_id=9) and job_id <>9


--query20
select  employee_id,first_name,last_name,job_id,department_id from employees 
where salary in (select avg(salary) from employees group by department_id )

