#
#                                    Given Raw Data Set
#
# Directory : Week4\Assignment\UCI HAR Dataset
# Files:
#       features.txt has 561 Column Names
# Directory : Week4\Assignment\UCI HAR Dataset\test\
# Files:
#       X-test.txt Test data of 2947 obs. of 561 variables
#       y_test.txt              2947 Activity ID  
#       subject_test.txt        2947 subject
#
# Directory : Week4\Assignment\UCI HAR Dataset\train
# Files:
#       X-train  Training data  7352 obs. of 561 variables.
#       y_train                 7352 Activity ID 
#       subject_train.txt       7352 subject
#####################################################
##
##                      TO PRODUCE A TIDY DATA SET
##
## 1. Merges the training and the test sets to create one data set.
#               10299 Obs. of 561 variables
#
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
## 3. Uses descriptive activity names to name the activities in the data set
#
## 4. Appropriately labels the data set with descriptive variable names.
#
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
#
# Libraries : dplyr, tidyr,stringr
library(dplyr)
library(tidyr)
library(stringr)
#
## 1. Merges the training and the test sets to create one data set.
#               10299 Obs. of 561 variables
#
setwd("C:/Users/dvaruna/Desktop/Coursera/course3/Week4/Assignment/UCI HAR Dataset")
features<-tbl_df(read.table("features.txt",sep="",header = FALSE))
features<-select(features,V2)
activity<-read.table("activity_labels.txt",sep="",header = FALSE)
#
setwd("C:/Users/dvaruna/Desktop/Coursera/course3/Week4/Assignment/UCI HAR Dataset/test")
X_test<-tbl_df(read.table("X_test.txt",sep="",header = FALSE))
y_test<-tbl_df(read.table("y_test.txt",sep="",header = FALSE))
testsubject<-read.csv("subject_test.txt",sep="",header = FALSE)
names(testsubject)<-"subject"
#
#Combining Test and Train Data
#
setwd("C:/Users/dvaruna/Desktop/Coursera/course3/Week4/Assignment/UCI HAR Dataset/train")
X_train<-tbl_df(read.table("X_train.txt",sep="",header = FALSE))
y_train<-tbl_df(read.table("y_train.txt",sep="",header = FALSE))
trainsubject<-read.csv("subject_train.txt",sep="",header = FALSE)
names(trainsubject)<-"subject"
X<-bind_rows(X_test,X_train)
#
#Column selection and labelling
#
#transpose of features 
title<-t(features) 
names(X)<-title
# Filtering only mean and std columns of X
msX<-X[,!duplicated(colnames(X)) & grepl("mean|std",colnames(X))]
#
# Combining Corresponding Activity list
#
Y=bind_rows(y_test,y_train)
names(Y)<-"Activity"
#
# Combining subjects data
#
Z=bind_rows(testsubject,trainsubject)
# Building One RAW Data Set
data=bind_cols(Z,Y,msX)
#Fixing columnnames
fixcolname<-gsub("-","",names(data))
fixcolname<-gsub("mean\\(\\)","Mean",fixcolname)
fixcolname<-gsub("std\\(\\)","Std",fixcolname)
fixcolname<-gsub("meanFreq\\(\\)","MeanFreq",fixcolname)
names(data)<-fixcolname
before<-data
#   Assigning Activity Labels
for (i in 1:length(c(as.integer(str_trim(before$Activity))))){
    if (as.integer(str_trim(before$Activity[i])) == 1) { data$Activity[i]<-"WALKING" }
    if (as.integer(str_trim(before$Activity[i])) == 2) { data$Activity[i]<-"WALKING_UPSTAIRS" }
    if (as.integer(str_trim(before$Activity[i])) == 3) { data$Activity[i]<-"WALKING_DOWNSTAIRS" }
    if (as.integer(str_trim(before$Activity[i])) == 4) { data$Activity[i]<-"SITTING" }
    if (as.integer(str_trim(before$Activity[i])) == 5) { data$Activity[i]<-"STANDING" }
    if (as.integer(str_trim(before$Activity[i])) == 6) { data$Activity[i]<-"LAYING" }
}
#
# Producing Summary result set by subject and activity
#
resultset<-data %>%group_by(subject,Activity)%>%summarise_each(funs(mean))
setwd("C:/Users/dvaruna/Desktop/Coursera/course3/Week4/Assignment")
write.table(resultset,file="resultset.txt",row.names = FALSE)
#> dim(resultset)
#[1] 180  81
