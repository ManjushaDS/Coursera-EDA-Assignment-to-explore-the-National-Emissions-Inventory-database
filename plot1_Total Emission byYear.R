#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
SCC <- readDS("Source_Classification_Code.rds")
str(SCC)

#Aggregated Total by year
A <- aggregate(Emissions~year,NEI,sum)

#Plot total emission by year

png("plot1.png")

barplot(height = A$Emissions,names.arg = A$year,xlab="Year",ylab = "TotalPM[2.5]*emissions",main=expression("TotalPM[2.5]*emissionsbyyear"))
dev.off()

#Total Emission from PM[2.5]decreased in the US from 1999 to 2008