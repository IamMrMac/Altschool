# E-commerce Data Analysis Project

This repository contains SQL scripts and analysis for an e-commerce database.

**Project Overview:**

This project explores various aspects of an e-commerce platform using SQL. It includes:

* **Data Definition:** SQL scripts to create tables for Customers, Products, Orders, and Order_Items.
* **Data Population:** Scripts to insert sample data into the tables.
* **CRUD Operations:** 
    * Inserting a new customer.
    * Updating product stock quantity after a purchase.
    * Deleting an order (with consideration for data integrity).
* **Data Retrieval:** 
    * Retrieving order history for a specific customer.
    * Calculating total revenue.
    * Finding revenue generated per product.
    * Identifying top-spending customers.
    * Finding inactive customers.
    * Retrieving order details for a specific order.
* **Data Analysis:**
    * Calculating monthly sales.
    * Identifying best-selling products.
    * Finding products that are out of stock.
* **Data Joins:**
    * Demonstrating INNER JOIN, LEFT JOIN, and FULL JOIN to retrieve data across multiple tables.
* **Window Functions:**
    * Using ROW_NUMBER() to assign unique order numbers for each customer.
    * Using RANK() to rank customers based on their total spending.
* **Common Table Expressions (CTEs):**
    * Calculating total revenue per customer using a CTE.
* **Query Optimization:**
    * Adding indexes to improve query performance.
    * Analyzing query performance using `EXPLAIN ANALYZE`.
    * Optimizing a query by reordering joins.

**How to Use:**

1. **Create a PostgreSQL database.**
2. **Execute the SQL scripts** in the `sql` directory to create the database schema and populate the tables with sample data.
3. **Run the analysis queries** to explore the e-commerce data.

**Key Insights:**

* Identified top-spending customers, best-selling products, and monthly sales trends.
* Analyzed customer order history and identified inactive customers.
* Demonstrated the importance of data integrity and query optimization.

**Further Exploration:**

* Implement more complex analytical queries (e.g., customer segmentation, churn analysis).
* Integrate with a data visualization tool to create dashboards and reports.
* Explore more advanced SQL features (e.g., recursive queries, triggers).

This project provides a foundation for understanding and analyzing e-commerce data using SQL. Feel free to explore, modify, and extend the queries to further your knowledge and gain valuable insights.

**Note:** This is a basic example. You can expand this project by adding more tables, data, and complex analysis.
