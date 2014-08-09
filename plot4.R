# plot4.R
# Setup

df <- read.csv('household_power_consumption.txt', sep=';')

# Subset the data frame for just the two days of interest.
dfsub <- df[grepl("^[1-2]/2/2007", df$Date),]

# Convert the date column 
dfsub$DateTime <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S" )
# Convert the active column 
dfsub$Global_active_power <- as.numeric(as.character(dfsub$Global_active_power))


# Plot 4

png(file = "plot4.png")
par(mfrow=c(2,2))
plot(dfsub$DateTime, dfsub$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dfsub$DateTime, dfsub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dfsub$DateTime, dfsub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dfsub$DateTime, dfsub$Sub_metering_2, type = "l", col = "red")
lines(dfsub$DateTime, dfsub$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", col= c("black", "red", "blue"), lwd=c( .5, .5, .5), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dfsub$DateTime, dfsub$Global_reactive_power, type = "l", xlab = "datetime")
dev.off()