# Getting and cleaning data Project assignment
# course code : getdata-010
# author : @StefMT2970 
# https://github.com/stefMT2970
# 
# Reuse of dataset:
# ==================================================================
#   Human Activity Recognition Using Smartphones Dataset
# Version 1.0
# ==================================================================
#   Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
# Smartlab - Non Linear Complex Systems Laboratory
# DITEN - Università degli Studi di Genova.
# Via Opera Pia 11A, I-16145, Genoa, Italy.
# activityrecognition@smartlab.ws
# www.smartlab.ws
# ==================================================================
  
# before running this script use setwd() to set a working directory
# in which sub folders and files can be created by this script

# libraries used, please install packages first
# install.packages("dplyr")
library(dplyr)

# get the raw data from the web, download file and unzip in ./getdata-010

## check / create our own directory first in current working directory
old_dir = getwd()
if(!file.exists("./getdata-010")){
  dir.create("./getdata-010")
}
setwd("./getdata-010")

## check if file exists first, then download and unzip
if(!file.exists("UCI_data.zip"))
  file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url = file_url, destfile = "UCI_data.zip")
  unzip("UCI_data.zip")
}

# read the training and data sets
## move to ZIP directory
setwd("./UCI HAR Dataset")
## open "README.txt" in getwd() for details

## Read the activity labels (what subjects were doing)
activities <- read.table(file = "./activity_labels.txt", 
                         sep = "",
                         stringsAsFactors = FALSE)

## Read the feature labels (dataset header or column names)
feature <- read.table(file = "./features.txt",
                      stringsAsFactors = FALSE)

## read training data set, labels and subjects
train <- read.table(file = "./train/X_train.txt", 
                    sep = "",
                    stringsAsFactors = FALSE)
train_labels <- read.table(file = "./train/y_train.txt", 
                           sep = "",
                           stringsAsFactors = FALSE)
train_subjects <- read.table(file = "./train/subject_train.txt",
                             sep = "", 
                             stringsAsFactors = FALSE)

## Read the test set, labels and subjects
test <- read.table(file = "./test/X_test.txt", 
                   sep = "",
                   stringsAsFactors = FALSE)
test_labels <- read.table(file = "./test/y_test.txt", 
                          sep = "",
                          stringsAsFactors = FALSE)
test_subjects <- read.table(file = "./test/subject_test.txt",
                            sep = "", 
                            stringsAsFactors = FALSE)

# now we have raw data, let's give names to columns
## start easy
names(activities) <- c("activityId", "activity")
names(feature) <- c("id", "feature")
names(train_labels) <- "activityId"
names(train_subjects) <- "subjectId"
names(test_labels) <- "activityId"
names(test_subjects) <-  "subjectId"

## now the data sets themselves
## first some cleanup of the feature names in feature data set
## get rid of () and use make.names to have format with dots
feature$feature <- gsub( "\\(\\)", "", feature$feature)
feature$feature <- make.names(names = feature$feature, unique = TRUE)

## test and train have 561 variables, feature has 561 observations
## so feature has the column headings of the test and train dataset
names(train) <- feature$feature
names(test) <- feature$feature

# prepare the tidy data sets
#   - cleanup of non-requested columns
#   - insert a variable to label the record as "train" or "test"
#   - insert the subject in front
#   - insert the activity 
#   - insert a temporary row sequence number to restore ordering after merge

## we are only interested in variables with mean or std
tidy_train <- train[, grepl(pattern = "([Mm]ean[.])|([Ss]td)", x = names(train))]
tidy_test <- test[, grepl(pattern = "([Mm]ean[.])|([Ss]td)", x = names(test))]

## the _labels and_subjects have the same number of rows as the tidy_* datasets
## they fit nicely in front of the main datasets
## label each record as coming from train or test dataset
## order will change in a while with merge etc, so put a unique row number
## in front, in order to restore order later
tidy_train <- cbind(row = seq(1, nrow(tidy_train)),
                    set ="train",
                    train_subjects, 
                    train_labels, 
                    tidy_train, 
                    stringsAsFactors = FALSE)

tidy_test <- cbind(row = seq(1, nrow(tidy_test)),
                   set ="test",
                   test_subjects, 
                   test_labels, 
                   tidy_test, 
                   stringsAsFactors = FALSE)

## so far the activity in the tidy* data sets are integers
## we can do better and add the activity$activity text
## activityId is the common field - done on purpose
tidy_test <- merge(x=activities, y= tidy_test)
tidy_train <- merge(x=activities, y= tidy_train)

# finally, let's make the real tidy dataset
## Bind the datasets
tidy_data <- rbind(tidy_train, tidy_test)

# # Recover ordering and drop unused temp variables
tidy_data <- tidy_data[order(tidy_data$set, tidy_data$row), ]
tidy_data <- subset(tidy_data, select=-c(activityId, row, set))
## cleanup row.names
row.names(tidy_data) <- seq(1, nrow(tidy_data))
## cleanup some typo's in the remaining column headings of tidy_data)
##    - make.names has inserted too many dots (in the middle and in the end) 
##    - "Body" has been repeated a few times
## put names in separate vector, then do the gsub's 
tidy_names <- names(tidy_data)

tidy_names <- gsub(pattern = "[..]+", 
                   replacement = ".", x = tidy_names)
tidy_names <- gsub(pattern = "fBodyBody", 
                   replacement = "fBody", x = tidy_names)
tidy_names <- gsub(pattern = "gravityMean.$", 
                   replacement = "gravityMean", x = tidy_names)
tidy_names <- gsub(pattern = "Mean.gravity.$", 
                   replacement = "Mean.gravity", x = tidy_names)

## now use tidy_names to give the tidy dataset improved variable names
names(tidy_data) <- tidy_names

# create a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
summary_data <- tidy_data %>% 
                group_by(subjectId, activity) %>%
                summarise_each(funs = "mean") %>%
                as.data.frame

## Export the tidy dataset
write.table(x = summary_data, file = "../summaryAvgData.txt", row.names = FALSE)

## in case you want to test the upload of the summary file again, consider
## the next statement
## importCoursera <- read.table("../summaryAvgData.txt", header=TRUE)
