## Make a histogram of Global Active Power

## Load the data from 01 and 02 February 2007

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", sep = ';', header = TRUE, stringsAsFactors = FALSE)
closeAllConnections()

## Make the histogram

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Convert to png file

dev.copy(png, file = "plot1.png")
dev.off()
