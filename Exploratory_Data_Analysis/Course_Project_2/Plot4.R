##Read data in

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge NEI and SCC data

mergedata <- merge(NEI,SCC, by="SCC")

#look for all records in Short.Name with coal

CoalRecords <- grepl("coal", mergedata$Short.Name, ignore.case=TRUE)

subsetmergedata <-mergedata[CoalRecords,]

#Aggregate Coal Data

Totalemyearcoal <- tapply(subsetmergedata$Emissions, subsetmergedata$year, sum)

#Plot png

png("Plot4.png")
plot(names(Totalemyearcoal),Totalemyearcoal, type ="l",  xlab="Year", ylab=expression("Total" ~ PM[2.5] ~"Emissions (tons)"),main=expression("Total Emissions from coal sources from 1999 to 2008"))
dev.off()