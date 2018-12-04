drop trigger if exists animal_age;
drop trigger if exists ensure_veterinary;
drop trigger if exists ensure_veterinary;
drop trigger if exists phone_number_trigger;
drop function if exists number_consults;
drop procedure if exists milligrams2centigrams;

/* 1 */
delimiter $$
create trigger animal_age after
insert on consult
for each row 
begin 
	declare b_y integer;
	select birth_year into b_y
	from animal
	where animal.name = new.name and
		  animal.vat = new.vat_owner;
	  update animal
	  set age = YEAR(CURDATE()) - birth_year 
	  where animal.name = new.name; 
end$$
delimiter ;

/* 2 */
delimiter $$
create trigger ensure_veterinary before
insert on veterinary
for each row 
begin
declare number_assistants integer;
select count(distinct assistant.vat) into number_assistants
from assistant
where assistant.vat = new.vat;
if number_assistants>0 then
	signal sqlstate '45000'
set MESSAGE_TEXT = 'There is already an assistant with that VAT';
end if;
end$$
delimiter ;


delimiter $$
create trigger ensure_assistant before
insert on assistant
for each row 
begin
declare number_doctors integer;
select count(distinct veterinary.vat) into number_doctors
from veterinary
where veterinary.vat = new.vat;
if number_doctors>0 then
	signal sqlstate '45000'
set MESSAGE_TEXT = 'There is already a veterinary with that VAT';
end if;
end$$
delimiter ;

/* 3 */
delimiter $$
create trigger phone_number_trigger
before insert on phone_number
for each row
begin
	declare number_phones integer default 0;
	select count(*) into number_phones
	from phone_number where phone = new.phone and vat != new.vat;
    if number_phones != 0 then 
		signal  sqlstate '45000'
        set MESSAGE_TEXT = "Phone Number already exists";
	end if;
end$$
delimiter ;

/* 4 */
delimiter $$
create function number_consults(animal_name	varchar(255),
								owner_vat integer,
								year integer)
returns integer
begin
declare nc	integer;
select count(distinct consult.date_timestamp) into nc
from consult
where consult.name = animal_name and
	  consult.vat_owner = owner_vat and
	  YEAR(consult.date_timestamp) like year;
return nc;
end$$
delimiter ;


/* 5 */
delimiter $$
create procedure milligrams2centigrams()
begin
update indicator
left join produced_indicator on indicator.name = produced_indicator.indicator_name
set indicator.units = "centigrams",
	indicator.reference_value = indicator.reference_value/10,
	produced_indicator.value = produced_indicator.value/10,
	produced_indicator.date_timestamp = produced_indicator.date_timestamp
where indicator.units like "milligrams";
end$$
delimiter ;