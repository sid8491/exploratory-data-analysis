# get the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get total emissions from different years
NEI.agg <- tapply(NEI$Emissions, NEI$year, sum)

# plot the graph to png
png("plot1.png")
barplot(height = NEI.agg, names.arg = names(NEI.agg), col = "darkred", xlab = "Years", ylab = expression ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()