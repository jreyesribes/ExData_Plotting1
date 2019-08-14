library(data.table)

png('plot_2.png')

# Load data
power = fread('data/household_power_consumption.txt')
power_filtered = power[Date == '1/2/2007' | Date == '2/2/2007']

# Parse date & time.
power_filtered[, datetime := as.POSIXct(paste(Date, Time), tz = '', format = '%d/%m/%Y %H:%M:%S')]

# Plot Global_active_power through time.
with(power_filtered, plot(datetime, Global_active_power, type = 'l', xlab = 'Day', ylab = 'Global active power (kilowatts)'))

dev.off()
