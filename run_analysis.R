# 1. Merge the training and the test sets to create one data set.

# Build the training data frame.

# Read in "features.txt" and subset the second column as a character vector.
features <- read.table("./UCI_HAR_Dataset/features.txt")
features <- as.character((features[,2]))

# Read in the "X_train.txt" file.
x <- read.table("./UCI_HAR_Dataset/train/X_train.txt")

# Add features as column names.
colnames(x) <- features

# Read in the "subject_train.txt" and the "y_train.txt" files.
subject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
activity <- read.table("./UCI_HAR_Dataset/train/y_train.txt")

# Bind subject and activity to data frame and add column names for each.
x <- cbind(subject, activity, x)
names(x)[1] <- "subject"
names(x)[2] <- "activity"

# Build the test data frame.

# Read in "X_test.txt".
y <- read.table("./UCI_HAR_Dataset/test/X_test.txt")

# Add features as column names.
colnames(y) <- features

# Read in the "subject_test.txt" and the "y_test.txt" files.
ysubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
yactivity <- read.table("./UCI_HAR_Dataset/test/y_test.txt")

# Bind subject_y and activity_y to y and add column names for each.
y <- cbind(ysubject, yactivity, y)
names(y)[1] <- "subject"
names(y)[2] <- "activity"

# Merge the training and test data frames into one data frame.
xy <- rbind(x, y)

# 2. Extract only the measurements on the mean and standard deviation 
#    for each measurement (in addtion to the subject and activity columns).

# Open the "features.txt" file, take down the numbers of the features whose 
# measurements are the mean or standard deviation. Add two to each of the 
# numbers (to account for the first two columns (subject, activity)). Subset 
# the columns for these features along with the first two columns.
xy2 <- xy[, c(1, 2, 3, 4, 5, 6, 7, 8, 43, 44, 45, 46, 47, 48, 83, 84, 85, 86,
              87, 88, 123, 124, 125, 126, 127, 128, 163, 164, 165, 166, 167, 
              168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268, 269,
              270, 271, 272, 273, 347, 348, 349, 350, 351, 352, 426, 427, 428,
              429, 430, 431, 505, 506, 518, 519, 531, 532, 544, 545)]

# 3. Use descriptive activity names to name the activities in the data set.
xy2$activity <- factor(xy2$activity, levels = 1:6, labels = c("walking", 
                                                          "walking.upstairs", 
                                                          "walking.downstairs", 
                                                          "sitting", 
                                                          "standing", 
                                                          "saying"))

# 4. Appropriately label the data set with descriptive variable names.

# Remove all the dashes.
names(xy2) <- gsub("-", "", names(xy2))
# Remove all the parantheses.
names(xy2) <- gsub("[(]", "", names(xy2))
names(xy2) <- gsub("[)]", "", names(xy2))
# Replace all shorthand with longhand.
names(xy2) <- gsub("tBodyAccJerk", "time.body.acceleration.jerk", names(xy2))
names(xy2) <- gsub("tBodyGyroJerk", "time.body.gyrometer.jerk", names(xy2))
names(xy2) <- gsub("tBodyAccJerkMag", "time.body.acceleration.jerk.magnitude",
                   names(xy2))
names(xy2) <- gsub("tBodyGyroJerkMag", "time.body.gyrometer.jerk.magnitude", 
                   names(xy2))
names(xy2) <- gsub("fBodyAccJerk", "frequency.body.acceleration.jerk", 
                   names(xy2))
names(xy2) <- gsub("fBodyAccJerk", "frequency.body.acceleration.jerk", 
                   names(xy2))
names(xy2) <- gsub("fBodyBodyAccJerkMag", 
                   "frequency.body.body.acceleration.jerk.magnitude", 
                   names(xy2))
names(xy2) <- gsub("fBodyBodyAccJerkMag", 
                   "frequency.body.body.acceleration.jerk.magnitude", 
                   names(xy2))
names(xy2) <- gsub("fBodyBodyGyroJerkMag", 
                   "frequency.body.body.gyrometer.jerk.magnitude", names(xy2))
names(xy2) <- gsub("tBodyAcc", "time.body.acceleration", names(xy2))
names(xy2) <- gsub("tGravityAcc", "time.gravity.acceleration", names(xy2))
names(xy2) <- gsub("tBodyGyro", "time.body.gyrometer", names(xy2))
names(xy2) <- gsub("tBodyAccMag", "time.body.acceleration.magnitude", 
                   names(xy2))
names(xy2) <- gsub("tGravityAccMag", "time.gravity.acceleration.magnitude", 
                   names(xy2))
names(xy2) <- gsub("tBodyGyroMag", "time.body.gyrometer.magnitude", names(xy2))
names(xy2) <- gsub("fBodyAcc", "frequency.body.acceleration", names(xy2))
names(xy2) <- gsub("fBodyGyro", "frequency.body.gyrometer", names(xy2))
names(xy2) <- gsub("fBodyAccMag", "frequency.body.acceleration.magnitude", 
                   names(xy2))
names(xy2) <- gsub("fBodyBodyGyroMag", 
                   "frequency.body.body.gyrometer.magnitude", names(xy2))
names(xy2) <- gsub("Mag", ".mag", names(xy2))
names(xy2) <- gsub("mean", ".mean", names(xy2))
names(xy2) <- gsub("std", ".standard.deviation", names(xy2))
names(xy2) <- gsub("X", ".x", names(xy2))
names(xy2) <- gsub("Y", ".y", names(xy2))
names(xy2) <- gsub("Z", ".z", names(xy2))

# 5. From the data set in step 4, create a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

# Open reshape2 library.
library(reshape2)

# Create a vector of all the column names.
xy2names <- names(xy2)

# Subset this vector to exlcude column names for subject and activity.
varnames <- xy2names[3:68]

# Melt the data frame using subject and activity as id variables and the varnames 
# vector as the measure variables.
xy2melt <- melt(xy2, id = c("subject", "activity"), measure.vars = varnames )

# Cast the data frame with subject + activity broken down by variable and 
# summarized by the mean.
xy2cast <- dcast(xy2melt, subject + activity ~ variable, mean)

# Write the data frame into a text file using write.table().
write.table(xy2cast, file = "tidy_variable_averages.txt", row.names = FALSE)
