# initialize ggplot2
library(ggplot2)

# get the data 
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# get total emissions from different years
# NEI.agg <- tapply(NEI$Emissions, NEI$year, sum)

# plot the graph
# png("plot3.png", 640, 400)
g <- ggplot(NEI.type, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab(expression ("Total" ~ PM[2.5] ~"Emissions (tons)")) + 
  ggtitle("Baltimore City" ~ PM[2.5] ~ " Emmission by Source type and Year")
print(g)
# dev.off()