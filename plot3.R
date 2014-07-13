library(sqldf)

file <- "./household_power_consumption.txt"
filter <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
data <- read.csv2.sql(file, filter)
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

with(data, plot(DateTime, Sub_metering_1, pch=".", 
                xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",
       lty=c(1,1,1), 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file='plot3.png')
dev.off()
