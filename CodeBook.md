# Human Activity Recognition Using Smartphones Dataset
### Tidy subset with averages means and standard deviations for every variable

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

## Files of initial dataset were used to create tidy dataset:
- train/X_train.txt: Training set
- train/y_train.txt: Training labels
- train/subject_train.txt': Each row identifies the subject of 30 who performed the activity 
- test/X_test.txt: Test set
- test/y_test.txt: Test labels
- test/subject_test.txt': Each row identifies the subject of 30 who performed the activity
- features.txt: List of all features
- activity_labels.txt: Links the class labels with their activity name

## Output file with tidy dataset:
- DS3_tidy.txt

## Implemented procedure to obtain tidy dataset (see run_analysis.R script file)
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Replaced activity code by names.
4. Variables labels are added as column names.
5. The interim dataset grouped by subject and activity, then for every subject-activity pair calculated averages of means and standard deviations.

## Input variables description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

## Output variables description
- Subject: subject's code from 1 to 30
- Activity: performed acitivity name (one of six)
- Averages for signal variables, where every variable name consisit of 3 parts:

### Signal name, one of the following:
- tBodyAcc: body acceleration signal
- tGravityAcc: gravity acceleration signal
- tBodyAccJerk: body linear acceleration Jerk signal
- tBodyGyro: body angular velocity signal
- tBodyGyroJerk: body angular velocity Jerk signal
- tBodyAccMag: body acceleration magnitude
- tGravityAccMag: gravity acceleration magnitude
- tBodyAccJerkMag: body linear acceleration Jerk magnitude
- tBodyGyroMag: body angular velocity magnitude
- tBodyGyroJerkMag: body angular velocity Jerk magnitude
- fBodyAcc: Fast Fourier Transformed body acceleration signal
- fBodyAccJerk: Fast Fourier Transformed body linear acceleration Jerk signal
- fBodyGyro: Fast Fourier Transformed body angular velocity signal
- fBodyAccMag: Fast Fourier Transformed body acceleration magnitude
- fBodyAccJerkMag: Fast Fourier Transformed body linear acceleration Jerk magnitude
- fBodyGyroMag: Fast Fourier Transformed body angular velocity magnitude
- fBodyGyroJerkMag: Fast Fourier Transformed body angular velocity Jerk magnitude

### Initial estimated variables:
- mean(): Mean value
- std(): Standard deviation

### Coordinate for 3-axial signals (optional):
- X
- Y
- Z