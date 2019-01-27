setwd("C:/Users/Dilara/Documents/R/Coursera/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extracting Baltimore and LA data
NEI_Baltimore  <- subset(NEI, fips == "24510")
NEI_Baltimore$County <- "Baltimore"
NEI_LosAngeles <- subset(NEI, fips == "06037")
NEI_LosAngeles$County <- "Los Angeles"

# subsetting SCC from motor vehicles
motor_vehicle <- SCC[grepl("Vehicle", SCC$EI.Sector), "SCC"]

#filtering NEI data frame
NEI_Baltimore_SCC <- NEI_Baltimore %>% filter(SCC %in% motor_vehicle)
NEI_LosAngeles_SCC <- NEI_LosAngeles%>% filter(SCC %in% motor_vehicle)
NEI_BL_LA_SCC <- rbind(NEI_Baltimore_SCC, NEI_LosAngeles_SCC)

# Total emission data based on year and county
total_emissions <-  aggregate(Emissions ~ year + County, NEI_BL_LA_SCC, sum)

#barplot
png("plot6.png", width=480, height=480)
ggplot(total_emissions,  aes(x = factor(year), Emissions, fill = County )) %+%
  geom_bar(stat="identity") %+%  
  facet_wrap(~County, nrow =1) %+% 
  labs(x="year", y=expression("Total PM2.5 Emission in tons")) %+% 
  labs(title=expression("PM2.5 Emitted in Los Angeles and Baltimore"))
dev.off()

