library(tidyverse)
library(lubridate)

## Read in the data
power_messy <- read_delim("household_power_consumption.txt", delim = ";", na = c("?", "NA"))

power <- power_messy %>%
    mutate(Date = dmy(Date)) %>% # Correct Date column from character to date type
    filter(Date >= "2007-02-01", Date <= "2007-02-02")

## Initiate graph without annotations
with(power, hist(Global_active_power, col = "red", ann = FALSE))

## Now I can annotate
title(main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      ylab = "Frequency")

## Copy file to .png and close the graphics device
dev.copy(png, "plot1.png")
dev.off() 
