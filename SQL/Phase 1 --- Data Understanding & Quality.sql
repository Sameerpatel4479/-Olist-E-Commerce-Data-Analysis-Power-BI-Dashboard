
# Missing values aur duplicate records
-- select count(*) missing_values from olist_order_items_dataset
-- where order_id is null
# missing_values 0 

-- select count(*) missing_values from olist_customers_dataset 
-- where customer_id is null
# missing_values 0 

-- select count(*) missing_values from olist_geolocation_dataset
-- where geolocation_zip_code_prefix is null
# missing_values 0 

-- select count(*) missing_values from olist_order_payments_dataset
-- where order_id is null
# missing_values 0 

-- select count(*) missing_values from olist_order_reviews_dataset
-- where review_id and review_score and order_id is null
# missing values 0 

/* =====================================================
   PHASE 1: DATA UNDERSTANDING AND QUALITY CHECKS
   Table: olist_orders_dataset
   ===================================================== */

/* STEP 1: Overall NULL Value Check
   Purpose: Check whether important columns have missing values.
*/
-- SELECT
--     COUNT(*) AS total_rows,
--     SUM(order_id IS NULL) AS order_id_nulls,
--     SUM(customer_id IS NULL) AS customer_id_nulls,
--     SUM(order_status IS NULL) AS status_nulls,
--     SUM(order_purchase_timestamp IS NULL) AS purchase_date_nulls,
--     SUM(order_approved_at IS NULL) AS approved_date_nulls,
--     SUM(order_delivered_carrier_date IS NULL) AS carrier_date_nulls,
--     SUM(order_delivered_customer_date IS NULL) AS customer_delivery_date_nulls,
--     SUM(order_estimated_delivery_date IS NULL) AS estimated_delivery_date_nulls
-- FROM olist_orders_dataset;


/* STEP 2: Missing Delivery Dates by Order Status
   Purpose: Understand whether missing dates depend on order status.
*/
-- SELECT order_status, COUNT(*) AS total_orders, SUM(order_delivered_carrier_date IS NULL) AS missing_carrier_dates,
-- SUM(order_delivered_customer_date IS NULL) AS missing_customer_delivery_dates,
-- SUM(order_estimated_delivery_date IS NULL) AS missing_estimated_dates
-- FROM olist_orders_dataset
-- GROUP BY order_status
-- ORDER BY total_orders DESC;


/* STEP 3: Investigate Delivered Orders with Missing Dates
   Purpose: Inspect individual records that need investigation.
*/
-- SELECT
--     order_id,
--     order_status,
--     order_purchase_timestamp,
--     order_approved_at,
--     order_delivered_carrier_date,
--     order_delivered_customer_date,
--     order_estimated_delivery_date
-- FROM olist_orders_dataset
-- WHERE order_status = 'delivered'
--   AND order_delivered_customer_date IS NULL;



/* STEP 4: Check Whether Review Records Are Available
   Purpose: Find out whether the 8 affected orders have review records.
   Note: Review timestamps do not prove the actual delivery date.
*/
-- SELECT o.order_id,  o.order_delivered_customer_date,  r.review_creation_date,
--   r.review_answer_timestamp FROM olist_orders_dataset AS o
-- LEFT JOIN olist_order_reviews_dataset AS r
--  ON o.order_id = r.order_id
-- WHERE o.order_status = 'delivered'
--  AND o.order_delivered_customer_date IS NULL;


-- STEP 5: Check Estimated Delivery Date Availability
--    Purpose: Summarize the estimated-date availability for the 8 affected orders.

-- SELECT COUNT(*) AS total_affected_orders, 
-- SUM(order_estimated_delivery_date IS NULL) AS missing_estimated_dates,
-- SUM(order_estimated_delivery_date IS NOT NULL) AS available_estimated_dates
-- FROM olist_orders_dataset
-- WHERE order_status = 'delivered'
-- AND order_delivered_customer_date IS NULL;

--  STEP 6: Duplicate Order ID Detection
--    Purpose: Check whether any order_id appears more than once.

-- SELECT order_id,COUNT(*) AS occurrence_count
-- FROM olist_orders_dataset
-- GROUP BY order_id
-- HAVING COUNT(*) > 1;

-- STEP 7: Validate Date Consistency
-- Purpose: Check whether a delivered order's purchase timestamp is later than 
-- its actual customer delivery timestamp.

-- SELECT COUNT(*) AS invalid_purchase_delivery_sequences
-- FROM olist_orders_dataset
-- WHERE order_status = 'delivered'
--   AND order_delivered_customer_date IS NOT NULL
--   AND order_purchase_timestamp > order_delivered_customer_date;


-- STEP 8: Validate Order-to-Customer Relationships
--   Purpose: Check whether every order's customer_id matches a customer record.

-- SELECT COUNT(*) AS unmatched_customer_orders
-- FROM olist_orders_dataset AS o
-- LEFT JOIN olist_customers_dataset AS c
-- ON o.customer_id = c.customer_id
-- WHERE c.customer_id IS NULL;

-- # NEW — Check Order Status and Actual Delivery Date Consistency
--   # Purpose: Identify canceled orders that nevertheless have
--   an actual customer delivery timestamp.

-- 	SELECT
-- 	order_status, order_id, order_delivered_carrier_date, 
-- 	order_delivered_customer_date
-- 	FROM olist_orders_dataset
-- 	WHERE order_status ='canceled' and
-- 	order_delivered_customer_date is not null;

# Canceled Orders with Delivery Timestamps
# Validation: Compared purchase, carrier and customer delivery timestamps for all six records

-- select order_id , order_purchase_timestamp,
-- order_delivered_carrier_date,order_delivered_customer_date
-- from olist_orders_dataset
--  WHERE order_status ='canceled' and
-- order_delivered_customer_date is not null;

# Canceled orders with pct recorded customer delivery dates

-- with cte as (select order_status , count(*) total_canceled_orders , 
-- count(case when order_delivered_customer_date is null then 1 end ) date_missing ,
-- count(case when order_delivered_customer_date is not null then 1 end ) Delivery_Dates_recorded
-- from olist_orders_dataset
-- where order_status = "canceled"
-- group by order_status)
-- select * ,round(Delivery_Dates_recorded/total_canceled_orders*100.0,2) pct_with_date
--  from cte






  
  





















