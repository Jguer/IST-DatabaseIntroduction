/* 1 */
create trigger animal_age after
insert on consult
for each row begin
DECLARE current_age integer;
SELECT age
INTO current_age
FROM animal
WHERE animal.name= new.name;
UPDATE animal
SET status = YEAR(new.date_timestamp) - current_age
WHERE animal.name= new.name;
end;
