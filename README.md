# Getting and Cleaning Data Course Project

## Project Description
This is the Coursera "Getting and Cleaning Data"" course's final project. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

This project outputs "Tidy Data"", i.e Each variable you measure should be in one column, 
Each different observation of that variable should be in a different row.

##Files Included in the Project
Included are this README, a CODEBOOK, an R script called "Run_analysis.R", and a tidy data set created 
by running the R script.

##Run_analysis.R does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Before running Run_analysis.R

1. Download the data source and put into a folder on your local drive. The source is:

UC Irvine Human Activity Recognition Using Smartphones Data Set 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

You'll have a ```UCI HAR Dataset``` folder, this is your working directory.

2. Put ```run_analysis.R``` in the parent folder one level up from ```UCI HAR Dataset```, so that the script will then set  ```UCI HAR Dataset``` as your working directory using ```setwd()``` function.

3. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.

## Dependencies

```run_analysis.R``` file will help you to install the dependencies automatically. It depends on ```plyr``` and ```data.table```. 