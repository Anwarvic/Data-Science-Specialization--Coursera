library(reshape2)

run_analysis <- function(){
  #This function does the following:
  #1) Load the train and test data
  #2) Extracts only the measurements on the mean and standard deviation for each measurement.
  #3) Merges the training and the test sets to create one data set.
  #4) Uses descriptive activity names to name the activities in the data set
  #5) Appropriately labels the data set with descriptive variable names.
  #6) From the data set in step 5, creates a second, independent tidy data set 
  #   with the average of each variable for each activity and each subject.
  
  #load the features
  features <- read.table("UCI HAR Dataset/features.txt")
  mean_std_features <- grep(".*mean.*|.*std.*", features[,2], value=FALSE)
  
  #load the activity labels
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  
  #load the train data
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  X_train <- X_train[mean_std_features]
  Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
  Y_train[,1] <- factor(Y_train[,1], levels = activity_labels[,1], labels = activity_labels[,2])
  train <- cbind(subject_train, Y_train, X_train)
  
  #load the test data
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  X_test <- X_test[mean_std_features]
  Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
  Y_test[,1] <- factor(Y_test[,1], levels = activity_labels[,1], labels = activity_labels[,2])
  test <- cbind(subject_test, Y_test, X_test)
  
  #merge train and test
  df <- rbind(train, test)
  
  #give the data descriptive names
  colnames(df) <- c('subject', 'activity', as.character(features[mean_std_features, 2]))
  
  #melt the whole data depending on "subject" and "activity")
  df_melted <- melt(df, id = c("subject", "activity"))
  
  #get the mean
  df_mean <- dcast(df_melted, subject+activity~variable, mean)
  
  #write the output
  write.table(df_mean, "tidy.txt", row.names = FALSE, quote = FALSE)
  
  
}

