create database scratch;
use scratch;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

alter table departments
modify dept_id int auto_increment;
insert into departments(dept_name)values('lawyer');

select*from departments;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Ravi', 50000, 1),
(102, 'Kiran', 60000, 1),
(103, 'Anil', 45000, 2),
(104, 'Sita', 70000, 3),
(105, 'Meena', 65000, 3),
(106,'vijay',890780,4),
(107,'ajith',999999,4);

select*from employees;
-- inner join
select e.emp_name,d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id;

-- cte and windows function
-- windows

select emp_name,salary,
row_number() over(order by salary desc) as row_no
from employees;

select emp_name,salary,
rank() over(order by salary desc)as rank_no
from employees;

SELECT emp_name, salary, dept_id,
ROW_NUMBER() OVER (
    PARTITION BY dept_id
    ORDER BY salary DESC
) AS dept_rank
FROM employees;

SELECT emp_name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS drnk
FROM employees;

SELECT emp_name, salary,
AVG(salary) OVER () AS avg_salary
FROM employees;

-- cte

with avg_sal as(
    select avg(salary) as avg_salary
    from employees
)
select emp_name,salary
from employees
where salary>(select avg_salary from avg_sal);

-- cte + windows
with ranked_emp as(
select emp_name,salary,rank() over(order by salary) as Rank_no
from employees
)
select*from ranked_emp;

WITH ranked_osa AS (
    SELECT emp_name, salary, dept_id,
    ROW_NUMBER() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS rn
    FROM employees
)
SELECT emp_name, salary, dept_id
FROM ranked_osa
WHERE rn = 1;

WITH ranked_emp AS (
    SELECT emp_name, salary, dept_id,
    DENSE_RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
),
top_emp AS (
    SELECT emp_name, salary, dept_id
    FROM ranked_emp
    WHERE rnk = 1
)
SELECT * FROM top_emp;

-- view

create view Emp_basic_view as
select emp_name,salary,dept_id
from employees;

select*from Emp_basic_view;

CREATE VIEW emp_dept_view AS
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

select*from emp
;
create view filter_copy as
select emp_name,salary,
dense_rank() over(order by salary desc) as rank_no
from employees;

select*from filter_copy;

-- update view -- allowe but shouldnt use windows,no group by and should be a single table

UPDATE emp_basic_view
SET salary = 55000
WHERE emp_id = '101';

-- stored procdeures

delimiter $$
create procedure get_employee()
begin
select emp_name,salary
from employees;
end $$
delimiter ;

drop procedure get_employee;
call get_employee;

-- input 

delimiter $$
create procedure get_emp_deptid(in d_id int)
begin
select emp_name,salary
from employees
where dept_id=d_id;
end $$
delimiter ;

call get_emp_deptid(2);

-- output

delimiter $$
create procedure get_out(out total int)
begin 
select count(*) into total
from employees;
end $$
delimiter ;

call get_out(@ntc);
select @ntc;