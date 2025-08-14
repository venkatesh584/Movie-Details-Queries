/*Laptap table queries 
*/
create table laptop(lap_id int PRIMARY KEY, lap_name VARCHAR(100) NOT NULL,lap_model VARCHAR(100) NOT NULL);
select * from laptop;
alter table laptop RENAME lap_id to id;
alter table laptop add lap_price decimal(10,2) not null;
insert into laptop (id,lap_name,lap_model,lap_price) values (1,'Dell','Core i5',50000.00);
update laptop set lap_model ='CORE-i5' where id=1;

select e.id,e.emp_name,e.emp_company,e.emp_salary,e.emp_joining_date,l.lap_name,l.lap_model,l.lap_price
from employee e inner join laptop l on e.id=l.id;
