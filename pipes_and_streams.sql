--Creation of Pipe for continous load
CREATE OR REPLACE SCHEMA MANAGE_DB.pipes

CREATE OR REPLACE PIPE MANAGE_DB.pipes.transaction_pipe
auto_ingest = TRUE
AS
COPY INTO MANAGE_DB.external_stages.transaction
FROM @MANAGE_DB.external_stages.retail
file_format= (type = csv field_delimiter=',' skip_header=1)
pattern='.*transactions.*' ;

--Check Status of Pipe
SELECT SYSTEM$PIPE_STATUS('MANAGE_DB.pipes.transaction_pipe');

--Stream Object for CDC
CREATE or REPLACE STREAM transaction_stream ON TABLE MANAGE_DB.external_stages.transaction;

--File processed using Snowpipe
ALTER PIPE MANAGE_DB.pipes.transaction_pipe REFRESH;

SELECT * FROM transaction_stream WHERE METADATA$ACTION='INSERT';

SHOW STREAMS;


CREATE TABLE sales_final AS 
SELECT count(1) AS cnt,quarter,product_name FROM transaction_stream t
INNER JOIN products p ON p.product_id=t.product_id
WHERE METADATA$ACTION='INSERT'
GROUP BY 2,3;