read_data <- function(){
  zipfile <- "exdata_data_household_power_consumption.zip"
  # Download the dataset
  if (!file.exists(zipfile)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, zipfile, method="curl")
  }  
  # Unzip the dataset
  filename <- "household_power_consumption.txt"
  if (!file.exists(filename)) { 
    print("Unzipping...")
    unzip(zipfile) 
  }
  #read and filter the dataset
  df <- read.table(filename, sep=';', na.strings = '?', skip= 66637 , nrows = 2880)
  colnames(df) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 
                    'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 
                    'Sub_metering_3')
  #merge 'Date' and 'Time' into 'DateTime'
  df <- transform(df, DateTime=paste(df$Date, df$Time, sep="/"))
  #convert the 'DataTime' column to Data class
  df$DateTime <- strptime(df$DateTime, "%d/%m/%Y/%H:%M:%S")
  #delete 'Data' and 'Time' fields
  df$Date <- NULL
  df$Time <- NULL
  
  return(df)
}