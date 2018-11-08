/* Indexes Useful for Query 1 */
create index idx_person_name on person(name);
create index idx_consult_vat_vet on consult(vat_vet);

/* Indexes Useful for Query 2 */
create index idx_indicators_units_reference on indicator(units, reference_value);