library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
mydata <- power[ 66638:69517, ]
Global_active_power=as.numeric(mydata$Global_active_power)
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)
png("plot2.png", width=480, height=480)
with(mydata, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
