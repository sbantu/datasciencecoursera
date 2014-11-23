##Read data in

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset for Baltimore

BmData <- subset(NEI, fips =="24510")

#Aggregate Baltimore Data with Types

TotalemyearbmType <- aggregate(Emissions ~ year + type, BmData, sum)

#load ggplot2

library(ggplot2)
#Plot png

png("Plot3.png", width=640, height = 480)

qplot(year,Emissions, data=TotalemyearbmType, color=type, geom="line") + ggtitle(expression("Baltimore City" ~PM[2.5] ~ "Emissions by Source Type and Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~"Emissions (tons)"))
dev.off()