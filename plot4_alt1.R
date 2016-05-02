# initialize ggplot2
library(ggplot2)

# get the data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get coal combustion-related data
coals <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
coalsub <- SCC[coals, ]
NEI.coal <- merge(NEI, coalsub, by = "SCC")
NEI.coal.agg <- aggregate(Emissions ~ year + type, NEI.coal, sum)

# plot the graph
png("plot4_alt1.png", 640, 400)
g <- ggplot(NEI.coal.agg, aes(year, Emissions, color = type))
g <- g + 
  geom_line(lty = 2, lwd=1) +
  geom_point(size = 3)  +   
  xlab("Year") +
  ylab(expression ("Total" ~ PM[2.5] ~"Emissions (tons)")) +
  ggtitle('Total Emissions from Coal sources from 1999 to 2008')
print(g)
dev.off()