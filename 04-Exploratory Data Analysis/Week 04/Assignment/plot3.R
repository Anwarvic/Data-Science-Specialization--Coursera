library(ggplot2)

plot3 <- function(){
  #This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  print("Done reading the data")
  
  #filter the data
  subset <- NEI[NEI$fips == "24510", ]
  
  #aggregate depending on 'type' and 'year'
  df <- aggregate(subset$Emissions, list(subset$type, subset$year), FUN = "sum")
  colnames(df) <- c('Type', 'Year', 'TotalEmission')
  
  #draw
  ggplot(data = df, aes(x=Year, y=TotalEmission)) + geom_line(aes(colour=Type)) +
    labs(title="Baltimore Total Emission", x="Year", y="Total Emission")
  ggsave("fig/plot3.png", device = 'png')
}