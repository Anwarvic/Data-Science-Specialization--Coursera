rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  #read csv file
  source("rankhospital.R")
  df <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
  
  hospital <- c()
  state <- c()
  for (s in sort(unique(df$State))){
    print(s)
    tmp <- rankhospital(s, outcome, num)
    if (!is.na(tmp))
      hospital <- rbind(hospital, tmp)
    else
      hospital <- rbind(hospital, data.frame('Hospital.Name'=NA))

    state <- c(state, s)
  }
  return (cbind(hospital, state))
}