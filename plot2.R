library(tidyverse)
library(lubridate)


## Read in the data
power_messy <- read_delim("household_power_consumption.txt", delim = ";", na = c("?", "NA"))


power <- power_messy %>%
    mutate(Date = dmy(Date)) %>% # Correct Date column from character to date type
    filter(Date >= "2007-02-01", Date <= "2007-02-02") %>% 
    mutate(Date_time = ymd(Date) + hms(Time)) ## Add new column for date and time together

## Initiate graph without annotations
with(power, plot(Date_time, Global_active_power, type = "l", ann = FALSE))

## Now I can annotate
title(ylab = "Global Active Power (kilowatts)")

## Copy to .png and close graphics device
dev.copy(png, "plot2.png")
dev.off()
