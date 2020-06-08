library(dplyr)
library(lubridate)

electricityData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# get the rows with the dates between Feb 1, 2007 and Feb 2, 2007
filteredElectricity <- filter(electricityData, as.Date(electricityData$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(electricityData$Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

filteredElectricityUpdate <- mutate(filteredElectricity, dateTime = paste(Date, Time, sep = "_"))

# default width and height are 480, but set them anyway
png(filename = "plot3.png", width = 480, height = 480)

# create plot
plot(dmy_hms(filteredElectricityUpdate$dateTime), filteredElectricity$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
lines(dmy_hms(filteredElectricityUpdate$dateTime), filteredElectricity$Sub_metering_2, col = "red")
lines(dmy_hms(filteredElectricityUpdate$dateTime), filteredElectricity$Sub_metering_3, col = "blue")
legend("topright", legend = paste("Sub_metering_", 1:3), col = c("black", "red", "blue"), lwd = 1)

# close device
dev.off()