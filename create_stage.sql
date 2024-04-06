-- Create Stage object with Integration object & File Format object

CREATE OR REPLACE stage MANAGE_DB.external_stages.Retail
    URL = 's3://astprojectbucket/Retail/'
    STORAGE_INTEGRATION = s3_int;

LIST @MANAGE_DB.external_stages.Retail;
    
SELECT METADATA$FILENAME,$1,$2,$3,$4,$5,$6,$7,$8,$9 from @MANAGE_DB.external_stages.Retail
WHERE METADATA$FILENAME='Retail/transactions.csv';

SELECT METADATA$FILENAME,$1 from @MANAGE_DB.external_stages.Retail
WHERE METADATA$FILENAME='Retail/product_class.json';
