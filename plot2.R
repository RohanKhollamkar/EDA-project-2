## Read the data sets 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##In this plot we want to plot the total emissions from PM2.5 decreased in the baltimore city from
#  year 1999 to 2008

Baltimore <- subset(NEI, fips == "24510")
 
## Here we will aggregate the data from previously subsetted data
TotalEmissions <- aggregate(Emissions ~ year, Baltimore, sum)

## Initialize graphics device
png("plot2.png")
barplot(height = TotalEmissions$x, names.arg = TotalEmissions$Group.1,col = "red", xlab = "Year", ylab = "Total Emission", main = "Baltimore PM2.5")
dev.off()