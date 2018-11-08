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