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
2.	subjectid
3.	tbodyacc.mean.x
4.	tbodyacc.mean.y
5.	tbodyacc.mean.z
6.	tbodyacc.std.x
7.	tbodyacc.std.y
8.	tbodyacc.std.z
9.	tgravityacc.mean.x
10.	tgravityacc.mean.y
11.	tgravityacc.mean.z
12.	tgravityacc.std.x
13.	tgravityacc.std.y
14.	tgravityacc.std.z
15.	tbodyaccjerk.mean.x
16.	tbodyaccjerk.mean.y
17.	tbodyaccjerk.mean.z
18.	tbodyaccjerk.std.x
19.	tbodyaccjerk.std.y
20.	tbodyaccjerk.std.z
21.	tbodygyro.mean.x
22.	tbodygyro.mean.y
23.	tbodygyro.mean.z
24.	tbodygyro.std.x
25.	tbodygyro.std.y
26.	tbodygyro.std.z
27.	tbodygyrojerk.mean.x
28.	tbodygyrojerk.mean.y
29.	tbodygyrojerk.mean.z
30.	tbodygyrojerk.std.x
31.	tbodygyrojerk.std.y
32.	tbodygyrojerk.std.z
33.	tbodyaccmag.std
34.	tgravityaccmag.std
35.	tbodyaccjerkmag.std
36.	tbodygyromag.std
37.	tbodygyrojerkmag.std
38.	fbodyacc.mean.x
39.	fbodyacc.mean.y
40.	fbodyacc.mean.z
41.	fbodyacc.std.x
42.	fbodyacc.std.y
43.	fbodyacc.std.z
44.	fbodyaccjerk.mean.x
45.	fbodyaccjerk.mean.y
46.	fbodyaccjerk.mean.z
47.	fbodyaccjerk.std.x
48.	fbodyaccjerk.std.y
49.	fbodyaccjerk.std.z
50.	fbodygyro.mean.x
51.	fbodygyro.mean.y
52.	fbodygyro.mean.z
53.	fbodygyro.std.x
54.	fbodygyro.std.y
55.	fbodygyro.std.z
56.	fbodyaccmag.std
57.	fbodyaccjerkmag.std
58.	fbodygyromag.std
59.	fbodygyrojerkmag.std
60.	angle.tbodyaccmean.gravity
61.	angle.tbodyaccjerkmean.gravitymean
62.	angle.tbodygyromean.gravitymean
63.	angle.tbodygyrojerkmean.gravitymean
64.	angle.x.gravitymean
65.	angle.y.gravitymean
66.	angle.z.gravitymean

