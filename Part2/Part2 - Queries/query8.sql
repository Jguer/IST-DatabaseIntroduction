/* Query 8 */
select distinct p1.name as name
from
  (select person.name
   from person,
        animal,
        consult
   where person.vat = animal.vat
     or person.vat = consult.vat_client) as p1
inner join
  (select person.name
   from person,
        veterinary,
        assistant
   where person.vat = veterinary.vat
     or person.vat = assistant.vat) as p2 on p1.name = p2.name;
