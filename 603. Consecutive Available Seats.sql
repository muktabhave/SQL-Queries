/* Several friends at a cinema ticket office would like to reserve consecutive available seats.
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table? */

select distinct s1.seat_id from
cinema s1 join cinema s2
on (abs(s2.seat_id-s1.seat_id)=1)
where s1.free=1
and s2.free=1
order by 1

-- select s1.seat_id from
-- cinema s1 join cinema s2
-- on (s2.seat_id=s1.seat_id+1)
-- where s1.free=1 and s2.free=1
-- union
-- select s1.seat_id from
-- cinema s1 join cinema s3
-- on (s3.seat_id=s1.seat_id-1)
-- where s1.free=1 and s3.free=1
-- order by 1
