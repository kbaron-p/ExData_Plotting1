# Read and prepare the data
setwd("C:/Exploratory data analysis/exdata_data_household_power_consumption")
library(sqldf)
power_data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE, sep=";")
power_data$Timestamp<-strptime(paste(power_data$Date," ",power_data$Time),"%d/%m/%Y %H:%M:%S")

#draw and save a plot
png("plot1.png",width=480,height=480, units="px")
hist(power_data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power")
dev.off()
