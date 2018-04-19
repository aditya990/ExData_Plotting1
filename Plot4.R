
power_consumption <- read.csv("household_power_consumption.txt",
                              header = TRUE , sep = ';',stringsAsFactors = F,
                              na.strings = "?")
power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
data <- power_consumption[power_consumption$Date >= "2007-02-01" &
                            power_consumption$Date <= "2007-02-02", ]

data$datetime = strptime(paste(data$Date,data$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
par(mfcol = c(2,2))
#first Plot
plot(data$datetime,data$Global_active_power,xlab = "",ylab = "Global Active Power (Kilowatts)", type = "l")
#second plot
plot(data$datetime,data$Sub_metering_1,type = 'l', col = "black",xlab = "",ylab = "Energy sub metering")
points(data$datetime,data$Sub_metering_2,type = 'l', col = "red")
points(data$datetime,data$Sub_metering_3,type = 'l', col = "blue")
legend("topright",legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty = 1, col = c("black","red","blue"))
#third plot
plot(data$datetime,data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
#fourth plot
plot(data$datetime,data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.copy(png,"Plot4.png",width = 480,height = 480)
dev.off()
