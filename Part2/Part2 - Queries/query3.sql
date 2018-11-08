/* Query 3 */
select animal.name as name,
       person.name as owner_name,
       animal.species_name as species,
       animal.age
from animal,
     person,
     consult as c1
where animal.vat = person.vat
  and c1.vat_owner = animal.vat
  and c1.weight > 30
  and (c1.o like "%obese%"
       or c1.o like "%obesity%")
  and c1.date_timestamp >= all
    (select c2.date_timestamp
     from consult as c2
     where c2.name = c1.name
           and c2.vat_owner = c1.vat_owner);