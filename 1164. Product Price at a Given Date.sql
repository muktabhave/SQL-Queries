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
