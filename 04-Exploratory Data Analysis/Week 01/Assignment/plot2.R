source('read_data.R')
library(ggplot2)

plot2 <- function(){
  df <- read_data()
  png("plot2.png", width=480, height=480)
  plot(df$DateTime, df$Global_active_power, type="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}