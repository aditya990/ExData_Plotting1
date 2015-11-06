#Reading the file
data = read.csv("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Getting the subset of dates
powerData = data[data$Date %in% c("1/2/2007","2/2/2007"),]
powerData$Date = as.Date(gsub("/"," ",powerData$Date),"%d%m%Y")
powerData$datetime = strptime(paste(powerData$Date,powerData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
#plot the graph
with(powerData,{plot(datetime,Sub_metering_1,col = "black", type = "l",ylab = "Energy Sub metering", xlab = "");lines(datetime,Sub_metering_2,col = "red"); lines(datetime,Sub_metering_3, col = "blue")})
#apply legend
legend("topright", lty = 1,col = c("black","red","blue"),legend = c("Sub metering 1","Sub metering 2","Sub metering 3"))
#copy to file device
dev.copy(png,file = "plot3.png",width = 480, height = 480)
dev.off()
