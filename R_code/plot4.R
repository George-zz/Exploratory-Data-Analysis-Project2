setwd("E:\\Courses\\Coursera\\Exploratory Data Analysis\\Project 2\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC.ind <- SCC[SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal", 1]
year <- c(1999, 2002, 2005, 2008)
ind <- c(as.vector(NEI$SCC) == as.vector(SCC.ind[1]))
for(i in 2:length(SCC.ind)){
	ind <- c(ind | as.vector(NEI$SCC) == as.vector(SCC.ind[i]))
}
Emissions <- numeric(length(year))
for(i in 1:length(year)){
	Emissions[i] <- sum(NEI$Emissions[NEI$year[ind] == year[i]])
}
plot(Emissions ~ year, ylab = expression(PM[2.5]), pch = 20)
abline(lm(Emissions ~ year), lwd = 2)
dev.copy(png, file = "E:\\Courses\\Coursera\\Exploratory Data Analysis\\Project 2\\PNG file\\plot4.png")
dev.off()
