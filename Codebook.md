---
title: "Getting and Cleaning Data Course Project Codebook"
author: "Kirill Romanov"
date: "20/11/2016"
output:
  html_document:
    keep_md: yes
---

## Project Description
-The purpose of this project is to  merge, clean and transform data set which consists of different raw files. 
-These files contain data about Human activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) collected by smartphone (Samsung Galaxy S II). 
-The goal is to prepare one file with tidy data that can be used for later analysis

##Study design and data processing

###Collection of the raw data
-Data for the project was downloaded from : [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
-A full data and description are available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes on the original (raw) data 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

##Creating the tidy datafile

###Guide to create the tidy data file

You should create one R script called run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Cleaning of the data
The details for cleaning data are describe inside of script for cleaning data [here](https://github.com/kvr777/Getting-and-Cleaning-Data/run_analysis.R)

##Description of the variables in the tdata.txt file
File contains the following data:

- Subject column. Identifier of the subject. Datatype is integer
- Activity column. Label of the activity. Datatype is factor
- All other columns are mean of variables grouped by Subject + Activity. Datatype is numeric


###Variable list
Full list of variables is following:
- Subject
- Activity
- Time.BodyAcc.Mean.X
- Time.BodyAcc.Mean.Y	      
- Time.BodyAcc.Mean.Z	      
- Time.BodyAcc.Std.X	
- Time.BodyAcc.Std.Y	
- Time.BodyAcc.Std.Z	
- Time.GravityAcc.Mean.X	
- Time.GravityAcc.Mean.Y	
- Time.GravityAcc.Mean.Z	
- Time.GravityAcc.Std.X	
- Time.GravityAcc.Std.Y	
- Time.GravityAcc.Std.Z	
- Time.BodyAccJerk.Mean.X	
- Time.BodyAccJerk.Mean.Y	
- Time.BodyAccJerk.Mean.Z	
- Time.BodyAccJerk.Std.X	
- Time.BodyAccJerk.Std.Y	
- Time.BodyAccJerk.Std.Z	
- Time.BodyGyro.Mean.X	
- Time.BodyGyro.Mean.Y	
- Time.BodyGyro.Mean.Z	
- Time.BodyGyro.Std.X	
- Time.BodyGyro.Std.Y	
- Time.BodyGyro.Std.Z	
- Time.BodyGyroJerk.Mean.X	
- Time.BodyGyroJerk.Mean.Y	
- Time.BodyGyroJerk.Mean.Z	
- Time.BodyGyroJerk.Std.X	
- Time.BodyGyroJerk.Std.Y	
- Time.BodyGyroJerk.Std.Z	
- Time.BodyAccMag.Mean	
- Time.BodyAccMag.Std	
- Time.GravityAccMag.Mean	
- Time.GravityAccMag.Std	
- Time.BodyAccJerkMag.Mean	
- Time.BodyAccJerkMag.Std	
- Time.BodyGyroMag.Mean	
- Time.BodyGyroMag.Std	
- Time.BodyGyroJerkMag.Mean	
- Time.BodyGyroJerkMag.Std	
- FFT.BodyAcc.Mean.X	
- FFT.BodyAcc.Mean.Y	
- FFT.BodyAcc.Mean.Z	
- FFT.BodyAcc.Std.X	
- FFT.BodyAcc.Std.Y	
- FFT.BodyAcc.Std.Z	
- FFT.BodyAccJerk.Mean.X	
- FFT.BodyAccJerk.Mean.Y	
- FFT.BodyAccJerk.Mean.Z	
- FFT.BodyAccJerk.Std.X	
- FFT.BodyAccJerk.Std.Y	
- FFT.BodyAccJerk.Std.Z	
- FFT.BodyGyro.Mean.X	
- FFT.BodyGyro.Mean.Y	
- FFT.BodyGyro.Mean.Z	
- FFT.BodyGyro.Std.X	
- FFT.BodyGyro.Std.Y	
- FFT.BodyGyro.Std.Z	
- FFT.BodyAccMag.Mean	
- FFT.BodyAccMag.Std	
- FFT.BodyBodyAccJerkMag.Mean	
- FFT.BodyBodyAccJerkMag.Std	
- FFT.BodyBodyGyroMag.Mean	
- FFT.BodyBodyGyroMag.Std	
- FFT.BodyBodyGyroJerkMag.Mean	
- FFT.BodyBodyGyroJerkMag.Std	

- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time.Acc-XYZ and Time.Gyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time.BodyAccJerk-XYZ and Time.BodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time.BodyAccMag, Time.GravityAccMag, Time.BodyAccJerkMag, Time.BodyGyroMag, Time.BodyGyroJerkMag). 

- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FFT.BodyAcc-XYZ, FFT.BodyAccJerk-XYZ, FFT.BodyGyro-XYZ, FFT.BodyAccJerkMag, FFT.BodyGyroMag, FFT.BodyGyroJerkMag 

- These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
- The set of variables that were estimated from these signals are: 
  - Mean: Mean value
  - Std: Standard deviation