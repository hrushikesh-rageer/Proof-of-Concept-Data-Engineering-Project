--Transforming JSON variant data type to required data type

CREATE or REPLACE TABLE promotions_final AS
SELECT $1:cost :: String  AS cost
,$1:end_date :: String AS end_date
,$1:media_type :: String AS media_type
,$1:promotion_district_id :: String AS promotion_district_id
,$1:promotion_id :: String AS promotion_id
,$1:promotion_name :: String AS promotion_name
,$1:start_date :: String AS start_date
FROM @MANAGE_DB.external_stages.parquet_folder
(file_format => 'MANAGE_DB.file_formats.parquet_fileformat');