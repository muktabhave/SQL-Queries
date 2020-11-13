/* Write an SQL query to find all the people who viewed more than one article on the same date, sorted in ascending order by their id. */

select distinct viewer_id as id
from views 
group by viewer_id,view_date
having count(distinct article_id)>1)
order by viewer_id

