library(dplyr)

electricityData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# get the rows with the dates between Feb 1, 2007 and Feb 2, 2007
filteredElectricity <- filter(electricityData, as.Date(electricityData$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(electricityData$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

# default width and height are 480, but set them anyway
png(filename = "plot1.png", width = 480, height = 480)

# create histogram
hist(as.numeric(filteredElectricity$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# close device
dev.off()