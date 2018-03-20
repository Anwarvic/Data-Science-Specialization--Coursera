plot2 <- function(){
  #This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  print("data/Done reading the data")
  
  #filter the data
  subset <- NEI[NEI$fips == "24510", ]
  
  #aggregate the data depending on 'year'
  df <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")
  colnames(df) <- c('Year', 'TotalEmission')

  #draw
  png(filename = "fig/plot2.png")
  barplot(df$TotalEmission, names.arg = df$Year, col='red',
          xlab = "Year", ylab = expression('Total Emission'),
          main = "Baltimore City Total Emissions from 1999 to 2008")
  dev.off()
}