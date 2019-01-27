library(dplyr)

setwd("C:/Users/Dilara/Documents/R/Coursera/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subsetting SCC with coal values
coal_comb  <- SCC[grepl("Comb.*Coal", SCC$EI.Sector), "SCC"]

#filtering NEI data frame
NEI_SCC <- NEI %>% filter(SCC %in% coal_comb)

# Total emission data per year
total_emissions <- tapply(NEI_SCC$Emissions, NEI_SCC$year, sum)

# plot
png("plot4.png", width=480, height=480)
barplot(total_emissions, xlab = "year", ylab = "Total PM2.5 Emitted in tons", 
        col =c("red","blue","green","gray"), main = "Annual Total Emission from coal sources")
dev.off()
