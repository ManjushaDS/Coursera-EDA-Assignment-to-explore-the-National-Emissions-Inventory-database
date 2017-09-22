
# PLOT 6 --------------------------------------------
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?


#load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

baltimore_LA <- NEI[NEI$type=="ON-ROAD" & (NEI$fips=="24510" |NEI$fips=="06037"), ]
total <- aggregate(Emissions ~ year+fips, baltimore_LA, sum)
total$year=as.factor(total$year)
total$fips[total$fips=="24510"]='Baltimore'
total$fips[total$fips=="06037"]='Los Angeles'


png(filename = "plot6.png", width = 480, height = 480, units = "px")

ggplot(total, aes(x=year,y=Emissions))+
  ggtitle("Total PM2.5 emission from motor vehicle sources (tons)")+
  geom_bar(aes(fill=year),width=.5,stat="identity")+facet_grid(.~fips)+
  theme(axis.text=element_text(color="red",size=10))+coord_flip()+
  theme(axis.title.x=element_text(color='black',vjust=-1),
        axis.title.y=element_text(color='black',vjust=1.5),
        plot.title=element_text(color="blue",size=12,vjust=1))


# Ending plot
dev.off()
