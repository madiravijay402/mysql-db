use 2pmbatch;
select count(*) as total_employees
from employees;

select sum(salary) as Total_salary
from employees
;
select department,sum(salary) as Dept_tot_sal
from employees
group by department;

select min(salary) as min_sal,max(salary) as max_sal
from employees
;
select department ,count(*) as emp_count
from employees
group by department;

select department ,count(*) as emp_count
from employees
group by department
having count(*)>2;

select*from employees
order by salary desc;

select*from employees
order by department desc,salary asc;

select department, avg(salary) as avg_sal
from employees
group by department
order by avg_sal asc
limit 3;

select department, avg(salary) as avg_sal
from employees
where status="active"
group by department
;

