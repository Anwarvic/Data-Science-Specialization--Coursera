source('read_data.R')
plot1 <- function(){
  df <- read_data()
  png(filename="plot1.png", width=480, height=480)
  hist(df$Global_active_power, xlab='Global Active Power (kilowatts)', 
             main='Global Active Power', col='orange', breaks=16, xlim=c(0, 6))
  dev.off()
}