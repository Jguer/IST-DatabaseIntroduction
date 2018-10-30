/* 1 */ /* Falta ligar person ao vet data */
SELECT animal.name,
       animal.species_name,
       person.name,
       animal.age
FROM animal
JOIN client ON animal.VAT = client.VAT
JOIN person ON animal.VAT = person.VAT
WHERE person.name == 'John Smith';

/* 2 */
SELECT name,
       reference_value
FROM
indicator
WHERE units = 'milligrams'
  AND reference_value > 100
ORDER BY reference_value DESC;

/* 3 */
SELECT animal.name,
       animal.species_name,
       person.name,
       animal.age
FROM consult
JOIN client ON consult.VAT = client.VAT
JOIN person ON consult.VAT = person.VAT
JOIN animal ON consult.VAT = animal.VAT
WHERE consult.weight > 30
  AND consult.o LIKE 'obes%';

/* 4 */
SELECT person.name,
       person.vat,
       person.address_street
FROM person
left join animal on person.VAT = animal.VAT
where animal.VAT is null;

/* se nao funcionar where not exists(select null from table2 t2 where t2.id = t1.id) */ /* 5 */ /* 6 */ /* 7 */ /* 8 */ /* 9 */
