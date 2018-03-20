library(ggplot2)

plot6 <- function(){
  #This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
  print("Done reading the data")
  
  #filter the data
  SCC <- SCC[grep(pattern = '.*motor.*', SCC$Short.Name, ignore.case = T), ]
  subset <- NEI[NEI$fips == "24510" | NEI$fips == "06037", ]
  df <- subset[subset$SCC %in% SCC$SCC,]
  
  #draw
  ggplot(df, aes(year, Emissions, color = fips)) +
    geom_line(stat = "summary", fun.y = "sum") +
      scale_colour_discrete(name = "Group", label = c("Los Angeles", "Baltimore")) + 
      labs(title="Baltimore & Los Angeles Total Emission", x="Year", y="Total Emission")
  ggsave("fig/plot6.png", device = 'png')
}