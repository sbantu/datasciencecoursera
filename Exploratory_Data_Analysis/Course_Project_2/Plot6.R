##Read data in

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset for Baltimore on Road data

BMLADataOnRoad <- subset(NEI, (fips =="24510" | fips =="06037") & type=="ON-ROAD")

#Aggregate Baltimore OnRoad Data

Totalemyearbmlaonroad <- aggregate(Emissions ~ year+fips, BMLADataOnRoad, sum)
Totalemyearbmlaonroad$fips[Totalemyearbmlaonroad$fips=="24510"] <- "Baltimore City"
Totalemyearbmlaonroad$fips[Totalemyearbmlaonroad$fips=="06037"] <- "Los Angeles"

library(ggplot2)

#Plot Png

png("plot6.png", width=840, height = 480)


qplot(year,Emissions, data=Totalemyearbmlaonroad, color=fips, geom="line") + ggtitle(expression("Total Emission from motor vechicle in Baltimore City Vs Los Angeles from 1999 to 2008")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~"Emissions (tons)"))
dev.off()

