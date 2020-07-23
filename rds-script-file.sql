/* Connect to my instance from your preffered mysql cli or gui with the provided endpoint. Copy and paste these mysql query commands in and run the file to retrieve the data. */

select * from tekcampers;

select * from `ta-mark`;

select * from hobbies;

select * from hobbiesintagroup;

/* this is the join command used to link the ta-mark, hobbies and hobbiesintagroup tables and pull just first name, last name and the hobby associated with that person. */

select first_name, last_name, hobby from `ta-mark`
left join hobbiesintagroup
on `ta-mark`.id = hobbiesintagroup.person_id
left join hobbies
on hobbiesintagroup.hobby_id = hobbies.id;


/* below are the queries we had to make for #7 in the readme file */

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