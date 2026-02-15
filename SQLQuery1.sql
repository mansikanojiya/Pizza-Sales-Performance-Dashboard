SELECT * FROM pizza_sales
SELECT SUM(TOTAL_PRICE) FROM pizza_sales;
select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales ;
select sum(quantity) as total_pizza_quantity from pizza_sales;
select count(distinct order_id) as total_orders from pizza_sales;
select sum(quantity)/count(distinct order_id) from pizza_sales;
--daily trends of total orders 
select datename (dw,order_date) as order_day ,count(distinct order_id) as total_orders 
from pizza_Sales
group by datename (DW,order_DATE);

--HOURLY TREND
SELECT DATEPART (HOUR,ORDER_TIME) AS ORDER_HOURS,COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS 
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE)*100/
(SELECT SUM(TOTAL_PRICE) FROM pizza_sales) FROM pizza_sales
GROUP BY pizza_category;

SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE) AS TOTAL_SALES ,SUM(TOTAL_PRICE)*100/
(SELECT SUM(TOTAL_PRICE) FROM pizza_sales WHERE MONTH(ORDER_DATE)=1) AS PCT  FROM pizza_sales
WHERE MONTH(ORDER_DATE)=1
GROUP BY pizza_category;

--PERCENTAGE OF SALES BY PIZZA_SIZE
SELECT PIZZA_SIZE,SUM(TOTAL_PRICE) AS TOTAL_SALES ,SUM(TOTAL_PRICE)*100/
(SELECT SUM(TOTAL_PRICE) FROM pizza_sales WHERE MONTH(ORDER_DATE)=1) AS PCT  FROM pizza_sales
WHERE MONTH(ORDER_DATE)=1
GROUP BY pizza_SIZE;

SELECT PIZZA_CATEGORY ,SUM(QUANTITY) AS TOTAL_PIZZA_SOLD
FROM PIZZA_SALES
GROUP BY PIZZA_CATEGORY;

SELECT PIZZA_NAME ,SUM(QUANTITY) AS TOTAL_PIZZA_SOLD
FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY SUM(QUANTITY);


SELECT  TOP 5 PIZZA_NAME ,SUM(QUANTITY) AS TOP_5
FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY SUM(QUANTITY);

SELECT  TOP 5 PIZZA_NAME ,SUM(QUANTITY) AS TOP_5_AUGUST
FROM PIZZA_SALES
WHERE MONTH(ORDER_DATE)=8
GROUP BY PIZZA_NAME
ORDER BY SUM(QUANTITY);