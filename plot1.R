# this file reads the data and constructs plot1.png
library(tidyverse)
dat <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?",
                  colClasses = c(rep("character",2), rep("numeric",7)))
dat <- dat%>%filter(Date %in% c("1/2/2007", "2/2/2007"))


# plot
png("plot1.png", height=480, width=480, units="px")
hist(dat$Global_active_power, col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
 








