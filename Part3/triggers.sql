/* 1 */
create trigger animal_age after
insert on consult
for each row begin DECLARE current_age integer;
select age into current_age
from animal
where animal.name = new.name;
  update animal
  set status = YEAR(new.date_timestamp) - current_age WHERE animal.name= new.name; end;

/* 2 */
create trigger ensure_veterinary after
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
