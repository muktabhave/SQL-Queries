/* 614. Second Degree Follower */

SELECT f1.follower, COUNT(DISTINCT f2.follower) as num
FROM follow f1 join follow f2
ON (f1.follower= f2.followee)
GROUP BY f1.follower
ORDER BY f1.follower
