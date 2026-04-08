# HR CSV Extraction and SQL Staging Pipeline

## Overview
This project demonstrates a real-world data extraction and staging workflow using synthetic HR data. Raw CSV files generated in R are extracted and loaded into PostgreSQL, where they are validated and transformed into structured staging tables and views.

The goal of this project is to showcase the **Extract stage of ETL**, along with foundational staging practices used in analytics and data engineering workflows.

---

## Business Scenario
HR data often comes from multiple systems and exports rather than a single clean source. In this project, separate CSV files represent different HR domains:

- Employee master data
- Department reference data
- Performance reviews
- Compensation history

These raw datasets are extracted into a relational database and prepared for downstream analytics through SQL staging.

---

## Results
This project successfully:
- Extracted multiple HR CSV files using R
- Loaded raw data into PostgreSQL tables
- Validated row counts and key fields
- Built staging tables and views to combine employee, department, compensation, and performance data
- Created an **analytics-ready dataset** for future reporting and dashboarding

---

## Tech Stack
- **R**
  - readr
  - DBI
  - RPostgres
- **PostgreSQL**
- **SQL**

---

## Source Data
The following synthetic datasets were used:

- `dim_employees.csv`
- `dim_departments.csv`
- `fact_performance_reviews.csv`
- `fact_compensation_history.csv`

All data was generated programmatically in R for portfolio purposes.

---

## Project Workflow

### 1. Extract
- Read CSV files into R using `read_csv()`
- Load data into PostgreSQL using `dbWriteTable()`

### 2. Validate
- Checked row counts across all raw tables
- Verified key columns such as `EmployeeID` and `DepartmentID`
- Identified missing or unmatched values

### 3. Stage
Created SQL objects to prepare data for analysis:

- **Raw Tables**
  - `employees_raw`
  - `departments_raw`
  - `performance_reviews_raw`
  - `compensation_history_raw`

- **Staging Table**
  - `stg_employee_current_comp`

- **Staging Views**
  - `stg_employee_latest_review_vw`
  - `stg_employee_analytics_ready_vw`

---

## Example Code

### R: Extract and Load CSV Files
```r
library(readr)
library(DBI)
library(RPostgres)

con <- dbConnect(
  RPostgres::Postgres(),
  dbname = "your_db",
  host = "localhost",
  user = "postgres",
  password = "your_password"
)

employees <- read_csv("data/raw/dim_employees.csv")
dbWriteTable(con, "employees_raw", employees, overwrite = TRUE)

dbDisconnect(con)
