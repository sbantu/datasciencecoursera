#Reading all Data

Alldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
Alldata$Date <- as.Date(Alldata$Date, format="%d/%m/%Y")

# subsetting Data

data <- subset(Alldata, subset=(Date >= "2007-02-01"  & Date <= "2007-02-02"))


#Convert Data and times

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plot Graph 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
    plot(data$Global_active_power~data$Datetime, xlab="", ylab="Global Active Power(kilowatts)", type ="l")
    plot(data$Voltage~data$Datetime, xlab="datetime", ylab="Voltage", type ="l")
    plot(data$Sub_metering_1~data$Datetime, xlab="", ylab="Energy Sub metering", type ="l")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(data$Global_reactive_powe~data$Datetime, xlab="datetime", ylab="Global_reactive_power", type ="l")
})



##Save the graph

dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()