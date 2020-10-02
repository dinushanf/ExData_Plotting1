#Download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table('household_power_consumption.txt', sep = ';', skip = 1)
names(data) <- c('date', 'time', 'global_active_power', 'global_reactive_power', 'voltage', 'global_intensity', 
                 'sub_metering_1', 'sub_metering_2', 'sub_metering_3')

data$date <- as.Date(data$date, format = '%d/%m/%Y')

sub_data <- subset(data, date == '2007-02-01' | date == '2007-02-02')
sub_data$time <- paste(sub_data$date, sub_data$time)
sub_data$time <- strptime(sub_data$time, format = '%Y-%m-%d %H:%M:%S')

#start process to save to png file
png("plot3.png", width = 480, height = 480)

plot(sub_data$time, sub_data$sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(sub_data$time, sub_data$sub_metering_1, col="black")
lines(sub_data$time, sub_data$sub_metering_2, col="red")
lines(sub_data$time, sub_data$sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

#Turn off device
dev.off()