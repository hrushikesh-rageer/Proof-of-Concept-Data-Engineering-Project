--Stream with Tasks to load final target table with scheduling

CREATE OR REPLACE TASK all_data_changes_transactions
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = '1 MINUTE'
    WHEN SYSTEM$STREAM_HAS_DATA('transaction_stream')
    AS 
    CREATE or REPLACE TABLE sales_final AS 
SELECT count(1) AS cnt,quarter,product_name FROM transaction_stream t
INNER JOIN products p ON p.product_id=t.product_id
GROUP BY 2,3;

ALTER TASK all_data_changes_transactions RESUME;

TRUNCATE TABLE sales_final;

SELECT SUM(cnt) FROM sales_final WHERE product_name='Washington Berry Juice';

SHOW TASKS;