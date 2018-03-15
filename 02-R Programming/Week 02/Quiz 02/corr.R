corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result
  corr_vector = c()
  for(i in 1:332){
    #read file
    filename <- paste(directory, formatC(i, width=3, flag="0"), sep="/")
    filename <- paste(filename, '.csv', sep="")
    #print(filename)
    data <- read.csv(filename)
    #nobs per file
    nobs <- sum(complete.cases(data))
    #clean NA
    data <- data[!is.na(data["sulfate"]), ]
    data <- data[!is.na(data["nitrate"]), ]
    
    if(nobs > threshold){
      corr <- cor(data['sulfate'], data['nitrate'])
      corr_vector <- c(corr_vector, corr)
    }
  }
  return (corr_vector)
}
  
  