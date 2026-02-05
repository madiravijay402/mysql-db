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