setwd("E:\\Courses\\Coursera\\Exploratory Data Analysis\\Project 2\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

year <- c(1999, 2002, 2005, 2008)
Emissions <- numeric(length(year))
for(i in 1:length(year)){
	Emissions[i] <- sum(NEI$Emissions[NEI$year == year[i]])
}
plot(Emissions ~ year, ylab = expression(PM[2.5]), pch = 20)
abline(lm(Emissions ~ year), lwd = 2)
dev.copy(png, file = "E:\\Courses\\Coursera\\Exploratory Data Analysis\\Project 2\\PNG file\\plot1.png")
dev.off()
