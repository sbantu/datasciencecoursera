#Reading all Data

Alldata <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
Alldata$Date <- as.Date(Alldata$Date, format="%d/%m/%Y")

# subsetting Data

data <- subset(Alldata, subset=(Date >= "2007-02-01"  & Date <= "2007-02-02"))


#Convert Data and times

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot Graph 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", col="Red")

household_power_consumption.txt