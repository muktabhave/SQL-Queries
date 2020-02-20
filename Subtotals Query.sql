Select category, subcategory,
sum(sales) as total_sale,
(sum(sales) over (partition by subcategory ) / sum(sales) over (partition by category ) ) * 100 as sales _percentage
From orders
Group by category, subcategory;
