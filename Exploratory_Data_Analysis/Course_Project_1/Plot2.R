#Reading all Data

Alldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
Alldata$Date <- as.Date(Alldata$Date, format="%d/%m/%Y")

# subsetting Data

data <- subset(Alldata, subset=(Date >= "2007-02-01"  & Date <= "2007-02-02"))


#Convert Data and times

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot Graph 2
plot(data$Global_active_power~data$Datetime, xlab="", ylab="Global Active Power(kilowatts)", type ="l")


##Save the graph

dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()