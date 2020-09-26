#final project
filename <- "course3finalpr.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  
features <- read.table("course3pr/features.txt", col.names = c("n","functions"))
activities <- read.table("course3pr/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("course3pr/test/subject_test.txt", col.names = "subject")
rec_test <- read.table("course3pr/test/rec_test.txt", col.names = features$functions)
rec_test2 <- read.table("course3pr/test/rec_test2.txt", col.names = "code")
subject_train <- read.table("course3pr/train/subject_train.txt", col.names = "subject")
x_train <- read.table("course3pr/train/X_train.txt", col.names = features$functions)
y_train <- read.table("course3pr/train/y_train.txt", col.names = "code")

M1 <- rbind(x_train, rec_test)
M2 <- rbind(y_train, rec_test2)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, M2, M1)

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
TidyData$code <- activities[TidyData$code, 2]
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

FinalData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
FinalData