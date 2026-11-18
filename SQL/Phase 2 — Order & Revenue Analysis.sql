-- =====================================================
# Phase 2 — Order & Revenue Analysis
-- ===================================================== 
# Task 1: Analyze Order Status Distribution

-- select order_status ,count(*) total_orders , 
--  round(count(*)/(select count(*) from olist_orders_dataset)*100.0,2) pct
-- from olist_orders_dataset
-- group by order_status
-- order by total_orders desc 

# Task 2: Calculate Delivered vs Non-Delivered Orders

-- with cte as (select count(*) total_orders , count(case when order_status = "delivered" then 1 end ) delivered_orders , 
-- count(case when order_status <> "delivered" then 1 end ) non_delivered_orders 
-- from olist_orders_dataset)
-- select total_orders , delivered_orders ,
--  round(delivered_orders/total_orders*100.0,2) delivered_pct,
-- non_delivered_orders , round(non_delivered_orders/total_orders*100.0,2) non_delivered_orders_pct
-- from cte

# Task 3: Analyze Order non delivered Status Breakdown

-- select order_status , count(*) total_orders,
-- round(count(*)/(select count(*) from olist_orders_dataset where order_status <> "delivered")*100.0,2) pct
-- from olist_orders_dataset
-- where order_status <> "delivered"
-- group by order_status
-- order by total_orders desc

 # Task 4: Analyze Delivery Performance
 
--  with cte as (select count(*) total_delivered_orders, 
-- count(case when order_delivered_customer_date<=order_estimated_delivery_date then 1 end ) on_time ,
--  count(case when order_delivered_customer_date>order_estimated_delivery_date then 1 end ) late 
--  from olist_orders_dataset
--  where order_status = "delivered")
--  select total_delivered_orders, on_time, round(on_time/total_delivered_orders*100.0,2) on_time_pct,
--  late , round(late/total_delivered_orders*100.0,2) late_pct
--  from cte

# Task 5: Average Delivery Time

-- select count(*) total_delivered_orders , 
-- round(avg(datediff(order_delivered_customer_date,order_purchase_timestamp)),2) avg_days
-- from olist_orders_dataset
-- where order_status = "delivered" and order_delivered_customer_date is not null and 
-- order_purchase_timestamp is not null

# Task 6: Identify Orders with the Longest Delivery Times

-- select order_id, order_purchase_timestamp, order_delivered_customer_date, 
-- datediff(order_delivered_customer_date,order_purchase_timestamp) delivery_days
-- from olist_orders_dataset
-- where order_status ="delivered" and  order_delivered_customer_date is not null and 
-- order_purchase_timestamp is not null
-- order by delivery_days desc 
-- limit 10 
 
 # Task 7: Compare Actual Delivery with Estimated Delivery
 #  Finds the 10 most delayed orders.
 
-- select order_id, order_estimated_delivery_date , order_delivered_customer_date,
--  datediff(order_delivered_customer_date,order_estimated_delivery_date) days , 
--  case when datediff(order_delivered_customer_date,order_estimated_delivery_date) <=0 then "on time" else 
--  "delay" end delivery_status
--  from olist_orders_dataset
--  where order_status="delivered"  and order_delivered_customer_date is not null and 
--  order_estimated_delivery_date is not null 
--  order by days desc
--  limit 10

# Task 8 — Analyze Delivery Performance Distribution
# Business question: What percentage of delivered orders arrived early, on time, and late?

-- WITH cte AS (SELECT  
-- CASE WHEN datediff(order_delivered_customer_date,order_estimated_delivery_date)<0 THEN 'Early'
-- 	WHEN datediff(order_delivered_customer_date,order_estimated_delivery_date)=0 THEN 'On Time' 
-- 	WHEN datediff(order_delivered_customer_date,order_estimated_delivery_date)>0 THEN 'Late' END AS delivery_status
--     FROM olist_orders_dataset
--     WHERE order_status = 'delivered'
--     AND order_delivered_customer_date IS NOT NULL
--     AND order_estimated_delivery_date IS NOT NULL
-- )
-- SELECT 'Early' AS delivery_status, COUNT(CASE WHEN delivery_status = 'Early' THEN 1 END) AS total_orders,
-- ROUND( COUNT(CASE WHEN delivery_status = 'Early' THEN 1 END) * 100.0 / COUNT(*), 2 ) AS percentage FROM cte
-- UNION ALL
-- SELECT 'On Time', COUNT(CASE WHEN delivery_status = 'On Time' THEN 1 END),
-- ROUND( COUNT(CASE WHEN delivery_status = 'On Time' THEN 1 END) * 100.0 / COUNT(*), 2) FROM cte
-- UNION ALL
-- SELECT'Late',COUNT(CASE WHEN delivery_status = 'Late' THEN 1 END),
-- ROUND(COUNT(CASE WHEN delivery_status = 'Late' THEN 1 END)* 100.0 / COUNT(*), 2) FROM cte
-- order by total_orders desc

#  Task 9 — Calculate Average Delivery Delay 
#  Business question: When an order is delivered late, how many days late is it typically?

-- SELECT 
-- count(*) total_late_orders,
-- round(avg(datediff(order_delivered_customer_date,order_estimated_delivery_date)),2) avg_days,
-- min(datediff(order_delivered_customer_date,order_estimated_delivery_date)) min_day,
-- max(datediff(order_delivered_customer_date,order_estimated_delivery_date)) max_day
-- from olist_orders_dataset
-- where order_status = 'delivered' 
-- AND order_delivered_customer_date IS NOT NULL
-- AND order_estimated_delivery_date IS NOT NULL
-- AND DATEDIFF(order_delivered_customer_date,order_estimated_delivery_date) > 0;

# Task 10 — Average Delivery Time by Order Status
# Business Q- Which order statuses have recorded delivery durations,and how do their average delivery times compare?

-- select order_status , count(*) total_orders ,
-- count(case 
-- when order_purchase_timestamp is not null   and 
-- order_delivered_customer_date is not null then 1 end ) orders_with_delivery_dates,
-- round(avg(datediff(order_delivered_customer_date,order_purchase_timestamp)),2) avg_delivery_days
-- from olist_orders_dataset
-- group by order_status
-- order by avg_delivery_days desc

# Task 11: Delivery Duration Statistics
# Business Ques: What are the min, avg, and max delivery times for delivered orders in the Olist dataset?

-- select max(datediff(order_delivered_customer_date,order_purchase_timestamp)) max_delivery_days,
-- min(datediff(order_delivered_customer_date,order_purchase_timestamp)) min_delivery_days,
-- round(avg(datediff(order_delivered_customer_date,order_purchase_timestamp)),2) avg_delivery_days
-- from olist_orders_dataset
-- where order_status = "delivered"
-- AND order_purchase_timestamp IS NOT NULL
-- AND order_delivered_customer_date IS NOT NULL

# Phase 2 — Task 12: Monthly Order Trends
# Business Question: How does the number of orders placed change from month to month?

-- select date_format(order_purchase_timestamp,'%Y-%m') order_month , count(*) total_orders 
-- from olist_orders_dataset
-- group by order_month
-- order by order_month

# Task 13: Monthly Revenue Analysis
# Business Q:How much revenue did the business generate each month,and which months generated the highest revenue?
-- select date_format(o.order_purchase_timestamp,'%Y-%m') order_month , sum(p.payment_value) monthly_revenue
-- from olist_orders_dataset o 
-- join olist_order_payments_dataset p 
-- on o.order_id=p.order_id
-- group by order_month 
-- order by order_month

# Task 14: Average Order Value (AOV)
# Business question: How much does a customer spend on average per order?

-- with cte as (select order_id, sum(payment_value) total_payment_value 
-- from olist_order_payments_dataset
-- group  by order_id) 
-- select count(*) total_orders , sum(total_payment_value) total_payment_value , 
-- round(avg(total_payment_value),2) avg_total_payment_value  from cte

# Task 15: Payment Method Analysis
# Business Q:Which payment methods do customers use most frequently,
# and which payment methods generate the highest payment value?

-- select payment_type Payment_method , count(order_id) total_payment_records , count(distinct order_id) total_orders ,
-- sum(payment_value) total_payment_value , round(avg(payment_value),2) avg_per_payment_value
-- from olist_order_payments_dataset
-- group by payment_type
-- order by total_payment_value