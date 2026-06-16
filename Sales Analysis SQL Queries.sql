SELECT * FROM da.pizza_sales_excel_file;
select sum(total_price) as Total_Revenue from pizza_sales_excel_file;
select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales_excel_file;
select sum(quantity) as Total_pizza_sold from pizza_sales_excel_file;
select count(distinct order_id) as Total_orders from pizza_sales_excel_file;
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_per_order from pizza_sales_excel_file;

SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales_excel_file
GROUP BY order_day
ORDER BY FIELD(order_day, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

	SELECT 
		MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name, 
		COUNT(DISTINCT order_id) AS Total_orders
	FROM pizza_sales_excel_file
	GROUP BY Month_Name
	ORDER BY FIELD(Month_Name, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

## PCT of sales by pizza category

select pizza_category, sum(total_price) as Total_sales, sum(total_price)*100/
(select sum(total_price) from pizza_sales where month(order_date)=1) as PCT 
from pizza_sales_excel_file
where month(order_date)=1
group by pizza_category;


SELECT 
    pizza_category, 
    SUM(total_price) AS Total_sales, 
    CONCAT(
        ROUND(
            SUM(total_price) * 100 / (
                SELECT SUM(total_price) 
                FROM pizza_sales_excel_file 
                WHERE MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1
            ), 2
        ), '%'
    ) AS PCT 
FROM pizza_sales_excel_file
WHERE MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1
GROUP BY pizza_category;

select pizza_name, sum(total_price) as Total_Revenue from pizza_sales_excel_file
group by Pizza_name
order by Total_Revenue asc
limit 5;


select pizza_name, sum(quantity) as Total_Quantity from pizza_sales_excel_file
group by Pizza_name
order by Total_Quantity desc
limit 5;






