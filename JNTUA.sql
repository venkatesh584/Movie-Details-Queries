select * from students;
insert into students(st_name,st_cource)values('Rajesh','Inter');
update students set st_cource='BTECH' where st_id=1;
alter table student RENAME column st_branch  to  st_cource;
alter table student alter column st_cource  type char(10);
alter table student rename  to students;
alter table students  add st_id varchar(20) primary key;
delete from students where st_id=3;
update 
--------------------------------------------------------------------------
create table cources(cource_id char(10),branch char(10));
select * from jntua.public.cources;
insert into cources (cource_id,branch,proficers) values('BTECH','CIVIL');
alter table cources add proficers char(20) DEFAULT  'Ramesh';
alter table cources TRUNCATE COLUMN proficers;
alter table cources rename column proficers to st_proficer_name;
alter table cources alter column st_proficer_name type char(10);
alter table cources drop COLUMN if exists st_proficer_name;
select s.st_id,s.st_name,s.st_cource,c.branch from students s inner join cources c on s.st_cource = c.cource_id;


select * from pg_roles;

create user venkatesh with password 'Venkatesh@127';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO venkatesh;

create SCHEMA school;
create table school.student(id int primary key GENERATED ALWAYS as identity, name char(10) not null);
select * from school.student;

start TRANSACTION;
insert into cources (cource_id,branch,proficers) values('DEGREE','DIPLAMA','Rajesh');
commit;

select * from cources;

discribe cources;

create table school.student1(id int unique,name char(10) not null);

select * from school.student1 order by id is not null;
insert into school.student1(name)values('RAJ');

create table school.student2(id int, st_name varchar(20), primary key(id,st_name));

select * from school.student2;

insert into school.student2 (id,st_name) values(1,'RAM'),(2,'RAM'),(1,'Rajesh');

select concat(id,st_name) as fullName from school.student2 where id=1;

---------------------------This query split the strings-----------------------------------------------------------
select split_part(email_id,'@',-1) as getmail_tail, 
concat(student_name,',',branch,',',cgpa,',',email_id) as total_student_data 
from student;

select student_name || ',' || branch || ','||cgpa|| ',' || email_id as total_student_data, 
split_part(email_id,'@',-1) as getmail_tail
from public.student;

---------------------------------Replace and trim for Strings-------------------------------------------------------------------
select *, REPLACE ('Raji','i','') as changename,replace('raji@yahoo.com','i','') as changemail
from student where student_name='Raji';

select REPLACE(student_name,' ','') from student where student_name='Sreenu Tumati';
select *,trim(' sam ') from student where student_name=' sam ';
----------------------------------Replace spaces by using REGEXP_REPLACE Method-----------------------------------------------------------
select REGEXP_REPLACE(initcap(student_name),'\s','','g')from student;

select lower(left(regexp_replace(initcap(student_name),'\s','','g'),1)) ||
SUBSTRING(REGEXP_REPLACE(INITCAP(student_name), '\s', '', 'g') FROM 2) from student;

select substring(student_name from 2 for 4) from student;

select right(student_name,2) from student;
select rpad(student_name,19,'#') from student;
select lpad(student_name,19,'#') from student;

select strpos(email_id,'@') as positions from student;

select position ('@' in email_id) from student;

select reverse(student_name) as reverse_name,reverse(email_id) as reverse_mailid from student;

SELECT TO_CHAR(1234567890.9, '9,99,99,99,990.00');
select round(12.99,2);

CREATE OR REPLACE FUNCTION add_numbers(a int, b int)
RETURNS int
LANGUAGE sql
AS $$
    SELECT a + b;
$$;

select add_numbers(3, 5);

create or replace function addTwoNumbers(a int, b int) returns int language sql as $$ select a+b$$;

select addtwonumbers(10, 10);

select exp(2);

select abs(-20.99) as absolutevalue;
select ceil(20.1);

select power(3,2);