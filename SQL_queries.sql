-- Aperçu initial
SELECT * FROM retail LIMIT 10;

-- Vérification données manquantes ou erronées
SELECT COUNT(*) FROM retail WHERE "Customer ID" IS NULL;
SELECT COUNT(*) FROM retail WHERE Quantity <= 0;
SELECT COUNT(*) FROM retail WHERE Price <= 0;

-- Création de la vue nettoyée
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

-- Vérification de la vue
SELECT * FROM clean_retail LIMIT 10;
SELECT COUNT(*) FROM clean_retail;

-- Chiffre d'affaires total
SELECT SUM(revenue) AS total_revenue
FROM clean_retail;

-- Chiffre d'affaires mensuel
SELECT
  strftime('%Y-%m', order_date) AS month,
  SUM(revenue) AS monthly_revenue
FROM clean_retail
GROUP BY month
ORDER BY month;

-- Nombre de clients uniques
SELECT COUNT(DISTINCT "Customer ID") AS nb_customers
FROM clean_retail;

-- Panier moyen
SELECT AVG(order_revenue) AS avg_basket
FROM (
  SELECT Invoice, SUM(revenue) AS order_revenue
  FROM clean_retail
  GROUP BY Invoice
);

-- Top 10 produits par CA
SELECT
  StockCode,
  SUM(revenue) AS product_revenue
FROM clean_retail
GROUP BY StockCode
ORDER BY product_revenue DESC
LIMIT 10;
