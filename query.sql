/* 1 */
select distinct animal.name,
       owner.name,
       animal.species_name,
       animal.age
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
       animal.species_name,
       animal.age
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
select diagnosis_code.name, count(distinct prescription.name_med)
from prescription, diagnosis_code
where prescription.code = diagnosis_code.code
group by diagnosis_code.name;


/* 6 */
select count(distinct participation.vat_assistant) / count(distinct consult.date_timestamp) 
       as average_number_of_assistants, 
       count(distinct vet_procedure.num) / count(distinct consult.date_timestamp)
       as average_number_of_procedures,
       count(distinct consult_diagnosis.code) / count(distinct consult.date_timestamp)
       as average_number_of_diagnosis, 
       count(distinct prescription.name_med) / count(distinct consult.date_timestamp)
       as average_number_of_prescriptions
from consult left join participation on consult.date_timestamp
             left join vet_procedure on consult.date_timestamp
             left join consult_diagnosis on consult.date_timestamp
             left join prescription on consult.date_timestamp
where YEAR(consult.date_timestamp) like "2017";

/* 7 */
select D.s, diagnosis_code.code
from (
      select sub.name as s, consult_diagnosis.code as c,
             count(consult_diagnosis.code) as n
      from generalization_species as dog_species, 
           species as sub, animal, consult_diagnosis
      where animal.species_name = sub.name and
            animal.name = consult_diagnosis.name and
            dog_species.name2 = "dog" and dog_species.name1 = sub.name
      group by consult_diagnosis.code) as D
      join 
      (
       select D2.s, max(D2.n) as mc
       from (
             select sub.name as s, consult_diagnosis.code as c,
                    count(consult_diagnosis.code) as n
             from generalization_species as dog_species, 
                  species as sub, animal, consult_diagnosis
             where animal.species_name = sub.name and
                   animal.name = consult_diagnosis.name and
                   dog_species.name2 = "dog" and dog_species.name1 = sub.name
             group by consult_diagnosis.code
            ) as D2
        group by D2.s
      ) as T
        on D.s = T.s and D.n = T.mc,
      diagnosis_code
      where diagnosis_code.code = D.c;

      #select sub.name, consult_diagnosis.code, 
      #       count(consult_diagnosis.code)
      #from generalization_species as dog_species, 
      #     species as sub, animal, consult_diagnosis
      #where animal.species_name = sub.name and
      #      animal.name = consult_diagnosis.name and
      #      dog_species.name2 = "dog" and dog_species.name1 = sub.name
      #group by consult_diagnosis.code;
      

/* 8 */
select distinct p1.name from 
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