d = read.table("household_power_consumption.txt", header = TRUE, sep=";")

sind <- d[,1] == "1/2/2007"
eind <- d[,1] == "2/2/2007"
data <- rbind(d[sind,],d[eind,])  ## all data 2/1-2/2

GAP <- as.vector(data[,3])
GAP <- as.numeric(GAP)


png(filename = "plot1.png",width = 480, height = 480)
hist(GAP, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()
