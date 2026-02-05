# Analyse e-commerce – SQL & Power BI Web

## Description rapide
Projet complet d’analyse des ventes pour un site e-commerce, utilisant SQL pour nettoyer et préparer les données, et Power BI Web pour créer un dashboard interactif et informatif.

## Objectifs
- Nettoyer et transformer les données en SQL
- Calculer des KPI clés
- Créer un dashboard interactif pour suivre les performances

## Données
- Dataset : Online Retail
- Colonnes : InvoiceNo, order_date, CustomerID, StockCode, Quantity, UnitPrice, Country
- Transformation : création de `revenue_clean = Quantity * UnitPrice`

## Dashboard Power BI
- **Cards KPI** : Chiffre d’affaires total, Nombre de clients, Panier moyen
- **Line chart** : CA mensuel
- **Bar chart** : Top 10 produits
- **Slicers** : Filtrage par pays et date
- **Table** : détails avec conditional formatting pour les revenus

## Insights principaux
1. Forte saisonnalité du CA
2. Quelques produits génèrent la majorité du CA
3. Panier moyen stable
4. Pays les plus rentables identifiés
5. CA mensuel en croissance

## Outils
- SQL : DB Browser for SQLite
- Power BI Web : Dashboard interactif
- GitHub : partage du projet

## Fichiers inclus
- `clean_retail.csv` : données prêtes à analyser
- `SQL_queries.sql` : toutes les requêtes SQL utilisées
- `screenshots/` : captures d’écran du dashboard
