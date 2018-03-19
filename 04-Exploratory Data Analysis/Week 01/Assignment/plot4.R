source('read_data.R')

plot4 <- function(){
  df <- read_data()
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  
  #First plot
  plot(df$DateTime, df$Global_active_power, type="l", 
       xlab="", ylab="Global Active Power")
  
  #second plot
  plot(df$DateTime, df$Voltage, type="l", 
       xlab="", ylab="Voltage")
  
  #third plot
  plot(range(df$DateTime), range(df$Sub_metering_1), type='n', 
       xlab = "", ylab = 'Energy sub metering')
  lines(df$DateTime, df$Sub_metering_1, type='l')
  lines(df$DateTime, df$Sub_metering_2, type='l', col='red')
  lines(df$DateTime, df$Sub_metering_3, type='l', col='blue')
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8,
         col = c('black', 'red', 'blue'), lty = 1)
  
  #fourth plot
  plot(df$DateTime, df$Global_reactive_power, type="l", 
       xlab="", ylab="Global Reactive Power")
  dev.off()
}