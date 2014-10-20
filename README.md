---
title: "README.md"
author: "thaddy.teo"
date: "20 October, 2014"
output: html_document
---

##Getting and Cleaning Data: Course Project

This repo contains the work and script for the "Getting and Cleaning Data: Course Project"
Notes on how the script works can be found on the script and here:

###Instructions from Course Project:
#####You should create one R script called run_analysis.R that does the following.
#####1. Merges the training and the test sets to create one data set.
#####2. Extracts only the measurements on the mean and standard deviation for each measurement.
#####3. Uses descriptive activity names to name the activities in the data set
#####4. Appropriately labels the data set with descriptive variable names.
#####5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####IMPORTANT NOTES!: 
####** for this script to succeed, please unzip the file of "UCI HAR Dataset" and place it into your current working directory!
####** this script required reshape2 package, if you do not have the package, it will help you to install and load the package!
####Please kindly contact your PC to the internet before running the script!

#####I have seperated this script into 3 Steps
#####Step 1: Read the datasets accordingly and label them up with the aproppriate data columns
#####Step 2: Combine all the datasets into one complete dataframe
#####Step 3: Create independent tidy data set with the mean of each variable for each activity / subject.

#####After Step 3, a "tiny_data_set.txt" will be created in your current working directory, this contains the answer to Instruction 5 of the course project, under "Instructions from Course Project" as seen above.

Kindly access the CodeBook.md for database variables used in this assignment.