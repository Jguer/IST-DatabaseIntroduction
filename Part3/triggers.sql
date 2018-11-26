drop trigger if exists animal_age;
drop trigger if exists ensure_veterinary;
drop trigger if exists ensure_veterinary;
drop function if exists number_consults;
drop procedure if exists milligrams2centigrams;

/* 1 */
/*create trigger animal_age after
insert on consult
for each row begin DECLARE current_age integer;
select age into current_age
from animal
where animal.name = new.name;
  update animal
  set status = YEAR(new.date_timestamp) - current_age WHERE animal.name= new.name; end;

/* 2 */
/*create trigger ensure_veterinary after
insert on veterinary
for each row begin
delete
from assistant
where assistant.vat = new.vat; end;


create trigger ensure_assistant after
insert on assistant
for each row begin
delete
from veterinary
where veterinary.vat = new.vat; end;

/* 3 */


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