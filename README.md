# HR CSV Extraction and SQL Staging Pipeline

## Overview
This project demonstrates a simple extraction and staging workflow using synthetic HR data created in R and loaded into PostgreSQL.

The goal of the project was to practice the first stage of ETL by extracting raw CSV files into a relational database, validating the load, and creating SQL staging objects to prepare the data for future transformation and analytics work.

## Business Scenario
HR data often arrives from multiple systems and exports rather than from one clean source. In this project, separate CSV files were used for employee, department, compensation history, and performance review data.

These raw files were loaded into PostgreSQL and then combined into staging tables and views for downstream analysis.

## Tools Used
- R
- readr
- DBI
- RPostgres
- PostgreSQL
- SQL

## Source Files
The following raw CSV files were used:
- dim_employees.csv
- dim_departments.csv
- fact_performance_reviews.csv
- fact_compensation_history.csv

## Project Steps
1. Read raw HR CSV files in R
2. Load raw files into PostgreSQL using `dbWriteTable()`
3. Validate row counts and key columns in SQL
4. Create a staging table for most recent compensation records
5. Create a staging view for latest performance reviews
6. Create a final analytics-ready staging view combining employee, department, compensation, and review data

## SQL Objects Created
- employees_raw
- departments_raw
- performance_reviews_raw
- compensation_history_raw
- stg_employee_current_comp
- stg_employee_latest_review_vw
- stg_employee_analytics_ready_vw

## Key Skills Demonstrated
- File-based data extraction
- Loading CSV data into PostgreSQL
- Raw data validation
- SQL joins
- Staging table design
- Preparing extracted data for transformation

## Example Use Case
The final staging view can be used as the starting dataset for:
- employee analytics dashboards
- compensation analysis
- performance reporting
- future Power BI models

## Screenshots
Screenshots are included in the `screenshots` folder to show:
- successful raw table loading
- validation queries
- staging table creation
- final combined analytics-ready view

## Future Enhancements
- Add automated logging for extraction runs
- Add row count checks inside R
- Schedule recurring loads
- Connect the final view to Power BI
