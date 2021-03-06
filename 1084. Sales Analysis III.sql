/* Write an SQL query that reports the products that were only sold in spring 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
 */

SELECT p.product_id,product_name
FROM Product p JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id,product_name
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31'
ORDER BY p.product_id
