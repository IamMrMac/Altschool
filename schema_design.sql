+----------------+     +----------------+     +-----------------+     +-------------------+
|   Customers    |     |   Products     |     |     Orders      |     |   Order_Items      |
+----------------+     +----------------+     +-----------------+     +-------------------+
| customer_id PK |     | product_id PK  |     | order_id PK      |     | order_item_id PK  |
| name           |     | product_name   |     | customer_id FK   |     | order_id FK       |
| email          |     | category       |     | order_date       |     | product_id FK     |
| phone_number   |     | price          |     | total_amount     |     | quantity          |
| address        |     | stock_quantity |     +-----------------+     | price             |
+----------------+     +----------------+                                +-------------------+

Relationships:
- Customers.customer_id -> Orders.customer_id (1:M)
- Orders.order_id -> Order_Items.order_id (1:M)
- Products.product_id -> Order_Items.product_id (1:M)
