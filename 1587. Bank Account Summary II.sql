select name, bal as balance from
(select account, sum(amount) as bal
from transactions group by account
having sum(amount)>10000) a join users u
on (u.account=a.account)
