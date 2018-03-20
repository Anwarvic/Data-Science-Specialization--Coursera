plot4 <- function(){
  #This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
  print("Done reading the data")
  
  #filter the data
  SCC <- SCC[grep(pattern = '.*coal.*', SCC$Short.Name, ignore.case = T), ]
  subset <- NEI[NEI$SCC %in% SCC$SCC, ]
  
  #aggreage the data depending on 'year'
  df <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")
  colnames(df) <- c('Year', 'TotalEmission')
  
  #draw
  png(filename = "fig/plot4.png")  
  barplot(df$TotalEmission, names.arg = df$Year, col='red',
          xlab = "Year", ylab = expression('Coal Total Emission'),
          main = "Coal Total Emissions from 1999 to 2008")
  dev.off()
}