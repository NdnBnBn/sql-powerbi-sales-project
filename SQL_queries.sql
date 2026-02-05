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

-- ==========================================
-- Analyse RFM (fidélité clients)
-- ==========================================

-- Créer la vue RFM
CREATE VIEW rfm_customers AS
SELECT
    "Customer ID",
    JULIANDAY('2011-12-31') - JULIANDAY(MAX(order_date)) AS recency,
    COUNT(DISTINCT Invoice) AS frequency,
    SUM(revenue) AS monetary
FROM clean_retail
GROUP BY "Customer ID";

-- Vérification
SELECT * FROM rfm_customers;


