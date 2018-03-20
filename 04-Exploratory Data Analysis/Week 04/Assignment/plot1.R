plot1 <- function(){
  #This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  print("Done reading the data")
  
  #aggregate the data depending on 'year'
  df <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")
  colnames(df) <- c('Year', 'TotalEmission')
  
  #draw
  png(filename = "fig/plot1.png")  
  barplot(df$TotalEmission, names.arg = df$Year, col='red',
          xlab = "Year", ylab = expression('Total Emission'),
          main = "Total Emissions from 1999 to 2008")
  dev.off()
}