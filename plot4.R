library(sqldf)

file <- "./household_power_consumption.txt"
filter <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
data <- read.csv2.sql(file, filter)
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

with(data, plot(DateTime, Global_active_power, pch=".", 
                xlab="", ylab="Global Active Power"))
with(data, lines(DateTime,Global_active_power))

with(data, plot(DateTime, Voltage, pch=".", 
                xlab="datetime"))
with(data, lines(DateTime,Voltage))

with(data, plot(DateTime, Sub_metering_1, pch=".", 
                xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",
       box.lwd=0,
       lty=c(1,1,1), 
       cex=0.5,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(DateTime, Global_reactive_power, pch=".", 
                xlab="datetime"))
with(data, lines(DateTime,Global_reactive_power))

dev.copy(png, file='plot4.png')
dev.off()
