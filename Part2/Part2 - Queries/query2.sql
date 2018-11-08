/* Query 2 */
select name,
       reference_value
from
indicator
where units = 'milligrams'
  and reference_value > 100
order by reference_value desc;