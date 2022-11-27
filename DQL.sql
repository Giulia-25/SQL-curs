select * from owners;

select firstName, lastName from owners;
select firstName, dateOfBirth from owners;

insert into owners (firstName, lastName, dateOfBirth, age)
values ('Anton', 'Popescu', '1973-06-25', 47), ('Marin', 'Antonescu', '1967-01-21', 54), ('Ion', 'Ionescu', '1975-06-02', 25), ('John', 'Andreescu', '1924-07-24', 45);

insert into owners (firstName, lastName, dateOfBirth, age)
values ('Winston', 'Churchill', '1898-06-06', 47);


alter table owners add column city varchar(50);

update owners set city = 'Cluj' where firstName = 'Ion';
update owners set dateOfBirth = '1898-05-06' where firstName = 'Winston';

select * from owners where dateOfBirth > '1970-12-31';
select * from owners where age = 25;
select * from owners where age > 25;
select * from owners where age >= 25;
select * from owners where age < 25;
select * from owners where age <= 25;

select * from owners where firstname in ('Ion', 'Marin');
select * from owners where firstname not in ('Ion', 'Marin');
select * from owners where city is null;
select * from owners where city is not null;

select * from owners where age != 25;
select * from owners where firstName != 'Ion';
select * from owners where firstName <> 'John';

select * from owners where age between 45 and 54;
select * from owners where age between 46 and 53;

select * from owners where firstName like 'i%';
select * from owners where firstName like '%on';
select * from owners where firstName like '%o%';

select * from owners where dateOfBirth like '1975%';
select * from owners where dateOfBirth like '197%';
select * from owners where dateOfBirth like '19%';
select * from owners where dateOfBirth like '%02';
select * from owners where dateOfBirth like '%06%';
select * from owners where dateOfBirth like '%-06-%';

select * from owners 
where firstName like '%on' 
and dateOfBirth like '197%';

select * from owners 
where firstName like '%on' 
or dateOfBirth like '197%';

select * from owners 
where firstName like '%on' 
or dateOfBirth like '197%'
and city = 'Cluj';

select * from owners 
where (firstName like '%on' 
or dateOfBirth like '197%')
and city = 'Cluj'; -- prioritate are and inaintea lui or

select sum(age) from owners;
select avg(age) from owners;
select min(age) from owners;

-- select firstName, lastName, min(age) from owners
-- group by firstName, lastName;

select max(age) from owners;
select count(*) from owners;
select count(city) from owners;


