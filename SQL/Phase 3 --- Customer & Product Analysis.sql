# Task 1 — Customer Distribution by State
# Business question: Which Brazilian states have the highest number of customers? 

-- select customer_state states , count(distinct customer_id) total_customers ,  
-- round(count(distinct customer_id)/(select count(*) from olist_customers_dataset)*100.0,2) pct
-- from olist_customers_dataset
-- group by states
-- order by total_customers desc

# Task 2: Top 10 Customer Cities
# Business question: Which 10 cities have the highest number of customers?

-- select customer_city , count(distinct customer_id) total_customers from olist_customers_dataset
-- group by customer_city
-- order by total_customers desc 
-- limit 10

# Task 3: Repeat vs One-Time Customers
# Business question: How many customers have placed only one order, and how many have placed multiple orders with %?

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

# Task 4: Top 10 Best-Selling Products 
# Business question : Which 10 products were purchased the most by customers?

-- select  p.product_id , p.product_category_name , count(o.order_id) total_orders 
-- from olist_order_items_dataset o 
-- left join olist_products_dataset p 
-- on o.product_id = p.product_id
-- group by p.product_category_name , p.product_id
-- order by total_orders desc
-- limit 10

# Task 5: Top 10 Revenue-Generating Product Categories
# Business question : Which 10 product categories generate the highest revenue for the business?

-- select p.product_category_name , sum(i.price) Revenue from olist_order_items_dataset i 
-- left join olist_products_dataset p 
-- on i.product_id = p.product_id
-- group by p.product_category_name
-- order by Revenue desc
-- limit 10

# Task 6 — Average Review Score by Product Category
# Business question: Which product categories receive the highest and lowest average customer ratings?

-- select p.product_category_name , round(avg(r.review_score),2) avg_review
-- from olist_products_dataset p
-- join olist_order_items_dataset i 
-- on p.product_id = i.product_id
-- join olist_orders_dataset o 
-- on o.order_id=i.order_id
-- join olist_order_reviews_dataset r
-- on r.order_id=o.order_id
-- group by p.product_category_name 
-- ORDER BY avg_review DESC;


# some products have a NULL value in product_category_name
# investigate how many products have a missing category:

-- SELECT COUNT(*) AS missing_category_products
-- FROM olist_products_dataset
-- WHERE product_category_name IS NULL;

# Task 7 — Review Score Distribution.
# Business question: How many customers gave 1-star, 2-star, 3-star, 4-star, and 5-star ratings?

-- select  review_score, count(*) Reviews , 
-- round(count(*)/(select count(*)from olist_order_reviews_dataset)*100.0,2) pct
-- from olist_order_reviews_dataset
-- group by review_score
-- order by Reviews desc

# Task 8 — Customer Purchase Value Analysis
# Business question: Which 10 customers have spent the most money on the platform?

-- SELECT customer_unique_id, total_payment 
-- FROM ( SELECT c.customer_unique_id, SUM(p.payment_value) AS total_payment 
-- FROM olist_customers_dataset c
--     JOIN olist_orders_dataset o
-- 	ON c.customer_id = o.customer_id
--     JOIN olist_order_payments_dataset p
-- 	ON o.order_id = p.order_id
--     GROUP BY c.customer_unique_id
-- ) AS customer_totals
-- ORDER BY total_payment DESC
-- LIMIT 10;




























































































