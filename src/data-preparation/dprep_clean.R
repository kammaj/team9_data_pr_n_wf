# Get final dataset
library(data.table)
library(dplyr)
data <- fread("../../gen/input/calendar_holiday_distance.csv.gz")

#Check missing values before coercing
sum(is.na(data))

#Cleaning data
data$price <- as.numeric(gsub("\\$", "", data$price))
data$adjusted_price <- as.numeric(gsub("\\$", "", data$adjusted_price))

#Make directory and write file
dir.create("../../gen/output")

fwrite(data, "../../gen/output/calendar_holiday_distance_clean.csv.gz")

