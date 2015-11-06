#Reading the file
data = read.csv("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Getting the subset of dates
powerData = data[data$Date %in% c("1/2/2007","2/2/2007"),]
powerData$Date = as.Date(gsub("/"," ",powerData$Date),"%d%m%Y")
powerData$datetime = strptime(paste(powerData$Date,powerData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
#Plot the chart
plot(powerData[,10],powerData[,3], type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)", main = "")
#copy the graph
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()