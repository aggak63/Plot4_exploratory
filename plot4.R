## Read the file, Subset it and create dattime function as in plot2 and 3
## plot 4

x<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, quote= "", 
strip.white=TRUE, 
stringsAsFactors = F, na.strings = "?")
x<- subset(x, (x$Date == "1/2/2007" | x$Date== "2/2/2007")) 
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
x$DateTime <- as.POSIXct(paste(x$Date, x$Time))


png("plot4.png", width = 480, height = 480)

## To create 4 plots on one screen, we use mfrow function here. (mfcol can also be used.)
## It will fill the screen row wise in sequencce- topRow (let to right), bottomrow(left to right)

par(mfrow=c(2,2)) 

## this is same as plot2
plot(x$DateTime, x$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="") ## plot at toprow first column

## similar to above but with Voltage

plot(x$DateTime, x$Voltage, type="l", xlab="datetime", ylab="Voltage")## plot at toprow second column

## same as plot 3
plot(x$DateTime, x$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")     ## plot at bottom row first column

lines(x$DateTime, x$Sub_metering_2, type="l", col="red")
lines(x$DateTime, x$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), bty="n", lty=1,col=c("black","red","blue")) 

## same as plot 2 but with  reactive power

plot(x$DateTime, x$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")     ## plot at bottom row second column
dev.off() 



