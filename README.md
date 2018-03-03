# Getting and Cleaning Data Course Project

A goal of this project is to prepare tidy data that can be used for later analysis. 

Data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The project insludes: 
1) README.md explains how all of the scripts work and how they are connected. 
2) Code book CodeBook.md. describes the variables, the data, and transformations performed to clean up the data.  
3) R script run_analysis.R 


R script run_analysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
