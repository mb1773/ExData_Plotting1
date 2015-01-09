setwd("c:/coursera/")

## "plot3.r" is a script to read data from a txt file into R
## and plot it into PNG files
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository 

## Step 1 Read the data and subset to Feb 1 and 2 of 2007 only
dataFile3 <- "./household_power_consumption.txt" 
data3 <- read.table(dataFile3, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData3 <- data3[data3$Date %in% c("1/2/2007","2/2/2007") ,] 
  
## Step 2 subset data to Global_active_power: household global minute-averaged active power (in kilowatt) and subset metering variables
#str(subSetData3) 
datetime <- strptime(paste(subSetData3$Date, subSetData3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData$Global_active_power) 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 
 
## Step 3 set up PNG plot parameters in course project instructions
png("plot3.png", width=480, height=480) 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Step 4 close graphic device
dev.off() 
