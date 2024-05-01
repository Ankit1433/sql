--query1

select First_name+Last_name as full_name ,salary from employees
where salary<6000

 --query2

select First_name,Last_name, department_id from employees
where salary>8000

--query3

select First_name,Last_name, department_id from employees
where Last_name like 'Baer'

--query4

select
employee_id,First_name,Last_name,Email,phone_number,hire_date,job_id,salary,manager_id,department_id
from employees
where department_id= null

--query5

select * from departments where department_name='marketing'

--query6

select First_name+' '+Last_name as full_name,hire_date,salary, department_id from employees
where first_name  not like 'm%'
order by department_id 

--query7

select * from employees
where salary between '8000' and '12000' and hire_date < '1997-06-05' and department_id not in (4,12,7)

--query8
select first_name+last_name full_name,salary from employees where commission_pct=0;

--query9
select first_name+last_name full_name,email + '-'+phone_number,salary
from employees where salary between 9000 and 17000

--query10
select First_name,Last_name,salary from employees
where first_name   like '%m'

--query11
select first_name+last_name full_name,salary
from employees where salary not between 7000 and 15000
order by full_name asc

--query12

select first_name+last_name full_name,job_id,hire_date
from employees
where hire_date between '1998-11-05' and '1999-07-05'

--query13

select first_name+last_name full_name,department_id
from employees where department_id = 7 or department_id= 9

--query14


select first_name+last_name full_name,salary,manager_id
from employees 
where manager_id!=0

--query15


select *
from employees
where hire_date < '2002-06-21'

--query16
select first_name+last_name full_name,email,salary,manager_id
from employees 
where manager_id in ('120','103','145')
 
 --query17
 select * from employees 
 where first_name LIKE '%D%'OR first_name LIKE  '%S%'OR first_name LIKE  '%N%'

 --QUERY18
 select first_name+last_name full_name,hire_date,phone_number,salary
from employees 
where (salary>11000 )or (phone_number like'______3___')

--query19
select first_name+''+last_name full_name,department_id
from employees 
where first_name like '__s%'

--query20
select employee_id,first_name,job_id,department_id
from employees 
where department_id not in(5,3,8)

