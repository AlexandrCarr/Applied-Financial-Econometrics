if (!requireNamespace("exuber", quietly = TRUE)) install.packages("exuber")
library(exuber)
library(readxl) 


##############################
# SADF Test for 2022 USD-VND #
##############################

# Loading and formatting the data
data <- read_excel("APEData.xlsx")
data$Date <- as.Date(data$Date)

# Selecting a subset of data
start_date <- as.Date('2022-01-01')
end_date <- as.Date('2023-01-01')
subset_data <- subset(data, Date >= start_date & Date <= end_date)

# Converting close to returns
close_series <- as.numeric(subset_data$Close)
log_close_series <- log(close_series)

# Performing the SADF test using the radf function on the log-transformed series
sadf_result <- radf(log_close_series)

# Viewing the summary of the test results
summary(sadf_result)

###########################
# SADF Test for DXY 2022 #
###########################

df <- read_excel("DXY.xlsx")
close_series2 <- as.numeric(df$Close)
log_close_series2 <- log(close_series2)
sadf_result2 <- radf(log_close_series2)
summary(sadf_result2)


