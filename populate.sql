insert into person (VAT,name,address_street,address_city,address_zip) values 
(293121444,'John Smith','Rua Dona Amelia','Lisboa','1820-021'),
(391286572,'John Doe','Rua da Buraca','Buraca','1904-192'),
(493232134,'Jorge Serra','Rua da Damaia','Amadora','1904-192'),
(921383212,'Nuno Neves','Rua Alvaro Cunhal','Beja','1204-222'),
(482121911,'Damasio Silva','Rua Santo Estevao','Loulé','2204-019'),
(812924465,'Lajos Kossuth','Rua Sarmento Rosa 92','Loulé','2204-123'),
(146252131,'Alfred I, Prince of Windisch-Gratz','Rua Vieira Luis Filipe 19','Porto','6451-035'),
(782333333,'Jair Bolsonaro','Avenida da Liberdade 1','Brasilia','9324-031'),
(692323322,'Dilma Rouseff','Praça dos Combatentes 31','Rio de Janeiro','8208-818'),
(562323322,'Xana Toc','Avenida Rosa 1','Funchal','8111-555'),
(587823329,'Pedro Tomas','Rua de Marco','Loures','4525-105'),
(121212746,'Ricardo Pereira','Rua Jorge da Cunha 143','Abrunheira','1821-131'),
(357812587,'Tomas de Noronha','Rua do Irao','Faro','2021-700'),
(667812587,'Goncalo Rosa','Rua 1o Dezembro','Guarda','1021-700');



insert into veterinary (VAT,specialization,bio) values 
(293121444,"surgery","A very nice man"),
(812924465,"surgery","A very regal man"),
(146252131,"analysis","A very old man");

insert into client (VAT) values
(293121444),
(391286572),
(493232134),
(921383212),
(482121911),
(146252131),
(782333333),
(692323322),
(587823329),
(121212746),
(357812587);

insert into assistant (VAT) values 
(692323322),
(562323322),
(667812587);


insert into species (name,description) values
("dobberman","very german"),
("chiwawa","very... small"),
("tibetan mastiff","very tibetan"),
("mastiff","not tibetan"),
("baiano","From the warm waters"),
("cao de agua","Fuzzy and warm"),
("dog","man's best friend"),
("mockingbird","small bird"),
("blackbird","bird that is black"),
("abyssinian","ethiopian cat"),
("aegean","greek cat"),
("cat","man's second best friend");


insert into generalization_species (name1, name2) values 
("dobberman","dog"),
("chiwawa","dog"),
("tibetan mastiff","dog"),
("mastiff","dog"),
("baiano","dog"),
("cao de agua","dog"),
("abyssinian","cat"),
("aegean","cat");


insert into animal values
("bobi",482121911,"mastiff","black","male",1995,23),
("gros bobi",482121911,"dobberman","white","female",1999,19),
("joli",921383212,"chiwawa","black","male",2013,5),
("socio",493232134,"mastiff","chestnut","male",2012,6),
("kafka",493232134,"tibetan mastiff","black","male",2010,8),
("poe",692323322,"cao de agua","grey","female",2002,16),
("smithy",391286572,"baiano","milky white","female", 2002,16),
("mockingjay",782333333, "mockingbird","brown","female",2015,3),
("blackie",121212746,"blackbird","black","male",2015,3),
("minnie",357812587,"abyssinian","grey","male",2010,8),
("daisy",357812587,"aegean","white","male",2015,3),
("tutankamon",293121444,"abyssinian","black","male",2017,1);

insert into diagnosis_code values 
(0,"kidney failure"),
(1,"renal insufficiency"),
(2,"pulmonary failure"),
(3,"heart failure"),
(4,"fleas"),
(5,"tartarus");

insert into consult values
("gros bobi",482121911,"2017-04-15 13:13:13","s","suffers obesity","a","p",587823329,293121444,31),
("gros bobi",482121911,"2017-04-30 13:13:13","s","no more obesity","a","p",482121911,293121444,29),
("gros bobi",482121911,"2016-04-30 10:20:20","s","o","a","p",482121911,293121444,23),
("blackie",121212746,"2017-08-04 09:00:00","s","already obese","a","p",121212746,293121444,35),
("blackie",121212746,"2017-07-04 14:00:00","s","not yet obese","a","p",587823329,293121444,25),
("bobi",482121911,"2017-1-11 09:00:00","s","o","a","p",482121911,146252131,10.1),
("socio",493232134,"2017-10-31 18:07:15","s","o","a","p",482121911,293121444,5.3),
("joli",921383212,"2017-10-31 15:28:15","s","o","a","p",921383212,812924465,7.2),
("smithy",391286572,"2017-09-05 10:21:15","s","o","a","p",493232134,812924465,6.6),
("minnie",357812587,"2017-01-010 17:21:15","s","o","a","p",357812587,812924465,6),
("minnie",357812587,"2017-02-06 16:21:15","s","o","a","p",357812587,293121444,6),
("daisy",357812587,"2017-07-22 10:21:15","s","o","a","p",357812587,293121444,5.5);


insert into participation values
("joli",921383212,"2017-10-31 15:28:15",692323322),
("smithy",391286572,"2017-09-05 10:21:15",562323322),
("gros bobi",482121911,"2016-04-30 10:20:20",562323322),
("gros bobi",482121911,"2016-04-30 10:20:20",692323322),
("minnie",357812587,"2017-01-010 17:21:15",692323322);

insert into consult_diagnosis values
(1,"gros bobi",482121911,"2016-04-30 10:20:20"),
(0,"blackie",121212746,"2017-08-04 09:00:00"),
(3,"gros bobi",482121911,"2017-04-15 13:13:13"),
(3,"gros bobi",482121911,"2017-04-30 13:13:13"),
(4,"bobi",482121911,"2017-1-11 09:00:00"),
(5,"joli",921383212,"2017-10-31 15:28:15"),
(2,"minnie",357812587,"2017-02-06 16:21:15");

insert into medication values
("MoreHeart1","cardiologylab","250 mg"),
("MoreHeart2","cardiologylab","500 mg"),
("LessScratch","Lab Lisboa","100 mg"),
("ToothPaste","Lab dentario","200 mg"),
("BreathBetter","Lab pulmoes","200 mg");

insert into prescription values
(3,"gros bobi",482121911,"2017-04-15 13:13:13","MoreHeart1","cardiologylab","250 mg","Every day"),
(3,"gros bobi",482121911,"2017-04-30 13:13:13","MoreHeart2","cardiologylab","500 mg","Every meal"),
(4,"bobi",482121911,"2017-1-11 09:00:00","LessScratch","Lab Lisboa","100 mg","Twice a day"),
(5,"joli",921383212,"2017-10-31 15:28:15","ToothPaste","Lab dentario","200 mg","Only at night"),
(2,"minnie",357812587,"2017-02-06 16:21:15","BreathBetter","Lab pulmoes","200 mg","Every day");

insert into vet_procedure values
("joli",921383212,"2017-10-31 15:28:15",1,"Detartatization"),
("bobi",482121911,"2017-1-11 09:00:00",1,"Taking fleas out!"),
("minnie",357812587,"2017-02-06 16:21:15",1,"Pulmonary surgery."),
("minnie",357812587,"2017-02-06 16:21:15",2,"Taking blood."),
("blackie",121212746,"2017-08-04 09:00:00",1,"Taking blood."),
("daisy",357812587,"2017-07-22 10:21:15",1,"Sampling urine.");

insert into performed values
("joli",921383212,"2017-10-31 15:28:15",1,692323322),
("minnie",357812587,"2017-02-06 16:21:15",1,692323322),
("minnie",357812587,"2017-02-06 16:21:15",1,667812587),
("daisy",357812587,"2017-07-22 10:21:15",1,667812587);

insert into indicator values
("Fe in blood",150,"milligrams","Milligrams of Iron in blood"),
("Platelets in blood",10,"number","Number of platelets in blood"),
("Sugar in blood",90,"milligrams","Milligrams of sugar in blood"),
("Fat in blood",200,"milligrams","Milligrams of fat in blood"),
("creatinine level",0.8,"grams","Grams of creatinine in blood"),
("pH",7,"none","pH of urine");

insert into test_procedure values
("minnie",357812587,"2017-02-06 16:21:15",2,"blood"),
("blackie",121212746,"2017-08-04 09:00:00",1,"blood"),
("daisy",357812587,"2017-07-22 10:21:15",1,"urine");

insert into produced_indicator values
("minnie",357812587,"2017-02-06 16:21:15",2,"Fe in blood",155),
("blackie",121212746,"2017-08-04 09:00:00",1,"creatinine level",1.5),
("daisy",357812587,"2017-07-22 10:21:15",1,"pH",6.8);