
/* https://leetcode.com/problems/hopper-company-queries-i/

acceptedrides left outer join rides

ride_id user_id requested_at driver_id ride_distance, ride_duration

join this with recursive_dates

get date, count(rides) as no_accpted_rides
where month(date)=month(ar.requested_at)
and year(ar.requested_at)= '2020'

join drivers with recursive dates on date.month= join_Date.month and year= 2020

get count of drivers by month

join this table with top table based on month and get counts
*/

with recursive month as
( select 1 as mon, LAST_DAY("2020-01-01") as dt
 
 union all 
 
 select mon+1 as mon, LAST_DAY(DATE_ADD(dt, INTERVAL 1 MONTH)) as dt from month
 where dt< DATE('2020-12-31')
),
accepted_rides as 
(select m.mon, count(ar.ride_id) as no_of_accepted_rides 
from acceptedrides ar left outer join rides r
on (ar.ride_id= r.ride_id)
right outer join month m
on (m.mon= MONTH(requested_at) and (year(requested_at)= '2020' or requested_at is Null))
group by m.mon),

active_driver as
(
select mon, count(driver_id) as driver_count 
from drivers d right outer join month m 
on (d.join_date<=m.dt)
group by mon
)

select ar.mon as month,  driver_count as active_drivers, no_of_accepted_rides as accepted_rides
from accepted_rides ar join active_driver ad
on (ar.mon= ad.mon) order by ar.mon
