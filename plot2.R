##Getting and Cleaning Data
##Course 4 - Exploratory Data
##Course Project #1 - Plot 2

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
png("plot2.png", width=480, height=480)
with(data2, plot(DateTime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type = "l"))
dev.off()