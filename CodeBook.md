# Code Book for Getting and Cleaning Data Project

## Project data
Project data is derived from the "Human Activity Recognition Using Smartphones Data Set" 
which is avaiable at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

  - Download zip file
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  - Extract zip file to a working directory

## Read in data from following files
  - subject_test.txt  - subject IDs participating in test
  - subject_train.txt - subject IDs participating in train
  - features.txt      - variable descriptions in files X_test and X_train
  - X_test - variable values in test           
  - X_train - variable values in train
  - y_test  - activity IDs in test
  - y_train - activity IDs in train
  - activity_labels - IDs and descriptions of 6 different activities included in the study
  
  The data files were read into data frames. Descriptive column labels were added. 
  
## Merge the training and the test sets to create one data set
  Dataset train was created by cbind of the follwing data frames:  y_train, subject_train, x_train.
  Dataset test was created by cbind of the follwing data frames:  y_test, subject_test, x_test.
  The first objective of this project was achived by combining train and test data frames into one dataset oneDS. 
  
## Extract only the measurements on the mean and standard deviation for each measurement.
  Logical vector was created to identify variables related to mean and standard deviation of the measurements: getColumns.
  It was used in the next operation to extract only the measuments on the mean and standard deviation. Final tidy dataset 
  tidyDS also contains SubjectID, ActivityID and ActivityDescription columns.

## Independent tidy data set with the average of each variable for each activity and each subject.
  The second tidy dataset (tidyMeansDS) was created to display the average of each variable grouped by each activity and each subject. 
  It was done by applying the aggregate function with performing mean calculation on each of the activity columns.


