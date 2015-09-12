##Getting and Cleaning Data
##Course 4 - Exploratory Data
##Course Project #1 - Plot 1

##identify the zip file
fileZip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileZip, destfile="data.zip", method="wininet")
dateDownloaded <- date()
data2 <- data.frame()

##Unzip the directory
(unzip("data.zip"))

##Placing in a table
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= "?")

##Subset rows for the table by desired date
desDate = data$Date == "1/2/2007" | data$Date == "2/2/2007"
data2 <- data[desDate,]

##Histogram
library(datasets)
globalActivePower <- as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
<<<<<<< HEAD

=======
>>>>>>> 4c6302fc3d6828202b7b0bbad4abb419bc80ef0b
