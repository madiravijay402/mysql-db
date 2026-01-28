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

create table departments(
dept_id int primary key auto_increment,
dept_name varchar(50) unique not null,
location varchar(50)
);
INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'Hyderabad'),
('Finance', 'Bengaluru'),
('IT', 'Chennai'),
('Marketing', 'Mumbai'),
('Sales', 'Delhi'),
('Operations', 'Pune'),
('Customer Support', 'Kolkata');

select*from departments;

create table emp(
emp_id int primary key auto_increment,
emp_name varchar(50) not null,
email varchar(100) unique,
phone varchar(15),
salary decimal(10,2) check(salary>0),
hire_date date,
dept_id int,
status enum("active","inactive") default "active",
foreign key (dept_id) references departments(dept_id)
);
INSERT INTO emp (emp_name, email, phone, salary, hire_date, dept_id, status) VALUES
('Teja', 'teja@gmail.com', '9876543210', 45000.00, '2023-06-15', 3, 'active'),
('Ramesh', 'ramesh@gmail.com', '9123456780', 52000.00, '2022-03-10', 1, 'active'),
('Suresh', 'suresh@gmail.com', '9012345678', 60000.00, '2021-11-25', 2, 'active'),
('Kiran', 'kiran@gmail.com', '9988776655', 38000.00, '2024-01-05', 5, 'active'),
('Arjun', 'arjun@gmail.com', '8899776655', 72000.00, '2020-08-18', 4, 'inactive'),
('Nikhil', 'nikhil@gmail.com', '7766554433', 50000.00, '2022-12-01', 6, 'active'),
('Rahul', 'rahul@gmail.com', '6655443322', 42000.00, '2023-09-20', 7, 'active');

select*from emp;
select*from departments;
 
  CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE employee_roles (
    emp_id INT,
    role_id INT,
    PRIMARY KEY (emp_id, role_id),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deductions DECIMAL(10,2),
    pay_date DATE,
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    attendance_date DATE,
    status ENUM('Present','Absent','Leave'),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id)
);


INSERT INTO roles (role_name) VALUES
('Developer'),
('HR Manager'),
('Accountant'),
('Sales Executive');


INSERT INTO employee_roles VALUES
(1,1),
(2,2),
(3,1),
(4,3);


INSERT INTO payroll (emp_id, basic_salary, bonus, deductions, pay_date)
VALUES
(1,30000,5000,2000,'2024-01-31'),
(2,28000,3000,1500,'2024-01-31'),
(3,45000,7000,3000,'2024-01-31');


