# PLOT 3 --------------------------------------------
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

# Loading ggplot2 
library(ggplot2)

#load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subseting data for Baltimore only
baltimore <-NEI[NEI$fips == "24510", ]

total <- aggregate(Emissions~type+year,baltimore,sum)

png("plot3.png")

qplot(year,Emissions,data=total,color=type,geom="line")+ggtitle("Total PM[2.5]*Emissions in the baltimore county by source type")+xlab("year")+ylab("PM[2.5]*Emissions")
dev.off()