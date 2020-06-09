/* Several friends at a cinema ticket office would like to reserve consecutive available seats.
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table? */


select s1.seat_id from
(select seat_id from cinema where free=1) s1
join 
(select seat_id from cinema where free=1) s2
on (s2.seat_id=s1.seat_id+1)
union
select s1.seat_id from
(select seat_id from cinema where free=1) s1
join
(select seat_id from cinema where free=1) s3
on (s3.seat_id=s1.seat_id-1)
order by 1
