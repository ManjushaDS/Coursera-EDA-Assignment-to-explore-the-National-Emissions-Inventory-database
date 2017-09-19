# PLOT 4 --------------------------------------------
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Filter emissions from "coal" sources based on the activity "Short.Name" which returns 239 entries
# The amount of entries if the grep is used on "EI.Sector"  is 99



#load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


SCCcoalonly <- SCC[grep("coal",SCC$Short.Name,ignore.case=TRUE), ]

# Merging the Source Classifcation Code with the PM25 measurements
NEISCC <- merge(NEI, SCCcoalonly, by.x="SCC", by.y="SCC")

# Calculating total emissions
totals <- as.vector(tapply(NEISCC$Emissions, NEISCC$year, sum))

# Defining plotting parameters
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Plotting

barplot(totals, names.arg = levels(NEISCC$year), xlab = "Year", main = "Total Emissions from Coal Combustion Related sources \n in the United States from 1999 to 2008", ylab = expression('Total PM'[2.5]*" Emission"))

# Ending plot
dev.off()