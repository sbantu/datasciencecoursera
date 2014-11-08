#Reading all Data

Alldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
Alldata$Date <- as.Date(Alldata$Date, format="%d/%m/%Y")

# subsetting Data

data <- subset(Alldata, subset=(Date >= "2007-02-01"  & Date <= "2007-02-02"))


#Convert Data and times

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot Graph 3
with(data, {
    plot(data$Sub_metering_1~data$Datetime, xlab="", ylab="Energy Sub metering", type ="l")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save the graph

dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()