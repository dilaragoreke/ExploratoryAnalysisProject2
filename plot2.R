setwd("C:/Users/Dilara/Documents/R/Coursera/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- subset(NEI, fips == "24510")
  
#summing total emissions for each year
total_emissions_Baltimore <-  tapply(NEI_Baltimore$Emissions, NEI_Baltimore$year, sum)

#bar plot
png("plot2.png", width=480, height=480)
barplot(total_emissions_Baltimore, xlab = "Year", ylab = "Total PM2.5 Emitted in tons", ylim = c(0,3500), col =c("red","blue","green","gray"), main = "Total Emission for each year in Baltimore")
dev.off()
