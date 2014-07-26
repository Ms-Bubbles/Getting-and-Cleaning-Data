##Getting-and-Cleaning-Data##
=========================

*This is a repository created for the Getting and Cleaning Data: Project course*

=========================
###Introduction###

The aim of the project course was to write a script which does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

=========================

###Script###
The above described script is called run_analysis.R and can be found in this repository. Before running the script please make sure that:
 1. The UCI HAR Dataset has been downloaded and extracted.
 2. The UCI HAR folder must be availble as the script will be setting it as a working directory.

=========================

###Tidy Dataset###
Tidy dataset will be created by the script and created in the working directory as a text file called "TidyData.txt". In order to read the dataset please use the read.table command, with header argument set to true.

=========================

###CodeBook###
Along with the submission a Code Book has been prepared. It is called CodeBook.md and can be found in this repository. The Code Book describes the variables, the data, and any transformations or work that was performed to clean up the data.
