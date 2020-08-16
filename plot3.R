library(tidyverse)
library(lubridate)

## Read in the data
power_messy <- read_delim("household_power_consumption.txt", delim = ";", na = c("?", "NA"))

power <- power_messy %>%
    mutate(Date = dmy(Date)) %>% # Correct Date column from character to date type
    filter(Date >= "2007-02-01", Date <= "2007-02-02") %>% 
    mutate(Date_time = ymd(Date) + hms(Time)) ## Add new column for date and time together

## Initiate graph without annotations
with(power, plot(Date_time, Sub_metering_1, type = "n", ann = FALSE))

## Add line graph for each sub_metering
lines(power$Date_time, power$Sub_metering_1)
lines(power$Date_time, power$Sub_metering_2, col = "red")
lines(power$Date_time, power$Sub_metering_3, col = "blue")

## Add legend
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Now I can annotate
title(ylab = "Energy sub metering")

## Copy to .png and close graphics device
dev.copy(png, "plot3.png", width = 550, height = 480)
dev.off()
