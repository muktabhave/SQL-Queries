select f2.followee as follower, count(distinct f2.follower) as num
from follow f1 join follow f2
on (f1.follower= f2.followee)
group by 1;
