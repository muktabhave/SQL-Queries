/* 614. Second Degree Follower */

Select f1.follower, count(distinct f2.follower) as num
From follow f1 join follow f2
On (f1.follower = f2.followee)
Group by f1.follower
order by f1.follower
