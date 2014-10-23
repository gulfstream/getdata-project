# getdata-project

## Getting and Cleaning Data 

### Course Project

#### Script: run_analysis.R 

*Before running the script contained in run_analysis.R, you will need to set the directory that contains the Samsung data as your working directory: setwd("filepath to your working directory")*

##### What the Script Does

###### 1.    Merges the training and the test sets to create one data frame.

1.1   Builds the training data frame.

1.1.a Reads in the "features.txt" file as a data frame and subsets the second
      column containing the feature names as a character vector.
      
1.1.b Reads in the "X_train.txt" file as a data frame.

1.1.c Adds the feature names as the column names for the data frame.

1.1.d Reads in the "subject_train.txt" and the "y_train.txt" files as vectors.

1.1.e Binds the above subject and activity vectors to the data frame and adds the 
      column names "subject" and "activity" to each of them respectively.

1.2   Builds the test data frame.

1.2.a Reads in the "X_test.txt" file as a data frame.

1.2.b Adds the feature names as the column names for the data frame.

1.2.c Reads in the "subject_test.txt" and the "y_test.txt" files as vectors.

1.2.d Binds the above subject and activity vectors to the data frame and adds the 
      column names "subject" and "activity" to each of them respectively.

1.3   Binds the training and test data frames into one data frame.


##### 2.  Subsets the data frame to extract only the columns containing *measurements* of the mean and standard deviation for each feature (in addtion to the subject and activity columns). 

(Note that the "features_info.txt" file that comes with the Samsung data lists mean, 
standard deviation, and mean frequency as three distinct measurements of the feautres 
(among many others) and therefore columns containing the measurement of mean frequency 
of a feature were excluded from the subset. Columns containing angle features were similiarly 
excluded as they are not strictly means of the feautures, but features composed of means.)


3.   Uses the factor funtion to use descriptive activity names taken from the 
     "activity_labels.txt" file to name the activities in the data set.


4.   Appropriately labels the data set with descriptive variable names.

a.   Uses the gsub function to removes all the dashes.
b.   Uses the gsub function to removes all the parantheses.
c.   Uses the gsub function to replaces all the shorthand with longhand.


5.   From the data set in step 4, creates a second, independent tidy data set with the 
     average of each variable for each activity and each subject.

a. Opens the reshape2 library.
b. Creates a vector of all the column names from the data frame called varnames.
c. Subsets this vector to exlcude column names for subject and activity.
d. Melts the data frame using "subject" and "activity" as id variables and the varnames 
   vector as the measure variables.
e. Casts the data frame with subject + activity broken down by variable and summarized 
   by the mean.

6. Writes the data frame into a text file called tidy_variable_averages using write.table().

