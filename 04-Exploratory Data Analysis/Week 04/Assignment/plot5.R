plot5 <- function(){
  #This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
  print("Done reading the data")
  
  #filter the data
  SCC <- SCC[grep(pattern = '.*motor.*', SCC$Short.Name, ignore.case = T), ]
  subset <- NEI[NEI$fips == "24510" & NEI$SCC %in% SCC$SCC, ]
  
  #aggreage the data depending on 'year'
  df <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")
  colnames(df) <- c('Year', 'TotalEmission')
  
  #draw
  png(filename = "fig/plot5.png")  
  barplot(df$TotalEmission, names.arg = df$Year, col='red',
          xlab = "Year", ylab = expression('Motor Vech Total Emission'),
          main = "Motor Vechicle Total Emissions in Baltimore City \n from 1999 to 2008")
  dev.off()
}