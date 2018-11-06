/* 1 */
update person
inner join client on person.vat = client.vat
set person.address_street = "Rua da Ferroviaria 3",
    person.address_city = "Estrela",
    person.address_zip = "1939-013"
where person.name == "John Smith";

/* 2 */ /* 3 */ /* 4 */
