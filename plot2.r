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
dates$timetemp <- paste(dates$Date, dates$Time)
dates$Time <- strptime(dates$timetemp, format = "%Y-%m-%d %H:%M:%S")


plot(dates$Time, dates$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()
