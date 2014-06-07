## Plot 4 file

## Load data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")
## create new column with date and time as convert it to POSIX
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## subset data to dates 2007-02-01 & 2007-02-02
subData <- subset(data, as.Date(data$DateTime) >= as.Date("2007-02-01") 
                  & as.Date(data$DateTime) <= as.Date("2007-02-02"))

## create png file with 480 x 480 pixels
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## make plot layout 2 x 2
par(mfcol = c(2,2))

## create 1st graph - time series of global active power
with(subData, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

## create 2nd graph - time series of three energy sub metering
with(subData, plot(DateTime, Sub_metering_1, type = "l", col= "black", xlab= "", ylab="Energy sub metering"))
with(subData, lines(DateTime, Sub_metering_2, col="red"))
with(subData, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, lwd=1, bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## create 3rd graph - time series of voltage
with(subData, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

## create 4th graph - time series of global reactive power
with(subData, plot(DateTime, Global_reactive_power,type ="l", lwd = 0.25, xlab="datetime", ylab="Global_reactive_power"))


## save plot to png file
dev.off()