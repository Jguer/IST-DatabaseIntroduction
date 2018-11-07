/* 1 */
update person
inner join client on person.vat = client.vat
set person.address_street = "Rua da Ferroviaria 3",
    person.address_city = "Estrela",
    person.address_zip = "1939-013"
where person.name == "John Smith";

/* 2 */ /* 3 */
delete
from person,
     client,
     animal,
     consult,
     prescription,
     participation,
     consult_diagnosis,
     vet_procedure,
     radiography,
     test_procedure,
     produced_indicator,
     performed using person
join client on person.vat = client.vat
join animal on person.vat = animal.vat
join consult on person.vat = consult.vat_owner
join prescription on person.vat = prescription.vat_owner
join participation on person.vat = participation.vat_owner
join consult_diagnosis on person.vat = consult_diagnosis.vat_owner
join vet_procedure on person.vat = vet_procedure.vat_owner
join performed on person.vat = performed.vat_owner
join radiography on person.vat = radiography.vat_owner
join test_procedure on person.vat = test_procedure.vat_owner
join produced_indicator on person.vat = produced_indicator.vat_owner
where person.name == "John Smith";

/* 4 */
