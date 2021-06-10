/* https://leetcode.com/problems/human-traffic-of-stadium 
601. Human Traffic of Stadium */

/* using join */

select s.id , to_char(s.visit_date, 'YYYY-MM-DD') as visit_date
--,dt.visit_date as vs1, count(dt.visit_date) from
(select id , visit_date, people from stadium where people>100) s 
join
(select distinct visit_date from stadium where people>100) dt
on (s.visit_date>= dt.visit_date+2)
group by s.id , s.visit_date
having count(dt.visit_date)>=3
order by s.visit_date



/* Using window function */

select id , to_char(visit_date, 'YYYY-MM-DD') as visit_date , people from
(select id , visit_date , people,
lag(id, 1) over (order by visit_date) as lag_id_1,
lag(id, 2) over (order by visit_date) as lag_id_2,
lead(id, 1) over (order by visit_date) as lead_id_1,
lead(id, 2) over (order by visit_date) as lead_id_2
from 
(select id , visit_date , people from stadium where people>=100)
)
where (id- lag_id_1= 1 and id- lag_id_2=2) or
(id- lag_id_1= 1 and lead_id_1- id= 1) or
(lead_id_1- id= 1 and lead_id_2- id= 2 )
