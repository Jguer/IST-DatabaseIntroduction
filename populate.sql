insert into person (VAT,name,address_street,address_city,address_zip)
values (293121444,
        'John Smith',
        'Rua Dona Amelia,9, Picheleira',
        'Lisboa',
        '1820-021');


insert into veterinary (VAT,specialization,bio)
values (293121444,
        "surgery",
        "A very nice man");


insert into person (VAT,name,address_street,address_city,address_zip)
values (391286572,
        'John Doe',
        'Rua da Buraca 4',
        'Buraca',
        '1904-192');


insert into client (VAT)
values (391286572);


insert into person (VAT,name,address_street,address_city,address_zip)
values (493232134,
        'Jorge Serra',
        'Rua da Damaia,2, Damaia',
        'Amadora',
        '1904-192');


insert into client (VAT)
values (493232134);


insert into person (VAT,name,address_street,address_city,address_zip)
values (921383212,
        'Nuno Neves',
        'Rua Alvaro Cunhal,182, Beja',
        'Beja',
        '1204-222');


insert into client (VAT)
values (921383212);


insert into person (VAT,name,address_street,address_city,address_zip)
values (482121911,
        'Damasio Silva',
        'Rua Santo Estevao,13, Soidos de Cima',
        'Loulé',
        '2204-019');


insert into client (VAT)
values (482121911);


insert into person (VAT,name,address_street,address_city,address_zip)
values (812924465,
        'Lajos Kossuth',
        'Rua Sarmento Rosa 92',
        'Loulé',
        '2204-123');


insert into veterinary (VAT,specialization,bio)
values (812924465,
        "surgery",
        "A very regal man");


insert into person (VAT,name,address_street,address_city,address_zip)
values (146252131,
        'Alfred I, Prince of Windisch-Gratz',
        'Rua Vieira Luis Filipe 19',
        'Porto',
        '6451-035');


insert into veterinary (VAT,specialization,bio)
values (146252131,
        "analysis",
        "A very regal man");


insert into client (VAT)
values (146252131);


insert into person (VAT,name,address_street,address_city,address_zip)
values (782333333,
        'Jair Bolsonaro',
        'Avenida da Liberdade 1',
        'Brasilia',
        '9324-031');


insert into client (VAT)
values (782333333);


insert into person (VAT,name,address_street,address_city,address_zip)
values (692323322,
        'Dilma Rouseff',
        'Praça dos Combatentes 31',
        'Rio de Janeiro',
        '8208-818');


insert into client (VAT)
values (692323322);


insert into assistant (VAT)
values (692323322);

insert into person (VAT,name,address_street,address_city,address_zip)
values (562323322,
        'Xana Toc',
        'Avenida Rosa 1',
        'Funchal',
        '8111-555');

insert into assistant (VAT)
values (562323322);

insert into person (VAT,name,address_street,address_city,address_zip)
values (587823329,
        'Pedro Tomas',
        'Rua de Marco',
        'Loures',
        '4525-105');

insert into client (VAT)
values (587823329);


insert into person (VAT,name,address_street,address_city,address_zip)
values (121212746,
        'Ricardo Pereira',
        'Rua Jorge da Cunha 143',
        'Abrunheira',
        '1821-131');


insert into client (VAT)
values (121212746);


insert into species (name,description)
values ("dobberman",
        "very german");


insert into species (name,description)
values ("chiwawa",
        "very... small");


insert into species (name,description)
values ("tibetan mastiff",
        "very tibetan");


insert into species (name,description)
values ("mastiff",
        "not tibetan");

insert into species (name,description)
values ("baiano",
        "From the warm waters");


insert into species (name,description)
values ("Cao de agua",
        "Fuzzy and warm");

insert into species (name,description)
values ("dog",
        "man's best friend");

insert into generalization_species (name1, name2)
values ("dobberman",
        "dog");

insert into generalization_species (name1, name2)
values ("chiwawa",
        "dog");

insert into generalization_species (name1, name2)
values ("tibetan mastiff",
        "dog");

insert into generalization_species (name1, name2)
values ("mastiff",
        "dog");

insert into generalization_species (name1, name2)
values ("baiano",
        "dog");

insert into generalization_species (name1, name2)
values ("cao de agua",
        "dog");

insert into species (name,description)
values ("mockingbird",
        "small bird");

insert into species (name,description)
values ("blackbird",
        "bird that is black");

insert into animal
values ("bobi",
        482121911,
        "mastiff",
        "black",
        "male",
        1995);


insert into animal
values ("gros bobi",
        482121911,
        "dobberman",
        "white",
        "female",
        1999);


insert into animal
values ("joli",
        921383212,
        "chiwawa",
        "black",
        "male",
        2013);


insert into animal
values ("socio",
        493232134,
        "mastiff",
        "chestnut",
        "male",
        2012);


insert into animal
values ("kafka",
        493232134,
        "tibetan mastiff",
        "black",
        "male",
        2010);


insert into animal
values ("ferdinand",
        146252131,
        "cao de agua",
        "grey",
        "male",
        2017);


insert into animal
values ("poe",
        692323322,
        "cao de agua",
        "grey",
        "female",
        2002);

insert into animal
values ("smithy",
        391286572,
        "baiano",
        "milky white",
        "female",
        2002);

insert into animal
values ("mockingjay",
        782333333,
        "mockingbird",
        "brown",
        "female",
        2015);

insert into animal
values ("blackie",
        121212746,
        "blackbird",
        "black",
        "male",
        2015);


insert into diagnosis_code
values (0,
        "kidney failure");

insert into diagnosis_code
values (1,
        "renal insufficiency");

insert into diagnosis_code
values (2,
        "pulmonary failure");

insert into diagnosis_code
values (3,
        "heart failure");

insert into diagnosis_code
values (4,
        "fleas");

insert into diagnosis_code
values (5,
        "tartarus");

insert into consult
values ("gros bobi",
        482121911,
        "2017-04-15 13:13:13",
        "s",
        "suffers obesity",
        "a",
        "p",
        587823329,
        293121444,
        31);


insert into consult
values ("gros bobi",
        482121911,
        "2017-04-30 13:13:13",
        "s",
        "no more obesity",
        "a",
        "p",
        482121911,
        293121444,
        29);

insert into consult
values ("gros bobi",
        482121911,
        "2016-04-30 10:20:20",
        "s",
        "o",
        "a",
        "p",
        482121911,
        293121444,
        23);

insert into consult
values ("blackie",
        121212746,
        "2017-08-04 09:00:00",
        "s",
        "already obese",
        "a",
        "p",
        121212746,
        293121444,
        35);

insert into consult
values ("blackie",
        121212746,
        "2017-07-04 14:00:00",
        "s",
        "not yet obese",
        "a",
        "p",
        587823329,
        293121444,
        25);

insert into consult
values ("bobi",
        482121911,
        "2017-1-11 09:00:00",
        "s",
        "o",
        "a",
        "p",
        482121911,
        146252131,
        10.1);

insert into consult
values ("socio",
        493232134,
        "2017-10-31 18:07:15",
        "s",
        "o",
        "a",
        "p",
        482121911,
        293121444,
        5.3);

insert into consult
values ("joli",
        921383212,
        "2017-10-31 15:28:15",
        "s",
        "o",
        "a",
        "p",
        921383212,
        812924465,
        7.2);

insert into consult
values ("smithy",
        391286572,
        "2017-09-05 10:21:15",
        "s",
        "o",
        "a",
        "p",
        493232134,
        812924465,
        6.6);

insert into participation
values ("joli",
        921383212,
        "2017-10-31 15:28:15",
        692323322);

insert into participation
values ("smithy",
        391286572,
        "2017-09-05 10:21:15",
        562323322);

insert into participation
values ("gros bobi",
        482121911,
        "2016-04-30 10:20:20",
        562323322);

insert into participation
values ("gros bobi",
        482121911,
        "2016-04-30 10:20:20",
        692323322);

insert into consult_diagnosis
values (1,
        "gros bobi",
        482121911,
        "2016-04-30 10:20:20");


insert into consult_diagnosis
values (0,
        "blackie",
        121212746,
        "2017-08-04 09:00:00");


insert into consult_diagnosis
values (3,
        "gros bobi",
        482121911,
        "2017-04-15 13:13:13");


insert into consult_diagnosis
values (3,
        "gros bobi",
        482121911,
        "2017-04-30 13:13:13");

insert into consult_diagnosis
values (4,
        "bobi",
        482121911,
        "2017-1-11 09:00:00");

insert into consult_diagnosis
values (5,
        "joli",
        921383212,
        "2017-10-31 15:28:15");

insert into medication
values ("MoreHeart1",
        "cardiologylab",
        "250 mg");

insert into medication
values ("MoreHeart2",
        "cardiologylab",
        "500 mg");

insert into prescription
values (3,
        "gros bobi",
        482121911,
        "2017-04-15 13:13:13",
        "MoreHeart1",
        "cardiologylab",
        "250 mg",
        "Every day");

insert into prescription
values (3,
        "gros bobi",
        482121911,
        "2017-04-30 13:13:13",
        "MoreHeart2",
        "cardiologylab",
        "500 mg",
        "Every meal");


insert into medication
values ("LessScratch",
        "Lab Lisboa",
        "100 mg");

insert into prescription
values (4,
        "bobi",
        482121911,
        "2017-1-11 09:00:00",
        "LessScratch",
        "Lab Lisboa",
        "100 mg",
        "Twice a day");

insert into medication
values ("ToothPaste",
        "Lab dentario",
        "200 mg");

insert into prescription
values (5,
        "joli",
        921383212,
        "2017-10-31 15:28:15",
        "ToothPaste",
        "Lab dentario",
        "200 mg",
        "Only at night");

insert into vet_procedure
values("joli",
        921383212,
        "2017-10-31 15:28:15",
        1,
        "Detartatization");

insert into performed
values("joli",
        921383212,
        "2017-10-31 15:28:15",
        1,
        692323322);

insert into vet_procedure
values("bobi",
        482121911,
        "2017-1-11 09:00:00",
        2,
        "Taking fleas out!");

insert into indicator
values("Fe in blood",
        150,
        "milligrams",
        "Milligrams of Iron in blood");

insert into indicator
values("Platelets in blood",
        10,
        "number",
        "Number of platelets in blood");

insert into indicator
values("Sugar in blood",
        90,
        "milligrams",
        "Milligrams of sugar in blood");

insert into indicator
values("Fat in blood",
        200,
        "milligrams",
        "Milligrams of fat in blood");

insert into indicator
values("creatinine level",
        0.8,
        "grams",
        "Grams of creatinine in blood");
