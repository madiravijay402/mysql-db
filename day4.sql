-- database normalization is normal form 
use 2pmbatch;
-- 1nf culture atomic values only one fact per person
-- 2nf no partial dependancy,must be part of 1nf, 



-- non-key column should not depend on other non key column
-- 3nf no non key non-key-dependency

select emp_name,salary
from emp
where salary>(select avg(salary)
from emp);
select*from emp;

select emp_name,salary
from emp
where salary=(select max(salary) from emp);

select emp_name
from emp
where dept_id in(select dept_id from departments where location='chennai');

select*from departments;

-- select emp_name,salary
-- from emp e
-- where salary>(
-- select avg(salary) 
-- from emp 
-- dept_id=e.dept_id
-- )
SELECT emp_name, salary
FROM emp e
WHERE salary > (
    SELECT AVG(salary)
    FROM emp
    WHERE dept_id = e.dept_id
);
-- co-related