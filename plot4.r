setwd("c:/coursera/")

## "plot3.r" is a script to read data from a txt file into R
## and plot it into PNG files
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository 

## Step 1 Read the data and subset to Feb 1 and 2 of 2007 only
dataFile4 <- "./household_power_consumption.txt" 
data4 <- read.table(dataFile4, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData4 <- data4[data4$Date %in% c("1/2/2007","2/2/2007") ,] 
 
## Step 2 subset data to Global_active_power: household global minute-averaged active power, global reactive power, voltage and subset metering variables
#str(subSetData4) 
datetime <- strptime(paste(subSetData4$Date, subSetData4$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData4$Global_active_power) 
globalReactivePower <- as.numeric(subSetData4$Global_reactive_power) 
voltage <- as.numeric(subSetData4$Voltage) 
subMetering1 <- as.numeric(subSetData4$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData4$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData4$Sub_metering_3) 
 
 
## Step 3 set up PNG plot parameters in course project instructions
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  
  
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 
 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
 
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
 

## Step 4 close graphic device
dev.off() 
