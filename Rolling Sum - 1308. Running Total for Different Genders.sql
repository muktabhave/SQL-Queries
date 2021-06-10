/* Write an SQL query to find the total score for each gender at each day.

Order the result table by gender and day */

select a.gender, to_char(a.day, 'YYYY-MM-DD') as day, sum(score_points) as total from
(select distinct gender, day from scores) a
join scores b
on (a.gender=b.gender and a.day>=b.day)
group by a.gender, to_char(a.day, 'YYYY-MM-DD')
order by a.gender, to_char(a.day, 'YYYY-MM-DD')


/* using sum () over.. */

select gender, to_char(day, 'YYYY-MM-DD') as day, sum(score_points) over (partition by gender order by day) as total
from scores
order by gender, to_char(day,'YYYY-MM-DD')
