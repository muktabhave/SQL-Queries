/* 1355. Activity Participants */

/* Faster Solution */

SELECT activity
FROM
(SELECT activity, count(*) as ac, 
       max(count(*)) OVER () as max_num, 
       min(count(*)) OVER () as min_num
FROM Friends
GROUP BY activity ) tablea
WHERE ac not in (max_num, min_num);


/* Alternate solution */

WITH mx AS
(SELECT MAX(cnt) as max_cnt, MIN(cnt) as min_cnt
FROM
(SELECT activity, COUNT(id) as cnt
FROM friends
GROUP BY activity)),

fin as 
(SELECT activity , count(id) as cnt
FROM friends f 
GROUP BY activity)

SELECT fin.activity 
FROM fin join mx
ON (fin.cnt!=max_cnt and fin.cnt!= min_cnt)
