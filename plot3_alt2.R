# initialize ggplot2
library(ggplot2)

# get the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get total emissions from different years of Baltimore City, Maryland
NEI.baltimore <- subset(NEI, fips == "24510")
NEI.type <- aggregate(Emissions ~ year + type, NEI.baltimore, sum)

# plot the graph
png("plot3_alt2.png", 640, 400)
g <- ggplot(NEI.type, aes(year, Emissions, color = type))
g <- g + geom_point(size = 3) +  geom_smooth() +
  xlab("Year") + ylab(expression ("Total" ~ PM[2.5] ~"Emissions (tons)")) + 
  ggtitle("Baltimore City" ~ PM[2.5] ~ " Emmission by Source type and Year")
print(g)
dev.off()