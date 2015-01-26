# TidyProject
Class Project for Clean Data

This project includes `run_analysis.R', which will summarize the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Input 

Data downloaded from above link into working directory

# Output

Produces 'tidy.txt' which averages all the mean and standard deviation variables from the original set, grouped by subject and activity. 

(Variables with mean(...) and std(...) suffixes chosen.)

# Transformations

* Load seperate measurements, activity, and subject data, for test and training subjects
* Merge into one data frame
* Subset by mean and std variables
* Change variable names to remove punctuation
* Group by subject/activity and average of all measurements
* Produce summary in text file




