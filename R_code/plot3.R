setwd("E:\\Courses\\Coursera\\Exploratory Data Analysis\\Project 2\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
year <- c(1999, 2002, 2005, 2008)
type <- c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")
Emissions <- numeric(length(year)*length(type))
for(i in 1:length(year)){
	for (j in 1:length(type)){
		Emissions[(i-1)*length(year)+j] <- sum(NEI$Emissions[NEI$year == year[i] & NEI$type == type[j]])
	}
}
type1 <- rep(type, 4)
year1 <- rep(year, each = 4)
da <- data.frame(year = year1, Emissions = Emissions, type = type1)
library(ggplot2)
qplot(year, Emissions, data =	da, ylab = expression(PM[2.5]), color = type)	
dev.copy(png, file = "E:\\Courses\\Coursera\\Exploratory Data Analysis\\Project 2\\PNG file\\plot3.png")
dev.off()
