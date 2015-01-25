
test_subject <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
test_activities <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
test_data <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
test_combined <- cbind(test_subject, test_activities, test_data)

train_subject <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
train_activities <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
train_data <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
train_combined <- cbind(train_subject, train_activities, train_data)

alldata <- rbind(test_combined, train_combined)

features <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
fnames <- features[grepl("mean\\(|std\\(",features[,2]),]
subdata <- alldata[,c(1:2,fnames[,1]+2)]
names(subdata) <- c("Subject", "Activity", as.character(fnames[,2]))
names(subdata) <- gsub("[[:punct:]]", "", names(subdata))

activities <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
subdata[,2] <- activities[subdata[,2], 2]

library(dplyr)
tbldata <- tbl_df(subdata)
bySubjectActivity <-group_by(tbldata,Subject,Activity)
tidy <- summarise_each(bySubjectActivity,funs(mean))

write.table(tidy,"tidy.txt", row.names = F)
