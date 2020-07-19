library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
mydata <- power[ 66638:69517, ]
Global_active_power=as.numeric(mydata$Global_active_power)
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)
png("plot3.png", width=480, height=480)
with(mydata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
