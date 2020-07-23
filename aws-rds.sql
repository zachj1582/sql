/* Setting up the RDS database:

My RDS info:

RDS endpoint: (db-module11-zach-johnson.csu5hk3jzveb.us-east-2.rds.amazonaws.com)

user: admin
password: slack me for password

I chose RDS for a couple of reasons, one AWS is such an important tool to have and know in the tech field these days. And 2 Amir always talks about how much he loves AWS so I had to check it out for myself. 

This was not a simple task, creating the account and the instance itself was very straight forward. But when it came to connecting to the instance from workbench is where it got tricky. Had to do a lot of troubleshooting and googling to finally get it to go. https://stackoverflow.com/questions/16488135/unable-to-connect-mysql-workbench-to-rds-instance this stack thread is where I finally found the answer. To sum up, had to change the inboud security rules to allow my IP address to connect and added a third rule making it open to all. Not sure if both work since I did them both. Once I had workbench connected then it was easy to create a new schema and then start adding tables. I populated the tables with all of the data from the get go so cut out a lot of the steps from exercise 1. I could also have done a mysql dump to transfer the data over from the first exercise but wasn't sure that was what you wanted to see, so I didn't. And below is the sql commands I used: */ 

create table tekcampers(
id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
gender varchar(10),
education varchar(50),
bootcamp varchar(50)
);

insert into tekcampers(first_name, last_name, gender, education, bootcamp)
values 
('Abigail','Swigert','F','Bachelors',NULL),
('Gabe','Chavez','M',NULL,'Us Navy'),
('Nancy','Golden','F','Masters',NULL),
('Jessica','Ulysse','F','Bachelors',NULL),
('Sabitha','Radhakrishnan','F','Bachelors',NULL),
('Adam','Rice','M','Bachelors','Coding Dojo'),
('Marcelo','Barbosa','M','Some College','Coding Dojo'),
('Caleb','Waters','M','Associates',NULL),
('Norita','Sieffert','F','Doctorate',NULL),
('Katherine','Kim','F','Bachelors',NULL),
('Julian','Ladd','M','Some College','Coding Dojo'),
('Vani','Muppuru','F','Masters',NULL),
('Kevin','Ibanez','M','High School',NULL),
('George','Torres','M','Some College',NULL),
('Jose','Moreno','M','Bachelors',NULL),
('Phoenix','Shane','F','Associates','DevMountain'),
('Mathew','Castiglione','M','Bachelors',NULL),
('Victor','Betts','M','Some College',NULL),
('Mathew','Choat','M','Masters','SMU Coding'),
('Michael','Kinney','M',NULL,NULL),
('Korey','Brooks','M','Masters',NULL),
('Christian','Gonzalez','M','Some College',NULL),
('Zachary','Johnson','M','High School','DevMountain'),
('Sarah','Bates','F',NULL,NULL),
('Cody','Clark','M','Some College','Trilogy Education'),
('Aaron','White','M',NULL,NULL),
('Monica','Howard','F',NULL,NULL),
('Kevin','Keesee','M','High School',NULL),
('Devon','Brewster','M','Some College',NULL),
('John','Bozarov','M','Bachelors',NULL),
('John','Kol','M','Some College',NULL),
('Justin','Cheng','M','Some College','Trilogy Education'),
('Tyler','Clements','M','Bachelors',NULL),
('Vimala','Murthy','F','Masters',NULL),
('Gowtham','Katta','M','Bachelors',NULL);

select * from tekcampers
where length(last_name) > 7;

select * from tekcampers
order by first_name;

select * from tekcampers
order by last_name;

select * from tekcampers
where gender = 'M';

select * from tekcampers
where gender = 'F';

select * from tekcampers
where education = 'Masters';

select * from tekcampers
where education = 'Bachelors';

select * from tekcampers
where education = 'Associates';

select * from tekcampers
where (education is null or education = 'High School' or education = 'Some College');


create table `ta-mark` AS 
select * from tekcampers
where (id=8 or id=19 or id=23 or id=24 or id=25 or id=26 or id=28 or id=30 or id=32 or id=33 or id=35 or id=21);

create table hobbies(
id int auto_increment primary key,
hobby varchar(100)
);

insert into hobbies(hobby)
values
("Reading"),
("Motorcycle Riding"),
("Video Games"),
("Golfing"),
("Cattle Rustling"),
("Gardening"),
("Aerial Yoga"),
("Running"),
("Working Out"),
("Pickle Ball"),
("Engineering projects with the kids"),
("Jiu Jitsu"),
("Writing"),
("Cooking"),
("Eating"),
("Music"),
("Hockey"),
("Soccer"),
("Longboarding"),
("Growing Peppers"),
("Interior Design"),
("Piano"),
("Eat Sleep Code!");


create table hobbiesintagroup(
person_id int not null references `ta-mark`(id), 
hobby_id int not null references `ta-mark`(hobby_id)
);

insert into hobbiesintagroup(person_id, hobby_id)
values 
(8, 15),
(21, 22),
(23, 17),
(25, 14),
(19, 19),
(24, 1),
(26, 1),
(28, 3),
(30, 18),
(32, 15),
(33, 20),
(35, 8);


select first_name, last_name, hobby from `ta-mark`
left join hobbiesintagroup
on `ta-mark`.id = hobbiesintagroup.person_id
left join hobbies
on hobbiesintagroup.hobby_id = hobbies.id;