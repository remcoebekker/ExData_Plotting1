createPlot4 <- function() {
  ## First, we read in the data. We replace the unavailable data point, denoted by a question mark with "NA".
  powerData <- read.csv("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";", colClass=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  ## Next we turn the date and time columns into 1 additional data/time column.
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  ## We only need the data of the first 2 days of February 2007.
  powerData <- subset(powerData, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
  
  ## We set the png graphics device with the desired widht/height
  png(filename = "plot4.png", width = 480, height = 480)

  ## We want 1 png with 4 subplots, so we set the mfcol variable to 2x2. 
  par(mfcol=c(2,2))
  
  ## The subplots are made by the various subplot functions
  createSubPlot1(powerData)
  createSubPlot2(powerData)
  createSubPlot3(powerData)
  createSubPlot4(powerData)
  
  ## And we close the graphics device
  dev.off()
}

createSubPlot1 <- function(powerData) {
  ## We create the first diagram
  plot(x = powerData$DateTime, y = powerData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
}

createSubPlot2 <- function(powerData) {
  ## We create the second diagram
  plot(x = powerData$DateTime, y = powerData$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab="")
  ## And add the other two lines
  lines(x = powerData$DateTime, y = powerData$Sub_metering_2, col = "red")
  lines(x = powerData$DateTime, y = powerData$Sub_metering_3, col = "blue")
  
  ## And add the legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, box.lwd=0)
}

createSubPlot3 <- function(powerData) {
  ## We create the third diagram
  plot(x = powerData$DateTime, y = powerData$Voltage, type = "l", ylab = "Voltage", xlab="datetime")
}

createSubPlot4 <- function(powerData) {
  ## We create the fourth diagram
  plot(x = powerData$DateTime, y = powerData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")
}
