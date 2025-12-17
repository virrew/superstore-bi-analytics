## Dimensional Model

The project uses a star schema design.

### Fact Table
- fact_sales: transactional sales data at order line level

### Dimension Tables
- dim_customer: customer attributes and segmentation
- dim_product: product hierarchy and categories
- dim_date: calendar attributes derived from order and ship dates
- dim_region: geographic attributes
