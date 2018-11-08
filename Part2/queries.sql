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
     where c2.name = c1.name
           and c2.vat_owner = c1.vat_owner);

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
select avg(S.a1) as average_number_of_assistants,
       avg(S.a2) as average_number_of_procedures,
       avg(S.a3) as average_number_of_diagnosis,
       avg(S.a4) as average_number_of_prescriptions
from
    (
    select consult.date_timestamp, 
           count(distinct participation.vat_assistant) as a1,
           count(distinct vet_procedure.num) as a2,
           count(distinct consult_diagnosis.code) as a3,
           count(distinct prescription.name_med) as a4
    from consult
    left join participation on consult.date_timestamp = participation.date_timestamp 
                            and consult.name = participation.name
                            and consult.vat_owner = participation.vat_owner
    left join vet_procedure on consult.date_timestamp = vet_procedure.date_timestamp
                            and consult.name = vet_procedure.name
                            and consult.vat_owner = vet_procedure.vat_owner
    left join consult_diagnosis on consult.date_timestamp = consult_diagnosis.date_timestamp
                                and consult.name = consult_diagnosis.name
                                and consult.vat_owner = consult_diagnosis.vat_owner
    left join prescription on consult.date_timestamp = prescription.date_timestamp
                           and consult.name = prescription.animal_name
                           and consult.vat_owner = prescription.vat_owner
    where YEAR(consult.date_timestamp) like "2017"
    group by consult.date_timestamp
    ) as S;

/* Query 7 */
select D.s as dog_sub_species, 
       diagnosis_code.code as most_common_disease
from diagnosis_code,
    (select sub.name as s,
              consult_diagnosis.code as c,
              count(consult_diagnosis.code) as n
    from generalization_species as dog_species,
        species as sub,
        animal inner join consult_diagnosis 
        on animal.name = consult_diagnosis.name 
           and animal.vat = consult_diagnosis.vat_owner
    where animal.species_name = sub.name
          and dog_species.name2 = "dog"
          and dog_species.name1 = sub.name
    group by consult_diagnosis.code) as D
where diagnosis_code.code = D.c 
      and D.n >= all(select count(consult_diagnosis.code) as n
                  from animal inner join consult_diagnosis 
                      on animal.name = consult_diagnosis.name 
                         and animal.vat = consult_diagnosis.vat_owner
                  where animal.species_name = D.s
                  group by consult_diagnosis.code
                  );

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
