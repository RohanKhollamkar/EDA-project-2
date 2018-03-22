## Read the data sets 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## here we will aggregate the emissions bye each of the year
TotalEmissions <- with(NEI,aggregate(Emissions, by = list(year),  FUN = sum))

## Initialize graphics device 
png("plot1.png")
plot(TotalEmissions, xlab = "Years", ylab = "Total Emission", main = "Decrease in PM2.5 : 1999-2008 ",
     pch = 19, col = "red", lty = 2, type = "o")
dev.off()
