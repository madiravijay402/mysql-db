-- Window Functions (SQL) are functions that perform calculations across a 
-- set of rows related to the current row, without collapsing rows like GROUP BY.

-- group by reduce rows 
-- window function will keep rows same

use 2pmbatch;

-- function name() over(
-- partition by column
-- order by column
-- )

select emp_name,dept_id,salary,
ROW_NUMBER() over (order by salary desc) as row_numb
from emp;

SELECT emp_name,dept_id,salary,
row_number() over (partition by dept_id order by salary desc) as dept_rank
from emp;

select emp_name,salary,
rank() over(order by salary desc) as rank_salary
from emp;

select emp_name,salary,
dense_rank() over(order by salary asc) as rank_salary
from emp;

-- without using group by

select emp_name,dept_id,salary,
avg(salary) over(partition by dept_id) as avg_salary
from emp;

select emp_name,hire_date,salary,
sum(salary) over(order by hire_date) as runing_total
from emp;

--  CTE is a temporary named result set
--  used inside a SQL query to make complex queries clean, readable, and reusable.

-- cte- common table expression

with avg_salary as(
select avg(salary) as avg_salar
from emp
)
select emp_name,salary
from emp
where salary>(select avg_salar from avg_salary);

with ranked_emp as(
select emp_name,dept_id,salary,
row_number() over(partition by dept_id order by salary desc)as rn
from emp
)
select emp_name,dept_id,salary
from ranked_emp
where rn<=2;

with sum_sal as(
select emp_name,dept_id,salary,
sum(salary) over(order by salary) as sums
from emp
)
high_paid as(
select e.emp_name,e.salary,d.sum_sal
from emp e
join dept_avg d

with ranked_emp as(
select emp_name,dept_id,salary,
row_number() over(partition by dept_id order by salary desc)as rn
from emp
)
select*from ranked_emp 


