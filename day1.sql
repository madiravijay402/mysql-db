create database 2pmbatch;
-- create read update delete
-- not case sensitivecustomer_list
-- create table table_name(
-- coloumn datatype,
-- coloumn datatype,)
use 2pmbatch;
create table students(
id int primary key,
name varchar(50) not null,
age int check(age>=18),
email varchar(100) unique,
status varchar(20) default "active");

insert into students(id,name,age,email)
values(
 1,"vijay",22,"vijaymadira681@gmail.com");
 
 alter table students add phone varchar(15);
--  insert into students(phone)
--  values(9840680771);
alter table students
modify id int auto_increment;
 
 insert into students(name,age,email,status)
 values("tanoj",22,"tj@gmail.com","active");
 
 update students
 set phone=9840680771
 where id=1;
 select email,phone from students;
 
 
 select*from students;
 