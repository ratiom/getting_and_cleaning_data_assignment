library(plyr)

### Data Import
xtest <- read.table('./data/UCI_HAR_Dataset/test/X_test.txt')
subjtest <- read.table('./data/UCI_HAR_Dataset//test/subject_test.txt')
ytest <- read.table('./data/UCI_HAR_Dataset/test//y_test.txt')
features <- read.table('./data/UCI_HAR_Dataset//features.txt')

xtrain <- read.table('./data/UCI_HAR_Dataset/train/X_train.txt')
subjtrain <- read.table('./data/UCI_HAR_Dataset//train/subject_train.txt')
ytrain <- read.table('./data/UCI_HAR_Dataset/train//y_train.txt')

###Column name assignment
names(xtest) <- features$V2
names(ytest) <- 'Activity'
names(subjtest) <- 'PersonID'

names(xtrain) <- features$V2
names(ytrain) <- 'Activity'
names(subjtrain) <- 'PersonID'

### Join data frame to one DF
test_all <- cbind(subjtest,ytest, xtest)
train_all <- cbind(subjtrain, ytrain, xtrain)
data_all <- rbind(test_all, train_all)

###Assign Activities and Person codes as factors
data_all$Activity <- as.factor(data_all$Activity)
data_all$PersonID <- as.factor(data_all$PersonID)

#Reset the activity labels from numbers to descriptions
levels(data_all$Activity) <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')

#Generate Column means
aves <- colMeans(data_all[,-c(1,2)])

#Generate Column standard deviations. Drop first 2 columns
sds <- apply(data_all[,-c(1,2)],2, sd) # 2 indicates use columns, not rows

#Calculate tidy data set with means for each variable arranged for each person and activity
tidy_dataset <- ddply(data_all, .(PersonID,Activity), colwise(mean))
