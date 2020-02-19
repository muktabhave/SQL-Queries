
select name as results from
(select
u.name
-- , count(movie_id)
from movie_rating r join users u
on (r.user_id= u.user_id)
group by u.name
order by count(movie_id) desc, u.name)
where rownum<2

union

select title as results from
(select m.title
-- , avg(rating) 
from
movie_rating r join movies m
on (r.movie_id= m.movie_id)
where created_at between '2020-02-01' and '2020-02-29'
group by m.title
order by avg(rating) desc, m.title)
where rownum<2
