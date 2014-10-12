d = read.table("household_power_consumption.txt", header = TRUE, sep=";")

sind <- d[,1] == "1/2/2007"
eind <- d[,1] == "2/2/2007"
data <- rbind(d[sind,],d[eind,])  ## all data 2/1-2/2

data2 <- data
data2$Date <- strptime(data2$Date, "%d/%m/%Y")
DayTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

SM1 <- as.vector(data[,7])
SM1 <- as.numeric(SM1)
SM2 <- as.vector(data[,8])
SM2 <- as.numeric(SM2)
SM3 <- as.vector(data[,9])
SM3 <- as.numeric(SM3)


png(filename = "plot3.png",width = 480, height = 480)
plot(DayTime, SM1, type="l",ylab = "Energy sub metering", xlab = "")
lines(DayTime,SM2, type="l", col="red")
lines(DayTime,SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c('black','red', 'blue'))
dev.off()
