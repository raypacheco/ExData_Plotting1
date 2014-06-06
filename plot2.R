## Plot 2 file

## load data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")

## create new column with date and time as convert it to POSIX
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## subset data to dates 2007-02-01 & 2007-02-02
subData <- subset(data, as.Date(data$DateTime) >= as.Date("2007-02-01") 
                  & as.Date(data$DateTime) <= as.Date("2007-02-02"))

## create png file with 480 x 480 pixels
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## plot time series of Global Active Power
with(subData, plot(DateTime, Global_active_power, type="l", 
                   xlab="", ylab="Global Active Power (kilowatts)"))

## save plot to png file
dev.off()