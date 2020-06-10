/* Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.
 */

select distinct buyer_id from sales s join product p 
on (p.product_id= s.product_id)
where p.product_name= 'S8'
and buyer_id not in
( select buyer_id from sales s join product p 
on (p.product_id= s.product_id)
where p.product_name= 'iPhone'
)
