#This script:
#1) Downloads and unzips the data, if necessary.
#2) Prepares the data for work
#3) Subsets the data
#4) Creates the Plot1
library(dplyr)
# Getting the data
setwd("ExData_Plotting1")
myURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("zippedData.zip")){
        download.file(myURL,"ExData_Plotting1/zippedData.zip")
        unzip("zippedData.zip")
}
myData <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

# Correcting the class of the cariables
myData$Date <- as.Date(myData$Date,  format="%d/%m/%Y")
myData$Time <- format(myData$Time, format="%H:%M:%S")
myData[,3:9] <- sapply(X = myData[,3:9], as.numeric)

# Drawing and saving the plot
png(filename = "plot1.png", width = 480, height = 480)
with(subset(x = myData, Date=="2007-02-01" | Date=="2007-02-02"),
        hist(Global_active_power, main = "Global Active Power", xlab = " Global Active Power (kilowatts)", col = "red")
        )
dev.off()

