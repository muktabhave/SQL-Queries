select user_id, name, mail
from users
where 
substr(mail, instr(mail,'@')+1)= 'leetcode.com'
and REGEXP_LIKE(substr(mail,1, instr(mail,'@')-1), 'a-z^A-Z^0-9^_^.')
