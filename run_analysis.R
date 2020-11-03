library(dplyr)
setwd(C:/Users/happy/Desktop/Data Science/Week 4/")

## Downloading the dataset from the weblink

file <- "C:/Users/happy/Desktop/Data Science/Week 4/getdata_projectfiles_UCI HAR Dataset.zip"

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file)

# unzip the zip file

unzip(file)


## Raed all test and train files

feature <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/features.txt", col.names = c("no","functions"))
activities <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/activity_labels.txt", col.names = c("activityCode", "activityType"))
testSubject <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
testX <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/test/X_test.txt", col.names = feature$functions)
testY <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/test/y_test.txt", col.names = "code")
trainSubject <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
trainX <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/train/X_train.txt", col.names = feature$functions)
trainY <- read.table("C:/Users/happy/Desktop/Data Science/Week 4/UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Q1: Merges the training and the test sets to create one data set.

AllX <- rbind(trainX, testX)
AllY <- rbind(trainY, testY)
AllSubject <- rbind(trainSubject, testSubject)
Merged <- cbind(AllSubject, AllY, AllX)

## Q2: 2: Extracts only the measurements on the mean and standard deviation for each measurement.

extract <- Merged %>% select(subject, code, contains("mean"), contains("std"))

## Q3: Uses descriptive activity names to name the activities in the data set.

extract$code <- activities[extract$code, 2]

## Q4: Appropriately labels the data set with descriptive variable names.

names(extract)[2] = "Activity"
names(extract)<-gsub("Acc", "Accelerometer", names(extract))
names(extract)<-gsub("Gyro", "Gyroscope", names(extract))
names(extract)<-gsub("BodyBody", "Body", names(extract))
names(extract)<-gsub("Mag", "Magnitude", names(extract))
names(extract)<-gsub("^t", "Time", names(extract))
names(extract)<-gsub("^f", "Frequency", names(extract))
names(extract)<-gsub("tBody", "TimeBody", names(extract))
names(extract)<-gsub("-mean()", "Mean", names(extract), ignore.case = TRUE)
names(extract)<-gsub("-std()", "STD", names(extract), ignore.case = TRUE)
names(extract)<-gsub("-freq()", "Frequency", names(extract), ignore.case = TRUE)
names(extract)<-gsub("angle", "Angle", names(extract))
names(extract)<-gsub("gravity", "Gravity", names(extract))

## Q5: rom the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalData <- extract %>%
  group_by(subject, Activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "C:/Users/happy/Desktop/Data Science/Week 4/FinalData.txt", row.name=FALSE)
