create table movielists(movie_name varchar(20),movie_release_date date,movie_cast varchar(250));
create table direction(movie_name varchar(20),movie_director_name varchar(20),director_age numeric,director_hometown varchar(20));
create table review(movie_name varchar(20),imbd decimal(2,2),review_comments varchar(250));
select * from movielists order by movie_release_date;
select * from direction;
select * from review;
alter table review alter COLUMN imbd type decimal(4,2);

alter table movielists add column movie_img bytea;
update movielists set movie_img= 'https://1drv.ms/i/c/156c1054e61062de/EaCd6RtwO8ZOmJqegP8lYf4BjO6MhPL0gVfcaviBDkmB9A?e=SYUtDO' 
where movielists.movie_release_date='2001-05-23';

select movie_img from movielists where movie_img is not null;

insert into movielists (movie_name,movie_release_date,movie_cast,movie_result) 
values
('Ninnu Choodalani','2001-05-23','N.T. Rama Rao Jr. , Raveena Rajput, Kaikala Satyanarayana,M.S. Narayana','Flap'),
('Aadi','2002-03-28','N.T. Rama Rao Jr,','Hit'),
('Rakhi','2006-08-09','N.T. Rama Rao Jr,','Hit'),
('Baadshah','2013-04-05','N.T. Rama Rao Jr,','Hit'),
('Oosaravelli','2011-10-06','N.T. Rama Rao Jr,','Average'),
('Brindavanam','2010-10-14','N.T. Rama Rao Jr,','Hit'),
('Yamadonga','2007-08-15','N.T. Rama Rao Jr,','Hit'),
('Temper','2015-02-13','N.T. Rama Rao Jr,','Super Hit'),
('Janatha Garage','2016-09-02','N.T. Rama Rao Jr., Mohanlal','Super Hit');

insert into direction(movie_name,movie_director_name,director_age,director_hometown,movie_result,about_director)
values
('Aadi','V. V. Vinayak.',27,'Dommeru','Hit','Gandrothu Veera Venkata Vinayaka Rao, better known as V. V. Vinayak (born 9 October 1974), is an Indian film director and screenwriter known for his work in Telugu cinema.'),
('Rakhi','Krishna Vamsi',44,'Tadepalligudem, Andhra Pradesh','Hit','Krishna Vamsi began his career as an assistant director to Ram Gopal Varma and made his directorial debut with the 1995 romantic crime film Gulabi.'),
('Baadshah','Sreenu Vaitla',40,'Kandulapalem near Ramachandrapuram','Hit','Indian film director and screenwriter known for his work in Telugu cinema, particularly in the action comedy genre.'),
('Oosaravelli','Surender Reddy',35,'Karimnagar district, Telangana','Hit','Surender Reddy is an Indian film director and screenwriter who works in Telugu cinema. He made his directorial debut with Athanokkade (2005), which won him Nandi Award for Best First Film of a Director.'),
('Brindavanam','Vamsi Paidipally',31,'Khanapur of Adilabad district,Telangana.','Hit','Indian film director and screenwriter who works predominantly in Telugu and a few Tamil films. He is best known for directing mainstream film works such as Munna (2007), Brindavanam (2010), Yevadu (2014), Oopiri (2016).'),
('Temper','S. S. Rajamouli',33,'Amareshwara Camp in Raichur district (present-day Karnataka state)','Hit','S. S. Rajamouli is an Indian film director and screenwriter who predominantly works in Telugu cinema. He is best known for his work in action, fantasy, and epic films. He has directed thirteen feature films so far. His films are typically characterised by their epic grandeur, unbridled heroism and larger-than-life characters. His films have themes and characters inspired from ancient Indian epics and are noted for their integration of the emotions in those ancient epics with visual grandeur.'),
('Yamadonga','Puri Jagannadh',48,'Bapiraju Kothapalli village of Anakapalli district in Andhra Pradesh.','Super Hit','Indian film director, screenwriter, and producer, who works primarily in the Telugu film Industry.'),
('Janatha Garage','Koratala Siva',41,'Pedakakani, Guntur District.','Super Hit','Indian film director and screenwriter who works in Telugu cinema. Siva has directed films such as Mirchi (2013), Srimanthudu (2015), Janatha Garage (2016), Bharat Ane Nenu (2018), and Devara: Part 1 (2024).');

insert into review(movie_name,imbd,review_comments,movie_result) 
values
('Aadi',7.3,'Super Movie, N.T.R Acting is awsome','Hit'),
('Rakhi',6.3,'Super Movie, N.T.R Acting is awsome','Hit'),
('Baadshah',6.3,'Super Movie, N.T.R Acting is awsome','Hit'),
('Oosaravelli',6.5,'Super Movie, N.T.R Acting is awsome','Hit'),
('Brindavanam',7.1,'Super Movie, N.T.R Acting is awsome','Hit'),
('Temper',7.4,'Super Movie, N.T.R Acting is awsome','Super Hit'),
('Yamadonga',7.2,'Super Movie, N.T.R Acting is awsome','Hit'),
('Janatha Garage',7.2,'Super Movie, N.T.R Acting is awsome','Hit');

--Join The Three Tables based on mvie_name column---
select m.movie_name,m.movie_result,r.imbd,d.movie_director_name,d.director_age,d.director_hometown,d.about_director 
from movielists m join direction d on m.movie_name=d.movie_name join review r on d.movie_name=r.movie_name;

select d.movie_name,d.movie_director_name,d.director_age,d.director_hometown,d.about_director,r.imbd,r.movie_result
from direction d join review r on d.movie_name= r.movie_name;

--View creation--
create VIEW Movie_Details as 
select m.movie_name,m.movie_release_date,m.movie_result,r.imbd,d.movie_director_name 
from movielists m join direction d on m.movie_name=d.movie_name join review r on d.movie_name=r.movie_name;

create view Director_Details as
select d.movie_name,d.movie_director_name,d.director_age,d.director_hometown,d.about_director,r.imbd,r.movie_result
from direction d join review r on d.movie_name= r.movie_name;
--view reslut--
select * from movie_details;
select * from director_details;
--CRUD Operation--
select max(imbd) as maximum,count(movie_result),movie_result,avg(imbd) as average from movie_details 
group by movie_result order by maximum desc;

select  max(director_age) as maxage, movie_director_name as director_name,movie_name
from director_details WHERE director_age IS NOT NULL 
group by movie_result,movie_director_name,movie_name
order by maxage desc LIMIT 1;
--nth Greatest value--
select DISTINCT imbd from movie_details order by imbd desc LIMIT 1 offset 2;

--Sub Queries--
select movie_name from director_details d where 
d.movie_name in (select movie_name from movie_details m where m.movie_director_name='S. S. Rajamouli');

--union---
select imbd from movie_details
union 
select imbd from director_details;

select imbd from movie_details
union all
select imbd from director_details;

select imbd from movie_details
intersect
select imbd from director_details order by imbd desc;

select imbd from movie_details
except
select imbd from director_details order by imbd desc;
--concat--
select DISTINCT m.movie_director_name ||' , '|| d.director_age as director
from movie_details m join director_details d on m.movie_director_name=d.movie_director_name
where d.director_age is not null;





