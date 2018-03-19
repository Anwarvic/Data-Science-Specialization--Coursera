source('read_data.R')

plot3 <- function(){
  df <- read_data()
  png("plot3.png", width=480, height=480)
  plot(range(df$DateTime), range(df$Sub_metering_1), type='n', 
       xlab = "", ylab = 'Energy sub metering')
  lines(df$DateTime, df$Sub_metering_1, type='l')
  lines(df$DateTime, df$Sub_metering_2, type='l', col='red')
  lines(df$DateTime, df$Sub_metering_3, type='l', col='blue')
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,
         col = c('black', 'red', 'blue'), lty = 1)
  dev.off()
}