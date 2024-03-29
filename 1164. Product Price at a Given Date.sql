Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+


________________________________SOLUTION___________________________________________________


select product_id,
case when change_date=to_date('2019-08-16') then new_price
     when change_date> to_date('2019-08-16') and prev_change_date is null then 10
     when change_date> to_date('2019-08-16') and prev_change_date is not null then prev_price
end as price from
(select product_id, new_price, change_date,
lag(change_date, 1) over (partition by product_id order by change_date) as prev_change_date,
lag(new_price, 1) over (partition by product_id order by change_date) as prev_price
from products) 
where 
case when change_date=to_date('2019-08-16') then new_price
     when change_date> to_date('2019-08-16') and prev_change_date is null then 10
     when change_date> to_date('2019-08-16') and prev_change_date is not null then prev_price
end is not null
order by price desc


/* Oher Method */

/* Write your PL/SQL query statement below */

select product_id, 
case when change_date> '2019-08-16' then 10 else new_price end as price from products
where (product_id, change_date) in
(select product_id, max(change_date) as change_date
from products
where change_date<= '2019-08-16'
group by product_id
union
select product_id , min(change_date) as change_date from products 
group by product_id
having min(change_date)> '2019-08-16')
