Code Book
=========
</br>
This code book describes the variables, the data, and the transformations that were performed to clean up the Samsung data contained in the file "tidy_variable_averages.txt". 

The file "tidy_variable_averages.txt" was produced by the script in run_analysis.R and it contains a tidy data set with the averages of each feature for each activity and each subject. See README.md for detailed descriptions of what the script does.

</br>

### Study Design

The data used comes from a 2012 study from Spain called Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine, conducted by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz of the International Workshop of Ambient Assisted Living.

The original data set can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Descriptions of the original data set can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

As per the reserchers the study design was as follows:
 
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

> For each record it is provided:

> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

> - Triaxial Angular velocity from the gyroscope. 

> - A 561-feature vector with time and frequency domain variables. 

> - Its activity label. 

> - An identifier of the subject who carried out the experiment.

> The dataset includes the following files:

> - 'README.txt'

> - 'features_info.txt': Shows information about the variables used on the feature vector.

> - 'features.txt': List of all features.

> - 'activity_labels.txt': Links the class labels with their activity name.

> - 'train/X_train.txt': Training set.

> - 'train/y_train.txt': Training labels.

> - 'test/X_test.txt': Test set.

> - 'test/y_test.txt': Test labels.

> The following files are available for the train and test data. Their descriptions are equivalent. 

> - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

</br>

#### What we have done

* Merged the training and the test sets to create one data frame.

* Subsetted the data frame to extract only the columns containing **measurements** of the mean and standard deviation for each feature (in addtion to the subject and activity columns).

* Used the factor funtion to use descriptive activity names taken from the "activity_labels.txt" file to name the activities in the data frame.

* Appropriately labelled the data frame with descriptive variable names, following guidelines from Google's R Style Guide, as well from the Getting and Cleaning Data lectures.

* From the data frame in the last step, created a second, independent tidy data set with the average (mean) of each feature for each activity and each subject.

</br>

### Code book

#### Choice of Summary

The averages for each feature variable contained in "tidy_variable_averages.txt" are calculated from feature values that had been normalized and bounded within [-1,1] in the original data set.

</br>

#### Choice of Variables 

As per the instructions of the assignment, only the variables containing **measurements** of the mean and standard deviation for each feature (in addtion to the subject and activity variables) were chosen. Note that the "features_info.txt" file lists mean, standard deviation, and mean frequency as three distinct **measurements** (among many others) of the features and therefore variables containing the measurement of mean frequency of a feature were excluded. Including variables containing mean frequency is equivalent to including variables containing skewness or kurtosis and thus non-sensical. Variables containing angle features were similiarly excluded as they are not strictly *means of the variables*, but *variables composed of means*.

The names of the chosen variables were cleaned up in accordance with guidelines from Google's R Style Guide, as well from the Getting and Cleaning Data lectures.

</br>

#### List of Variables

 [1] "subject"  : *30 volunteers aged 19-48, numbered 1:30*
 
 [2] "activity" : *6 activities carried out by the subjects while wearing a smartphone (Samsung Galaxy S II), labelled "walking", "walking.upstairs", "walking.downstairs", "sitting"", "standing"", and "laying".*
 
 [3] "time.body.acceleration.mean.x" : *mean of the x-axis, time domain, body acceleration signal*
 
 [4] "time.body.acceleration.mean.y" : *mean of the y-axis, time domain, body acceleration signal*
 
 [5] "time.body.acceleration.mean.z" : *mean of the z-axis, time domain, body acceleration signal*
 
 [6] "time.body.acceleration.standard.deviation.x" : *standard deviation of the x-axis, time domain, body acceleration signal*
 
 [7] "time.body.acceleration.standard.deviation.y" : *standard deviation of the y-axis, time domain, body acceleration signal*
 
 [8] "time.body.acceleration.standard.deviation.z" : *standard deviation of the z-axis, time domain, body acceleration signal*
 
 [9] "time.gravity.acceleration.mean.x" : *mean of the x-axis, time domain, gravity acceleration signal*

[10] "time.gravity.acceleration.mean.y" : *mean of the y-axis, time domain, gravity acceleration signal*

[11] "time.gravity.acceleration.mean.z" : *mean of the z-axis, time domain, gravity acceleration signal*

[12] "time.gravity.acceleration.standard.deviation.x" : *standard deviation of the x-axis, time domain, gravity acceleration signal*

[13] "time.gravity.acceleration.standard.deviation.y" : *standard deviation of the y-axis, time domain, gravity acceleration signal*

[14] "time.gravity.acceleration.standard.deviation.z" : *standard deviation of the z-axis, time domain, gravity acceleration signal*

[15] "time.body.acceleration.jerk.mean.x" : *mean of the x-axis, time domain, body acceleration jerk signal*

[16] "time.body.acceleration.jerk.mean.y" : *mean of the y-axis, time domain, body acceleration jerk signal*

[17] "time.body.acceleration.jerk.mean.z" : *mean of the z-axis, time domain, body acceleration, jerk signal*

[18] "time.body.acceleration.jerk.standard.deviation.x" : *standard deviation of the x-axis, time domain, body acceleration, jerk signal*

[19] "time.body.acceleration.jerk.standard.deviation.y" : *standard deviation of the y-axis, time domain, body acceleration, jerk signal*

[20] "time.body.acceleration.jerk.standard.deviation.z" : *standard deviation of the z-axis, time domain, body acceleration, jerk signal*

[21] "time.body.gyrometer.mean.x" : *mean of the x-axis, time domain, body gyrometer signal*

[22] "time.body.gyrometer.mean.y" : *mean of the y-axis, time domain, body gyrometer signal*

[23] "time.body.gyrometer.mean.z" : *mean of the z-axis, time domain, body gyrometer signal*

[24] "time.body.gyrometer.standard.deviation.x" : *standard deviation of the x-axis, time domain, body gyrometer signal*

[25] "time.body.gyrometer.standard.deviation.y" : *standard deviation of the y-axis, time domain, body gyrometer signal*

[26] "time.body.gyrometer.standard.deviation.z" : *standard deviation of the z-axis, time domain, body gyrometer signal*

[27] "time.body.gyrometer.jerk.mean.x" : *mean of the x-axis, time domain, body gyrometer, jerk signal*

[28] "time.body.gyrometer.jerk.mean.y" : *mean of the y-axis, time domain, body gyrometer, jerk signal*

[29] "time.body.gyrometer.jerk.mean.z" : *mean of the z-axis, time domain, body gyrometer, jerk signal*

[30] "time.body.gyrometer.jerk.standard.deviation.x" : *standard deviation of the x-axis, time domain, body gyrometer, jerk signal*

[31] "time.body.gyrometer.jerk.standard.deviation.y" : *standard deviation of the y-axis, time domain, body gyrometer, jerk signal*

[32] "time.body.gyrometer.jerk.standard.deviation.z" : *standard deviation of the z-axis, time domain, body gyrometer, jerk signal*

[33] "time.body.acceleration.mag.mean" : *mean of the magnitude of the time domain, body acceleration signal*

[34] "time.body.acceleration.mag.standard.deviation" : *standard deviation of the magnitude of the time domain, body acceleration signal*

[35] "time.gravity.acceleration.mag.mean" : *mean of the magnitude of the time domain, gravity acceleration signal*

[36] "time.gravity.acceleration.mag.standard.deviation" : *standard deviation of the magnitude of the time domain, gravity acceleration signal*

[37] "time.body.acceleration.jerk.mag.mean" : *mean of the magnitude of the time domain, body acceleration, jerk signal*

[38] "time.body.acceleration.jerk.mag.standard.deviation" : *standard deviation of the magnitude of the time domain, body acceleration, jerk signal*

[39] "time.body.gyrometer.mag.mean" : *mean of the magnitude of the time domain, body gyrometer signal*

[40] "time.body.gyrometer.mag.standard.deviation" : *standard deviation of the magnitude of the time domain, body gyrometer signal*

[41] "time.body.gyrometer.jerk.mag.mean" : *mean of the magnitude of the time domain, body gyrometer signal*

[42] "time.body.gyrometer.jerk.mag.standard.deviation" : *standard deviation of the magnitude of the time domain, body gyrometer signal*

[43] "frequency.body.acceleration.mean.x" : *mean of the x-axis, frequency domain, body acceleration signal*

[44] "frequency.body.acceleration.mean.y" : *mean of the y-axis, frequency domain, body acceleration signal*

[45] "frequency.body.acceleration.mean.z" : *mean of the z-axis, frequency domain, body acceleration signal*

[46] "frequency.body.acceleration.standard.deviation.x" : *standard deviation of the x-axis, frequency domain, body acceleration signal*

[47] "frequency.body.acceleration.standard.deviation.y" : *standard deviation of the y-axis, frequency domain, body acceleration signal*

[48] "frequency.body.acceleration.standard.deviation.z" : *standard deviation of the z-axis, frequency domain, body acceleration signal*

[49] "frequency.body.acceleration.jerk.mean.x" : *mean of the x-axis, frequency domain, body acceleration, jerk signal*

[50] "frequency.body.acceleration.jerk.mean.y" : *standard deviation of the y-axis, frequency domain, body acceleration, jerk signal*

[51] "frequency.body.acceleration.jerk.mean.z" : *standard deviation of the z-axis, frequency domain, body acceleration, jerk signal*

[52] "frequency.body.acceleration.jerk.standard.deviation.x" : *standard deviation of the x-axis, frequency domain, body acceleration, jerk signal*

[53] "frequency.body.acceleration.jerk.standard.deviation.y" : *standard deviation of the y-axis, frequency domain, body acceleration, jerk signal*

[54] "frequency.body.acceleration.jerk.standard.deviation.z" : *standard deviation of the z-axis, frequency domain, body acceleration, jerk signal*

[55] "frequency.body.gyrometer.mean.x" : *mean of the x-axis, frequency domain, body gyrometer signal*

[56] "frequency.body.gyrometer.mean.y" : *mean of the y-axis, frequency domain, body gyrometer signal*

[57] "frequency.body.gyrometer.mean.z" : *mean of the z-axis, frequency domain, body gyrometer signal*

[58] "frequency.body.gyrometer.standard.deviation.x" : *standard deviation of the x-axis, frequency domain, body gyrometer signal*

[59] "frequency.body.gyrometer.standard.deviation.y" : *standard deviation of the y-axis, frequency domain, body gyrometer signal*

[60] "frequency.body.gyrometer.standard.deviation.z" : *standard deviation of the z-axis, frequency domain, body gyrometer signal*

[61] "frequency.body.acceleration.mag.mean" : *mean of the magnitude of the frequency domain, body acceleration signal*

[62] "frequency.body.acceleration.mag.standard.deviation" : *standard deviation of the magnitude of the frequency domain, body acceleration signal*

[63] "frequency.body.body.acceleration.jerk.magnitude.mean" : *mean of the magnitude of the frequency domain, body acceleration, jerk signal*

[64] "frequency.body.body.acceleration.jerk.magnitude.standard.deviation" : *standard deviation of the magnitude of the frequency domain, body acceleration, jerk signal*

[65] "frequency.body.body.gyrometer.magnitude.mean" : *mean of the magnitude of the frequency domain, body body gyrometer signal*

[66] "frequency.body.body.gyrometer.magnitude.standard.deviation" : *standard deviation of the magnitude of the frequency domain, body body gyrometer signal*

[67] "frequency.body.body.gyrometer.jerk.magnitude.mean" : *mean of the magnitude of the frequency domain, body body gyrometer, jerk signal*

[68] "frequency.body.body.gyrometer.jerk.magnitude.standard.deviation" : *standard deviation of the magnitude of the frequency domain, body body gyrometer, jerk signal*
