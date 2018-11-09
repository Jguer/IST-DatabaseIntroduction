drop view if exists facts_consults;
drop view if exists dim_date;
drop view if exists dim_animal;

/* dim_date */
create view dim_date as
  (select distinct date_timestamp,
                   DAY(date_timestamp) as day,
                   MONTH(date_timestamp) as month,
                   YEAR(date_timestamp) as year
   from consult);

/* dim_animal */
create view dim_animal as
  (select animal.name as animal_name,
          animal.vat as animal_vat,
          animal.species_name as species,
          animal.age as age
   from animal);

/* facts_consults */
create view facts_consults as
  (select consult.name as name,
          consult.vat_owner as vat,
          consult.date_timestamp as date_timestamp,
          count(distinct vet_procedure.num) as num_procedures,
          count(distinct prescription.name_med) as num_medications
   from consult
   left join prescription on consult.date_timestamp = prescription.date_timestamp
                          and consult.name = prescription.name
                          and consult.vat_owner = prescription.vat_owner
   left join vet_procedure on consult.date_timestamp = vet_procedure.date_timestamp
                           and consult.name = vet_procedure.name
                           and consult.vat_owner = vet_procedure.vat_owner
   group by consult.date_timestamp);
