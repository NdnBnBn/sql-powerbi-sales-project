# Analyse e-commerce – SQL & Power BI Web

## Description rapide
Projet complet d’analyse des ventes pour un site e-commerce, utilisant SQL pour nettoyer et préparer les données, et Power BI Web pour créer un dashboard interactif et informatif.

## Objectifs
- Nettoyer et transformer les données avec SQL
- Calculer des KPI clés
- Créer un dashboard interactif pour suivre la performance

## Données
Le dataset contient des données de transaction d’un site e-commerce britannique, incluant :
- Numéros de commandes (Invoice)
- Dates de commande (order_date)
- Identifiants clients (Customer ID)
- Codes produits (StockCode)
- Quantités (Quantity)
- Prix unitaires (Price)
- Pays (Country)

- Dataset original : **Online Retail II (UCI)**  
- Source : [Kaggle](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)

## Dashboard Power BI
- **Cards KPI** : Chiffre d’affaires total, Nombre de clients, Panier moyen
- **Line chart** : Chiffre d’affaires mensuel
- **Bar chart** : Top 10 produits
- **Slicers** : Filtrage par pays et par période
- **Table** : détails avec mise en forme conditionnelle pour les revenus

## Insights principaux
1. Forte saisonnalité du chiffre d’affaires
2. Quelques produits génèrent la majorité du CA
3. Panier moyen stable
4. Pays les plus rentables identifiés
5. Chiffre d’affaires mensuel en croissance

## Outils
- SQL : DB Browser for SQLite
- Power BI Web : dashboard interactif
- GitHub : partage du projet

## Fichiers inclus
- `clean_retail.csv` : données prêtes à analyser (échantillon si dataset complet trop lourd)
- `SQL_queries.sql` : toutes les requêtes SQL utilisées

## Dashboard interactif Power BI
Vous pouvez consulter le dashboard interactif Power BI ici :  
[Retail Report – Power BI Web](https://app.powerbi.com/reportEmbed?reportId=dcce4dc7-da58-4a40-96d7-b4eebbd9ddd9&autoAuth=true&ctid=a9f1c4f7-38f4-4d38-8a3c-4b6dbe981cea&actionBarEnabled=true)

