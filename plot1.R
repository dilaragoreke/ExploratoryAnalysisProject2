setwd("C:/Users/Dilara/Documents/R/Coursera/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#summing total emissions for each year
total_emissions <-  tapply(NEI$Emissions, NEI$year, sum)

#bar plot
png("plot1.png", width=480, height=480)
barplot(total_emissions, xlab = "Year", ylab = "Total PM2.5 Emitted in tons", ylim = c(0,8e06), col =c("red","blue","green","gray"), main = "Total Emission for each year")
dev.off()

