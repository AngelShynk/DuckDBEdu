-- Create the sales table
CREATE TABLE sales (
    id INTEGER,
    salesperson_id INTEGER,
    region TEXT,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

-- TRUNCATE TABLE sales;
-- Insert sample data into the sales table
INSERT INTO sales (id, salesperson_id, region, sale_date, amount) VALUES
(1, 101, 'North', '2024-01-01', 100.00),
(2, 102, 'South', '2024-01-02', 150.00),
(3, 101, 'North', '2024-01-03', 200.00),
(4, 103, 'West', '2024-01-04', 250.00),
(5, 102, 'South', '2024-01-05', 300.00),
(6, 104, 'East', '2024-01-06', 350.00),
(7, 103, 'West', '2024-01-07', 400.00),
(8, 104, 'East', '2024-01-08', 450.00),
(9, 103, 'West', '2024-01-19', 400.00),
(10, 104, 'East', '2024-01-10', 500.00),
(10, 105, 'East', '2024-01-10', 600.00);


SELECT * FROM sales;


-- Generate a row_number column with incremental identifiers for each row
SELECT 
    id,
    salesperson_id,
    region,
    sale_date,
    amount,
    ROW_NUMBER() OVER () AS row_number
FROM 
    sales;

-- Generate a row_number column, by order of sale_date
SELECT 
    id,
    salesperson_id,
    region,
    sale_date,
    amount,
    ROW_NUMBER() OVER (ORDER BY sale_date) AS row_number
FROM 
    sales;

-- Generate a row_number column, by order of sale_date partitioned by region
SELECT 
    id,
    salesperson_id,
    region,
    sale_date,
    amount,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY sale_date) AS row_number
FROM 
    sales;

-- Compute the percentage of the total amount of sales per region for each row
SELECT 
    id,
    salesperson_id,
    region,
    sale_date,
    amount,
    amount / SUM(amount) OVER (PARTITION BY region) AS pct_of_region_sales
FROM 
    sales;
   
-- LEAD
SELECT 
    id,
    sale_date,
    amount,
    LEAD(amount, 1) OVER (ORDER BY sale_date) AS next_amount
FROM 
    sales;

-- LAG
SELECT 
    id,
    sale_date,
    amount,
    LAG(amount, 1) OVER (ORDER BY sale_date) AS previous_amount
FROM 
    sales;

-- CUME_DIST
SELECT
    id,
    salesperson_id,
    region,
    sale_date,
    amount,
    CUME_DIST() OVER (ORDER BY amount) AS cume_dist
FROM 
    sales;
   
SELECT
    id,
    salesperson_id,
    region,
    sale_date,
    amount,
    CUME_DIST() OVER (PARTITION BY region ORDER BY amount) AS cume_dist
FROM 
    sales;
  