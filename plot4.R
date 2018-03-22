## Read the data sets 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## In this plot we want to know how emissions from coal combustion has been changed across united states
#  from 1999 to 2008

coalSCC <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
coalNEI <- NEI[NEI$SCC %in% coalSCC$SCC, ]

## Here we will call library(ggplot2)
library(ggplot2)

## Initialize graphics device
png("plot4.png")
g <- ggplot(coalNEI, aes(x = factor(year), y = Emissions, fill = type))
g <- g + geom_bar(stat = "identity") + xlab("year of coal combustion") + ylab("Total Emission due to coal") + ggtitle("Emissions from coal combustion related sources")
g
dev.off()
