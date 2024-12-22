
DROP TABLE IF EXISTS Customers;

-- Create Customers Table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    address TEXT NOT NULL
);


DROP TABLE IF EXISTS Products;
-- Create Products Table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0)
);



DROP TABLE IF EXISTS Orders;
-- Create Orders Table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES Customers(customer_id),
    order_date DATE NOT null,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0)
);


DROP TABLE IF EXISTS Order_Items;
-- Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY, 
    order_id INTEGER NOT NULL REFERENCES Orders(order_id),
    product_id INTEGER NOT NULL REFERENCES Products(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0)
);


-- Insert 10 Customers
INSERT INTO Customers (name, email, phone_number, address)
VALUES 
    ('Chioma Chukwu', 'customer0@randle.com', '545-495-5020', '77 Shehu Shagari Way, Port Harcourt, Oyo 10910'),
    ('Olumide Mohammed', 'customer1@randle.com', '236-232-3269', '86 Ajose Adeogun Street, Kano, Kano 10740'),
    ('Ahmed Mohammed', 'customer2@randle.com', '307-168-2768', '88 Ajose Adeogun Street, Ibadan, Rivers 10299'),
    ('Chioma Fagbenle', 'customer3@randle.com', '600-449-7557', '51 Kawo Road, Ibadan, Imo 10243'),
    ('Chioma Ojo', 'customer4@randle.com', '779-293-6455', '92 Abraham Adesanya Street, Kano, Imo 10882'),
    ('Chioma Nwankwo', 'customer5@randle.com', '598-910-3765', '25 Nigerian Port Authority Road, Abuja, Oyo 10723'),
    ('Ngozi Adebayo', 'customer6@randle.com', '399-425-5974', '75 Ajose Adeogun Street, Abuja, Kano 10441'),
    ('Chioma Mohammed', 'customer7@randle.com', '202-901-2031', '56 Nigerian Port Authority Road, Port Harcourt, Oyo 10429'),
    ('Chukwudi Okonkwo', 'customer8@randle.com', '832-384-1440', '88 Ajose Adeogun Street, Kano, Oyo 10541'),
    ('Emeka Adeleke', 'customer9@randle.com', '445-452-8796', '59 Shehu Shagari Way, Port Harcourt, Imo 10881'),
    ('Ngozi Nwankwo', 'customer10@randle.com', '240-290-2140', '3 Bode Thomas Street, Kano, Oyo 10250'),
    ('Emeka Nwankwo', 'customer11@randle.com', '624-431-8625', '54 Shehu Shagari Way, Abuja, Oyo 10579'),
    ('Adebayo Mohammed', 'customer12@randle.com', '732-651-6748', '53 Ajose Adeogun Street, Kano, FCT 10551'),
    ('Amina Mohammed', 'customer13@randle.com', '850-706-4391', '6 Ring Road, Abuja, Oyo 10344'),
    ('Adebayo Nwankwo', 'customer14@randle.com', '167-188-2569', '64 Nigerian Port Authority Road, Kano, Rivers 10853'),
    ('Chukwudi Fagbenle', 'customer15@randle.com', '778-767-5528', '55 Nigerian Port Authority Road, Port Harcourt, Kano 10402'),
    ('Ahmed Ojo', 'customer16@randle.com', '506-885-5938', '74 Bode Thomas Street, Port Harcourt, Imo 10602'),
    ('Ahmed Chukwu', 'customer17@randle.com', '786-600-7937', '3 Bode Thomas Street, Abuja, Imo 10352'),
    ('Olumide Nwankwo', 'customer18@randle.com', '135-731-4305', '84 Shehu Shagari Way, Port Harcourt, Kano 10988'),
    ('Chioma Ibrahim', 'customer19@randle.com', '642-458-6901', '6 Shehu Shagari Way, Ibadan, FCT 10956');



   
-- Insert 10 Products
INSERT INTO Products (product_name, category, price, stock_quantity)
VALUES 
    ('Wireless Headphones', 'Electronics', 129.99, 50),
    ('Organic Coffee Beans', 'Food', 15.50, 100),
    ('Leather Wallet', 'Accessories', 49.99, 75),
    ('Running Shoes', 'Sports', 89.99, 60),
    ('Smart Watch', 'Electronics', 199.99, 40),
    ('Yoga Mat', 'Sports', 29.99, 80),
    ('Gourmet Chocolate Box', 'Food', 34.50, 90),
    ('Noise-Cancelling Earbuds', 'Electronics', 89.99, 55),
    ('Leather Messenger Bag', 'Accessories', 129.99, 35),
    ('Fitness Tracker', 'Electronics', 79.99, 65);

-- Insert 20 Orders (with varying numbers of items)
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2021-02-17', 259.98), 
(2, '2021-05-29', 179.48), 
(3, '2021-11-03', 94.49), 
(4, '2021-07-12', 219.98),
(5, '2021-09-21', 129.99), 
(6, '2021-01-06', 64.49), 
(7, '2021-03-30', 299.98), 
(8, '2021-10-15', 149.98),
(9, '2021-06-08', 89.99), 
(10, '2021-12-27', 199.99), 
(1, '2021-04-19', 44.50), 
(2, '2021-08-05', 269.97),
(3, '2021-01-24', 79.99), 
(4, '2021-11-16', 34.50), 
(5, '2021-05-02', 159.98), 
(6, '2021-09-07', 109.98),
(7, '2021-02-28', 49.99), 
(8, '2021-06-23', 89.99), 
(9, '2021-10-31', 174.48), 
(10, '2021-07-19', 129.99);

-- Insert 50 Order Items (distributed across the 20 orders)
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES 
    (1, 1, 2, 129.99), 
    (2, 3, 1, 49.99),  
    (2, 2, 3, 15.50),  
    (3, 4, 1, 89.99),  
    (4, 5, 1, 199.99), 
    (4, 6, 1, 29.99),  
    (5, 1, 1, 129.99), 
    (6, 2, 2, 15.50),  
    (7, 5, 1, 199.99), 
    (7, 7, 2, 34.50),  
    (8, 8, 1, 89.99),  
    (8, 9, 1, 129.99), 
    (9, 10, 1, 79.99), 
    (10, 5, 1, 199.99),
    (11, 2, 1, 15.50), 
    (11, 7, 1, 34.50), 
    (12, 1, 2, 129.99),
    (12, 9, 1, 129.99),
    (13, 4, 1, 89.99), 
    (14, 7, 1, 34.50), 
    (15, 1, 1, 129.99),
    (15, 6, 1, 29.99), 
    (16, 3, 2, 49.99), 
    (17, 3, 1, 49.99), 
    (18, 8, 1, 89.99), 
    (19, 2, 3, 15.50), 
    (19, 10, 1, 79.99),
    (20, 1, 1, 129.99),
    (1, 4, 1, 89.99),    
    (1, 7, 1, 34.50),    
    (2, 5, 1, 199.99),   
    (3, 8, 1, 89.99),    
    (3, 6, 1, 29.99),    
    (4, 10, 1, 79.99),   
    (5, 3, 1, 49.99),    
    (5, 2, 2, 15.50),    
    (6, 5, 1, 199.99),  
    (7, 8, 1, 89.99),    
    (8, 2, 2, 15.50),    
    (9, 6, 1, 29.99),   
    (10, 9, 1, 129.99),  
    (11, 5, 1, 199.99),  
    (12, 3, 1, 49.99),   
    (13, 7, 1, 34.50),   
    (14, 10, 1, 79.99),  
    (15, 4, 1, 89.99),   
    (16, 9, 1, 129.99),  
    (17, 7, 1, 34.50),   
    (18, 4, 1, 89.99),   
    (19, 8, 1, 89.99),   
    (20, 6, 1, 29.99);   
    
  select *
   from customers
   
   
    select *
   from products
   
    select *
   from orders
  
   
    select *
   from order_items
   
 
-- Add a customer to the database
INSERT INTO Customers (name, email, phone_number, address)
VALUES 
    ('Obi Frank', 'obi@example.com', '555-123-4567', '77 Ran Away Way, Ibeku, Ehime 10910');
   
-- Update the stock quantity of a product after a purchase.
UPDATE Products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 2;

-- Delete an order from the database.

ALTER TABLE Order_Items
ADD CONSTRAINT FK_Order_Items_Orders
FOREIGN KEY (order_id) REFERENCES Orders (order_id)
ON DELETE CASCADE;

DELETE FROM Orders
WHERE order_id = 3;


-- Retrieve all orders made by a specific customer.
SELECT c."name" , o.order_id, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Chioma Chukwu';


-- Calculate the total revenue generated by the e-commerce platform.
select sum(total_amount) as total_revenue
from orders

-- Find the revenue generated per product.
select product_name, sum(oi.quantity * oi.price) as revenue
from order_items oi
join products p
on oi.product_id = p.product_id
group by product_name


-- List the top 5 customers by total spending.
select c."name" , sum(o.total_amount) total_spent
from customers c
join orders o 
on c.customer_id = o.customer_id 
group by c."name" 
order by sum(o.total_amount) desc 
limit 5


-- Identify customers who haven’t made any purchases.
SELECT c.name, c.email
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Find the top 3 best-selling products.
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- Identify products that are out of stock
SELECT product_name
FROM Products
WHERE stock_quantity = 0;

-- Retrieve all items in a specific order, including product names, quantities, and prices.
SELECT o.order_id, oi.order_item_id, p.product_name, oi.quantity, oi.price
FROM Order_Items oi
JOIN Products p 
ON oi.product_id = p.product_id
JOIN orders o 
on oi.order_id = o.order_id 
WHERE oi.order_id = 1;


-- Calculate the total amount of an order.
SELECT order_id, SUM(quantity * price) AS total_amount
FROM Order_Items
WHERE order_id = 5
GROUP BY order_id;

-- Calculate the number of orders and total revenue for each month.
SELECT date_part('month', order_date) AS month, COUNT(*) AS total_orders, SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY month
ORDER BY month;


-- Write queries using INNER JOIN, LEFT JOIN, and FULL JOIN to retrieve data across multiple tables.
select *
from customers c 
left join orders o 
on c.customer_id = o.customer_id 

select *
from orders o 
inner join order_items oi 
on o.order_id = oi.order_id;

select c."name", p.product_name, oi.quantity, o.total_amount 
from customers c 
full join orders o 
on c.customer_id = o.customer_id 
left join order_items oi 
on o.order_id = oi.order_id 
inner join products p 
on oi.product_id = p.product_id;


-- Use RANK() to rank customers based on their total spending.
SELECT 
    c.customer_id, 
    c.name, 
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
ORDER BY 
    spending_rank;


-- Use ROW_NUMBER() to assign a unique number to each order for a customer.
SELECT 
    o.customer_id, 
    o.order_id,
    o.order_date, 
    o.total_amount, 
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS order_number
FROM 
    Orders o
WHERE  
	customer_id = 6  
ORDER BY 
    o.customer_id, order_number;
   
   
 -- Use a Common Table Expression (CTE) to calculate the total revenue per customer, then find the customers with revenue greater than $400.  
WITH CustomerRevenue AS 
	( SELECT 
		c.customer_id, 
		c.name, 
		SUM(o.total_amount) AS total_spent 
	FROM Customers c 
	JOIN Orders o 
	ON c.customer_id = o.customer_id 
	GROUP BY c.customer_id, c.name ) 
SELECT name, 
total_spent 
FROM CustomerRevenue 
WHERE total_spent > 400;


-- Find the product with the highest price using a subquery.
SELECT DISTINCT p.product_name, oi.price
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.price = (SELECT MAX(price) FROM Products);



-- Create index for customer_id in Orders table
CREATE INDEX idx_orders_customer_id 
ON Orders(customer_id);

-- Create index for product_id in Order_Items table
CREATE INDEX idx_order_items_product_id 
ON Order_Items(product_id);



-- Analyze query performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT o.order_id, o.order_date, c.name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id = 1;


-- Complex query analysis with joins:
EXPLAIN ANALYZE
SELECT 
    c.name,
    p.product_name,
    COUNT(*) as purchase_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.name, p.product_name
HAVING COUNT(*) > 1;


/*Optimize slow queries by adjusting indexes, reordering joins, or rewriting the query*/
-- Reorder the join so that the smaller table is processed first:
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;


