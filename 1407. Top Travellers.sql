/* Write your PL/SQL query statement below */

select name, nvl(sum(distance),0) as travelled_distnace
from users u left outer join rides r
on (u.id= r.user_id)
group by name
order by nvl(sum(distance),0) desc, name asc
