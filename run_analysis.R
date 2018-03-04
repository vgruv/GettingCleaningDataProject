## Getting and Cleaning Data Course Projectless 
## The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
## The goal is to prepare tidy data that can be used for later analysis. 
## Required to submit: 
##   1) a tidy data set as described below, 
##   2) a link to a Github repository with your script for performing the analysis, and 
##   3) a code book that describes the variables, the data, 
##      and any transformations or work that you performed to clean up the data called CodeBook.md. 
##   4) You should also include a README.md in the repo with your scripts. 
##      This file explains how all of the scripts work and how they are connected.

## data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## create one R script called run_analysis.R that does the following.
## - Merges the training and the test sets to create one data set.
## - Extracts only the measurements on the mean and standard deviation for each measurement.
## - Uses descriptive activity names to name the activities in the data set
## - Appropriately labels the data set with descriptive variable names.
## - From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.

## library???

# to download Human Activity Recognition Using Smartphones zip file
inputFile <- "InputDS.zip"
if (!file.exists(fileToGet)){
     fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(fileURL, inputFile, method = "curl" )
}

# unzip the file to a local directory
if (!file.exists("UCI HAR Dataset")){
     unzip(inputFile)
}

# to list all the files
list.files("./UCI HAR Dataset", recursive = T)

# path to files
pathToFiles = file.path("./UCI HAR Dataset")

# path to train and test folders
pathToTrain = file.path("./UCI HAR Dataset/train")
pathToTest = file.path("./UCI HAR Dataset/test")

# to read train data
x_train = read.table(file.path(pathToTrain, "X_train.txt"), header = F)
y_train = read.table(file.path(pathToTrain, "y_train.txt"), header = F)
subject_train = read.table(file.path(pathToTrain, "subject_train.txt"), header = F)

# to read test data
x_test = read.table(file.path(pathToTest, "X_test.txt"), header = F)
y_test = read.table(file.path(pathToTest, "y_test.txt"), header = F)
subject_test = read.table(file.path(pathToTest, "subject_test.txt"), header = F)

# to read the features data
features = read.table(file.path(pathToFiles, "features.txt"), header = F)

# to read activity labels
activityLabels = read.table(file.path(pathToFiles, "activity_labels.txt"), header = F)

# to get column names from features data frame
colnames(x_train) = features[,2]
colnames(x_test) = features[,2]

# descriptive column names 
colnames(y_train) = "ActivityID"
colnames(y_test)  = "ActivityID"
colnames(subject_test)  = "SubjectID"
colnames(subject_train) = "SubjectID"
colnames(activityLabels) <- c("ActivityID", "ActivityDescription")

# to combine the training and test sets to create one data set.
train = cbind(y_train, subject_train, x_train)
test = cbind(y_test, subject_test, x_test)
oneDS = rbind(train, test)
oneDS$ActivityDescription <- activityLabels$ActivityDescription[match(oneDS$ActivityID, activityLabels$ActivityID)]
# oneDS_3Columns <- oneDS[,c(2,1,564)]

# to extract only the measurements on the mean and standard deviation 
getColumns = (grepl("ActivityID" , colnames(oneDS)) |
                   grepl("ActivityDescription" , colnames(oneDS)) |
                   grepl("SubjectID" , colnames(oneDS)) | 
                   grepl("mean.." , colnames(oneDS)) | 
                   grepl("std.." , colnames(oneDS)))

tidyDS <- oneDS[, getColumns]

# to get a subset of required values
MeanColumns <- function(InDS){ colMeans(inDS[, -c(1,2,82)])}
tidyMeansDS <- aggregate(.~SubjectID + ActivityID + ActivityDescription, tidyDS, mean)
tidyMeansDS <- tidyMeansDS[order(tidyMeansDS$SubjectID, tidyMeansDS$ActivityID, tidyMeansDS$ActivityDescription),]

