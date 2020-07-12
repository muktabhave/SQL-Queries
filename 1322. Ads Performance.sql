/* Write an SQL query to find the ctr of each Ad.

Round ctr to 2 decimal points. Order the result table by ctr in descending order and by ad_id in ascending order in case of a tie. */

select ad_id, 
nvl(round(sum(case when action in ('Clicked') then 1 else 0 end)
 /sum(case when action in ('Clicked','Viewed') then 1  end)*100,2),0) ctr
from
Ads
group by ad_id
order by ctr desc,ad_id
