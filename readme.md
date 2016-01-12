This repo holds the assignment data for Getting and Cleaning Data
The analysis script is named run_analysis.Reassigned

The original date was obatined from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data import
Individual files were imported into R as data frames

##Column name assignment
The features file contained a list of variable names. These were assigned as column names for the XTest and XTrain frames
The subject frames (subjtest, subjtrain) were assigned a column name of **'PersonID'
The Activities columns were assigned a column name of **'Activities'

##Join data frame to one DF
Used cbind to fuse three frames for test data: **test_all
Used cbind to fuse three frames for train data: **train_all
Used rbind to make the required data frame containing all data: **data_all


##Assign Activities and Person codes as factors
Reassigned the numbers in the Activites and PersonID columns as factors

##Reset the activity labels from numbers to descriptions
Renamed the levels (1-6) in the Activity column as the verbose activity descriptions:
'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'

##Generate Column means
Generated column means for all except the first two column containing factors: **aves

##Generate Column standard deviations
Generated column standard deviations for all except the first two column containing factors: **sds

##Calculate tidy data set with means for each variable arranged for each person and activity
Calculated means for each column grouped by activity levels: **tidy_dataset
