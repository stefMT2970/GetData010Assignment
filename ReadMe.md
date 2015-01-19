# Getdata-010 Project assignment
## Purpose
Collect raw data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), subsequently :

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Approach
1. Open the run_analysis.R script from this GIT repo.
2. Before running the script, setwd() to a directory where the script can create folders and files. 
3. Load package "dplyr" upfront.
4. Follow the instructions in run_analysis.R script
5. Refer to CodeBook.md for an explanation of the variables in the final data set produced by the R script.


## References
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
2. David Hood. FAQ (https://class.coursera.org/getdata-010/forum/thread?thread_id=49) 