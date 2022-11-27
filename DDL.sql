/* Crearea unei tabele */
CREATE TABLE owners (
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL
);

/* Adaugarea unei coloane intr-o tabela */
alter table owners
add column age int;


/* Stergerea unei coloane din tabela - doua instructiuni echivalente*/
alter table owners drop age;
alter table owners drop column age;

/* Modify poate sa modifice proprietatile unei coloane
!!! Daca in momentul in care executam instructiunea, 
nu specificam toate proprietatile pe care le-am
specificat la creare, ele vor fi sterse
*/

desc owners; -- arata structura tabelei 

alter table owners modify firstName char(25) not null;
alter table owners modify lastName char(25) not null;


/* Instructiunea de CHAMGE ne ajuta sa schimbam numele unei coloane */
alter table owners change lastName ownerLastName char(25) not null;

/* Instructiunea de RENAME ne ajuta sa schimbam numele tabelei */
alter table owners rename to petOwner;

/* Instructiunea de DROP TABLE sterge tabela impreuna cu toate informatiile */
-- drop table petOwner; -- !!! Se va sterge tabela impreuna cu toate informatiile din ea si nu se mai poate recupera

