rename table petOwner to owners;
alter table owners change ownerLastName lastName varchar (25);
alter table owners add column dateOfBirth date;

-- Instructiune de insert
insert into owners (firstName, lastName, dateOfBirth)
values ('Jim', 'Jameson', '1980-01-31');

-- Instructiune de insert cu mai multe randuri inserate concomitent
insert into owners (firstName, lastName, dateOfBirth)
values ('Andrew', 'Smith', '1957-05-20'), ('Tom', 'Thomson', '1954-07-28');

-- Instructiune de insert fara specificarea coloanelor
/* Trebuie in cazul acesta sa specificam numarul exact de valori 
corespunzator numarului de coloane*/
insert into owners values ('Tom', 'Anderson', '1980-01-31');
insert into owners values ('Tom', 'Anderson'); -- va returna eroare: Error Code: 1136. Column count doesn't match value count at row 1

-- Verificam rezultatele instructiunii de insert
select * from owners;

------------------------------------------------

update owners set firstName = 'James'; -- punem la fiecare firstName-ul de James

-- Verificam rezultatele instructiunii de update
select * from owners;

------------------------------------------------
-- Stergerea tuturor inregistrarilor din tabela cu delete
delete from owners;

-- Verificam rezultatele instructiunii de delete
select * from owners;

------------------------------------------------
-- Stergerea tuturor inregistrarilor din tabela cu truncate
truncate table owners;

-- Verificam rezultatele instructiunii de truncate
select * from owners;

-- Diferenta dintre DELETE si TRUNCATE:
/* 
- Delete are capacitatea de a numara inregistrarile pe care le sterge, iar truncate sterge
fara a numara
- Cu Delete putem sa filtram si sa stergem doar anumite inregistrari, in timp ce la Truncate nu 
putem face filtrare
*/


