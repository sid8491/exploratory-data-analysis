# get the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get total emissions from different years of Baltimore City, Maryland
NEI.baltimore <- subset(NEI, fips == "24510")
NEI.baltimore.agg <- tapply(NEI.baltimore$Emissions, NEI.baltimore$year, sum)

# plot the graph to png
#png("plot2.png")
barplot(height = NEI.baltimore.agg, names.arg = names(NEI.baltimore.agg), col = "darkgreen", xlab = "Years", ylab = expression ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total" ~ PM[2.5] ~ "Emissions of Baltimore City by Year"))
#dev.off()