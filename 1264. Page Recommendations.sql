/* Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not recommend pages you already liked. */

select distinct page_id  as recommended_page from likes l join
(select user2_id as frnd from friendship where user1_id=1
union
select user1_id as frnd from friendship where user2_id=1) k
on (k.frnd= l.user_id)

minus

select page_id as recommended_page from likes where user_id=1
