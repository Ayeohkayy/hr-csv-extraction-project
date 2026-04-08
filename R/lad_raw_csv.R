install.packages("RPostgres")

library(DBI)
library(RPostgres)
library(readr)

con <- dbConnect(
  RPostgres::Postgres(),
  dbname = "HR_data_260407",
  host = "localhost",
  port = 5432,
  user = "postgres",
  password = "your_password_here"
)

employees <- read_csv("data/raw/dim_employees.csv")
departments <- read_csv("data/raw/dim_departments.csv")
performance_reviews <- read_csv("data/raw/fact_performance_reviews.csv")
compensation_history <- read_csv("data/raw/fact_compensation_history.csv")

dbWriteTable(con, "employees_raw", employees, overwrite = TRUE)
dbWriteTable(con, "departments_raw", departments, overwrite = TRUE)
dbWriteTable(con, "performance_reviews_raw", performance_reviews, overwrite = TRUE)
dbWriteTable(con, "compensation_history_raw", compensation_history, overwrite = TRUE)

dbDisconnect(con)
