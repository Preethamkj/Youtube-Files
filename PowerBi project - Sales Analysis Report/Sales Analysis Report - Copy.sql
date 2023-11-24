use Pizza_Sales2

select * from pizza


-- 1. Total Revenue --
select cast(sum(total_price) as decimal(10,2)) as total_revenue from Pizza

-- 2. Average Order Value --
select cast(sum(total_price)/count(distinct order_id) as decimal(10,2))
as avg_ord_val from pizza

-- 3. Total Pizza Sold --
select sum(quantity) as tot_piz_sold from pizza

-- 4. Total Orders --
select count(distinct order_id) as tot_orders from pizza

-- 5. Average Pizza per Order --
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id)
as decimal(10,2)) as decimal(10,2)) 
as avg_pizza_per_order from pizza

-- 6. Daily Trend for pizza Sales --
select datename(dw,order_date) day, count(quantity) as Pizza_sales from pizza
group by datename(dw,order_date)


-- 7. Monthly Trend for total orders --
select datename(month,order_date) as month_name, 
count(distinct order_id) as Total_orders from pizza
group by datename(month,order_date)


-- 8. Percentage of sales by pizza category --
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_sales,
cast(sum(total_price)*100/(select sum(total_price) from pizza) as decimal(10,2))
as percentage
from pizza
group by pizza_category



-- 9. Percentage of sales by pizza size --
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales,
cast(sum(total_price)*100/(select sum(total_price) from pizza) as decimal(10,2))
as percentage
from pizza
group by pizza_size

-- 10. Total Pizza sold by pizza category --
select pizza_category, sum(quantity) as total_sold from pizza
group by pizza_category



-- 11. Top 5 pizza by Revenue --
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as Total_revenue
from pizza
group by pizza_name
order by sum(total_price) desc

-- 12. Bottom 5 pizza by revenue -- 
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as Total_revenue
from pizza
group by pizza_name
order by sum(total_price) 


-- 13. Top 5 pizza by quanity sold --
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as total_quantity
from pizza
group by pizza_name
order by sum(quantity) desc

-- 14. Bottom 5 pizza by quanity sold --
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as total_quantity
from pizza
group by pizza_name
order by sum(quantity)

-- 15. Top 5 pizza by Total Orders -- 
select top 5 pizza_name, count(distinct order_id) as Total_orders from pizza
group by pizza_name
order by count(distinct order_id) DESC


-- 16. Bottom 5 pizza by Total Order --

select top 5 pizza_name, count(distinct order_id) as Total_orders from pizza
group by pizza_name
order by count(distinct order_id) 
 