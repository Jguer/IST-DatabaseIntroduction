DROP TABLE IF EXISTS produced_indicator;


DROP TABLE IF EXISTS
INDICATOR;


DROP TABLE IF EXISTS radiography;


DROP TABLE IF EXISTS test_procedure;


DROP TABLE IF EXISTS performed;


DROP TABLE IF EXISTS vet_procedure;


DROP TABLE IF EXISTS prescription;


DROP TABLE IF EXISTS medication;


DROP TABLE IF EXISTS consult_diagnosis;


DROP TABLE IF EXISTS diagnosis_code;


DROP TABLE IF EXISTS participation;


DROP TABLE IF EXISTS consult;


DROP TABLE IF EXISTS animal;


DROP TABLE IF EXISTS generalization_species;


DROP TABLE IF EXISTS species;


DROP TABLE IF EXISTS client;


DROP TABLE IF EXISTS veterinary;


DROP TABLE IF EXISTS assistant;


DROP TABLE IF EXISTS phone_number;


DROP TABLE IF EXISTS person;


CREATE TABLE person (vat integer, name varchar(255),
address_street varchar(255),
address_city varchar(255),
address_zip varchar(255),
PRIMARY key(vat));


CREATE TABLE phone_number
(vat integer, phone integer, PRIMARY key(vat, phone),
FOREIGN key(vat) REFERENCES person(vat) ON DELETE CASCADE);


CREATE TABLE client
(vat integer, PRIMARY key(vat),
FOREIGN key(vat) REFERENCES person(vat) ON DELETE CASCADE);


CREATE TABLE veterinary
(vat integer, specialization varchar(255),
bio varchar(255),
PRIMARY key(vat),
FOREIGN key(vat) REFERENCES person(vat) ON DELETE CASCADE);


CREATE TABLE assistant
(vat integer, PRIMARY key(vat),
FOREIGN key(vat) REFERENCES person(vat) ON DELETE CASCADE);


CREATE TABLE species (name varchar(255),
description varchar(255),
PRIMARY key(name));


CREATE TABLE generalization_species (name1 varchar(255),
name2 varchar(255),
PRIMARY key(name1),
FOREIGN key(name1) REFERENCES species(name),
FOREIGN key(name2) REFERENCES species(name));


CREATE TABLE animal
(name varchar(255),
vat integer, species_name varchar(255),
colour varchar(255),
gender varchar(255),
birth_year integer, age integer, PRIMARY key(name, vat),
FOREIGN key(vat) REFERENCES client(vat) ON DELETE CASCADE,
FOREIGN key(species_name) REFERENCES species(name));


CREATE TABLE consult
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
s varchar(255),
o varchar(255),
a varchar(255),
p varchar(255),
vat_client integer, vat_vet integer, weight numeric(5,2),
CHECK (weight >= 0), PRIMARY key(name, vat_owner, date_timestamp),
FOREIGN key(name, vat_owner) REFERENCES animal(name, vat) ON DELETE CASCADE,
FOREIGN key(vat_client) REFERENCES client(vat) ON DELETE CASCADE,
FOREIGN key(vat_vet) REFERENCES veterinary(vat) ON DELETE CASCADE);


CREATE TABLE participation
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
vat_assistant integer, PRIMARY key(name, vat_owner, date_timestamp, vat_assistant),
FOREIGN key(name, vat_owner, date_timestamp) REFERENCES consult(name, vat_owner, date_timestamp) ON DELETE CASCADE,
FOREIGN key(vat_assistant) REFERENCES assistant(vat));


CREATE TABLE diagnosis_code (code varchar(255),
name varchar(255),
PRIMARY key(code));


CREATE TABLE consult_diagnosis
(code varchar(255),
name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
PRIMARY key(code, name, vat_owner, date_timestamp),
FOREIGN key(code) REFERENCES diagnosis_code(code) ON UPDATE CASCADE,
FOREIGN key(name, vat_owner, date_timestamp) REFERENCES consult(name, vat_owner, date_timestamp) ON DELETE CASCADE);


CREATE TABLE medication (name varchar(255),
lab varchar(255),
dosage varchar(255),
PRIMARY key(name, lab, dosage));


CREATE TABLE prescription
(code varchar(255),
name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
name_med varchar(255),
lab varchar(255),
dosage varchar(255),
regime varchar(255),
PRIMARY key(code, name, vat_owner, date_timestamp, name_med, lab, dosage),
FOREIGN key(code, name, vat_owner, date_timestamp) REFERENCES consult_diagnosis(code, name, vat_owner, date_timestamp) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN key(name_med, lab, dosage) REFERENCES medication(name, lab, dosage));


CREATE TABLE
INDICATOR (name varchar(255),
reference_value numeric(5,2),
units varchar(255),
description varchar(255),
PRIMARY key(name));


CREATE TABLE vet_procedure
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
num integer, description varchar(255),
PRIMARY key(name, vat_owner, date_timestamp, num),
FOREIGN key(name, vat_owner, date_timestamp) REFERENCES consult(name, vat_owner, date_timestamp) ON DELETE CASCADE);


CREATE TABLE performed
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
num integer, vat_assistant integer, PRIMARY key(name, vat_owner, date_timestamp, num, vat_assistant),
FOREIGN key(name, vat_owner, date_timestamp, num) REFERENCES vet_procedure(name, vat_owner, date_timestamp, num) ON DELETE CASCADE,
FOREIGN key(vat_assistant) REFERENCES assistant(vat));


CREATE TABLE radiography
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
num integer, FILE varchar(255),
PRIMARY key(name, vat_owner, date_timestamp, num),
FOREIGN key(name, vat_owner, date_timestamp, num) REFERENCES vet_procedure(name, vat_owner, date_timestamp, num) ON DELETE CASCADE);


CREATE TABLE test_procedure
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
num integer, TYPE varchar(5),
CHECK ((TYPE="blood")
OR (TYPE="urine")), PRIMARY key(name, vat_owner, date_timestamp, num),
FOREIGN key(name, vat_owner, date_timestamp, num) REFERENCES vet_procedure(name, vat_owner, date_timestamp, num) ON DELETE CASCADE);


CREATE TABLE produced_indicator
(name varchar(255),
vat_owner integer, date_timestamp TIMESTAMP,
num integer, indicator_name varchar(255),
value numeric(5,2),
PRIMARY key(name, vat_owner, date_timestamp, num, indicator_name),
FOREIGN key(name, vat_owner, date_timestamp, num) REFERENCES test_procedure(name, vat_owner, date_timestamp, num) ON DELETE CASCADE,
FOREIGN key(indicator_name) REFERENCES indicator(name));


INSERT INTO person (VAT,name,address_street,address_city,address_zip)
VALUES (293121444,
'John Smith',
'Rua Dona Amelia',
'Lisboa',
'1820-021'), (391286572,
'John Doe',
'Rua da Buraca',
'Buraca',
'1904-192'), (493232134,
'Jorge Serra',
'Rua da Damaia',
'Amadora',
'1904-192'), (921383212,
'Nuno Neves',
'Rua Alvaro Cunhal',
'Beja',
'1204-222'), (482121911,
'Damasio Silva',
'Rua Santo Estevao',
'Loulé',
'2204-019'), (812924465,
'Lajos Kossuth',
'Rua Sarmento Rosa 92',
'Loulé',
'2204-123'), (146252131,
'Alfred I, Prince of Windisch-Gratz',
'Rua Vieira Luis Filipe 19',
'Porto',
'6451-035'), (782333333,
'Jair Bolsonaro',
'Avenida da Liberdade 1',
'Brasilia',
'9324-031'), (692323322,
'Dilma Rouseff',
'Praça dos Combatentes 31',
'Rio de Janeiro',
'8208-818'), (562323322,
'Xana Toc',
'Avenida Rosa 1',
'Funchal',
'8111-555'), (587823329,
'Pedro Tomas',
'Rua de Marco',
'Loures',
'4525-105'), (121212746,
'Ricardo Pereira',
'Rua Jorge da Cunha 143',
'Abrunheira',
'1821-131'), (357812587,
'Tomas de Noronha',
'Rua do Irao',
'Faro',
'2021-700'), (667812587,
'Goncalo Rosa',
'Rua 1o Dezembro',
'Guarda',
'1021-700'), (735916821,
'Jean Doc',
'Avenida da Liberdade',
'Lisboa',
'1700-000'), (555916111,
'Afonsina de Albuquerque',
'Avenida do Conquistador',
'Guimaraes',
'2100-123');


INSERT INTO veterinary (VAT,specialization,bio)
VALUES (293121444,
"surgery",
"A very nice man"), (812924465,
"surgery",
"A very regal man"), (146252131,
"analysis",
"A very old man"), (735916821,
"cancer",
"A very wise man");


INSERT INTO client (VAT)
VALUES (293121444), (391286572), (493232134), (921383212), (482121911), (146252131), (782333333), (692323322), (587823329), (121212746), (357812587), (555916111);


INSERT INTO assistant (VAT)
VALUES (692323322), (562323322), (667812587), (555916111);


INSERT INTO species (name,description)
VALUES ("dobberman",
"very german"), ("chiwawa",
"very... small"), ("tibetan mastiff",
"very tibetan"), ("mastiff",
"not tibetan"), ("baiano",
"From the warm waters"), ("cao de agua",
"Fuzzy and warm"), ("dog",
"man's best friend"), ("mockingbird",
"small bird"), ("blackbird",
"bird that is black"), ("abyssinian",
"ethiopian cat"), ("aegean",
"greek cat"), ("cat",
"man's second best friend");


INSERT INTO generalization_species (name1, name2)
VALUES ("dobberman",
"dog"), ("chiwawa",
"dog"), ("tibetan mastiff",
"dog"), ("mastiff",
"dog"), ("baiano",
"dog"), ("cao de agua",
"dog"), ("abyssinian",
"cat"), ("aegean",
"cat");


INSERT INTO animal
VALUES ("bobi",
482121911,
"mastiff",
"black",
"male",
1995,
23), ("gros bobi",
482121911,
"dobberman",
"white",
"female",
1999,
19), ("joli",
921383212,
"chiwawa",
"black",
"male",
2013,
5), ("socio",
493232134,
"mastiff",
"chestnut",
"male",
2012,
6), ("kafka",
493232134,
"tibetan mastiff",
"black",
"male",
2010,
8), ("poe",
692323322,
"cao de agua",
"grey",
"female",
2002,
16), ("smithy",
391286572,
"baiano",
"milky white",
"female",
2002,
16), ("mockingjay",
782333333,
"mockingbird",
"brown",
"female",
2015,
3), ("blackie",
121212746,
"blackbird",
"black",
"male",
2015,
3), ("minnie",
357812587,
"abyssinian",
"grey",
"male",
2010,
8), ("daisy",
357812587,
"aegean",
"white",
"male",
2015,
3), ("tutankamon",
293121444,
"abyssinian",
"black",
"male",
2017,
1);


INSERT INTO diagnosis_code
VALUES (0,
"kidney failure"), (1,
"renal insufficiency"), (2,
"pulmonary failure"), (3,
"heart failure"), (4,
"fleas"), (5,
"tartarus");


INSERT INTO consult
VALUES ("gros bobi",
482121911,
"2017-04-15 13:13:13",
"eats a lot",
"suffers obesity",
"heart problem",
"prescribe dose1",
587823329,
293121444,
31), ("gros bobi",
482121911,
"2017-04-30 13:13:13",
"isn't eating",
"no more obesity",
"heart problem",
"prescribe dose2",
482121911,
293121444,
29), ("gros bobi",
482121911,
"2016-04-30 10:20:20",
"nothing special",
"not well",
"renal insufficiency",
"let things evolve",
482121911,
293121444,
23), ("blackie",
121212746,
"2017-08-04 09:00:00",
"feeling down",
"already obese",
"kidney problem",
"sample blood",
121212746,
735916821,
35), ("blackie",
121212746,
"2017-07-04 14:00:00",
"feeling down",
"not yet obese",
"ok",
"let things evolve",
587823329,
293121444,
25), ("bobi",
482121911,
"2017-1-11 09:00:00",
"scratches much",
"never stands still",
"has fleas",
"prescribe medication",
482121911,
146252131,
10.1), ("socio",
493232134,
"2017-10-31 18:07:15",
"seems fine",
"is fine",
"has nothing",
"do nothing",
482121911,
293121444,
5.3), ("joli",
921383212,
"2017-10-31 15:28:15",
"toothache",
"bad teeth",
"has tartarus",
"prescribe medication",
921383212,
812924465,
7.2), ("smithy",
391286572,
"2017-09-05 10:21:15",
"seems fine",
"is fine",
"has nothing",
"do nothing",
493232134,
812924465,
6.6), ("minnie",
357812587,
"2017-01-10 17:21:15",
"seems fine",
"is fine",
"has nothing",
"do nothing",
357812587,
812924465,
6), ("minnie",
357812587,
"2017-02-06 16:21:15",
"doesn't breath well",
"bad inhaling",
"pulmonary issue",
"immediate surgery",
357812587,
293121444,
6), ("daisy",
357812587,
"2017-07-22 10:21:15",
"seems fine",
"is fine",
"has nothing",
"will still sample urine",
357812587,
293121444,
10), ("poe",
692323322,
"2018-01-12 21:10:10",
"feeling down",
"obese",
"renal insufficiency",
"prescribe medication",
391286572,
735916821,
32), ("tutankamon",
293121444,
"2018-04-15 15:07:51",
"seems fine",
"is fine",
"has nothing",
"will see x-ray",
555916111,
735916821,
7);


INSERT INTO participation
VALUES ("joli",
921383212,
"2017-10-31 15:28:15",
692323322), ("smithy",
391286572,
"2017-09-05 10:21:15",
562323322), ("gros bobi",
482121911,
"2016-04-30 10:20:20",
562323322), ("gros bobi",
482121911,
"2016-04-30 10:20:20",
692323322), ("minnie",
357812587,
"2017-01-010 17:21:15",
692323322), ("poe",
692323322,
"2018-01-12 21:10:10",
667812587), ("tutankamon",
293121444,
"2018-04-15 15:07:51",
555916111);


INSERT INTO consult_diagnosis
VALUES (1,
"gros bobi",
482121911,
"2016-04-30 10:20:20"), (0,
"blackie",
121212746,
"2017-08-04 09:00:00"), (3,
"gros bobi",
482121911,
"2017-04-15 13:13:13"), (3,
"gros bobi",
482121911,
"2017-04-30 13:13:13"), (4,
"bobi",
482121911,
"2017-1-11 09:00:00"), (5,
"joli",
921383212,
"2017-10-31 15:28:15"), (2,
"minnie",
357812587,
"2017-02-06 16:21:15"), (0,
"poe",
692323322,
"2018-01-12 21:10:10");


INSERT INTO medication
VALUES ("MoreHeart1",
"cardiologylab",
"250 mg"), ("MoreHeart2",
"cardiologylab",
"500 mg"), ("LessScratch",
"Lab Lisboa",
"100 mg"), ("ToothPaste",
"Lab dentario",
"200 mg"), ("BreathBetter",
"Lab pulmoes",
"200 mg"), ("UrineImprover",
"Lab rins",
"50 mg");


INSERT INTO prescription
VALUES (3,
"gros bobi",
482121911,
"2017-04-15 13:13:13",
"MoreHeart1",
"cardiologylab",
"250 mg",
"Every day"), (3,
"gros bobi",
482121911,
"2017-04-30 13:13:13",
"MoreHeart2",
"cardiologylab",
"500 mg",
"Every meal"), (4,
"bobi",
482121911,
"2017-1-11 09:00:00",
"LessScratch",
"Lab Lisboa",
"100 mg",
"Twice a day"), (5,
"joli",
921383212,
"2017-10-31 15:28:15",
"ToothPaste",
"Lab dentario",
"200 mg",
"Only at night"), (2,
"minnie",
357812587,
"2017-02-06 16:21:15",
"BreathBetter",
"Lab pulmoes",
"200 mg",
"Every day"), (0,
"poe",
692323322,
"2018-01-12 21:10:10",
"UrineImprover",
"Lab rins",
"50 mg",
"Only once");


INSERT INTO vet_procedure
VALUES ("joli",
921383212,
"2017-10-31 15:28:15",
1,
"Detartatization"), ("bobi",
482121911,
"2017-1-11 09:00:00",
1,
"Taking fleas out!"), ("minnie",
357812587,
"2017-02-06 16:21:15",
1,
"Pulmonary surgery."), ("minnie",
357812587,
"2017-02-06 16:21:15",
2,
"Taking blood."), ("blackie",
121212746,
"2017-08-04 09:00:00",
1,
"Taking blood."), ("daisy",
357812587,
"2017-07-22 10:21:15",
1,
"Sampling urine."), ("poe",
692323322,
"2018-01-12 21:10:10",
1,
"Sampling blood."), ("tutankamon",
293121444,
"2018-04-15 15:07:51",
1,
"X-Ray.");


INSERT INTO performed
VALUES ("joli",
921383212,
"2017-10-31 15:28:15",
1,
692323322), ("minnie",
357812587,
"2017-02-06 16:21:15",
1,
692323322), ("minnie",
357812587,
"2017-02-06 16:21:15",
1,
667812587), ("daisy",
357812587,
"2017-07-22 10:21:15",
1,
667812587), ("tutankamon",
293121444,
"2018-04-15 15:07:51",
1,
555916111);


INSERT INTO radiography
VALUES ("tutankamon",
293121444,
"2018-04-15 15:07:51",
1,
"C:/radiography_images/x-ray/tutankamon_293121444");


INSERT INTO
INDICATOR
VALUES ("Fe in blood",
150,
"milligrams",
"Milligrams of Iron in blood"), ("Platelets in blood",
10,
"number",
"Number of platelets in blood"), ("Sugar in blood",
90,
"milligrams",
"Milligrams of sugar in blood"), ("Fat in blood",
200,
"milligrams",
"Milligrams of fat in blood"), ("creatinine level",
0.8,
"grams",
"Grams of creatinine in blood"), ("pH",
7,
"none",
"pH of urine");


INSERT INTO test_procedure
VALUES ("minnie",
357812587,
"2017-02-06 16:21:15",
2,
"blood"), ("blackie",
121212746,
"2017-08-04 09:00:00",
1,
"blood"), ("daisy",
357812587,
"2017-07-22 10:21:15",
1,
"urine"), ("poe",
692323322,
"2018-01-12 21:10:10",
1,
"blood");


INSERT INTO produced_indicator
VALUES ("minnie",
357812587,
"2017-02-06 16:21:15",
2,
"Fe in blood",
155), ("blackie",
121212746,
"2017-08-04 09:00:00",
1,
"creatinine level",
1.5), ("daisy",
357812587,
"2017-07-22 10:21:15",
1,
"pH",
6.8), ("poe",
692323322,
"2018-01-12 21:10:10",
1,
"creatinine level",
0.8);
