Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.


pages Example Input:
page_id    page_name
20001     SQL Solutions
20045     Brain Exercises

  

page_likes Example Input:
user_id   page_id   liked_date
111       20001     04/08/2022 00:00:00
121       20045     03/12/2022 00:00:00


Ans:
select p.page_id
from pages p left outer join page_likes l 
on (p.page_id= l.page_id)
where l.page_id is null 
order by 1
