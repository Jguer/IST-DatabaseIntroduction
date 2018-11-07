/* Query 1 */
select distinct animal.name as name,
                owner.name as owner_name,
                animal.species_name as species,
                animal.age as age
from animal,
     person as vet,
     consult,
     person as owner
where vet.name = "John Smith"
  and consult.vat_vet = vet.vat
  and consult.name = animal.name
  and consult.vat_owner = animal.vat
  and consult.vat_owner = owner.vat;

/* Query 2 */
select name,
       reference_value
from
indicator
where units = 'milligrams'
  and reference_value > 100
order by reference_value desc;

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
     where c2.name = c1.name);

/* Query 4 */
select N.name as name,
       N.vat as vat,
       N.address_street as street,
       N.address_city as city,
       N.address_zip as zip
from person as N,
     client
where N.vat = client.vat
  and not exists
    (select animal.vat
     from animal
     where animal.vat = N.vat);

/* Query 5 */
select diagnosis_code.name as diagnosis,
       count(distinct prescription.name_med) as number_distinct_medication
from prescription,
     diagnosis_code
where prescription.code = diagnosis_code.code
group by diagnosis_code.name
order by number_distinct_medication asc;

/* Query 6 */
select sum(S.a1)/count(distinct S.date_timestamp) as average_number_of_assistants,
       sum(S.a2)/count(distinct S.date_timestamp) as average_number_of_procedures,
       sum(S.a3)/count(distinct S.date_timestamp) as average_number_of_diagnosis,
       sum(S.a4)/count(distinct S.date_timestamp) as average_number_of_prescriptions
from
    (
    select consult.date_timestamp, 
           count(distinct participation.vat_assistant) as a1,
           count(distinct vet_procedure.num) as a2,
           count(distinct consult_diagnosis.code) as a3,
           count(distinct prescription.name_med) as a4
    from consult
    left join participation on consult.date_timestamp = participation.date_timestamp
    left join vet_procedure on consult.date_timestamp = vet_procedure.date_timestamp
    left join consult_diagnosis on consult.date_timestamp = consult_diagnosis.date_timestamp
    left join prescription on consult.date_timestamp = prescription.date_timestamp
    where YEAR(consult.date_timestamp) like "2017"
    group by consult.date_timestamp
    ) as S;

/* Query 7 */
select D.s as dog_sub_species,
       diagnosis_code.code as most_common_disease
from
  (select sub.name as s,
          consult_diagnosis.code as c,
          count(consult_diagnosis.code) as n
   from generalization_species as dog_species,
        species as sub,
        animal,
        consult_diagnosis
   where animal.species_name = sub.name
     and animal.name = consult_diagnosis.name
     and dog_species.name2 = "dog"
     and dog_species.name1 = sub.name
   group by consult_diagnosis.code) as D
join
  (select D2.s,
          max(D2.n) as mc
   from
     (select sub.name as s,
             consult_diagnosis.code as c,
             count(consult_diagnosis.code) as n
      from generalization_species as dog_species,
           species as sub,
           animal,
           consult_diagnosis
      where animal.species_name = sub.name
        and animal.name = consult_diagnosis.name
        and dog_species.name2 = "dog"
        and dog_species.name1 = sub.name
      group by consult_diagnosis.code) as D2
   group by D2.s) as T on D.s = T.s
and D.n = T.mc,
    diagnosis_code
where diagnosis_code.code = D.c;

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

/* Query 9 */
select distinct person.name as name,
                person.address_street as street,
                person.address_city as city,
                person.address_zip as zip
from person,
     client
where not exists
    (select animal.name
     from animal
     where animal.vat = person.vat
       and animal.species_name not like "%bird%")
  and exists
    (select animal.name
     from animal
     where animal.vat = person.vat);
