## Make a plot of Global Active Power vs. Time

## Load the data

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", sep = ';', header = TRUE, stringsAsFactors = FALSE)
closeAllConnections()

## Convert the time to the actual time

time <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(time, "%d/%m/%Y %H:%M:%S")

## Make the plot (first empty, then add the lines)
plot(x = data$datetime, y = data$Global_active_power, type = "n", main = NULL, ylab = "Global Active Power (kilowatts)", xlab = " ")
lines(x = data$datetime, y = data$Global_active_power, type = "l")

## Convert to png file
dev.copy(png, file = "plot2.png")
dev.off()
