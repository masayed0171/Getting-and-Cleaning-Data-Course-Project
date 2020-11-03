My run_analysis.R script initially start the preparation of dat. That includes downlad and unzip the dataset, arracnge the data according to the question and finally answer the 5 question in the course project.

Dataset is downloaded and unzipped from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip website and saved under the folder called UCI HAR Dataset.

There are two datasets named "activity_labels.txt" and "features.txt" in the main folder and there datasets in train and test folders named "subject_....txt", "X_....txt" and "y_....txt". Beside two info files in main folder "features_info.txt" and "README.txt"

By looking all the datasets the first step was to assign each data to appropriate variable
1. features.txt has total of 561 rows, 2 columns. This database has come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. I define the table name as feature and columns are "no" and "functions"
2. activity_labels.txt has total of 6 rows, 2 columns. I define the table name as activities and column names are "activityCode" and "activityType"
3. subject_test.txt has 2947 rows, 1 column. This datasets contains huge test data of 9/30 volunteer of test subjects those being observed. I defined the table as testSubject and the column refers to "subject"
4. x_test.txt has 2947 rows, 561 columns that contains recorded features test data. I defined the table as textX and colum correspondings to the feature table "functions"
5. y_test.txt has 2947 rows, 1 columns as well contains test data of all activities code labels. I defined the table as testY and column as "code"
6. subject_train.txt has 7352 rows, 1 column that contains huge train data of 21/30 volunteer of train subjects being observed. I defined the table as trainSubject and column name "subject"
7. x_train.txt has 7352 rows, 561 columns that contains recorded features train data. I defined the atble as trainX and colum correspondings to the feature table "functions"
8. y_train.txt has 7352 rows, 1 columns as well contains train data of all activities code labels. I defined the table as trainY and column as "code"

Q1: Merges the training and the test sets to create one data set
AllX (10299 rows, 561 columns) is created by merging trainX and testX using rbind() function
similarly, AllY (10299 rows, 1 column) is created by merging trainY and testY using rbind() function
AllSubject (10299 rows, 1 column) is created by merging trainSubject and test$subject using rbind() function
finally, Merged (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

Q2: Extracts only the measurements on the mean and standard deviation for each measurement
extract (10299 rows, 88 columns) is created by subsetting Merged, selecting only columns: subject, code and the measurements that contains the mean and the standard deviation (std) for each measurement

Q3: Uses descriptive activity names to name the activities in the data set
Taking into cosideration of total numbers in code column of the extract table which is replaced with corresponding activity extractn from second column of the activities variable

Q4: Appropriately labels the data set with descriptive variable names
code column in extract renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time

Q5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData (180 rows, 88 columns) is created from extract by taking the means of each variable for each activity and each subject using groupped by subject and activity.
finally write.table export locally FinalData into FinalData.txt file.
