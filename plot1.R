df <- read.csv('household_power_consumption.txt', sep=';')

# Subset the data frame for just the two days of interest.
dfsub <- df[grepl("^[1-2]/2/2007", df$Date),]
# Convert the date column 
# dfsub$Date <- as.Date(dfsub$Date, "%d/%m/%Y")
dfsub$DateTime <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S" )

# Plot 1
dfsub$Global_active_power <- as.numeric(as.character(dfsub$Global_active_power))

png(file = "plot1.png")
hist(dfsub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()