library(tidyverse)
library(lubridate)

power_messy <- read_delim("household_power_consumption.txt", delim = ";", na = c("?", "NA"))

power <- power_messy %>%
    mutate(Date = dmy(Date)) %>% # Correct Date column from character to date type
    filter(Date >= "2007-02-01", Date <= "2007-02-02") %>% 
    mutate(Date_time = ymd(Date) + hms(Time))

with(power, plot(Date_time, Global_active_power, type = "l", ann = FALSE))
title(ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()
