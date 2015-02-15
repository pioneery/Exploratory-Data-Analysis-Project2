NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- c(sum(NEI$Emissions[which(NEI$year == 1999)]),sum(NEI$Emissions[which(NEI$year == 2002)]),sum(NEI$Emissions[which(NEI$year == 2005)]),sum(NEI$Emissions[which(NEI$year == 2008)]))
year <- unique(NEI$year)
Year <- as.factor(year)
info1 <- data.frame(TotalEmissions = total, Year)

png(filename='plot1.png', width=480, height=480, units='px')
ggplot(data=info1, aes(x=Year, y=TotalEmissions)) + geom_bar(stat="identity") + ggtitle("Total PM2.5 emission")
dev.off()