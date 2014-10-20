---
title: "CodeBook.md"
author: "thaddy.teo"
date: "20 October, 2014"
output: html_document
---

####Data Source for Getting and Cleaning Data: Course Project : 
####http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
####Download source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#####1) Please kindly read the README.txt provided in the UCI HAR Dataset before continuing.
#####2) activity_labels are classified under the following:
        - 1 WALKING
        - 2 WALKING_UPSTAIRS
        - 3 WALKING_DOWNSTAIRS
        - 4 SITTING
        - 5 STANDING
        - 6 LAYING      
#####3) Using the information provided, we will classify the information of "test"/"train" folder, activity_labels, features into a single database. All this information should contain the "test"/"train" data from the following mentioned in features_info.txt
        - tBodyAcc-XYZ
        - tGravityAcc-XYZ
        - tBodyAccJerk-XYZ
        - tBodyGyro-XYZ
        - tBodyGyroJerk-XYZ
        - tBodyAccMag
        - tGravityAccMag
        - tBodyAccJerkMag
        - tBodyGyroMag
        - tBodyGyroJerkMag
        - fBodyAcc-XYZ
        - fBodyAccJerk-XYZ
        - fBodyGyro-XYZ
        - fBodyAccMag
        - fBodyAccJerkMag
        - fBodyGyroMag
        - fBodyGyroJerkMag
        
#####4) We are to also take note of the subject_id which has interger values 1 to 30.
#####5) Using the complied data, we will extract the following stated requirements for the "tiny_data_set.txt" for the assignment.
        - mean(): Mean value
        - std(): Standard deviation
#####6) From the assigned vectors of the "run_analysis.R", (all are dataframes)
        - <activity_labels>, to store "activity_id" and ""activity_name"" columns
        - <features>, to store data columns and labels from column 2 of features.txt
        - <testData>, to store data from X_test.txt
        - <trainData>, to store data from X_train.txt
        - <tSubjectID>, to store data from subject_test.txt
        - <testActivityID>, to store data from y_test.txt
        - <trainSubjectID>, to store data from subject_train.txt
        - <trainActivityID>, to store data from y_train.txt
        - <DataTest>, to store combine data from tSubjectID , testActivityID , testData
        - <DataTrain>, to store combine data from trainSubjectID , trainActivityID , trainData
        - <DataAll>, to store combine data from DataTest, DataTrain
        - <ColMeanNames>, to store combine data from the Means
        - <ColStdNames>, to store combine data from the Standard Dev
        - <StdMeanCol>, to store combine data from ColMeanNames, ColStdNames
        - <dataFinal>, to store final results after melt and dcast

