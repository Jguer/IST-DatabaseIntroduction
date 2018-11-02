/* 1 */
select distinct animal.name,
       owner.name,
       animal.species_name
#       animal.age
from animal, person as vet, consult, person as owner
where vet.name = "John Smith" and 
      consult.vat_vet = vet.vat and
      consult.name = animal.name and
      consult.vat_owner = animal.vat and
      consult.vat_owner = owner.vat; 

/* 2 */
select name, reference_value
from indicator
where units = 'milligrams' and reference_value > 100
order by reference_value desc;


/* 3 */
select animal.name,
       person.name,
       animal.species_name
#      animal.age
from animal, person, consult as c1
where animal.vat = person.vat and
      c1.vat_owner = animal.vat and
      c1.weight > 30 and
      (c1.o like "%obese%" or c1.o like "%obesity%") and
      c1.date_timestamp >= all (select c2.date_timestamp
                                from consult as c2
                                where c2.name = c1.name);

/* 4 */ 
select N.name,
       N.vat,
       N.address_street
from person as N, client
where N.vat = client.vat and 
not exists (
           select animal.vat
           from animal
           where animal.vat = N.vat);

/* 5 */
select diagnosis_code.name, count(distinct prescription.med_name)
from prescription, diagnosis_code
where prescription.code = diagnosis_code.code
group by diagnosis_code.name;

/* 6 */


/* 7 */


/* 8 */
select distinct * from 
(select person.name
from person, animal, consult
where person.vat = animal.vat or person.vat = consult.vat_client) as p1
inner join
(select person.name
from person, veterinary, assistant
where person.vat = veterinary.vat or person.vat = assistant.vat) as p2
on p1.name = p2.name;

/* 9 */
select distinct person.name, person.address_street
from person, client
where not exists (
                  select animal.name
                  from animal
                  where animal.vat = person.vat and
                        animal.species_name not like "%bird%") and
      exists (
              select animal.name
              from animal
              where animal.vat = person.vat);