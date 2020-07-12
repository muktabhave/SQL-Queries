/* Write your PL/SQL query, You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it. */

select '[0-5>' as bin,
count(case when duration >= 0 and duration<(5*60) then session_id end) as total
from Sessions
group by '[0-5>'
 
union

select '[5-10>' as bin,
count(case when duration >= (5*60) and duration<(10*60) then session_id end) as total
from Sessions
group by '[5-10>'
 
union
 
select '[10-15>' as bin,
count(case when duration >= (10*60) and duration<(15*60) then session_id end) as total
from Sessions
group by  '[10-15>'

union

select '15 or more' as bin,
count(case when duration >= (15*60) then session_id end) as total
from Sessions
group by '15 or more'
