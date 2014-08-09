# plot3.R
# Setup

df <- read.csv('household_power_consumption.txt', sep=';')

# Subset the data frame for just the two days of interest.
dfsub <- df[grepl("^[1-2]/2/2007", df$Date),]

# Convert the date column 
dfsub$DateTime <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S" )
# Convert the active column 
dfsub$Global_active_power <- as.numeric(as.character(dfsub$Global_active_power))

# Plot 3
dfsub$Sub_metering_1 <- as.numeric(as.character(dfsub$Sub_metering_1))
dfsub$Sub_metering_2 <- as.numeric(as.character(dfsub$Sub_metering_2))
dfsub$Sub_metering_3 <- as.numeric(as.character(dfsub$Sub_metering_3))

png(file = "plot3.png")
plot(dfsub$DateTime, dfsub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dfsub$DateTime, dfsub$Sub_metering_2, type = "l", col = "red")
lines(dfsub$DateTime, dfsub$Sub_metering_3, type = "l", col = "blue")
legend("topright", col= c("black", "red", "blue"), lwd=c( 2.5, 2.5, 2.5), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

