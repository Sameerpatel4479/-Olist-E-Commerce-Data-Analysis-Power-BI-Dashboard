# 🛒 Olist E-Commerce Data Analysis & Power BI Dashboard
End-to-end Olist E-Commerce Data Analysis project using MySQL and Power BI. Includes data exploration, SQL analysis, data modeling, DAX measures, and a 5-page interactive dashboard covering sales, revenue, orders, delivery, customers, and product performance.

**Turning E-Commerce Data into Meaningful Business Insights**

📊 SQL Analysis | ⚡ Power BI | 🔍 Business Intelligence | 📈 Data Visualization

## 🌟 Project Overview

This project focuses on analyzing the **Olist Brazilian E-Commerce Public Dataset** using MySQL and Microsoft Power BI.

The main objective was to explore e-commerce business performance, understand customer purchasing behavior, analyze product sales, evaluate delivery performance, and identify meaningful business insights.

I performed data analysis using SQL and developed a **five-page interactive Power BI dashboard** to transform raw data into clear and actionable business information.

### 🧰 Tools & Technologies

| Tool                  | Purpose                                             |
| --------------------- | --------------------------------------------------- |
| 🐬 MySQL              | Data exploration, cleaning checks, and SQL analysis |
| 📊 Microsoft Power BI | Interactive dashboard development                   |
| 🔄 Power Query        | Data transformation                                 |
| ⚡ DAX                 | Measures and calculated columns                     |
| 🧩 Data Modeling      | Relationships between fact and dimension tables     |
| 📈 Data Visualization | Business insights and reporting                     |

---

## 🎯 1. Problem Statement

E-commerce businesses generate large amounts of data related to customers, orders, payments, products, sellers, and deliveries.

However, raw data does not directly explain business performance or highlight areas that need improvement.

The objective of this project was to analyze the Olist dataset and develop an interactive dashboard that answers important business questions:

- 💰 What is the total recorded payment value and Average Order Value?
- 📅 How does revenue change over time?
- 🌎 Which states contribute the most to business activity?
- 💳 Which payment methods are most commonly used?
- 🚚 What percentage of orders are delivered and non-delivered?
- ⏱️ How efficiently are orders delivered?
- 👥 What percentage of customers make repeat purchases?
- ⭐ How satisfied are customers with their purchases?
- 📦 Which product categories and products perform best?
- 🏪 Which sellers contribute the highest number of items sold?

**🎯 Goal:** Convert raw e-commerce data into meaningful insights through SQL analysis and an interactive Power BI dashboard.

---

## 📝 2. Project Task List

The project was divided into different phases to complete the analysis systematically.

### 🔹 Phase 1 — Data Understanding & Quality

- [x] Explore all datasets and understand their structure.
- [x] Identify important columns and data types.
- [x] Check missing values in important columns.
- [x] Check duplicate order IDs.
- [x] Validate relationships between customers and orders.
- [x] Analyze order statuses and delivery date availability.
- [x] Identify data quality issues.

### 🔹 Phase 2 — Order & Revenue Analysis

- [x] Calculate total orders and recorded payment value.
- [x] Calculate Average Order Value (AOV).
- [x] Analyze monthly order and payment trends.
- [x] Analyze payment methods.
- [x] Compare delivery status with recorded payment values.
- [x] Analyze order-level payment information.

### 🔹 Phase 3 — Customer & Product Analysis

- [x] Identify one-time and repeat customers.
- [x] Analyze customer distribution by state and city.
- [x] Identify top customers by purchase value.
- [x] Analyze customer review scores.
- [x] Identify top-performing product categories.
- [x] Analyze product revenue and item quantities.

### 🔹 Phase 4 — Business Insights & Final Project

- [x] Combine important business metrics.
- [x] Identify key business trends and patterns.
- [x] Analyze customer, order, revenue, and product performance.
- [x] Prepare business insights from the analysis.
- [x] Organize findings for dashboard development.

### 🔹 Phase 5 — Power BI Dashboard Development

- [x] Import datasets into Power BI.
- [x] Transform data using Power Query.
- [x] Create relationships between tables.
- [x] Develop fact and dimension tables.
- [x] Create DAX measures and calculated columns.
- [x] Build five interactive dashboard pages.
- [x] Add KPI cards, charts, slicers, and filters.
- [x] Format and organize the dashboard.

---

## 🗂️ 3. Dataset Understanding

The project uses the **Olist Brazilian E-Commerce Public Dataset**, containing information about customers, orders, payments, products, sellers, reviews, and geolocation.

The dataset consists of nine CSV files.

| # | Dataset                 | Records (Approx.) | Description                                     |
| - | ----------------------- | ----------------: | ----------------------------------------------- |
| 1 | 👥 Customers            |            99,441 | Customer IDs, city, and state                   |
| 2 | 📍 Geolocation          |         1,000,163 | ZIP codes, latitude, longitude, city, and state |
| 3 | 🛍️ Order Items         |           112,650 | Products, sellers, item prices, and freight     |
| 4 | 💳 Order Payments       |           103,886 | Payment type, payment value, and installments   |
| 5 | ⭐ Order Reviews         |            99,224 | Customer ratings and review comments            |
| 6 | 📦 Orders               |            99,441 | Order status and purchase and delivery dates    |
| 7 | 🏷️ Products            |            32,951 | Product IDs, categories, and product attributes |
| 8 | 🏪 Sellers              |             3,095 | Seller IDs, cities, and states                  |
| 9 | 🌐 Category Translation |                71 | Portuguese-to-English product category names    |


### 🧩 Data Model

The Power BI model was organized using fact and dimension tables.

**📊 Fact Tables**

- Fact_Order_Items
- Fact_Payments
- Fact_Reviews

**📁 Dimension Tables**

- Dim_Customers
- Dim_Orders
- Dim_Products
- Dim_Sellers
- Dim_Category
- Dim_Date

The Raw_Geolocation table was retained separately.

Relationships were created using common keys such as `customer_id`, `order_id`, `product_id`, `seller_id`, and `product_category_name`.

<p align="center">
    <img src="Resource/data%20model.png" width="900">
</p>

## 🔄 4. Importing Data into Power BI

After completing the SQL analysis, I imported the datasets into Microsoft Power BI to build the interactive dashboard.

### 1️⃣ Import CSV Files

1. Open Microsoft Power BI Desktop.
2. Select **Get Data**.
3. Choose **Text/CSV**.
4. Browse and select the Olist CSV files.
5. Preview the data.
6. Select **Transform Data** to open Power Query.

### 2️⃣ Data Transformation Using Power Query

- Reviewed imported datasets.
- Checked column names and data types.
- Ensured date columns were recognized correctly.
- Checked numeric columns such as `price` and `payment_value`.
- Renamed tables using meaningful names.
- Prepared datasets for data modeling.

### 3️⃣ Data Modeling

- Created relationships between relevant tables.
- Organized fact and dimension tables.
- Created a separate date table (`Dim_Date`).
- Used date hierarchy for monthly and yearly analysis.
- Configured relationships to support filtering across dashboard pages.

### 4️⃣ DAX Measures & Calculated Columns

Created important DAX calculations for business KPIs.

| Category     | Measures / Calculations                                                               |
| ------------ | ------------------------------------------------------------------------------------- |
| 📦 Orders    | Total Orders, Delivered Orders, Non-Delivered Orders                                  |
| 💰 Revenue   | Total Revenue, Product Revenue, Average Order Value                                   |
| 🛍️ Products | Total Products, Total Items Sold, Average Product Price                               |
| 👥 Customers | Total Customers, Repeat Customers, Repeat Customer %                                  |
| 🚚 Delivery  | Early Delivery Rate, On-Time Delivery Rate, Late Delivery Rate, Average Delivery Days |
| ⭐ Reviews    | Average Review Score, Review Percentage                                               |

Also created calculated columns to classify delivery timeliness and simplify customer and seller labels in charts.

### 5️⃣ Dashboard Development

Developed five report pages using:

- KPI Cards
- Clustered Bar Charts
- Clustered Column Charts
- Line Charts
- Donut Charts
- Tables
- Interactive Slicers
- Visual-Level Filters

---

# 📊 5. Interactive Power BI Dashboard

The final dashboard contains **5 analytical views, 27 KPI cards, and 20 charts/tables**.

Each page focuses on a different area of e-commerce performance.

## 🏠 View 1 — Executive Overview

**🎯 Objective:** Provide management with a quick overview of overall business performance.

### 📌 KPI Cards — 6

| KPI                    | Purpose                                        |
| ---------------------- | ---------------------------------------------- |
| 📦 Total Orders        | Total number of orders                         |
| 💰 Average Order Value | Average recorded payment value per order       |
| 💵 Total Revenue       | Total recorded payment value                   |
| 🚀 Early Delivery Rate | Percentage of delivered orders delivered early |
| ⏰ Late Delivery Rate   | Percentage of delivered orders delivered late  |
| ⭐ Average Review Score | Average customer rating                        |

### 📈 Charts — 4

| Chart                              | Visualization       | Business Purpose                            |
| ---------------------------------- | ------------------- | ------------------------------------------- |
| Monthly Revenue Trends             | 📉 Line Chart       | Tracks monthly recorded payment value       |
| Revenue by State (%)               | 📊 Clustered Bar    | Compares state-wise revenue contribution    |
| Customer Review Score Distribution | 📊 Clustered Column | Shows customer ratings                      |
| Delivery Status Distribution       | 🍩 Donut Chart      | Compares delivered and non-delivered orders |

### 💡 Business Value

- Understand overall business performance.
- Track monthly payment trends.
- Identify states contributing significantly to recorded payment value.
- Evaluate customer satisfaction.
- Monitor delivery performance.

---

## 💰 View 2 — Sales & Revenue

**🎯 Objective:** Analyze recorded payment value, order performance, product sales, and payment preferences.

### 📌 KPI Cards — 5

| KPI                    | Purpose                                                   |
| ---------------------- | --------------------------------------------------------- |
| 🛍️ Total Items Sold   | Total item records sold                                   |
| 💵 Total Revenue       | Total recorded payment value                              |
| 📊 Average Order Value | Average recorded payment value per order                  |
| 📦 Total Orders        | Total number of orders                                    |
| 💰 Revenue per Item    | Product/payment value per item, as defined by the measure |

### 📈 Charts — 4

| Chart                                | Visualization                | Business Purpose                                   |
| ------------------------------------ | ---------------------------- | -------------------------------------------------- |
| Revenue by Payment Type              | 📊 Clustered Bar             | Compares payment methods                           |
| Revenue by Delivery Status           | 🍩 Donut Chart               | Compares recorded payment value by delivery status |
| Top 10 Product Categories by Revenue | 📊 Clustered Bar             | Identifies highest-value categories                |
| Monthly Revenue & Orders             | 📈 Line and Clustered Column | Compares monthly payment value and order volume    |

### 💡 Business Value

- Identify the most significant payment methods.
- Understand monthly order and payment trends.
- Identify high-value product categories.
- Compare recorded payment values associated with different delivery statuses.

---

## 🚚 View 3 — Order & Delivery Analysis

**🎯 Objective:** Understand order status, delivery performance, and delivery efficiency.

### 📌 KPI Cards — 6

| KPI                      | Purpose                                          |
| ------------------------ | ------------------------------------------------ |
| 📦 Total Orders          | Total orders placed                              |
| ✅ Delivered Orders       | Number of delivered orders                       |
| ❌ Non-Delivered Orders   | Number of orders not delivered                   |
| 🚀 Early Delivery Rate   | Percentage of delivered orders delivered early   |
| ⏱️ On-Time Delivery Rate | Percentage of delivered orders delivered on time |
| ⚠️ Late Delivery Rate    | Percentage of delivered orders delivered late    |

### 📈 Charts — 4

| Chart                            | Visualization    | Business Purpose                                                   |
| -------------------------------- | ---------------- | ------------------------------------------------------------------ |
| Late Delivery Rate by State      | 📊 Clustered Bar | Identifies states with higher late-delivery rates                  |
| Average Delivery Time by Month   | 📈 Line Chart    | Tracks average delivery duration                                   |
| Delivery Status Distribution (%) | 🍩 Donut Chart   | Compares delivered and non-delivered orders by count               |
| Order Status Summary             | 📋 Table         | Summarizes order count and recorded payment contribution by status |

### 📋 Order Status Summary Includes

- Order Status
- Total Orders
- Order Percentage
- Total Revenue (Recorded Payment Value)
- Revenue Percentage (Recorded Payment Contribution)

### 💡 Business Value

- Identify states with potential delivery issues.
- Monitor average delivery time over months.
- Compare delivered and non-delivered orders.
- Understand the distribution of different order statuses.

---

## 👥 View 4 — Customer Insights

**🎯 Objective:** Understand customer behavior, repeat purchases, satisfaction, and purchase value.

### 📌 KPI Cards — 5

| KPI                            | Purpose                                  |
| ------------------------------ | ---------------------------------------- |
| 👥 Total Customers             | Total unique customers                   |
| 🔁 Repeat Customers            | Customers who placed more than one order |
| 📊 Repeat Customer %           | Percentage of repeat customers           |
| 🛒 Average Orders per Customer | Average orders per unique customer       |
| ⭐ Average Review Score         | Average customer rating                  |

### 📈 Charts — 4

| Chart                                 | Visualization       | Business Purpose                                              |
| ------------------------------------- | ------------------- | ------------------------------------------------------------- |
| Top 10 Customer Distribution by State | 📊 Clustered Bar    | Shows customer distribution across leading states             |
| One-Time vs Repeat Customers          | 🍩 Donut Chart      | Compares one-time and repeat customers                        |
| Customer Satisfaction Distribution    | 🍩 Donut Chart      | Displays review scores from 1 to 5                            |
| Top 5 Customers by Purchase Value     | 📊 Clustered Column | Identifies customers with the highest recorded purchase value |

### 🔍 Customer Retention Highlights

- One-Time Customers: **93.1K (96.88%)**
- Repeat Customers: **3K (3.12%)**

### 💡 Business Value

- Understand customer distribution.
- Identify the proportion of repeat customers.
- Analyze customer satisfaction.
- Identify high-value customers.
- Highlight opportunities for customer retention and loyalty strategies.

---

## 🛍️ View 5 — Product & Category Analysis

**🎯 Objective:** Analyze product performance, category sales, item demand, and seller contribution.

### 📌 KPI Cards — 5

| KPI                      | Purpose                         |
| ------------------------ | ------------------------------- |
| 🏷️ Total Products       | Total unique products           |
| 📦 Total Items Sold      | Total item records              |
| 💰 Product Revenue       | Sum of product item prices      |
| 📊 Average Product Price | Average item price              |
| 🗂️ Total Categories     | Total unique product categories |

### 📈 Charts — 4

| Chart                                | Visualization       | Business Purpose                                            |
| ------------------------------------ | ------------------- | ----------------------------------------------------------- |
| Top 10 Product Categories by Revenue | 📊 Clustered Bar    | Identifies categories with the highest product revenue      |
| Top 5 Items Sold by Product Category | 🍩 Donut Chart      | Shows the item quantity contribution of leading categories  |
| Top 5 Sellers by Items Sold          | 📊 Clustered Bar    | Identifies sellers contributing the highest item quantities |
| Top 10 Products by Items Sold        | 📊 Clustered Column | Highlights the most frequently purchased products           |

### 💡 Business Value

- Identify high-performing product categories.
- Understand product demand by quantity.
- Compare seller contribution.
- Identify frequently purchased products.
- Support product planning and inventory decisions.

---

## 🔑 6. Key Insights from the Dashboard

The following findings are based on the completed SQL analysis and the dashboard metrics.

### 📦 Order & Revenue Performance

- Total Orders: **99,441**
- Total Recorded Payment Value: **16,008,872.12**
- Average Order Value: **160.99**
- Delivered Orders: **96,478**
- Non-Delivered Orders: **2,963**

### 👥 Customer Behavior

- One-Time Customers: **93,099 (96.88%)**
- Repeat Customers: **2,997 (3.12%)**
- São Paulo had the highest customer count, with **41,746 customers**.
- The repeat customer percentage indicates an opportunity to improve customer retention.

### ⭐ Customer Satisfaction

- 5-Star Reviews: **57,327 (57.78%)**
- 4-Star Reviews: **19,142**
- 1-Star Reviews: **11,424**

The majority of reviews were 5-star, while the 1-star segment provides an opportunity to investigate customer complaints and service issues.

### 🛍️ Product Performance

Top categories by product revenue:

| Product Category     | Product Revenue |
| -------------------- | --------------: |
| Beleza & Saúde       |    1,258,681.34 |
| Relógios & Presentes |    1,205,005.68 |
| Cama, Mesa & Banho   |    1,036,988.68 |

These categories generated the highest product revenue based on item prices.

### 🚚 Delivery Performance

- Early Deliveries: **88,644 (91.89%)**
- Late Deliveries: **6,534 (6.77%)**
- On-Time Deliveries: **1,292 (1.34%)**

These percentages are based on delivered orders with available delivery and estimated delivery dates.

---

## 📚 7. Learnings from This Project

This project helped me gain practical experience in data analysis, data modeling, DAX, and business intelligence.

### 🐬 SQL & Data Analysis

- Practiced SQL joins, aggregate functions, GROUP BY, CTEs, and subqueries.
- Learned how to explore large datasets.
- Checked missing values and duplicate records.
- Calculated order-level payment value and AOV.
- Converted business questions into SQL queries.

### 📊 Power BI & Data Visualization

- Learned how to import and transform data using Power Query.
- Understood fact tables, dimension tables, and relationships.
- Created DAX measures and calculated columns.
- Developed KPI cards and different chart types.
- Created date hierarchies and monthly trends.
- Used slicers and filters to make dashboards interactive.
- Improved dashboard layout and visual presentation.

### 🧩 Data Modeling & DAX

- Understood relationships between fact and dimension tables.
- Learned how filter context affects DAX calculations.
- Practiced `CALCULATE`, `DISTINCTCOUNT`, `FILTER`, `ALL`, and `DIVIDE`.
- Created measures for customer retention, revenue, and delivery performance.
- Learned to validate Power BI calculations against SQL results.

### 💼 Business Understanding

- Learned how to interpret business performance metrics.
- Understood the difference between product revenue and recorded payment value.
- Analyzed customer retention and purchasing behavior.
- Identified important product categories and customer segments.
- Understood how delivery performance and reviews can support business decisions.

---

## 🏁 8. Project Conclusion

The Olist E-Commerce Data Analysis project provided practical experience in transforming raw e-commerce data into meaningful business insights.

Using **MySQL for data analysis** and **Power BI for visualization**, I developed a five-page interactive dashboard covering:

1. 🏠 Executive Overview
2. 💰 Sales & Revenue
3. 🚚 Order & Delivery Analysis
4. 👥 Customer Insights
5. 🛍️ Product & Category Analysis

The project strengthened my understanding of the complete data analytics workflow, from dataset exploration and SQL analysis to data modeling, DAX calculations, and interactive dashboard development.

It also improved my ability to identify business trends, interpret data, and communicate findings through visual reports.

### 🎉 Final Project Outcome

| Project Component                   | Completed |
| ----------------------------------- | --------- |
| SQL Analysis                        | ✅         |
| Data Understanding & Quality Checks | ✅         |
| Data Modeling                       | ✅         |
| DAX Measures                        | ✅         |
| Power BI Dashboard                  | ✅         |
| Five Analytical Views               | ✅         |

**🧰 Technologies:** MySQL • Microsoft Power BI • Power Query • DAX • Data Modeling • Data Visualization

**📌 Project Type:** End-to-End E-Commerce Data Analytics Project



**⭐ Thank you for exploring my project!**

*Feedback and suggestions are always welcome.*

\</p>
