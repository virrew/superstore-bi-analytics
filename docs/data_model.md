# Data Model – Superstore BI Analytics

This document defines the analytical data model used for SQL-based analysis.

## Grain
One row represents one order line (one product per order).

## Fact Table
### fact_sales
Measures:
- Sales
- Profit
- Quantity
- Discount

Foreign Keys:
- order_date_id
- ship_date_id
- customer_id
- product_id
- location_id

## Dimension Tables

### dim_date
- date_id (PK)
- date
- year
- month
- quarter

### dim_customer
- customer_id (PK)
- customer_name
- segment

### dim_product
- product_id (PK)
- product_name
- category
- sub_category

### dim_location
- location_id (PK)
- country
- region
- state
- city
- postal_code


# Data Model (Star Schema)

## Dimensions
- dim_date: calendar attributes (used for order_date and ship_date)
- dim_customer: customer_id, customer_name, segment
- dim_product: product_id, product_name, category, sub_category
- dim_geography: country, state, city, postal_code, region
- dim_ship_mode: ship_mode

## Fact
- fact_sales: one row per order line (transaction line)
  - order_id (degenerate dimension)
  - FKs: order_date_id, ship_date_id, customer_key, product_key, geography_key, ship_mode_key
  - measures: sales, profit, quantity, discount

