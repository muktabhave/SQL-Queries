/* Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020. */

select distinct title 
from tvprogram t join content c
on (t.content_id= c.content_id)
where kids_content= 'Y' and content_type= 'Movies' and to_char(program_date, 'YYYY-MM')= '2020-06'
