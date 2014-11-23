##Read data in

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset for Baltimore

BmData <- subset(NEI, fips =="24510")

#Aggregate Baltimore Data

Totalemyearbm <- tapply(BmData$Emissions, BmData$year, sum)

#Plot png

png("Plot2.png")

plot(names(Totalemyearbm),Totalemyearbm, type ="l",  xlab="Year", ylab=expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions (tons)"),main=expression("Total Baltimore City," ~ PM[2.5] ~ "Emissions by Year"))
dev.off()