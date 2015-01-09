setwd("c:/coursera/")

## "plot2.r" is a script to read data from a txt file into R
## and plot it into PNG files
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository 

## Step 1 Read the data and subset to Feb 1 and 2 of 2007 only

dataFile2 <- "./household_power_consumption.txt" 
data2 <- read.table(dataFile2, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData2 <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,] 

## Step 2 subset data to Global_active_power: household global minute-averaged active power (in kilowatt) variable
#str(subSetData2) 
datetime <- strptime(paste(subSetData2$Date, subSetData2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData2$Global_active_power) 

## Step 3 set up PNG plot parameters in course project instructions
png("plot2.png", width=480, height=480) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

## Step 4 close graphic device
dev.off() 
