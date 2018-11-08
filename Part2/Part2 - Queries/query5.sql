/* Query 5 */
select diagnosis_code.name as diagnosis,
       count(distinct prescription.name_med) as number_distinct_medication
from prescription,
     diagnosis_code
where prescription.code = diagnosis_code.code
group by diagnosis_code.name
order by number_distinct_medication asc;