library(data.table)

png('plot_3.png')

# Open dataset.
power = fread('data/household_power_consumption.txt')
power_filtered = power[Date == '1/2/2007' | Date == '2/2/2007']

# Parse datetimes.
power_filtered[, datetime := as.POSIXct(paste(Date, Time), tz = '', format = '%d/%m/%Y %H:%M:%S')]

# Plot sub meterings
with(power_filtered, plot(datetime, Sub_metering_1, type = 'l', col = 'black', ylab = "Energy sub metering", xlab = "Day"))

with(power_filtered, lines(datetime, Sub_metering_2, col = 'red'))
with(power_filtered, lines(datetime, Sub_metering_3, col = 'blue'))

# Add a legend.
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 'solid')

dev.off()
