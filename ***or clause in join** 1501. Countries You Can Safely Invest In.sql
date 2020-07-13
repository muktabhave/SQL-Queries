/* A telecommunications company wants to invest in new countries. The company intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration. */

select ct.name as country
from calls c join person p
on (c.caller_id= p.id or c.callee_id= p.id)
join country ct
on (substr(p.phone_number,1,3)=ct.country_code)
group by ct.name
having avg(duration)> (select avg(duration) from calls)
