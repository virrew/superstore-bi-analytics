-- Tables

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INT PRIMARY KEY,
    date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    day_name INT NOT NULL,
    day_of_week INT NOT NULL,
    week_of_year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    segment VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_product (
    product_key SERIAL PRIMARY KEY,
    product_id VARCHAR(50) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    sub_category VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_location (
    location_key SERIAL PRIMARY KEY,
    country VARCHAR(80) NOT NULL,
    state VARCHAR (80) NOT NULL,
    city VARCHAR(80) NOT NULL,
    postal_code VARCHAR(20),
    region VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_ship_mode (
    ship_mode_key SERIAL PRIMARY KEY,
    ship_mode VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS fact_sales (
    sales_key SERIAL PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    -- Foreign Keys
    order_date_id INT NOT NULL,
    ship_date_id INT NOT NULL,
    customer_key INT NOT NULL,
    product_key INT NOT NULL,
    location_key INT NOT NULL,
    ship_mode_key INT NOT NULL,
    -- Measures
    sales_amount DECIMAL(18,2) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(5,2) NOT NULL,
    profit DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (order_date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (ship_date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (ship_mode_key) REFERENCES dim_ship_mode(ship_mode_key)

);

-- Indexes for performance optimization
CREATE INDEX idx_fact_sales_order_date ON fact_sales(order_date_id);
CREATE INDEX idx_fact_sales_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_sales_product ON fact_sales(product_key);
CREATE INDEX idx_fact_sales_location ON fact_sales(location_key);
CREATE INDEX idx_fact_sales_ship_mode ON fact_sales(ship_mode_key);