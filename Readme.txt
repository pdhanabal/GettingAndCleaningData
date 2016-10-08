Readme.txt

Given Raw Data Set:
--------------------
Directory 	: 	Week4\Assignment\UCI HAR Dataset
Files		:	features.txt has 561 Column Names
Directory 	: 	Week4\Assignment\UCI HAR Dataset\test\
Files		:
			X-test.txt  	2947 obs. of 561 variables
			y_test.txt 	2947 Activity ID  
			subject_test.txt     2947 subject
Directory 	: 	Week4\Assignment\UCI HAR Dataset\train
			X-train 	7352 obs. of 561 variables.
			y_train 	7352 Activity ID 
			subject_train.txt	7352 subject

Objective: 
---------

Create one R script called run_analysis.R that

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of 
	each variable for each activity and each subject.

Result Set:
----------

	Produce a summarized observation tidy result set of 30 subject(people) doing 6 activities with 
individual mean and standard deviations.

