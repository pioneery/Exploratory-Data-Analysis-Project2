NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

MarylandData <- NEI[which(NEI$fips == "24510"),]
total2 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999)]),sum(MarylandData$Emissions[which(MarylandData$year == 2002)]),sum(MarylandData$Emissions[which(MarylandData$year == 2005)]),sum(MarylandData$Emissions[which(MarylandData$year == 2008)]))
year2 <- unique(MarylandData$year)
info2 <- data.frame(TotalEmissions = total2, Year = as.factor(year2))

png(filename='plot2.png', width=480, height=480, units='px')

q <- ggplot(data=info2, aes(x=Year, y=TotalEmissions)) + geom_bar(stat="identity")
q + ggtitle("Total Emissions Of Baltimore City") + ylab("Total Emission")


dev.off()