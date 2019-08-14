library(data.table)

png('plot_1.png')

# Load dataset.
power = fread('data/household_power_consumption.txt')
power_filtered = power[Date == '1/2/2007' | Date == '2/2/2007']

# Global active power histogram
hist(as.numeric(power_filtered[, Global_active_power]), xlab = 'Global active power (kilowatts)', col = "red", main = "Global active power histogram")

dev.off()
