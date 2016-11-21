##The purpose of this project is to  merge, clean and transform data set which consists of different raw files. 
##These files contain data about Human activity collected by smartphone. 
##The goal is to prepare one file with tidy data that can be used for later analysis

## STEP 0: load required packages and download data

# check and install required packages
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

# load required packages
require("reshape2")
require("data.table")

# download data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip")


## STEP 1: Merges the training and the test sets to create one data set

# read data into data frames
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# read column names of train and test datasets
names(subject_train) <- "subject_id"
names(subject_test) <- "subject_id"

# add column names for measurement files
featureNames <- read.table("./UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"

# merge files into one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
merged <- rbind(train, test)


## STEP 2: Extracts only the measurements on the mean and standard
## deviation for each measurement.

# determine which columns contain "mean()" or "std()"
mscols <- grepl("-(mean|std)\\(\\)", names(merged))

# keep the subject_id and activity columns
mscols[1:2] <- TRUE

# created dataframe with selected columns
sorted <- merged[, mscols]


## STEP 3: Uses descriptive activity names to name the activities
## in the data set.

# convert the activity column from integer to factor
sorted$activity <- factor(sorted$activity, labels=c("Walking",
                                                    "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

names_of_sorted_DF <- colnames(sorted)
names_of_sorted_DF <- gsub("tBody", "Time.Body",names_of_sorted_DF,fixed=TRUE)
names_of_sorted_DF <- gsub("tGravity", "Time.Gravity",names_of_sorted_DF,fixed=TRUE)
names_of_sorted_DF <- gsub("fBody", "FFT.Body",names_of_sorted_DF,fixed=TRUE)
names_of_sorted_DF <- gsub("fGravity", "FFT.Gravity",names_of_sorted_DF,fixed=TRUE)

names_of_sorted_DF <- gsub("-mean()-", ".Mean.",names_of_sorted_DF,fixed=TRUE)
names_of_sorted_DF <- gsub("-std()-", ".Std.",names_of_sorted_DF,fixed=TRUE)
names_of_sorted_DF <- gsub("-mean()",".Mean",names_of_sorted_DF,fixed=TRUE)
names_of_sorted_DF <- gsub("-std()",".Std",names_of_sorted_DF,fixed=TRUE)

colnames(sorted)<-names_of_sorted_DF


## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# create the tidy data set
melted <- melt(sorted, id=c("subject_id","activity"))
tdata <- dcast(melted, subject_id+activity ~ variable, mean)

# write the tidy data set to a file
write.table(tdata, file="./tdata.txt",row.name=FALSE)