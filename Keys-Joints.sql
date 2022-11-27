alter table owners add column ownerid int primary key auto_increment;

alter table owners modify column ownerid int auto_increment first;
desc owners; -- prescurtarea de la describe

select * from owners;
insert into owners (firstname, lastname, dateofbirth, age) values ('Anton', 'Pann', '1823-04-17', 95);
insert into owners (firstname, lastname, dateofbirth, age) values ('Anton', 'Pann', '1823-04-17', 95);



create table pets (
petid int not null auto_increment,
race varchar (45) not null,
dateOfBirth date not null,
ownerid int not null,
primary key (petid),
constraint fk_pets_owners foreign key (ownerid) references owners(ownerid)
);

select * from owners;
select * from pets;

insert into pets (race, dateofbirth, ownerid)
values ('european', '2020-02-15', 11);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`petclinic`.`pets`, CONSTRAINT `fk_pets_owners` FOREIGN KEY (`ownerid`) REFERENCES `owners` (`ownerid`))

insert into pets (race, dateofbirth, ownerid)
values ('european', '2020-02-15', 6);

insert into pets (race, dateofbirth, ownerid)
values ('spitz', '2021-12-07', 6);

insert into pets (race, dateofbirth, ownerid)
values ('dog german', '2015-07-05', 3);

insert into pets (race, dateofbirth, ownerid)
values ('pisica norvegiana', '2016-06-03', 3);

delete from owners where ownerid = 7;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`petclinic`.`pets`, CONSTRAINT `fk_pets_owners` FOREIGN KEY (`ownerid`) REFERENCES `owners` (`ownerid`))

delete from pets where ownerid = 3;
delete from owners where ownerid = 7;

select * from owners;
select * from pets;

select * from owners cross join pets on owners.ownerid = pets.ownerid;
select * from owners cross join pets; -- sau varianta mai simpla ar fi

select * from owners inner join pets on owners.ownerid = pets.ownerid;

select * from owners left join pets on owners.ownerid = pets.ownerid;

select * from owners left join pets on owners.ownerid = pets.ownerid where pets.ownerid is null;

select * from owners left join pets on owners.ownerid = pets.ownerid where pets.ownerid is not null; -- rezultatele sunt identice cu inner join

-- Instructiuni echivalente
select * from owners right join pets on owners.ownerid = pets.ownerid;
select * from pets left join owners on owners.ownerid = pets.ownerid;

select * from owners right join pets on owners.ownerid = pets.ownerid where owners.ownerid is null;
select * from owners right join pets on owners.ownerid = pets.ownerid where owners.ownerid is not null;

-- Cross Join = Se vor aduce toate combinatiile intre inregistrarile din tabela din dreapta si cea din stanga
-- Inner Join = Se vor aduce toate datele care exista in ambele tabele, comparatia facandu-se pe coloana pe care se face conditia de join
-- Left Join = Se aduc toate inregistrarile din tabela din stanga si se compara cu cele din dreapta
		-- Astfel se vor aduce toate randurile din tabela din stanga, iar pe coloanele aferente tabelei din dreapta se va completa doar pt randurile care au echivalent
        -- (adica cele a caror cheie primara exista in tabela din dreapta)
-- Right Join = se aduc toate inregistrarile din tabela din dreapta si se compara cu cele din stanga
		-- Astfel se vor aduce toate randurile din tabela din dreapta, iar pe coloanele aferente tabelei din stanga se va completa doar pt randurile care au echivalent
        -- (adica cele a caror cheie primara exista in tabela din stanga)


select * from owners;
select * from pets;
select * from owners order by dateOfBirth; -- sortarea se face by default ascendent
select * from owners order by dateOfBirth desc; -- desc = descendent
select * from owners order by age desc limit 1;
select max(age) from owners;

select o.ownerid, firstName, lastName, count(petid)
from owners o inner join pets p on o.ownerid = p.ownerid
group by o.ownerid, firstName, lastName;

select * from owners;
select * from pets;

select o.ownerid, firstName, lastName, count(petid)
from owners o inner join pets p on o.ownerid = p.ownerid
where count(petid) > 2
group by o.ownerid, firstName, lastName;
-- Error Code: 1111. Invalid use of group function

select o.ownerid, firstName, lastName, count(petid)
from owners o inner join pets p on o.ownerid = p.ownerid
group by o.ownerid, firstName, lastName
having count(petid) > 2;

-- In mod normal filtrarea se face cu clauza where, singura exceptie fiind functiile agregate care se pot filtra doar cu clauza having


select * from owners o inner join pets p on ownerid = ownerid;
-- Error Code: 1052. Column 'ownerid' in on clause is ambiguous
select * from owners inner join pets on owners.ownerid = pets.ownerid;
select * from owners o inner join pets p on o.ownerid = p.ownerid;

select ownerid, firstName, lastName, race, dateOfBirth from owners o inner join pets p on o.ownerid = p.ownerid;
-- Error Code: 1052. Column 'ownerid' in field list is ambiguous
select o.ownerid, firstName, lastName, race, dateOfBirth from owners o inner join pets p on o.ownerid = p.ownerid;
-- Error Code: 1052. Column 'dateOfBirth' in field list is ambiguous
select o.ownerid, firstName, lastName, race, o.dateOfBirth from owners o inner join pets p on o.ownerid = p.ownerid;
select o.ownerid, firstName, lastName, race, o.dateOfBirth ownerBirthdate, p.dateOfBirth petBirthdate 
from owners o inner join pets p on o.ownerid = p.ownerid;



