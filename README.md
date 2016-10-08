# GettingAndCleaningData
GettingAndCleaningData Week4 Assignment

readme.txt has some information of the project
run_analysis.R is the R code that produce
resultset.txt as result.

# Process is documented below:
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
# Additional Libraries : dplyr, tidyr,stringr
#
## 1. Merges the training and the test sets to create one data set. "X"
#               10299 Obs. of 561 variables
#
features holds data of 'features.txt'
activity holds data of 'activity_labes.txt'
test data is stored as 'X_test' from X_test.txt
test activity data is stored as 'y_test' from y_test.txt
testsubject stores the subjects data from subject_test.txt
train data is stored as 'X_train' from X_train.txt
train activity data is stored as 'y_train' from y_train.txt
trainsubject stores the subjects data from subject_train.txt
Combining Test and Train Data as "X"
used transpose of features as "title" to assifn column names to "X"
Filtering only mean and std columns of 'X' as 'msX' after filtering duplicated other colnames.
Combining Corresponding Activity list (Y) and name the column as 'Activity'
Combined subjects data as 'Z' and name the column as 'Subject'
Building One RAW Data Set
Combined Subject(Z), Activity (Y) and mean, std only filtered observerations (msX)
#Fixing columnnames
column names get cleanedup for removal of '()' and '-' and assigned back to 'data'
before is used for backup and temporary processing
"data" is the RAW Data Set.
Used for loop to Assigning Activity Labels to the raw data set
Producing Summary result set by subject and activity using %>% 
resultset - Final Result Set

Column Variables of Result set are:
 [1] "subject"                      "Activity"                     "tBodyAccMeanX"                "tBodyAccMeanY"               
 [5] "tBodyAccMeanZ"                "tBodyAccStdX"                 "tBodyAccStdY"                 "tBodyAccStdZ"                
 [9] "tGravityAccMeanX"             "tGravityAccMeanY"             "tGravityAccMeanZ"             "tGravityAccStdX"             
[13] "tGravityAccStdY"              "tGravityAccStdZ"              "tBodyAccJerkMeanX"            "tBodyAccJerkMeanY"           
[17] "tBodyAccJerkMeanZ"            "tBodyAccJerkStdX"             "tBodyAccJerkStdY"             "tBodyAccJerkStdZ"            
[21] "tBodyGyroMeanX"               "tBodyGyroMeanY"               "tBodyGyroMeanZ"               "tBodyGyroStdX"               
[25] "tBodyGyroStdY"                "tBodyGyroStdZ"                "tBodyGyroJerkMeanX"           "tBodyGyroJerkMeanY"          
[29] "tBodyGyroJerkMeanZ"           "tBodyGyroJerkStdX"            "tBodyGyroJerkStdY"            "tBodyGyroJerkStdZ"           
[33] "tBodyAccMagMean"              "tBodyAccMagStd"               "tGravityAccMagMean"           "tGravityAccMagStd"           
[37] "tBodyAccJerkMagMean"          "tBodyAccJerkMagStd"           "tBodyGyroMagMean"             "tBodyGyroMagStd"             
[41] "tBodyGyroJerkMagMean"         "tBodyGyroJerkMagStd"          "fBodyAccMeanX"                "fBodyAccMeanY"               
[45] "fBodyAccMeanZ"                "fBodyAccStdX"                 "fBodyAccStdY"                 "fBodyAccStdZ"                
[49] "fBodyAccMeanFreqX"            "fBodyAccMeanFreqY"            "fBodyAccMeanFreqZ"            "fBodyAccJerkMeanX"           
[53] "fBodyAccJerkMeanY"            "fBodyAccJerkMeanZ"            "fBodyAccJerkStdX"             "fBodyAccJerkStdY"            
[57] "fBodyAccJerkStdZ"             "fBodyAccJerkMeanFreqX"        "fBodyAccJerkMeanFreqY"        "fBodyAccJerkMeanFreqZ"       
[61] "fBodyGyroMeanX"               "fBodyGyroMeanY"               "fBodyGyroMeanZ"               "fBodyGyroStdX"               
[65] "fBodyGyroStdY"                "fBodyGyroStdZ"                "fBodyGyroMeanFreqX"           "fBodyGyroMeanFreqY"          
[69] "fBodyGyroMeanFreqZ"           "fBodyAccMagMean"              "fBodyAccMagStd"               "fBodyAccMagMeanFreq"         
[73] "fBodyBodyAccJerkMagMean"      "fBodyBodyAccJerkMagStd"       "fBodyBodyAccJerkMagMeanFreq"  "fBodyBodyGyroMagMean"        
[77] "fBodyBodyGyroMagStd"          "fBodyBodyGyroMagMeanFreq"     "fBodyBodyGyroJerkMagMean"     "fBodyBodyGyroJerkMagStd"     
[81] "fBodyBodyGyroJerkMagMeanFreq"

Column Naming Description

t - time
f - Fast Fourier Transform (FFT)/frequency domain signals
BodyACC - Body Accelerometer reading
BdoyGyro - Body Gyroscope readming
Mean - Mean value of the mean observation
Std - Mean value of  the Stadandard Deviation of observation
