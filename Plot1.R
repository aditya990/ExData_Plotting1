
power_consumption <- read.csv("household_power_consumption.txt",
                              header = TRUE , sep = ';',stringsAsFactors = F,
                              na.strings = "?")
power_consumption$Date <- as.Date(power_consumption$Date,"%d/%m/%Y")
data <- power_consumption[power_consumption$Date >= "2007-02-01" &
                            power_consumption$Date <= "2007-02-02", ]
hist(data$Global_active_power,col = "red", xlab = "Global Active Power (Kilowatts)",main = "Global Active Power")
dev.copy(png,"Plot1.png",width = 480,height = 480)
dev.off()
