# Task 1 — Combine Key Business Metrics
# Business question What is the overall performance of the Olist e-commerce business?
-- with cte as (select order_id , sum(payment_value) total_payment from olist_order_payments_dataset
-- group by order_id)

-- select count(*) total_orders, sum(total_payment) Total_revenue , 
-- round(avg(total_payment),2) avg_payment,
-- count(case when o.order_status = "delivered" then 1 end)  Delivered_orders , 
-- count(case when o.order_status<> "delivered" then 1 end) non_Delivered_orders
-- from cte c 
-- join  olist_orders_dataset o
-- on c.order_id = o.order_id

# notes : "We use a CTE with GROUP BY to aggregate multiple payment records into one record per order before joining with the orders table. 
    -- This prevents duplicate order rows and ensures accurate calculation of total revenue and average order value." 


# Task 2: Identify Key Business Insights
# Business question: What are the most important business patterns across Phases 1–3?

# Task 2.1 — Customer Retention Analysis
-- with cte as (select c.customer_unique_id, count(o.order_id) total_orders from 
-- olist_customers_dataset c
-- join olist_orders_dataset o 
-- on c.customer_id = o.customer_id
-- group by c.customer_unique_id) 
-- ,cte1 as (select customer_unique_id , total_orders ,
-- case when total_orders>1 then 'Repeat' else 'one time' end as Customer_type
-- from cte)
--  select customer_type , count(*) customers  , 
-- round(count(*)/(select count(*) from cte1)*100.0,2) pct from 
--  cte1
--  group by customer_type

# Task 2.2 — Revenue Contribution by Product Category
-- select p.product_category_name , sum(i.price) Revenue , 
-- round(sum(i.price)/(select sum(price) from olist_order_items_dataset)*100.0,2) pct
-- from olist_order_items_dataset i 
-- left join olist_products_dataset p 
-- on i.product_id = p.product_id
-- group by p.product_category_name
-- order by Revenue desc
-- limit 10

-- # Task 2.3 — Delivery Performance Analysis
-- select order_status ,count(*) total_orders , 
--  round(count(*)/(select count(*) from olist_orders_dataset)*100.0,2) pct
-- from olist_orders_dataset
-- group by order_status
-- order by total_orders desc

-- # Task 2.4: Customer Satisfaction Analysis
-- SELECT review_score, COUNT(*) AS total_reviews,
-- ROUND( COUNT(*) / (SELECT COUNT(*) FROM olist_order_reviews_dataset) * 100.0, 2 ) AS percentage
-- FROM olist_order_reviews_dataset
-- GROUP BY review_score
-- ORDER BY review_score DESC;

-- # Task 2.5: Revenue by State Analysis
-- WITH cte AS (SELECT order_id, SUM(payment_value) AS total_payment
--     FROM olist_order_payments_dataset
--     GROUP BY order_id )
-- SELECT c.customer_state, ROUND(SUM(cte.total_payment), 2) AS total_revenue,
-- COUNT(DISTINCT o.order_id) AS total_orders
-- FROM olist_customers_dataset c
-- JOIN olist_orders_dataset o
-- ON c.customer_id = o.customer_id
-- JOIN cte
-- ON o.order_id = cte.order_id
-- GROUP BY c.customer_state
-- ORDER BY total_revenue DESC;


# Task 3 — Business Recommendations

# Business Question:
# What actions should Olist take to improve overall business performance?


# 3.1 — Customer Retention

# Finding:
# 96.88% of customers are one-time customers.
# Only 3.12% of customers are repeat customers.

# Business Problem:
# Olist has a low repeat purchase rate, indicating a potential
# customer retention challenge.

# Recommendation:
# Introduce loyalty programs, personalized offers,
# and discounts on the next purchase.

# Expected Benefit:
# Improve customer retention and encourage repeat purchases.


# 3.2 — Revenue Growth by Product Category

# Finding:
# Beleza_Saude generates the highest product revenue
# with 1,258,681.34, contributing 9.26%.
# The top 3 categories contribute 25.76% of product revenue.

# Business Problem:
# Revenue contribution varies across product categories.

# Recommendation:
# Focus marketing campaigns on high-performing categories
# and identify opportunities to improve sales in other categories.

# Expected Benefit:
# Increase product sales and overall revenue.


# 3.3 — Delivery Performance

# Finding:
# 97.02% of orders have delivered status.
# 0.63% are canceled and 0.61% are unavailable.
# 2.98% of orders are in statuses other than delivered.

# Business Problem:
# Some orders are canceled, unavailable, or still in
# intermediate order statuses.

# Recommendation:
# Monitor pending orders, improve inventory management,
# and coordinate with delivery partners to reduce cancellations
# and unsuccessful order fulfillment.

# Expected Benefit:
# Improve order fulfillment and customer experience.


# 3.4 — Customer Satisfaction

# Finding:
# 57.78% of reviews have a 5-star rating.
# 19.29% have a 4-star rating.
# 11.51% have a 1-star rating.
# Overall, 77.07% of reviews are 4 or 5 stars.

# Business Problem:
# Although most reviews are positive, negative reviews
# indicate areas where customer experience needs improvement.

# Recommendation:
# Analyze negative reviews to identify recurring complaints.
# Improve customer support, product quality, and delivery processes.

# Expected Benefit:
# Improve customer satisfaction and overall review ratings.


# 3.5 — Revenue by State

# Finding:
# Sao Paulo (SP) generates the highest revenue
# of 5,998,226.96 with 41,745 orders.
# Rio de Janeiro (RJ) and Minas Gerais (MG) are the next
# highest revenue-generating states.
# Roraima (RR) generates the lowest revenue of 10,064.62.

# Business Problem:
# Revenue is concentrated in a few states,
# while other states contribute relatively less revenue.

# Recommendation:
# Study customer demand in lower-revenue states.
# Use targeted marketing campaigns and improve regional
# customer acquisition.

# Expected Benefit:
# Expand the customer base and increase revenue
# across different regions.



























































