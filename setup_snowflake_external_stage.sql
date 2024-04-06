--Create or Replace Storage Integration s3_int

TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::975050330770:role/ASTS3Full'
  STORAGE_ALLOWED_LOCATIONS = ('s3://astprojectbucket/CSV/')
    COMMENT = 'This an optional comment'

ALTER STORAGE INTEGRATION s3_int SET STORAGE_ALLOWED_LOCATIONS = ('s3://astprojectbucket/CSV/','s3://astprojectbucket/JSON/','s3://astprojectbucket/Parquet/','s3://astprojectbucket/Retail/');