# Read and prepare the data
setwd("C:/Exploratory data analysis/exdata_data_household_power_consumption")
library(sqldf)
power_data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE, sep=";")
power_data$Timestamp<-strptime(paste(power_data$Date," ",power_data$Time),"%d/%m/%Y %H:%M:%S")

#draw and save a plot
png("plot3.png",width=480,height=480, units="px")
plot(power_data$Timestamp,power_data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(power_data$Timestamp,power_data$Sub_metering_1, type="l", col="black")
lines(power_data$Timestamp,power_data$Sub_metering_2, type="l", col="red")
lines(power_data$Timestamp,power_data$Sub_metering_3, type="l", col="blue")
legend("topright", names(power_data)[7:9], col=c("black","red", "blue"), lty=1)
dev.off()
