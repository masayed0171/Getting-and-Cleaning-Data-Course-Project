---
title: "README.MD"
author: "Mohsin Dhrubo"
date: "02/11/2020"
output: html_document
---



## Week 4 -> Peer-graded Assignment: Getting and Cleaning Data Course Project
Files, tables and variables are described in CodeBook.md. It also explains the data, and all transformations or work that I was performed to clean up the data

The R script file run_analysis.R contains all the source code for data preparation. That code excutes all the answers of the questions required as described in the course project. The answers follows:

First, merges the train and test sets to create one data set.

Then, extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names.

Finally, from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final output of FinalData.txt is the exported as final data to the local drive after executing all the steps written in run_analysis.R.