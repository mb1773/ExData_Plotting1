setwd("c:/coursera/")

## "plot1.r" is a script to read data from a txt file into R
## and plot it into PNG files
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository 

## Step 1 Read the data and subset to Feb 1 and 2 of 2007 only
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

## Step 2 subset data to Global_active_power: household global minute-averaged active power (in kilowatt) variable
#str(subSetData) 
globalActivePower <- as.numeric(subSetData$Global_active_power) 

## Step 3 set up PNG plot parameters for a histogram with red bars, 480x480, and titles as shown in project instructions
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 

## Step 4 close graphic device
dev.off() 
