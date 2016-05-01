# initialize ggplot2
library(ggplot2)

# get the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.motor.baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
NEI.motor <- aggregate(Emissions ~ year, NEI.motor.baltimore, sum)

# plot the graph
png("plot5.png", 640, 400)
g <- ggplot(NEI.motor, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity", fill = "#4a66c5") + xlab("Year") +
  ylab(expression ("Total" ~ PM[2.5] ~"Emissions (tons)")) +
  ggtitle("Motor Vehical" ~ PM[2.5] ~"Emmissions In Baltimore City between 1999-2008")
print(g)
dev.off()