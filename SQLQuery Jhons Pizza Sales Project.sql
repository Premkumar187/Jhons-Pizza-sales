
select * from pizza_sales

--Total Revenue
select sum (total_price) as Total_Rrevenue from pizza_sales

--Average Order Value
select sum (total_price) / count(distinct order_id) as Avg_Order_value from pizza_sales

--Total Pizza Sold
select sum(quantity) as Total_pizza from pizza_sales

--Total Orders Plased
select count(distinct order_id) as Total_Orders from pizza_sales

--Average Pizza Per Order
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizza_per_Order from pizza_sales

--Daily Trend for Total Orders
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_Orders from pizza_sales group by DATENAME(DW,order_date)

--Monthly Trend for Total Orders
select DATENAME(month, order_date) as Month_Name, count(distinct order_id) as Total_Orders from pizza_sales group by DATENAME(month, order_date)
order by Total_Orders desc

--Percentage of Sales by Pizza Category
select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date) = 1) as Percentage_of_Sales from pizza_sales where month(order_date)=1 group by pizza_category

--Percentage of Sales by Pizza Size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where DATEPART(quarter, order_date) = 1) as decimal(10,2)) as Percentage_of_Sales from pizza_sales where DATEPART(quarter, order_date) = 1 group by pizza_size order by Percentage_of_Sales desc

--Top 5 Best Selling Pizza and Revenue,Total Quantity and Total Orders
select top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue desc

--Bottom 5 Sellers by Revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue asc

--Top 5 Best Selling Pizza by Total Quantity
select top 5 pizza_name, sum(quantity) as Total_quantity from pizza_sales group by pizza_name order by Total_quantity desc

--Bottom 5 Selling Pizza by Total Quantity
select top 5 pizza_name, sum(quantity) as Total_quantity from pizza_sales group by pizza_name order by Total_quantity asc

--Top 5 Best Selling Pizza by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_Order from pizza_sales group by pizza_name order by Total_order desc

--Bottom 5 Selling Pizza by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_Order from pizza_sales group by pizza_name order by Total_order asc




