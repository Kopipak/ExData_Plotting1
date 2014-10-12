d = read.table("household_power_consumption.txt", header = TRUE, sep=";")

sind <- d[,1] == "1/2/2007"
eind <- d[,1] == "2/2/2007"
data <- rbind(d[sind,],d[eind,])  ## all data 2/1-2/2

GAP <- as.vector(data[,3])
GAP <- as.numeric(GAP)

data2 <- data
data2$Date <- strptime(data2$Date, "%d/%m/%Y")
DayTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)
plot(DayTime,GAP, type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
