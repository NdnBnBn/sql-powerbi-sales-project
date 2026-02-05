-- ===========================
-- Original queries
-- ===========================

-- Preview first 10 rows
SELECT * FROM retail LIMIT 10;

-- Check for missing or invalid data
SELECT COUNT(*) FROM retail WHERE "Customer ID" IS NULL;
SELECT COUNT(*) FROM retail WHERE Quantity <= 0;
SELECT COUNT(*) FROM retail WHERE Price <= 0;

-- Create cleaned view
CREATE VIEW clean_retail AS
SELECT 
  Invoice, 
  DATE(InvoiceDate) AS order_date, 
  "Customer ID", 
  StockCode, 
  Quantity, 
  Price, 
  ROUND(Quantity * Price, 2) AS revenue, 
  Country
FROM retail
WHERE "Customer ID" IS NOT NULL
  AND Quantity > 0
  AND Price > 0;

-- Preview & check
SELECT * FROM clean_retail LIMIT 10;
SELECT COUNT(*) FROM clean_retail;

-- Basic KPIs
SELECT SUM(revenue) AS total_revenue FROM clean_retail;

SELECT strftime('%Y-%m', order_date) AS month, SUM(revenue) AS monthly_revenue
FROM clean_retail
GROUP BY month
ORDER BY month;

SELECT COUNT(DISTINCT "Customer ID") AS nb_customers FROM clean_retail;

SELECT AVG(order_revenue) AS avg_basket
FROM (
  SELECT Invoice, SUM(revenue) AS order_revenue
  FROM clean_retail
  GROUP BY Invoice
);

SELECT StockCode, SUM(revenue) AS product_revenue
FROM clean_retail
GROUP BY StockCode
ORDER BY product_revenue DESC
LIMIT 10;

-- ===========================
-- Clean retail with RFM columns added
-- ===========================

-- ===========================
-- Clean retail with RFM columns added
-- ===========================

CREATE VIEW clean_retail_rfm AS
WITH customer_rfm AS (
    SELECT
        "Customer ID",
        JULIANDAY('2011-12-31') - JULIANDAY(MAX(order_date)) AS recency,
        COUNT(DISTINCT Invoice) AS frequency,
        SUM(revenue) AS monetary
    FROM clean_retail
    GROUP BY "Customer ID"
)
SELECT
    cr.*,
    rfm.recency,
    rfm.frequency,
    rfm.monetary
FROM clean_retail cr
LEFT JOIN customer_rfm rfm
    ON cr."Customer ID" = rfm."Customer ID";




