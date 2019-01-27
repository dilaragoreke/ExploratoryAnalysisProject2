setwd("C:/Users/Dilara/Documents/R/Coursera/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extracting Baltimore data
NEI_Baltimore <- subset(NEI, fips == "24510")

# subsetting SCC from motor vehicles
motor_vehicle <- SCC[grepl("Vehicle", SCC$EI.Sector), "SCC"]

#filtering NEI data frame
NEI_Baltimore_SCC <- NEI_Baltimore %>% filter(SCC %in% motor_vehicle)

# Total emission data per year
total_emissions <- tapply(NEI_Baltimore_SCC$Emissions, NEI_Baltimore_SCC$year, sum)

# plot
png("plot5.png", width=480, height=480)
barplot(total_emissions, xlab = "year", ylab = "Total PM2.5 Emitted in tons", ylim=c(0,400),
        col =c("red","blue","green","gray"), main = "Annual Total Emission from motor vehicles in Baltimore")
dev.off()
