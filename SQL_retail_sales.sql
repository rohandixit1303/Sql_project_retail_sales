select stock_quantity from books
order by stock_quantity desc;


SELECT 
    stock_quantity
FROM
    books
WHERE
    stock_quantity = (SELECT 
            MAX(stock_quantity)
        FROM
            books
        WHERE
            stock_quantity < (SELECT 
                    MAX(stock_quantity)
                FROM
                    books));

select category,sum(total_sale),count(*) from retail_sales

group by category;



SELECT 
    round(avg(age),2) AS avg
FROM
    retail_sales
WHERE
    category = 'beauty';
    
    
select * from retail_sales
where total_sale >1000
;

select category,gender,count(*) from retail_sales
group by category,gender
order by category;


select year,month  from
(select 
year( sale_date) as year , 
month(sale_date) as month ,
avg(total_sale) ,
rank() over(partition by year( sale_date) order by avg(total_sale) desc) as numb
from retail_sales
group by year, month
) as t1	
where numb =1
;

SELECT 
    customer_id, SUM(total_sale)
FROM
    retail_sales
GROUP BY customer_id
ORDER BY SUM(total_sale) DESC
LIMIT 5;


SELECT 
    category,  COUNT(DISTINCT customer_id) as dis
FROM
    retail_sales
GROUP BY category;

with hourly_sales as(
select *,
case 
	when hour(sale_time) <12 then 'morning '
    when hour(sale_time) between 12 and 17 then'afternoon'
    else 'evening'
end AS shift
from retail_sales
)
select shift,count(*) from hourly_sales
group by shift
;


-- end of project 




































