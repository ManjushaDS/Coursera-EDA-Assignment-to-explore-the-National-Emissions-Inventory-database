
# PLOT 5 --------------------------------------------
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)


# Finding "motor vehicle sources" from the EI.Sector field.
baltimorevehicle <- NEI[NEI$type=="ON-ROAD"& NEI$fips=="24510", ]

total <- aggregate(Emissions~year,data=baltimorevehicle,FUN=sum)

total$year=as.factor(total$year)
png(filename = "plot5.png", width = 480, height = 480, units = "px")

g<-ggplot(total, aes(x=year,y=Emissions))+ggtitle("Total PM2.5 emission from motor vehicle sources (tons)\n in Baltimore")
g<-g+geom_bar(width=.5,stat="identity",colour="#004C00",fill="#666699")

g+theme(axis.text=element_text(color="red",size=10))+
  theme(axis.title.x=element_text(color='black'),
        axis.title.y=element_text(color='black',vjust=1.5),plot.title=element_text(color="blue",size=12,vjust=1))

# Ending plot
dev.off()

