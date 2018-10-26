drop table if exists produced_indicator;
drop table if exists indicator;
drop table if exists radiography;
drop table if exists test_procedure;
drop table if exists performed;
drop table if exists vet_procedure;
drop table if exists prescription;
drop table if exists medication;
drop table if exists consult_diagnosis;
drop table if exists diagnosis_code;
drop table if exists participation;
drop table if exists consult;
drop table if exists animal;
drop table if exists generalization_species;
drop table if exists species;
drop table if exists client;
drop table if exists veterinary;
drop table if exists assistant;
drop table if exists phone_number;
drop table if exists person;

create table person(
	VAT integer,
	name varchar(255),
	address_street varchar(255),
	address_city varchar(255),
	address_zip varchar(255),
	primary key(VAT));

create table phone_number(
	VAT integer,
	phone integer,
	primary key(VAT, phone),
	foreign key(VAT) references person(VAT));

create table client(
	VAT integer,
	primary key(VAT),
	foreign key(VAT) references person(VAT));

create table veterinary(
	VAT integer,
	specialization varchar(255),
	bio varchar(255),
	primary key(VAT),
	foreign key(VAT) references person(VAT));

create table assistant(
	VAT integer,
	primary key(VAT),
	foreign key(VAT) references person(VAT));

create table species(
	name varchar(255),
	description varchar(255),
	primary key(name));

create table generalization_species(
	name1 varchar(255),
	name2 varchar(255),
	primary key(name1, name2),
	foreign key(name1) references species(name),
    foreign key(name2) references species(name));

create table animal(
	name varchar(255),
	VAT integer,
	species_name varchar(255),
	colour varchar(255),
	gender varchar(255),
	birth_year integer,
	age integer,
	primary key(name, VAT),
	foreign key(VAT) references client(VAT),
    foreign key(species_name) references species(name));

create table consult(
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	s varchar(255),
	o varchar(255),
	a varchar(255),
	p varchar(255),
	VAT_client integer,
	VAT_vet integer,
	weight integer unsigned,
	primary key(name, VAT_owner, date_timestamp),
	foreign key(name, VAT_owner) references animal(name, VAT),
	foreign key(VAT_client) references client(VAT),
    foreign key(VAT_vet) references veterinary(VAT));

create table participation(
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	VAT_assistant integer,
	primary key(name, VAT_owner, date_timestamp, VAT_assistant),
	foreign key(name, VAT_owner, date_timestamp) 
		references consult(name, VAT_owner, date_timestamp),
	foreign key(VAT_assistant) references assistant(VAT));

create table diagnosis_code(
	code varchar(255),
	name varchar(255),
	primary key(code));

create table consult_diagnosis(
	code varchar(255),
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	primary key(code, name, VAT_owner, date_timestamp),
	foreign key(code) references diagnosis_code(code),
	foreign key(name, VAT_owner, date_timestamp) 
		references consult(name, VAT_owner, date_timestamp));

create table medication(
	name varchar(255),
	lab varchar(255),
	dosage varchar(255),
	primary key(name, lab, dosage));

create table prescription(
	code varchar(255),
	animal_name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	med_name varchar(255),
	lab varchar(255),
	dosage varchar(255),
	regime varchar(255),
	primary key(code, animal_name, VAT_owner, date_timestamp, 
		med_name, lab, dosage),
	foreign key(code) references consult_diagnosis(code),
	foreign key(animal_name, VAT_owner, date_timestamp) 
		references consult(name, VAT_owner, date_timestamp),
	foreign key(med_name, lab, dosage) 
		references medication(name, lab, dosage));

create table indicator(
	name varchar(255),
	reference_value varchar(255),
	units varchar(255),
	description varchar(255),
	primary key(name));

create table vet_procedure(
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	num varchar(255),
	description varchar(255),
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name, VAT_owner, date_timestamp) 
		references consult(name, VAT_owner, date_timestamp));

create table performed(
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	num varchar(255),
	VAT_assistant integer,
	primary key(name, VAT_owner, date_timestamp, num, VAT_assistant),
	foreign key(name, VAT_owner, date_timestamp, num) 
		references vet_procedure(name, VAT_owner, date_timestamp, num),
	foreign key(VAT_assistant) references assistant(VAT));

create table radiography(
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	num varchar(255),
	file varchar(255),
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name, VAT_owner, date_timestamp, num) 
		references vet_procedure(name, VAT_owner, date_timestamp, num));

create table test_procedure(
	name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	num varchar(255),
	type char(5),
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name, VAT_owner, date_timestamp, num) 
		references vet_procedure(name, VAT_owner, date_timestamp, num));

create table produced_indicator(
	animal_name varchar(255),
	VAT_owner integer,
	date_timestamp varchar(255),
	num varchar(255),
	indicator_name varchar(255),
	value varchar(255),
	primary key(animal_name, VAT_owner, date_timestamp, num, indicator_name),
	foreign key(animal_name, VAT_owner, date_timestamp, num) 
		references test_procedure(name, VAT_owner, date_timestamp, num),
	foreign key(indicator_name) references indicator(name));

