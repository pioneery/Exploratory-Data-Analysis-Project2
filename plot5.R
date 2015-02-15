NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

temp <- SCC[grep("Mobile Sources",SCC$SCC.Level.One),]
MaryMobile <- MarylandData[MarylandData$SCC %in% temp$SCC,]
total4 <- c(sum(MaryMobile$Emissions[which(MaryMobile$year == 1999)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2002)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2005)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2008)]))
info4 <- data.frame(Total = total4,Year = as.factor(year3))

png(filename='plot5.png', width=480, height=480, units='px')

ggplot(data=info4, aes(x=Year, y=Total)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("MotorVehicle emissions from 1999â2008 in Baltimore")

dev.off()