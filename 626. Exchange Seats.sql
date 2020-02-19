626. Exchange Seats

https://leetcode.com/problems/exchange-seats/

o/p code:
select s1.id as id, ifnull(s2.student, s1.student) as student from
(select * from seat where id%2=1) s1 
left outer join 
(select * from seat where id%2=0) s2
on (s1.id= s2.id-1)
union

select s2.id as id, s1.student as student from
 (select * from seat where id%2=1) s1 
 join 
(select * from seat where id%2=0) s2
on (s1.id= s2.id-1)
order by id
