/* 
Employee Table Queries
*/

create table employee(id int primary key, emp_name VARCHAR(100) not null, emp_company VARCHAR(100) not null, 
emp_salary decimal(10,2) not null);
select * from employee;
alter table employee add emp_joining_date date not null;
insert into employee(id,emp_name,emp_company,emp_salary,emp_joining_date) 
values(1,'Venkatesh','TCS',25000.00,'2022-05-19');

select CURRENT_TIMESTAMP