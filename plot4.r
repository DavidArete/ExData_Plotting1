setwd("C:/David/Data/Explore")

con <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")

data <- NULL

data <- read.csv(con, sep=";")

unlink(con)

data <- as.vector(data)

dates1 <- subset(data, Date == "1/2/2007") 
dates2 <- subset(data, Date == "2/2/2007")
dates <- rbind(dates1, dates2)

dates$Date <- as.Date(dates$Date, format = "%d/%m/%Y")
dates$Global_active_power <- as.numeric(as.character(dates$Global_active_power))
dates$Voltage <- as.numeric(as.character(dates$Voltage))
dates$Global_reactive_power <- as.numeric(as.character(dates$Global_reactive_power))
dates$Sub_metering_1 <- as.numeric(as.character(dates$Sub_metering_1))
dates$Sub_metering_2 <- as.numeric(as.character(dates$Sub_metering_2))
dates$Sub_metering_3 <- as.numeric(as.character(dates$Sub_metering_3))
dates$timetemp <- paste(dates$Date, dates$Time)
dates$Time <- strptime(dates$timetemp, format = "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

#Plot 1
plot(dates$Time, dates$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

#Plot 2
plot(dates$Time, dates$Voltage, type = "l", xlab="datetime", ylab="Voltage")

#Plot 3
plot(dates$Time, dates$Sub_metering_1, type = "l", xlab="", ylab="Energy Sub Metering")
lines(dates$Time, dates$Sub_metering_2,col="red")
lines(dates$Time, dates$Sub_metering_3,col="blue")
legend("topright", c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"), cex=0.6, bty ="n", lty=c(1,1),lwd=c(2.5,2.5),col=c("black","blue","red"))

#Plot 1
plot(dates$Time, dates$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()
