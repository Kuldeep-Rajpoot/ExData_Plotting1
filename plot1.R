library(readr)
file <- "household_power_consumption.txt"
power <- read_csv2( file = file )
mydata <- power[ 66638:69517, ]
Global_active_power=as.numeric(mydata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power,col = "red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
