##You should create one R script called run_analysis.R that does the following.
##1. Merges the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names.
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## IMPORTANT NOTE! : for this script to succeed, please unzip the file of "UCI HAR Dataset" and place it into 
## file destination : "./UCI HAR Dataset/"

## Alerting the user of the package needed.
print ("Do kindly note that this script needs the reshape2 package.")
print ("It will install and load reshape2 package, if it is missing")
print ("Checking for status of reshape2 package in R....")

##checking for the required reshape2 package, if TRUE, it will proceed, if false it will run install.package(reshape2)
if (!require("reshape2")) {
        install.packages("reshape2")
}else {
        ##load the "reshape2" package
        library(reshape2)
        print ("Loading of reshape2 sucessful, proceeding with script!")
        
        ##I have seperated this scrip into 3 Steps
        ##Step 1: we will need to read the datasets accordingly and label them up with the aproppriate data columns
        ##Step 2: we will combine all the datasets into one complete dataframe
        ##Step 3: we will create independent tidy data set with the mean of each variable for each activity / subject.
       
        ##Start of Step 1
        
        ##Step 1.1: we shall start loading activity_labels
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))
        
        ##Step 1.2: aquiring/load the data columns and labels
        features <- read.table("./UCI HAR Dataset/features.txt")[,2]
        
        ##Step 1.3: aquiring/loading the test data and labels to the dataframe cols
        testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
        colnames(testData) <- features
        
        ##Step 1.4: aquiring/loading the train data and labels to the dataframe cols
        trainData <-read.table("./UCI HAR Dataset/train/X_train.txt")
        colnames(trainData) <- features
        
        ##Step 1.5: aquiring/loading/labeling ids of the test subjects to dataframe cols
        tSubjectID <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        colnames(tSubjectID) <- "subject_id"
        
        ##Step 1.6: aquiring/loading/labeling the activity ids of the test data to the dataframe cols
        testActivityID <- read.table("./UCI HAR Dataset/test/y_test.txt")
        colnames(testActivityID) <- "activity_id"
        
        ##Step 1.7: aquiring/loading/labeling the test sujects ids of the test data to the dataframe cols
        trainSubjectID <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        colnames(trainSubjectID) <- "subject_id"
        
        ##Step 1.8: aquiring/loading/labeling the test sujects ids of the test data to the dataframe cols
        trainActivityID <- read.table("./UCI HAR Dataset/train/y_train.txt")
        colnames(trainActivityID) <- "activity_id"
        
        ##end of Step 1
        ##start of Step 2
        
        ##Step 2.1: Let's combine the following into one dataframe (Cols) - 
        ##tSubjectID (the test subject id) ,testActivityID (test activity id) and testData (the test data)
        DataTest <- cbind(tSubjectID , testActivityID , testData)
        
        ##Step 2.2: Let's combine the following into one dataframe (Cols) - 
        ##trainSubjectID (train_subject_id) , trainActivityID (train_activity_id) , trainData (traindata)
        DataTrain <- cbind(trainSubjectID , trainActivityID , trainData)
        
        ##Step 2.3: Combination of DataTest and DataTrain into only one dataframe
        DataAll <- rbind(DataTest, DataTrain)
        
        ##end of Step 2
        ##start of Step 3
        
        ##Step 3.1: Keeping only Cols with mean removing the rest.
        idColMean <- grep("mean", names(DataAll), ignore.case = TRUE)
        ColMeanNames <- names(DataAll)[idColMean]
        
        ##Step 3.2: keeping only Cols with std, removing the rest.
        idColStd <- grep("std",names(DataAll), ignore.case = TRUE)
        ColStdNames <- names(DataAll)[idColStd]
        
        ##Step 3.3: Combination of ColMeanNames and ColStdNames into only one dataframe
        StdMeanCol <- DataAll[,c("subject_id","activity_id", ColMeanNames, ColStdNames)]
        
        ##Step 3.4: Merging activity db with mean/std db into one dataset
        namesdesc <- merge(activity_labels, StdMeanCol, by.x="activity_id", by.y="activity_id",all=TRUE)
        
        ##Step 3.5: Melting the dataset and adding in descriptive activity names
        dataMelt <- melt(namesdesc, id=c("activity_id","activity_name","subject_id"))
        
        ##Step 3.6: Casting of melt data into mean/std for each variable/activity/subject
        dataFinal <- dcast( dataMelt, activity_id + activity_name + subject_id ~ variable,mean)
       
        ##Step 3.7: New tidy dataset file creation
        write.table(dataFinal,"./UCI HAR Dataset/tidy_data_set.txt", row.name=FALSE)
        
        ##end of Step 3
        print ("Successful!")
}