setwd("C:/David/Data/Explore")

con <- unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt")

data <- read.csv(con, sep=";")

unlink(con)

dates <- as.vector(dates)

dates1 <- subset(data, Date == "1/2/2007") 
dates2 <- subset(data, Date == "2/2/2007")
dates <- rbind(dates1, dates2)


dates$Global_active_power
GAP <- as.numeric(as.character(dates$Global_active_power))
#GAP <- dates$Global_active_power

hist(GAP, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()


