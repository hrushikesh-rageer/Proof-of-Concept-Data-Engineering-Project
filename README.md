# Proof of Concept(PoC) Data Engineering Project

align="center">
![Project Architecture](Project Architecture.png)


## Project Overview

This project involves building a robust data pipeline to extract data from an Oracle database using Talend, storing it in AWS S3, and then loading it into Snowflake for data cleansing, validations, and transformations.

This curated data in Snowflake is used by Data analysts to create dashboards and visualizations to support data-driven decision-making while data scientists build machine learning models from this data.

## Technical Stack

- **ETL Tool**: Talend
- **Cloud Services**: AWS S3 for Storage, IAM for access control, SQS to send notifications
- **Data Warehouse**: Snowflake

## Dataset

The retail dataset contains information related to product sales, inventory, and customer records.

## Workflow

### Data Extraction

Data is extracted from the Oracle DB using Talend, converted it into flat files, and pushed into AWS S3 for storage. Data masking is performed on sensitive information in Talend before the data is pushed into AWS S3.

### Data Storage and Management

An AWS S3 bucket is set up with multiple folders for CSV, JSON, and Parquet files to organize the data efficiently. Necessary IAM roles and policies are created to ensure secure access to the S3 bucket.

### Integration with Snowflake

Multiple Snowflake objects such as stages, file formats, and storage integration are created to facilitate seamless access to data stored in AWS S3 from Snowflake.

### Continuous Loading and Notification

SnowPipe is configured to establish a notification channel in AWS S3, enabling continuous loading of data into Snowflake staging tables upon detection of new data.

### Data Cleansing and Validation

Data cleansing techniques are applied to handle NULL values, remove duplicates, and perform business column validations prior to loading into dimension tables. Additionally, data validations are implemented to ensure that dates fall within specified ranges and numerical values are within expected limits.

### Data Transformation

Various transformations are applied to the staging data including Slowly Changing Dimensions (SCD), Change Data Capture (CDC), concatenation, derivation of additive measures, and adding new columns based on predefined rules specified in the mapping sheet.

### Incremental Loading

Stream objects are created on source tables to capture changes in the staging table, enabling incremental loading of data into both dimension and fact tables.

### Scheduling

Tasks are configured to automate the data load process based on changes detected in the stream object, ensuring timely and efficient data processing.

## Conclusion

The entire process of creating a scalable and effective data pipeline for the ingestion, transformation, and loading of retail datasets into the Snowflake data warehouse is illustrated in this data engineering project. The project ensures efficient data management, real-time loading, and extensive data processing capabilities by utilizing Talend, AWS services, and Snowflake. 
