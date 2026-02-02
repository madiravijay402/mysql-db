use 2pmbatch;
create database tcs;
use tcs;
create table employees(
emp_id int primary key,
emp_name varchar(50) not null,
phone  varchar(10) unique,
hire_date date,
dept varchar(50),
salary decimal(10,2) check(salary>0) );

insert into employees(emp_id,emp_name,phone,hire_date,dept,salary)
values(1,'Vijay',9840680771,'12-05-26','developer',23420);
alter table employees
modify emp_id int auto_increment;

insert into employees(emp_name,phone,hire_date,dept,salary)
values('vetrimaran',9833392312,'26-06-12','lawyer',99999);

select*from employees;

alter table employees
add  emp_status varchar(50) default"active";

alter table employees
drop column reg_dt; 

select emp_name,salary
from employees
order by salary asc;

select emp_name,salary
from employees
where emp_status='inactive';

select emp_name, avg(salary) as Avg_sal from employees
group by emp_name
having avg(salary>30000);

INSERT INTO employees (emp_name, phone, hire_date, dept, salary, emp_status)
VALUES
('suraj', 9804392312, '2012-06-26', 'carpenter', 311414, 'active'),
('arun',       9123456789, '2015-03-18', 'hr',     45000, 'active'),
('kumar',      9876543210, '2018-11-05', 'it',     60000, 'active'),
('suresh',     9988776655, '2020-01-22', 'finance',55000, 'inactive'),
('raj',        9012345678, '2022-07-10', 'sales',  40000, 'active');

select*from employees;

update employees
set emp_status='inactive'
where emp_id=5;

select count(*) as total_emp
from employees;

select emp_name,salary
from employees
where salary>30000 and emp_status='active';

create table departments(
dept_id int primary key auto_increment,
dept_name varchar(50));

alter table employees add constraint employees_dept foreign key(dept_id) references departments(dept_id);

alter table employees add dept_id INT;

select e.emp_name,d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id;
