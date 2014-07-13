library(sqldf)

file <- "./household_power_consumption.txt"
filter <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
data <- read.csv2.sql(file, filter)
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

with(data, plot(DateTime, Global_active_power, pch=".", 
                xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(DateTime,Global_active_power))

dev.off()
