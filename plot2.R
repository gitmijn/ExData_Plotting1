# plot2.R
# Setup

df <- read.csv('household_power_consumption.txt', sep=';')

# Subset the data frame for just the two days of interest.
dfsub <- df[grepl("^[1-2]/2/2007", df$Date),]

# Convert the date column 
dfsub$DateTime <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S" )
# Convert the active column 
dfsub$Global_active_power <- as.numeric(as.character(dfsub$Global_active_power))


# Plot 2
png(file = "plot2.png")
plot(dfsub$DateTime, dfsub$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()