#Reading the file
data = read.csv("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Getting the subset of dates
powerData = data[data$Date %in% c("1/2/2007","2/2/2007"),]
powerData$Date = as.Date(gsub("/"," ",powerData$Date),"%d%m%Y")
powerData$datetime = strptime(paste(powerData$Date,powerData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
#set the parameters
par(mfcol = c(2,2), mar = c(4,4,1,1))
#plot Global Active Power
plot(powerData[,10],powerData[,3], ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
#plot Energy Sub metering
with(powerData,{plot(datetime,Sub_metering_1,col = "black", type = "l",ylab = "Energy Sub metering", xlab = "");lines(datetime,Sub_metering_2,col = "red"); lines(datetime,Sub_metering_3, col = "blue")})
#apply legend
legend("topright", lty = 1,col = c("black","red","blue"),legend = c("Sub metering 1","Sub metering 2","Sub metering 3"))
#plot voltage
plot(powerData[,10], powerData[,5], xlab = "datetime", ylab = "voltage", type ="l")
#plot Global reactive power
plot(powerData[,10],powerData[,4], ylab = "Global_Reactive_Power", xlab = "datetime", type = "l")
#copy to file device
dev.copy(png,file = "plot4.png",width = 480, height = 480)
dev.off()
