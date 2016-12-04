# Read and prepare the data
setwd("C:/Exploratory data analysis/exdata_data_household_power_consumption")
library(sqldf)
power_data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE, sep=";")
power_data$Timestamp<-strptime(paste(power_data$Date," ",power_data$Time),"%d/%m/%Y %H:%M:%S")

#draw and save a plot
png("plot2.png",width=480,height=480, units="px")
plot(power_data$Timestamp,power_data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(power_data$Timestamp,power_data$Global_active_power, type="l")
dev.off()
