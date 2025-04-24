SELECT segment, SUM(sales) AS total_sales
FROM cleaned_sales_data
WHERE order_date >= '2016-01-01'  -- Filter for orders in 2025
GROUP BY segment
ORDER BY total_sales DESC
LIMIT 10;

SELECT o1.order_id, o1.sales, o1.product_name
FROM cleaned_sales_data o1
INNER JOIN cleaned_sales_data o2 ON o1.product_id = o2.product_id
WHERE o1.sales > 500
LIMIT 10;

SELECT order_id, customer_name, sales
FROM cleaned_sales_data
WHERE sales > (SELECT AVG(sales) FROM cleaned_sales_data)
LIMIT 10;

SELECT category, SUM(sales) AS total_sales, AVG(profit) AS avg_profit
FROM cleaned_sales_data
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10;

-- Create a view for total sales by region
CREATE VIEW region_sales AS
SELECT region, SUM(sales) AS total_sales
FROM cleaned_sales_data
GROUP BY region;

-- Optimizing queries with an index on the 'order_date' column
CREATE INDEX idx_order_date ON cleaned_sales_data(order_date);

-- Querying the view created above
SELECT * FROM region_sales
ORDER BY total_sales DESC
LIMIT 10;