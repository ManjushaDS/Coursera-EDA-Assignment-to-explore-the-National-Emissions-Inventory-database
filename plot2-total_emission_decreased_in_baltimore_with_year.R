# PLOT 2 --------------------------------------------
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#loading data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readDS("Source_Classification_Code.rds")


#analyis emission of baltimore city
Baltimore<-subset(NEI,fips==24510)

# Defining plotting parameters
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Calculating total emissions per year and plotting
totals <- as.vector(tapply(Baltimore$Emissions, Baltimore$year, sum))



barplot(totals, names.arg = levels(Baltimore$year),col="green",xlab="Year",ylab = "TotalPM[2.5]*emissions",main=expression("Total PM[2.5]*emissions in baltimore city from 1999 to 2008"))

# Ending plot
dev.off()