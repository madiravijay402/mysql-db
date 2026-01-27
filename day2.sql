use 2pmbatch;

create table employees(
employee_id int primary key auto_increment,
emp_name varchar(50) not null,
department varchar(50) not null,
salary decimal(10,2) check(salary>0),
email varchar(100) unique,
hire_date date,
status varchar(20) default "active"
);


insert into employees(emp_name,department,salary,email,hire_date,status)
values('vijay','IT',400000,"vj@gmail.com",'2026-03-12','active');

insert into employees(emp_name,department,salary,email,hire_date,status)
values
('teja','networking',600000,'dfds@gmail.com','2023-09-12','active'),
('ravi','it',550000,'ravi.it@gmail.com','2022-06-15','active'),
('sita','hr',420000,'sita.hr@gmail.com','2021-03-10','active'),
('arjun','finance',600000,'arjun.fin@gmail.com','2020-11-25','active'),
('neha','marketing',480000,'neha.mkt@gmail.com','2023-01-05','probation'),
('kiran','it',700000,'kiran.it@gmail.com','2019-08-19','active'),
('anjali','sales',450000,'anjali.sales@gmail.com','2022-02-14','active'),
('vamsi','operations',520000,'vamsi.ops@gmail.com','2021-12-01','resigned')
;
select*from employees;

select emp_name,salary
from employees
order by salary desc;

select*from employees
where status="active";

select emp_name,hire_date
from employees
where status='active' and department='finance';

select emp_name,hire_date
from employees
where status='active' or department='finance';

select emp_name,hire_date,department
from employees
where not status='inactive' or not department='finance';

select emp_name,hire_date,department,salary
from employees
where salary between 300000 and 500000;

select emp_name,hire_date,department,salary
from employees
where department in('it','hr');

select*from employees
where email like '%.ops@%';

select distinct department from employees;

