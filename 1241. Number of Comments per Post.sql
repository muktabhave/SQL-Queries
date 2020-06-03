/* Write an SQL query to find number of comments per each post.

Result table should contain post_id and its corresponding number_of_comments, and must be sorted by post_id in ascending order.

Submissions may contain duplicate comments. You should count the number of unique comments per post.

Submissions may contain duplicate posts. You should treat them as one post. */


select post_id, count(distinct s.comment_id) as number_of_comments 
from 
(select sub_id as post_id from submissions
where parent_id is null) p left outer join
(select sub_id as comment_id, parent_id from submissions
where parent_id is not null) s
on (p.post_id= s.parent_id)
group by post_id
order by post_id
