library(sqldf)

file <- "./household_power_consumption.txt"
filter <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
data <- read.csv2.sql(file, filter)
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col='red'
)
dev.copy(png, file='plot1.png')
dev.off()
