##Read data in

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset for Baltimore on Road data

BmDataOnRoad <- subset(NEI, fips =="24510" & type=="ON-ROAD")

#Aggregate Baltimore OnRoad Data

Totalemyearbmonroad <- aggregate(Emissions ~ year, BmDataOnRoad, sum)

library(ggplot2)

#Plot Png

png("plot5.png", width=840, height = 480)

p <- ggplot(Totalemyearbmonroad, aes(factor(year), Emissions))

p <- p+geom_bar(stat="identity") + xlab("Year") + ylab(expression("Total PM'[2.5]*Emissions")) + ggtitle("Total Emission from motor vechicle in Baltimore City from 1999 to 2008")

print(p)
dev.off()