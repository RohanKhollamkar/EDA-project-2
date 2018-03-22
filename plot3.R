## Read the data sets 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##In this plot we want to plot the total emissions from PM2.5 decreased in the baltimore city for each
# of the four sources indicated by the type (point, nonpoint, onroad, nonroad) variable from 
# year 1999 to 2008.

Baltimore <- subset(NEI, fips == "24510")

## Here we will call library(ggplot2)
 
library(ggplot2)
aggBaltimore <- aggregate(Emissions ~ year + type, Baltimore, sum)

## Initialize graphics device
png("plot3.png")
g <- ggplot(aggBaltimore, aes(year, Emissions, color = type)) 
g <- g + geom_line() +  xlab("year") + ylab("Emissions") + ggtitle("Decrease in emissions for baltimore city source wise") 
g
dev.off()
