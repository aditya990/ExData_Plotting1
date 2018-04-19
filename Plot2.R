power_consumption <- read.csv("household_power_consumption.txt",
                              header = TRUE , sep = ';',stringsAsFactors = F,
                              na.strings = "?")
power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
data <- power_consumption[power_consumption$Date >= "2007-02-01" &
                            power_consumption$Date <= "2007-02-02", ]
data$datetime = strptime(paste(data$Date,data$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
plot(data$datetime,data$Global_active_power, type = 'l',ylab = "Global Active Power (Kilowatts)", xlab = '')
dev.copy(png,"Plot2.png",width = 480,height = 480)
dev.off()
