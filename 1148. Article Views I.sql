/* Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.*/

select distinct author_id as id from views 
where author_id= viewer_id
order by author_id
