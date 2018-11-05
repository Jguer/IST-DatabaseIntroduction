drop view if exists facts_consults;
drop view if exists dim_date;
drop view if exists dim_animal;

/* 1 */
create view dim_date as
	( select distinct date_timestamp, 
		DAY(date_timestamp) as day,
		MONTH(date_timestamp) as month,
		YEAR(date_timestamp) as year
	  from consult
	);


/* 2 */
create view dim_animal as
	( select animal.name as animal_name, 
		animal.vat as animal_vat,
		animal.species_name as species
		# animal.age as age
	  from animal
	);

/* 3 */
create view facts_consults as
	( select dim_animal.animal_name as name,
			 dim_animal.animal_vat as vat,
			 dim_date.date_timestamp as date_timestamp,
			 count(vet_procedure.date_timestamp),
			 count(prescription.date_timestamp)
	  from dim_date, dim_animal, consult,
	  	   vet_procedure, prescription
	  where vet_procedure.date_timestamp = consult.date_timestamp and
	  		prescription.date_timestamp = consult.date_timestamp and
	  		consult.date_timestamp = dim_date.date_timestamp and
	  		consult.name = dim_animal.animal_name and
	  		consult.vat_owner = dim_animal.animal_vat
	);