## Read the data sets 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## In this plot we want to compare emissions from motor vehicle sources 
#  in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California
## Here we will subset data from NEI for the batlimore city and los angeles

BmLaNEI <- NEI[(NEI$fips == "24510"|NEI$fips == "06037") & NEI$type == "ON-ROAD", ]
aggTotal <- aggregate(Emissions ~ year + fips, BmLaNEI, sum)
aggTotal$fips[aggTotal$fips == "24510"] <- "Baltimore"
aggTotal$fips[aggTotal$fips == "06037"] <- "LosAngeles"

## Here we will call library(ggplot2)

library(ggplot2)

## Initialize the graphics device
png("plot6.png")
g <- ggplot(aggTotal, aes(factor(year),Emissions))
g <- g + geom_bar(stat = "identity") + xlab("Year of comparison") + ylab("Total Emissions") + ggtitle("Motor Vehicel emission : Baltimore vs Los Angeles")
g <- g + facet_grid(. ~fips)
g
dev.off()