use Pizza_Sales

select * from pizza


-- 1. Total Revenue --

select cast(sum(total_price) as Decimal(10,4)) as Total_Revenue from pizza


-- 2. Average Order Value --

Select cast(sum(total_price)/count(distinct order_id) as Decimal(10,4)) as Average_Order_Value from pizza


-- 3. Total Pizza Sold --

Select sum(quantity) as Total_Pizza_Sold from pizza


-- 4. Total Orders --

Select count(distinct order_id) as Total_Orders from pizza


-- 5. Average Pizza per Order --

Select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,4)) as decimal(10,4))
as Avg_Pizza_per_Order from pizza


-- 6. Daily Trend for pizza Sales --

select datename(dw,order_date) Day, count(quantity) as Pizza_sales from pizza
group by datename(dw,order_date)


-- 7. Monthly Trend for total orders --

select datename(month,order_date) as Month_Name, count(distinct order_id) as Total_orders from pizza
group by datename(month,order_date)


-- 8. Percentage of sales by pizza category --

select pizza_category, cast(sum(total_price) as decimal(10,4))as Total_sales, 
cast(sum(total_price)*100/(select sum(total_price)from pizza) as decimal(10,4))as Percentage_sales from pizza
group by pizza_category


-- 9. Percentage of sales by pizza size --

select pizza_size, cast(sum(total_price)as decimal(10,4)) as Total_sales, 
cast(sum(total_price)*100/(select sum(total_price) from pizza) as decimal(10,4)) as Percentage_of_Sales
from pizza group by pizza_size order by Percentage_of_Sales DESC


-- 10. Total Pizza sold by pizza category --

Select pizza_category, sum(quantity)as Total_sales from pizza
group by pizza_category

-- 11. Top 5 pizza by Revenue --

select top 5 pizza_name, cast(sum(total_price) as decimal(10,4))as Total_Revenue from pizza
group by pizza_name 
order by sum(total_price) DESC


-- 12. Bottom 5 pizza by revenue -- 

select top 5 pizza_name, cast(sum(total_price) as decimal(10,4))as Total_Revenue from pizza
group by pizza_name 
order by sum(total_price)


-- 13. Top 5 pizza by quanity sold --

Select top 5 pizza_name, sum(quantity) as Total_quantity from pizza
group by pizza_name
order by sum(quantity) DESC


-- 14. Bottom 5 pizza by quanity sold --

Select top 5 pizza_name, sum(quantity) as Total_quantity from pizza
group by pizza_name
order by sum(quantity)


-- 15. Top 5 pizza by Total Orders -- 

Select top 5 pizza_name, count(distinct order_id) as Total_Orders from pizza
group by pizza_name
order by count(distinct order_id) DESC


-- 16. Top 5 pizza by Total Order --

Select top 5 pizza_name, count(distinct order_id) as Total_Orders from pizza
group by pizza_name
order by count(distinct order_id)
