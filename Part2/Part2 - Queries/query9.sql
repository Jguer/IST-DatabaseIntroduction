/* Query 9 */
select distinct person.name as name,
                person.address_street as street,
                person.address_city as city,
                person.address_zip as zip
from person
where not exists
    (select animal.name
     from animal
     where animal.vat = person.vat
       and animal.species_name not like "%bird%")
  and exists
    (select animal.name
     from animal
     where animal.vat = person.vat);