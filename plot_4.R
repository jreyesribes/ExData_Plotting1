library(data.table)

png('plot_4.png')


# Fetch dataset, filter
power = fread('data/household_power_consumption.txt')
power_filtered = power[Date == '1/2/2007' | Date == '2/2/2007']

# Get datetime as POSIXct
power_filtered[, datetime := as.POSIXct(paste(Date, Time), tz = '', format = '%d/%m/%Y %H:%M:%S')]


# Split the chart in 4.
par(mfrow = c(2, 2))


# Chart 1: Global Active Power v. Date
with(power_filtered, plot(datetime, Global_active_power, type = 'l', xlab = 'Day', ylab = 'Global active power (kilowatts)'))


# Chart 2: Voltage.
with(power_filtered, plot(datetime, Voltage, type = 'l', xlab = 'Day', ylab = 'Voltage'))


# Chart 3: Sub meterings
with(power_filtered, plot(datetime, Sub_metering_1, type = 'l', col = 'black', ylab = "Energy sub metering", xlab = "Day"))

with(power_filtered, lines(datetime, Sub_metering_2, col = 'red'))
with(power_filtered, lines(datetime, Sub_metering_3, col = 'blue'))

# Add a legend.
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 'solid')


# Chart 4: Global reactive power
with(power_filtered, plot(datetime, Global_reactive_power, type = 'l', xlab = 'Day', ylab = 'Global reactive power'))


dev.off()
