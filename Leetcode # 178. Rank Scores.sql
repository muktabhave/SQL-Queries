
Leetcode # 178. Rank Scores

o/p:
select Score as "Score",
dense_rank() over (order by Score desc) as "Rank"
from Scores 
