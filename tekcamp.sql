/* Original database students -> tekcamp01 */

/* #2 I used the gui interface to create my personal database */

-- create table tekcampers AS 
-- select * from students.tekcamp01;

-- select * from tekcampers;

-- DELETE FROM tekcampers where (id = 9 or id = 20 or id = 26);

-- INSERT INTO tekcampers (first_name, last_name, gender, education) 
-- values
-- ('Cody', 'Clark', 'M', null),
-- ('Aaron', 'White', 'M', null),
-- ('Monica', 'Howard', 'F', null),
-- ('Kevin', 'Keesee', 'M', null),
-- ('Devon', 'Brewster', 'M', null),
-- ('John', 'Bozarov', 'M', null),
-- ('John', 'Kol', 'M', null),
-- ('Justin', 'Cheng', 'M', null),
-- ('Tyler', 'Clements', 'M', null),
-- ('Vimala', 'Murthy', 'F', null),
-- ('Gowtham', 'Katta', 'M', null)
-- ;


-- update tekcampers
-- set gender = education
-- where id BETWEEN 1 and 27;

-- update tekcampers
-- set education = null
-- where id between 1 and 38;

-- update tekcampers
-- set gender = "F"
-- where (id=4 or id=10);

-- update tekcampers
-- set gender = "M"
-- where (id=2 or id=15 or id=22 or id=24);

-- update tekcampers
-- set education = "High School"
-- where (id=14 or id=25 or id=31);

-- update tekcampers
-- set education = "Some College"
-- where (id=7 or id=12 or id=15 or id=19 or id=24 or id=28 or id=35 or id=32);

-- update tekcampers
-- set education = "Associates"
-- where (id=8 or id=17);

-- update tekcampers
-- set education = "Bachelors"
-- where (id=1 or id=4 or id=5 or id=6 or id=11 or id=16 or id=18 or id=33 or id=38 or id=36);

-- update tekcampers
-- set education = "Masters"
-- where (id=21 or id=37 or id=3);

-- update tekcampers
-- set education = "Doctorate"
-- where id=10;

-- select * from tekcampers
-- where length(last_name) > 7;

-- select * from tekcampers
-- order by first_name;

-- select * from tekcampers
-- order by last_name;

-- select * from tekcampers
-- where gender = 'M';

-- select * from tekcampers
-- where gender = 'F';

-- select * from tekcampers
-- where education = 'Masters';

-- select * from tekcampers
-- where education = 'Bachelors';

-- select * from tekcampers
-- where education = 'Associates';

-- select * from tekcampers
-- where (education is null or education = 'High School' or education = 'Some College');


-- create table `ta-mark` AS 
-- select * from tekcampers
-- where (id=8 or id=21 or id=23 or id=25 or id=27 or id=28 or id=29 or id=31 or id=33 or id=35 or id=36 or id=38);

-- select * from `ta-mark`;

-- create table hobbies(
-- id int auto_increment primary key,
-- hobby varchar(100)
-- );

-- insert into hobbies(hobby)
-- values
-- ("Reading"),
-- ("Motorcycle Riding"),
-- ("Video Games"),
-- ("Golfing"),
-- ("Cattle Rustling"),
-- ("Gardening"),
-- ("Aerial Yoga"),
-- ("Running"),
-- ("Working Out"),
-- ("Pickle Ball"),
-- ("Engineering projects with the kids"),
-- ("Jiu Jitsu"),
-- ("Writing"),
-- ("Cooking"),
-- ("Eating"),
-- ("Music"),
-- ("Hockey"),
-- ("Soccer"),
-- ("Longboarding"),
-- ("Growing Peppers");

-- select * from hobbies;

-- create table hobbiesintagroup(
-- person_id int not null references `ta-mark`(id), 
-- hobby_id int not null references `ta-mark`(hobby_id)
-- );

-- insert into hobbiesintagroup(person_id, hobby_id)
-- values 
-- (38, 8)
-- (31, 3),
-- (28, 14),
-- (8, 15),
-- (35, 15),
-- (25, 17),
-- (33, 18),
-- (21, 19),
-- (36, 20)
-- ;

-- select * from hobbiesintagroup;


-- select first_name, last_name, hobby from `ta-mark`
-- left join hobbiesintagroup
-- on `ta-mark`.id = hobbiesintagroup.person_id
-- left join hobbies
-- on hobbiesintagroup.hobby_id = hobbies.id;

-- alter table tekcampers
-- add column bootcamp varchar(50);

-- alter table `ta-mark`
-- add column bootcamp varchar(50);










