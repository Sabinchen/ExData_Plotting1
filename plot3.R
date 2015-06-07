## Making a plot the shows the sub-metered energy vs. time (with lines and a legend)

## Load the data from 01-02 Feb 2007

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", sep = ';', header = TRUE, stringsAsFactors = FALSE)
closeAllConnections()

## Make a column with data and time  

time <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(time, "%d/%m/%Y %H:%M:%S")

## Plot the data 

with(data, plot(x = datetime, y = Sub_metering_1, type = "n", main = NULL, ylab = "Energy sub metering", xlab = " "))
with(data, lines(x = datetime, y = Sub_metering_1, type = "l", col = "black"))
with(data, lines(x = datetime, y = Sub_metering_2, type = "l", col = "red"))
with(data, lines(x = datetime, y = Sub_metering_3, type = "l", col = "blue"))

## Make the legend

legend("topright", lty = 1, col = c("black", "red", "blue"), y.intersp = 0.7, pt.cex = 1, cex = 0.75, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Convert to png file and close

dev.copy(png, file = "plot3.png")
dev.off()
