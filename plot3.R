## Plot 3 file

## Load data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")
## create new column with date and time as convert it to POSIX
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## subset data to dates 2007-02-01 & 2007-02-02
subData <- subset(data, as.Date(data$DateTime) >= as.Date("2007-02-01") 
                  & as.Date(data$DateTime) <= as.Date("2007-02-02"))

## create png file with 480 x 480 pixels
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## create time series with sub metering 1 - 3 on one plot
with(subData, plot(DateTime, Sub_metering_1, type = "l", col= "black", xlab= "", ylab="Energy sub metering"))
with(subData, lines(DateTime, Sub_metering_2, col="red"))
with(subData, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()