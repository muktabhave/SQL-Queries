/* 1517. Find Users With Valid E-Mails
https://leetcode.com/problems/find-users-with-valid-e-mails/submissions/
*/

select user_id, name, mail
from users
where 
REGEXP_LIKE(mail, '^[a-z]+[a-z0-9_.-]*@leetcode.com', 'i')
