--Created Tables for different file formats: CSV, JSON, Parquet

CREATE or REPLACE transient TABLE transaction
(product_id string,
customer_id string,
store_id string,
promotion_id string,
month_of_year string,
quarter string,
the_year string,
store_sales string,
store_cost string,
unit_sales string,
fact_count string);


CREATE or REPLACE transient TABLE products
(product_class_id string,
product_id string,
brand_name string,
product_name string,
SKU string,
SRP string,
gross_weight string,
net_weight string,
recyclable_package string,
low_fat string,
units_per_case string,
cases_per_pallet string,
shelf_width string,
shelf_height string,
shelf_depth string);


CREATE or REPLACE TABLE product_class_raw
(raw variant );

CREATE or REPEAT TABLE product_class AS
 SELECT raw:product_category :: String AS product_category
 ,raw:product_class_id :: String AS product_class_id
 ,raw:product_department :: String AS product_department
 ,raw:product_family :: String AS  product_family
 ,raw:product_subcategory :: String AS product_subcategory
 FROM product_class_raw;