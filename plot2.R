# this file reads the data and constructs plot2.png
library(tidyverse)
# read data
if (!file.exists("exdata_data_household_power_consumption.zip")) {
        download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      destfile="exdata_data_household_power_consumption.zip",
                      method="curl")
        unzip("exdata_data_household_power_consumption.zip")  
}

dat <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?",
                  colClasses = c(rep("character",2), rep("numeric",7)))
dat <- dat%>%filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
        unite(date_time, c("Date", "Time"), sep=" ")%>%
        mutate(Time1 = as.POSIXct(strptime(date_time, format ="%d/%m/%Y %H:%M:%S") ))

# plot 
png("plot2.png", height=480, width=480, units="px")
plot(x=dat$Time1,
     y= dat$Global_active_power,
     xlab="",
     ylab = "Global Active Power (kilowatts)",
     type="l")
dev.off()
