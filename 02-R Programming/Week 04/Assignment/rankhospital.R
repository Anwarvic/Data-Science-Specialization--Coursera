rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate

  #read csv file
  df <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
  
  #check for validity
  if (! state %in% unique(df$State))
    stop("invalid state")
  
  #modify the outcome
  full <- 'Hospital.30.Day.Death..Mortality..Rates.from.'
  if (outcome=="heart attack")
    outcome <- paste(full, 'Heart.Attack', sep="")
  else if (outcome=="heart failure")
    outcome <- paste(full, 'Heart.Failure', sep="")
  else if (outcome=="pneumonia")
    outcome <- paste(full, 'Pneumonia', sep="")
  else
    stop("invalid outcome")
  
  #minimize into three columns
  df <- df[c("Hospital.Name", 'State', outcome)]
  #delete NA outcome
  clean_rows <- complete.cases(df[outcome])
  df <- df[clean_rows & df['State'] == state, ]
  df <- df[order( df[,3], df[,1] ), ]
  
  #handle different cases of num
  if (num == "worst")
    return(df[nrow(df), ]["Hospital.Name"])
  else if (num == "best")
    return(df[1, ]["Hospital.Name"])
  else if (num > nrow(df))
    return (NA)
  else
    return(df[num, ]["Hospital.Name"])
  
}