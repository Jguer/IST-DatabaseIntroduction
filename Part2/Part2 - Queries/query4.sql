/* Query 4 */
select N.name as name,
       N.vat as vat,
       N.address_street as street,
       N.address_city as city,
       N.address_zip as zip
from person as N,
     client
where N.vat = client.vat
  and not exists
    (select animal.vat
     from animal
     where animal.vat = N.vat);