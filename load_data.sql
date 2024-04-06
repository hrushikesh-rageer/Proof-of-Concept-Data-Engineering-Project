--Load the data into Snowflake table

COPY INTO transaction
FROM @MANAGE_DB.external_stages.retail
file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('transactions.csv'); 

SELECT * FROM transaction;

COPY INTO products
FROM @MANAGE_DB.external_stages.retail
file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('product.csv'); 

SELECT * FROM products;

COPY INTO product_class_raw
FROM @MANAGE_DB.external_stages.retail
file_format= MANAGE_DB.file_formats.json_fileformat
files = ('product_class.json');

SELECT * FROM product_class_raw;