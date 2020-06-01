/* Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month. */

select
id,
sum(case when month= 'Jan' then revenue end) as jan_revenue,
sum(case when month= 'Feb' then revenue end) as feb_revenue,
sum(case when month= 'Mar' then revenue end) as mar_revenue,
sum(case when month= 'Apr' then revenue end) as apr_revenue,
sum(case when month= 'May' then revenue end) as may_revenue,
sum(case when month= 'Jun' then revenue end) as jun_revenue,
sum(case when month= 'Jul' then revenue end) as jul_revenue,
sum(case when month= 'Aug' then revenue end) as aug_revenue,
sum(case when month= 'Sep' then revenue end) as sep_revenue,
sum(case when month= 'Oct' then revenue end) as oct_revenue,
sum(case when month= 'Nov' then revenue end) as nov_revenue,
sum(case when month= 'Dec' then revenue end) as dec_revenue
from department
group by id
