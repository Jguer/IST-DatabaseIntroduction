/* 1 */
update person
inner join client on person.vat = client.vat
set person.address_street = "Rua da Ferroviaria 3",
    person.address_city = "Estrela",
    person.address_zip = "1939-013"
where person.name = "John Smith";

/* 2 */ 
update indicator
join produced_indicator on indicator.name = produced_indicator.indicator_name
join test_procedure on test_procedure.name = produced_indicator.name
                    and test_procedure.vat_owner = produced_indicator.vat_owner
                    and test_procedure.date_timestamp = produced_indicator.date_timestamp
set indicator.reference_value = indicator.reference_value*1.1
where test_procedure.type = "blood" and indicator.units = "milligrams";


/* 3 */
delete 
from client using person join client on person.vat = client.vat
where person.name ="John Smith";

/* 4 */
insert into diagnosis_code values (6,"end-stage renal disease");
update consult_diagnosis
join produced_indicator on produced_indicator.name = consult_diagnosis.name
                        and produced_indicator.vat_owner = consult_diagnosis.vat_owner
                        and produced_indicator.date_timestamp = consult_diagnosis.date_timestamp
join diagnosis_code on diagnosis_code.code = consult_diagnosis.code
set consult_diagnosis.code = 6, consult_diagnosis.date_timestamp = consult_diagnosis.date_timestamp
where diagnosis_code.name = "kidney failure" and produced_indicator.value > 1
      and produced_indicator.indicator_name = "creatinine level";