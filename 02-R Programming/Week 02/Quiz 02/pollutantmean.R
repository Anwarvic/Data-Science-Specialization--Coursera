pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## NOTE: Do not round the result
  s <- 0  #for sum
  c <- 0  #for count
  for (i in id){
    filename <- paste(directory, formatC(i, width=3, flag="0"), sep="/")
    filename <- paste(filename, '.csv', sep="")
    data <- read.csv(filename)
    #clean the NA
    data <- data[!is.na(data[pollutant]), ]
    if (lengths(data[pollutant]) != 0){
      s <- s + sum(data[pollutant])
      c <- c + lengths(data[pollutant])
    }
  }
  if (c == 0){return (0)}
  return (s/c)
}
  