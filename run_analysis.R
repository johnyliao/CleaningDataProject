# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#      average of each variable for each activity and each subject.

# Submit data set from step 5
# Submit run_analysis.R with updated readme.MD file to describe how code works

# Assumes data file downloaded as zip file to local filesystem
# Set the variable below to point to right folder where zip file resides
# Code will unzip the file to data subfolder and work accordingly


load.data <- function(folder,subject_file, dataset_file, labels_file,features,activity_labels) {
  
  # Load subject information
  filename <- sprintf("%s/%s",folder,subject_file)
  data.subject <- read.table(filename,stringsAsFactors=F)
  names(data.subject) <- c("SubjectID")
  
  # Load activity information
  filename <- sprintf("%s/%s",folder,labels_file)
  data.activity <- read.table(filename,stringsAsFactors=F)
  names(data.activity)  <- c("ActivityCode")
  
  # Merge the activity code with the activity labels
  data.activity <- merge(activity_labels,data.activity,sort=F)

  # Temporary data structure to hold subject id and activity code/label info
  dataset.1 <- cbind(data.subject,data.activity)
  
  filename <- sprintf("%s/%s",folder,dataset_file)
  dataset <- read.table(filename,stringsAsFactors=F)
  dataset <- cbind(dataset.1,dataset)
  names(dataset) <- c("SubjectID","ActivityCode","ActivityLabel",features$FeatureLabel)
  
  # Extracts only the measurements on the mean and 
  # standard deviation for each measurement.
  colnames <- names(dataset)
  meanData <- grep("*mean\\(\\)*",colnames)
  stddevData <- grep("*std\\(\\)*",colnames)
  #colnames[meanData]
  #colnames[stddevData]
  desired.cols <- sort(c(1,3,meanData,stddevData))
  #desired.cols
  
  # return the data frame with only the desired columns
  dataset[,desired.cols]
  
}

run_analysis <- function(directory,zipfile) {
  
  class.projectfolder <- directory
  
  setwd(class.projectfolder)

  # Only unzip file if it does not already exists
  if (file.exists("data")) {
    foldername <- dir("data")
    # Check if file exists
    check.file <- sprintf("data/%s/features.txt",foldername)
    if(!file.exists(check.file)) {
      unzip(zipfile,exdir="data")
    }
  } else {
    
    unzip(zipfile,exdir="data")    
    
  }
  
  foldername <- dir("data")
  basepath <- sprintf("data/%s",foldername)
  
  # Read activity code & labels
  filename <- sprintf("%s/activity_labels.txt",basepath)
  activities <- read.table(filename,stringsAsFactors=F)
  names(activities) <- c("ActivityCode","ActivityLabel")
  
  # Read feature code & labels
  filename <- sprintf("%s/features.txt",basepath)
  features <- read.table(filename,stringsAsFactors=F)
  names(features) <- c("FeatureCode","FeatureLabel")
  
  train.basepath <- sprintf("%s/train",basepath)
  train.data <- load.data(train.basepath,"subject_train.txt","X_train.txt","y_train.txt",features,activities)
  
  test.basepath <- sprintf("%s/test",basepath)
  test.data <- load.data(test.basepath,"subject_test.txt","X_test.txt","y_test.txt",features,activities)
  data <- rbind(train.data,test.data)
  data
  
  # Calculate the mean for each data column
  n <- length(data[1,])
  aggregate(data[,3:n],by=list(data$SubjectID,data$ActivityLabel),FUN=mean)
}


