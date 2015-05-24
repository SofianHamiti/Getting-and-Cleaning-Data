Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  

The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

###The run_analysis.R script performs the following steps:   
 
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "UCI HAR Dataset/train" folder and store them in *trainData*, *trainActivity* and *trainSubject* respectively.       
 
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "UCI HAR Dataset/test" folder and store them in *testData*, *testActivity* and *testsubject* respectively.  
 
 3. Read the features.txt file from the "UCI HAR Dataset" folder and store the data in a variable called *features*. Rename the column of *features*
 
 3. Concatenate: trainData+testData, trainActivity+testActivity, trainSubject+testSubject
And set properly the different column names. 
 
 4. Extract only the measurements on the mean and standard deviation for each measurement from *mergedData*
 
 5. Read the activity_labels.txt file from the "UCI HAR Dataset" folder and store the data in a variable called *activityNames*, set properly the different column names, set properly the row values(*activityName*),
 and merge the all the data together in *mergedData*
 
 10. Write *mergedData* to "tidyData.txt" file in the current working directory.  
 
 11. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination.
 
 12. Write *dt* out to "tidyData_means.txt" file in the current working directory. 
 