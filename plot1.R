library(tidyverse)
library(lubridate)

power_messy <- read_delim("household_power_consumption.txt", delim = ";", na = c("?", "NA"))

power <- power_messy %>%
    mutate(Date = dmy(Date)) %>% # Correct Date column from character to date type
    filter(Date >= "2007-02-01", Date <= "2007-02-02")

with(power, hist(Global_active_power, col = "red", ann = FALSE))
title(main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      ylab = "Frequency")

dev.copy(png, "plot1.png")
dev.off()
