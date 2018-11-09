/* Query 6 */
select avg(S.a1) as average_number_of_assistants,
       avg(S.a2) as average_number_of_procedures,
       avg(S.a3) as average_number_of_diagnosis,
       avg(S.a4) as average_number_of_prescriptions
from
    (
    select consult.date_timestamp, 
           count(distinct participation.vat_assistant) as a1,
           count(distinct vet_procedure.num) as a2,
           count(distinct consult_diagnosis.code) as a3,
           count(distinct prescription.name_med) as a4
    from consult
    left join participation on consult.date_timestamp = participation.date_timestamp 
                            and consult.name = participation.name
                            and consult.vat_owner = participation.vat_owner
    left join vet_procedure on consult.date_timestamp = vet_procedure.date_timestamp
                            and consult.name = vet_procedure.name
                            and consult.vat_owner = vet_procedure.vat_owner
    left join consult_diagnosis on consult.date_timestamp = consult_diagnosis.date_timestamp
                                and consult.name = consult_diagnosis.name
                                and consult.vat_owner = consult_diagnosis.vat_owner
    left join prescription on consult.date_timestamp = prescription.date_timestamp
                           and consult.name = prescription.name
                           and consult.vat_owner = prescription.vat_owner
    where YEAR(consult.date_timestamp) like "2017"
    group by consult.date_timestamp
    ) as S;