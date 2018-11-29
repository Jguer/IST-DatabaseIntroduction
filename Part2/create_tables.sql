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

create table person 
  ( 
     vat            integer, 
     name           varchar(255), 
     address_street varchar(255), 
     address_city   varchar(255), 
     address_zip    varchar(255), 
     primary key(vat)
  ); 

create table phone_number 
  ( 
     vat   integer, 
     phone integer, 
     primary key(vat, phone), 
     foreign key(vat) references person(vat) on delete cascade
  ); 

create table client 
  ( 
     vat integer, 
     primary key(vat), 
     foreign key(vat) references person(vat) on delete cascade
  ); 

create table veterinary 
  ( 
     vat            integer, 
     specialization varchar(255), 
     bio            varchar(255), 
     primary key(vat), 
     foreign key(vat) references person(vat) on delete cascade
  ); 

create table assistant 
  ( 
     vat integer, 
     primary key(vat), 
     foreign key(vat) references person(vat) on delete cascade
  ); 

create table species 
  ( 
     name        varchar(255), 
     description varchar(255), 
     primary key(name) 
  ); 

create table generalization_species 
  ( 
     name1 varchar(255), 
     name2 varchar(255), 
     primary key(name1), 
     foreign key(name1) references species(name), 
     foreign key(name2) references species(name) 
  ); 

create table animal 
  ( 
     name         varchar(255), 
     vat          integer, 
     species_name varchar(255), 
     colour       varchar(255), 
     gender       varchar(255), 
     birth_year   integer,
     age          integer,
     primary key(name, vat), 
     foreign key(vat) references client(vat) on delete cascade, 
     foreign key(species_name) references species(name) 
  ); 

create table consult 
  ( 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp default CURRENT_TIMESTAMP, 
     s              varchar(255), 
     o              varchar(255), 
     a              varchar(255), 
     p              varchar(255), 
     vat_client     integer, 
     vat_vet        integer, 
     weight         numeric(5,2),
     check (weight >= 0),
     primary key(name, vat_owner, date_timestamp), 
     foreign key(name, vat_owner) references animal(name, vat) on delete cascade, 
     foreign key(vat_client) references client(vat) on delete cascade, 
     foreign key(vat_vet) references veterinary(vat) on delete cascade
  ); 

create table participation 
  ( 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     vat_assistant  integer, 
     primary key(name, vat_owner, date_timestamp, vat_assistant), 
     foreign key(name, vat_owner, date_timestamp) references consult(name, 
     vat_owner, date_timestamp) on delete cascade, 
     foreign key(vat_assistant) references assistant(vat) 
  ); 

create table diagnosis_code 
  ( 
     code varchar(255), 
     name varchar(255), 
     primary key(code) 
  ); 

create table consult_diagnosis 
  ( 
     code           varchar(255), 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     primary key(code, name, vat_owner, date_timestamp), 
     foreign key(code) references diagnosis_code(code) on update cascade,
     foreign key(name, vat_owner, date_timestamp) references consult(name, 
     vat_owner, date_timestamp) on delete cascade
  ); 

create table medication 
  ( 
     name   varchar(255), 
     lab    varchar(255), 
     dosage varchar(255), 
     primary key(name, lab, dosage) 
  ); 

create table prescription 
  ( 
     code           varchar(255), 
     name    varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     name_med       varchar(255), 
     lab            varchar(255), 
     dosage         varchar(255), 
     regime         varchar(255), 
     primary key(code, name, vat_owner, date_timestamp, name_med, lab, 
     dosage), 
     foreign key(code, name, vat_owner, date_timestamp) references 
        consult_diagnosis(code, name, vat_owner, date_timestamp) on delete cascade on update cascade, 
     foreign key(name_med, lab, dosage) references medication(name, lab, dosage) 
  ); 

create table indicator 
  ( 
     name            varchar(255), 
     reference_value numeric(5,2), 
     units           varchar(255), 
     description     varchar(255), 
     primary key(name) 
  ); 

create table vet_procedure 
  ( 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     num            integer, 
     description    varchar(255), 
     primary key(name, vat_owner, date_timestamp, num), 
     foreign key(name, vat_owner, date_timestamp) references consult(name, 
     vat_owner, date_timestamp) on delete cascade
  ); 

create table performed 
  ( 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     num            integer, 
     vat_assistant  integer, 
     primary key(name, vat_owner, date_timestamp, num, vat_assistant), 
     foreign key(name, vat_owner, date_timestamp, num) references vet_procedure( 
     name, vat_owner, date_timestamp, num) on delete cascade, 
     foreign key(vat_assistant) references assistant(vat) 
  ); 

create table radiography 
  ( 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     num            integer, 
     file           varchar(255), 
     primary key(name, vat_owner, date_timestamp, num), 
     foreign key(name, vat_owner, date_timestamp, num) references vet_procedure( 
     name, vat_owner, date_timestamp, num) on delete cascade
  ); 

create table test_procedure 
  ( 
     name           varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     num            integer, 
     type           varchar(5),
     check ((type="blood") or (type="urine")),
     primary key(name, vat_owner, date_timestamp, num), 
     foreign key(name, vat_owner, date_timestamp, num) references vet_procedure( 
     name, vat_owner, date_timestamp, num) on delete cascade
  ); 

create table produced_indicator 
  ( 
     name    varchar(255), 
     vat_owner      integer, 
     date_timestamp timestamp, 
     num            integer, 
     indicator_name varchar(255), 
     value          numeric(5,2), 
     primary key(name, vat_owner, date_timestamp, num, indicator_name), 
     foreign key(name, vat_owner, date_timestamp, num) references 
     test_procedure(name, vat_owner, date_timestamp, num) on delete cascade, 
     foreign key(indicator_name) references indicator(name) on update cascade
  ); 