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