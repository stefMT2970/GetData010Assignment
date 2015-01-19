# CodeBook 

## Introduction
The end result of the run_anlaysis.R file has been a file "../summaryAvgData.txt" written to your local file system. 
run_analysis.R describes in detail how this file has been compiled, from which raw data the final file has been sourced, and which transformation steps have been executed. You can execute the script instruction per instruction and follow the progress by viewing the global environment objects after each step. Comments have been inserted in the script explaining what will happen.

## Data source description
Refer to the original readme.txt and features_info.txt files in the "../getdata-010/UCI HAR Dataset" folder created by the R script.
For ease of reading and referencing, some parts of those files are repeated hereafter. 
  
The experiments have been carried out with a group of 30 volunteers (subjectId) within an age bracket of 19-48 years. Each person performed six activities (activityId) (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear accelerations and 3-axial angular velocities.  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). ("Jerk" is the time rate of change of acceleration. It is the acceleration of the acceleration.)  
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For each of these variables the mean value (suffix mean) and standard deviation (suffix std) were taken.

Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the "angle" variable.

In the last transformation step, the averages (mean) of each remaining variable has been taken grouped by subjectId and activityId leading to a higly condensed tidy data set.


## List of Variables
There are 66 columns in the data set.The first 2 identify the activity(what has been done) and the subject (who did it), followed by 64 features (dimensionless numbers, normalised in the range [-1,1]).

To keep variable names short, abbreviations have been used which are however easy to understand.

### Abbreviations used in variable names
* t stands for time series
* f stands for frequency series
* X, Y, Z stand for 3-axial system
* acc stands for acceleration
* gyro stands for gyroscope
* mag stands for magnitude

### Variables
1.  activity
2.	subjectId
3.	tBodyAcc.mean.X
4.	tBodyAcc.mean.Y
5.  tBodyAcc.mean.Z
6.	tBodyAcc.std.X
7.	tBodyAcc.std.Y
8.	tBodyAcc.std.Z
9.	tGravityAcc.mean.X
10.	tGravityAcc.mean.Y
11.	tGravityAcc.mean.Z
12.	tGravityAcc.std.X
13.	tGravityAcc.std.Y
14.	tGravityAcc.std.Z
15.	tBodyAccJerk.mean.X
16.	tBodyAccJerk.mean.Y
17.	tBodyAccJerk.mean.Z
18.	tBodyAccJerk.std.X
19.	tBodyAccJerk.std.Y
20.	tBodyAccJerk.std.Z
21.	tBodyGyro.mean.X
22.	tBodyGyro.mean.Y
23.	tBodyGyro.mean.Z
24.	tBodyGyro.std.X
25.	tBodyGyro.std.Y
26.	tBodyGyro.std.Z
27.	tBodyGyroJerk.mean.X
28.	tBodyGyroJerk.mean.Y
29.	tBodyGyroJerk.mean.Z
30.	tBodyGyroJerk.std.X
31.	tBodyGyroJerk.std.Y
32.	tBodyGyroJerk.std.Z
33.	tBodyAccMag.std
34.	tGravityAccMag.std
35.	tBodyAccJerkMag.std
36.	tBodyGyroMag.std
37.	tBodyGyroJerkMag.std
38.	fBodyAcc.mean.X
39.	fBodyAcc.mean.Y
40.	fBodyAcc.mean.Z
41.	fBodyAcc.std.X
42.	fBodyAcc.std.Y
43.	fBodyAcc.std.Z
44.	fBodyAccJerk.mean.X
45.	fBodyAccJerk.mean.Y
46.	fBodyAccJerk.mean.Z
47.	fBodyAccJerk.std.X
48.	fBodyAccJerk.std.Y
49.	fBodyAccJerk.std.Z
50.	fBodyGyro.mean.X
51.	fBodyGyro.mean.Y
52.	fBodyGyro.mean.Z
53.	fBodyGyro.std.X
54.	fBodyGyro.std.Y
55.	fBodyGyro.std.Z
56.	fBodyAccMag.std
57.	fBodyAccJerkMag.std
58.	fBodyGyroMag.std
59.	fBodyGyroJerkMag.std
60.	angle.tBodyAccMean.gravity
61.	angle.tBodyAccJerkMean.gravityMean
62.	angle.tBodyGyroMean.gravityMean
63.	angle.tBodyGyroJerkMean.gravityMean
64.	angle.X.gravityMean
65.	angle.Y.gravityMean
66.	angle.Z.gravityMean
