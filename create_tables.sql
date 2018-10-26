drop table if exists person;
drop table if exists phone_number;
drop table if exists client;
drop table if exists veterinary;
drop table if exists assistant;
drop table if exists species;
drop table if exists generalization_species;
drop table if exists animal;
drop table if exists consult;
drop table if exists participation;
drop table if exists diagnosis_code;
drop table if exists consult_diagnosis;
drop table if exists medication;
drop table if exists prescription;
drop table if exists indicator;
drop table if exists procedure;
drop table if exists performed;
drop table if exists radiography;
drop table if exists test_procedure;
drop table if exists produced_indicator;


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
	foreign key(VAT) references person(VAT));

create table veterinary(
	VAT integer,
	specialization varchar(255),
	bio varchar(255),
	foreign key(VAT) references person(VAT));

create table assistant(
	VAT integer,
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
	age integer as (2018 - birth_year),
	primary key(name, VAT),
	foreign key(VAT) references client(VAT),
    foreign key(species_name) references species(name));

create table consult(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	s varchar(255),
	o varchar(255),
	a varchar(255),
	p varchar(255),
	VAT_client integer,
	VAT_vet integer,
	weight integer unsigned,
	primary key(name, VAT_owner, date_timestamp),
	foreign key(name) references animal(name),
	foreign key(VAT_owner) references animal(VAT),
	foreign key(VAT_client) references client(VAT),
    foreign key(VAT_vet) references veterinary(VAT));

create table participation(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	VAT_assistant integer,
	primary key(name, VAT_owner, date_timestamp, VAT_assistant),
	foreign key(name) references consult(name),
	foreign key(VAT_owner) references consult(VAT_owner),
	foreign key(date_timestamp) references consult(date_timestamp),
    foreign key(VAT_assistant) references assistant(VAT));


create table diagnosis_code(
	code varchar(255),
	name varchar(255),
	primary key(code));

create table consult_diagnosis(
	code varchar(255),
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	primary key(code, name, VAT_owner, date_timestamp),
	foreign key(code) references diagnosis_code(code),
	foreign key(name) references consult(name),
	foreign key(VAT_owner) references consult(VAT_owner),
	foreign key(date_timestamp) references consult(date_timestamp));

create table medication(
	name varchar(255),
	lab varchar(255),
	dosage varchar(255),
	primary key(name, lab, dosage));

create table prescription(
	code varchar(255),
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	med_name varchar(255),
	lab varchar(255),
	dosage varchar(255),
	regime varchar(255),
	primary key(code, animal_name, VAT_owner, date_timestamp, 
		med_name, lab, dosage),
	foreign key(code) references consult_diagnosis(code),
	foreign key(animal_name) references consult_diagnosis(name),
	foreign key(VAT_owner) references consult_diagnosis(VAT_owner),
	foreign key(date_timestamp) references consult_diagnosis(date_timestamp),
	foreign key(med_name) references medication(name),
	foreign key(lab) references medication(lab),
	foreign key(dosage) references medication(dosage));

create table indicator(
	name varchar(255),
	reference_value varchar(255),
	units varchar(255),
	description varchar(255),
	primary key(name));

create table procedure(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	num varchar(255),
	description varchar(255),
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name) references consult(name),
	foreign key(VAT_owner) references consult(VAT_owner),
	foreign key(date_timestamp) references consult(date_timestamp));

create table performed(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	num varchar(255),
	VAT_assistant varchar(255),
	primary key(name, VAT_owner, date_timestamp, num, VAT_assistant),
	foreign key(name) references procedure(name),
	foreign key(VAT_owner) references procedure(VAT_owner),
	foreign key(date_timestamp) references procedure(date_timestamp),
	foreign key(num) references procedure(num),
	foreign key(VAT_assistant) references assistant(VAT));

create table radiography(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	num varchar(255),
	file varchar(255),
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name) references procedure(name),
	foreign key(VAT_owner) references procedure(VAT_owner),
	foreign key(date_timestamp) references procedure(date_timestamp),
	foreign key(num) references procedure(num));

create table test_procedure(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	num varchar(255),
	type char(5),
	primary key(name, VAT_owner, date_timestamp, num),
	foreign key(name) references procedure(name),
	foreign key(VAT_owner) references procedure(VAT_owner),
	foreign key(date_timestamp) references procedure(date_timestamp),
	foreign key(num) references procedure(num));

create table produced_indicator(
	name varchar(255),
	VAT_owner integer,
	date_timestamp char(16),
	num varchar(255),
	indicator_name varchar(255),
	value varchar(255),
	primary key(name, VAT_owner, date_timestamp, num, indicator_name),
	foreign key(name) references test_procedure(name),
	foreign key(VAT_owner) references test_procedure(VAT_owner),
	foreign key(date_timestamp) references test_procedure(date_timestamp),
	foreign key(num) references test_procedure(num),
	foreign key(indicator_name) references indicator(indicator_name));

