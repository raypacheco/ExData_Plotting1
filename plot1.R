## Plot 1 file

## Load data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")

## Convert column Date to class type date
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date)

## Subset data to date 2007-02-01 & 2007-02-02
subData <- subset(data, data$Date == as.Date("2007-02-01") 
                  | data$Date == as.Date("2007-02-02"))

## create png file with 480 x 480 pixels
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## create histogram for Global Active Power
hist(subData$Global_active_power, xlab="Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")

## save plot to png file
dev.off()
