setwd("./UCI HAR Dataset")

##preparing descriptive labels to column names
header <- read.table("./features.txt")
header <- as.factor(header$V2)

testData <- read.table("./test/X_test.txt")

##assigning descriptive labels to column names
colnames(testData) <- header
testLabels <- read.table("./test/y_test.txt")
colnames(testLabels)<- c("Labels")
testSubjects <- read.table("./test/subject_test.txt")
colnames(testSubjects)<- c("SubjectIDs")
test <- cbind(testSubjects, testLabels, testData)

trainData <- read.table("./train/X_train.txt")

##assigning descriptive labels to column names
colnames(trainData) <- header
trainLabels <- read.table("./train/y_train.txt")
colnames(trainLabels)<- c("Labels")
trainSubjects <- read.table("./train/subject_train.txt")
colnames(trainSubjects)<- c("SubjectIDs")
train <- cbind(trainSubjects, trainLabels, trainData)

##merge the two data sets

bindData <- rbind(test, train)
labels <- names(bindData)

##Extract columns referencing to mean and standard deviation
sel_mean <- grep("-mean()", labels, fixed = TRUE)
sel_std <- grep("-std()", labels, fixed = TRUE)

means <- bindData[,sel_mean]
stds <- bindData[,sel_std]

cleanData <- cbind(SubjectIDs = bindData$SubjectIDs, Labels = bindData$Labels, means, stds)


##assigning descriptive activity names to variables

cleanData$Labels[cleanData$Labels =="1"] <-"WALKING"
cleanData$Labels[cleanData$Labels =="2"] <-"WALKING_UPSTAIRS"
cleanData$Labels[cleanData$Labels =="3"] <-"WALKING_DOWNSTAIRS"
cleanData$Labels[cleanData$Labels =="4"] <-"SITTING"
cleanData$Labels[cleanData$Labels =="5"] <-"STANDING"
cleanData$Labels[cleanData$Labels =="6"] <-"LAYING"

##Point 5: Creating independent tidy data set with the average of each variable for each activity and each subject 

tidyData <- aggregate(cleanData[,3:ncol(cleanData)], list(SubjectIDs=cleanData$SubjectIDs, ActivityLabels=cleanData$Labels), mean)

##Sorting the data based on the subject ids
tidyData <- tidyData[order(tidyData$SubjectIDs, decreasing=FALSE),]
tidyData$SubjectIDs <- as.factor(tidyData$SubjectIDs)

##Creating an output file with the tidy data
write.table(tidyData, file="./TidyData.txt", sep="\t", row.names=FALSE)
