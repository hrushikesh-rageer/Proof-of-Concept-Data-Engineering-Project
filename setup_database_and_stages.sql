
DESC integration s3_int; -- See storage integration properties to fetch external_id so we can update it in S3


/*This SQL script sets up a database named MANAGE_DB and a schema named external_stages. Additionally, it defines file formats for different file types to be used within the MANAGE_DB database */ 

CREATE or REPLACE database MANAGE_DB;

CREATE or REPLACE schema external_stages;

CREATE OR REPLACE file format MANAGE_DB.file_formats.csv_fileformat
    type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE;

CREATE OR REPLACE file format MANAGE_DB.file_formats.json_fileformat
    type = JSON;
    
 CREATE OR REPLACE file format MANAGE_DB.file_formats.parquet_fileformat
    type = Parquet;