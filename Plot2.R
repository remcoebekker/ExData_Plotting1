createPlot2 <- function() {
  ## First, we read in the data. We replace the unavailable data point, denoted by a question mark with "NA".
  powerData <- read.csv("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";", colClass=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  ## Next we turn the date and time columns into 1 additional data/time column.
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  ## We only need the data of the first 2 days of February 2007.
  powerData <- subset(powerData, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
  
  ## We set the png graphics device with the desired widht/height
  png(filename = "plot2.png", width = 480, height = 480)
  
  ## We create the diagram
  plot(x = powerData$DateTime, y = powerData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
  
  ## And we close the graphics device
  dev.off()
}