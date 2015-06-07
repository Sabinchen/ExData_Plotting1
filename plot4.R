## Making a plot the shows the sub-metered energy vs. time (with lines and a legend)

## Load the data from 01-02 Feb 2007

library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", sep = ';', header = TRUE, stringsAsFactors = FALSE)
closeAllConnections()

## Make a column with data and time  

time <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(time, "%d/%m/%Y %H:%M:%S")

## Set the plot to four panels

par(mfrow = c(2,2))
par(mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))

## Plot the data
with(data, 
     plot(x = datetime, y = Global_active_power, type = "n", main = NULL, ylab = "Global Active Power", xlab = ""), 
     )
with(data, lines(x = datetime, y = Global_active_power))
with(data, 
     plot(x = datetime, y = Voltage, type = "n", main = NULL, ylab = "Voltage", xlab = "datetime", ylim = c(232, 248))
     )
with(data, lines(x = datetime, y = Voltage))

with(data, 
     plot(x = datetime, y = Sub_metering_1, type = "n", main = NULL, ylab = "Energy sub metering", xlab = "")
)
with(data, lines(x = datetime, y = Sub_metering_1, type = "l", col = "black"))
with(data, lines(x = datetime, y = Sub_metering_2, type = "l", col = "red"))
with(data, lines(x = datetime, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), y.intersp = 0.7, pt.cex = 1, cex = 0.75, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     

with(data, 
     plot(x = datetime, y = Global_reactive_power, type = "n", main = NULL, ylab = "Global_reactive_power")
)
with(data, lines(x = datetime, y = Global_reactive_power, type = "l"))

     
# Convert to png file and close

dev.copy(png, file = "plot4.png")
dev.off()
