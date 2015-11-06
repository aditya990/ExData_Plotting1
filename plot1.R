#Reading the file
data = read.csv("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Getting the subset of dates
powerData = data[data$Date %in% c("1/2/2007","2/2/2007"),]
powerData$Date = as.Date(gsub("/"," ",powerData$Date),"%d%m%Y")
#draw the plot
par(mfrow = c(1,1), mar = c(6,6,6,1))
hist(powerData[,3], col = "red", xlab = "Global Active Power (kilowatts)" , main = "Global Active Power")
#exporting to png
dev.copy(png,file = "plot1.png", width = 480, height = 480)
dev.off()