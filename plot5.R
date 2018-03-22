## Read the data sets 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## In this plot we want to plot emissions from motor vehicle sources changed from 1999-2008 in Baltimore City
vehicleNEI <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

aggNEI <- aggregate(Emissions ~ year, vehicleNEI, sum)

## Here we will call library(ggplot2)
library(ggplot2)

## Initialize graphics device
png("plot5.png")
g <- ggplot(aggNEI, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("Years") + ylab("Total Emissions") + ggtitle("Motor-Vehicle emission from 1999 to 2008")
g
dev.off()
