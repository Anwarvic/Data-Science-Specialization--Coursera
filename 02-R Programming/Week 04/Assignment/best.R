best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death rate
  
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
  
  #filter the data
  df <- df[!is.na(df[outcome]) & df['State'] == state, ]
  row = df[which(df[outcome] == min(df[outcome][[1]])), ]
  return(row["Hospital.Name"])

}