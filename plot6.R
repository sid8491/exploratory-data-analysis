# initialize ggplot2
library(ggplot2)

# get the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data for motor from Baltimore City(24510) and Los Angeles County(06037)
NEI.motor.cities <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
NEI.motor.agg <- aggregate(Emissions ~ year + fips, NEI.motor.cities, sum)
NEI.motor.agg$fips[NEI.motor.agg$fips == '24510'] <- "Baltimore City"
NEI.motor.agg$fips[NEI.motor.agg$fips == '06037'] <- "Los Angeles County"
names(NEI.motor.agg)[names(NEI.motor.agg) == "fips"] <- "City"

# plot the graph
png("plot6.png", 640, 400)
g <- ggplot(NEI.motor.agg, aes(factor(year), Emissions, fill = City))
g <- g + geom_bar(stat = "identity", position = position_dodge()) +
  xlab("Year") + ylab(expression ("Total" ~ PM[2.5] ~"Emissions (tons)")) +
  ggtitle("Motor Vehical" ~ PM[2.5] ~"Emmissions In Baltimore City vs Los Angeles County between 1999-2008")
print(g)
dev.off()