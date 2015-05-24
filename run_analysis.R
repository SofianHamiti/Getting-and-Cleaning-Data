# 1. Merges the training and the test sets to create one data set.
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

testData <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("featureNum", "featureName")

mergedData <- rbind(trainData, testData)
names(mergedData) <- features[,2]
mergedActivity <- rbind(trainActivity, testActivity)
names(mergedActivity) <- "activityNum"
mergedSubject <- rbind(trainSubject, testSubject)
names(mergedSubject) <- "subject"

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
featuresSubset <- grepl("mean|std", features$featureName)
mergedData <- mergedData[, featuresSubset]

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activityNames) <- c("activityNum", "activityName")

mergedActivity$activityNum <- activityNames[match(mergedActivity$activityNum, activityNames$activityNum) , 'activityName']
names(mergedActivity)[1] <- "activityName"
mergedData <- cbind(mergedSubject, mergedActivity, mergedData)
mergedData <- mergedData[order(mergedData$subject),] 

write.table(mergedData, "tidyData.txt")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dt <- aggregate(mergedData[, 3:ncol(mergedData)], 
                by=list(subject = mergedData$subject, activityName = mergedData$activityName),
                mean)
write.table(dt, "tidyData_means.txt")