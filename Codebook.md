========================================================
DETAILS OF THE DATA

"Human_Act_Rec_Data_Summary.txt" includes a data set which basically the summary
of Human Activity Recognition Using Smartphones Dataset from:
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
========================================================
WHAT ARE THE COLUMNS/VARIABLES IN SUMMERIZED (present) DATASET?

More specifically, the variables in this dataset are the average values of each variable in original dataset, averaged over each activity and each subject. And only the measurements on mean and standard deviations for the original dataset have been selected as asked in assignment. Therefore every variable name begins with averageof_ prefix indicating that every value is average of measurements on variables in original dataset
========================================================
WHAT ARE THE COLUMNS IN ORIGINAL DATASET?

The variables in original dataset are basically features that come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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
===================================================
WHAT TRANSFORMATIONS ARE PERFORMED ON ORIGINAL DATA TO SUMMERIZE IT?
Different values were then estimated from these from these signals. These include, for example, mean, standard deviation, median, minimum and maximum values, entropy. But as mentioned earlier the measurements only on mean and standard deviation are selected in summarized data.
To include only the measurements on mean and standard deviations(SD), only the columns representing the measurements over mean and SD were slice from original training and test data were sliced. Then these selected columns from training and test data were merged together using 'rbind' function.
Then these values were averaged over each activity and each subject.
Finally the activities and variable names were labelled appropriately.
