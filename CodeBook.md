##Code Book##
=======================

###Data Source###

Data used for this assignment comes from the following source: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" Full description of the data is available here: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" and in the data zip file. For the latter please refer to README and features_info files. 

###Data transformation and variables###

In order to form the data following files were merged:
* files referring to test and creating the test dataset **testData**: ...UCI HAR Dataset\test\X_test, y_test and subject_test
* files referrring to training and creating the training dataset **trainData**: ...UCI HAR Dataset\train\X_train, y_train and subject_train

Based on features.txt file a factor of descriptive headers was created. It was used to assign descriptive variable names to the column names of both the testData and trainData sets.

Both testData and trainData were combined into one dataset **bindData**. Based on the colmumn names of the data set only those referencing to mean and standard deviation were extracted using grep function. As an outcome 66 variables were extracted. As a next step both subject IDs and activity label columns were attached creating a dataset called **cleanData**.

Based on the file activity_labels.txt descriptive names to the avtctibity labels were assigned in the cleanData.

##Tidy data##
Second data set was created based on the script above with the average of each variable for each activity and each subject. To achieve this function aggregate was used. As a last step, the data was sorted by the subject id.

The outcome of the above steps is a tidy data saved into a text file **TidyData** and saved in UCI HAR Dataset folder.

