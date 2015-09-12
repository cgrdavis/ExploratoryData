##Getting and Cleaning Data
##Course 4 - Exploratory Data
##Course Project #1 - Plot 3

##identify the zip file
fileZip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileZip, destfile="data.zip", method="wininet")
dateDownloaded <- date()
data2 <- data.frame()

##Unzip the directory
(unzip("data.zip"))

##Placing in a table
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

##Subset rows for the table by desired date
desDate = data$Date == "1/2/2007" | data$Date == "2/2/2007"
data2 <- data[desDate,]
library(datasets)

##Changing to numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

##Merging date and time
data2$DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Changing column position to the beginning
data2 <- data2[c(10,1,2,3,4,5,6,7,8,9)]

##Line Graph
png("plot4.png", width=480, height=480)
with(data2, plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l", col="black"))
with(data2, lines(DateTime, Sub_metering_2, col = "red"))
with(data2, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data2, {
  plot(DateTime, Global_active_power, ylab="Global Active Power", xlab="", type = "l")
  plot(DateTime, Voltage, type="l")
  plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l", col="black")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l")
})
dev.off()