##Read data in

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate Data

Totalemyear <- tapply(NEI$Emissions, NEI$year, sum)

#Plot png

png("Plot1.png")

plot(names(Totalemyear),Totalemyear, type ="l",  xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()