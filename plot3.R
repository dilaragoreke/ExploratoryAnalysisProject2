library(ggplot2)

setwd("C:/Users/Dilara/Documents/R/Coursera/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- subset(NEI, fips == "24510")

#summing total emissions for each year and type
total_emissions_yt <-  aggregate(Emissions ~ year + type, NEI_Baltimore, sum)

#barplot
png("plot3.png", width=480, height=480)
     ggplot(total_emissions_yt,  aes(x = factor(year), Emissions, fill = type)) %+%
     geom_bar(stat="identity") %+%  
     facet_grid(.~type) %+% 
     facet_wrap(~type, nrow =2) %+% 
     theme(plot.title = element_text(hjust = 0.5)) %+%
     labs(x="year", y=expression("Total PM2.5 Emission in tons")) %+% 
     labs(title=expression("PM2.5 Emitted in Baltimore"))
dev.off()
