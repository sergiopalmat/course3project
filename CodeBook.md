
The following are the steps for the data preparation for the final project:

1. Download the Dataset.

2. Assign the variables

	- Features contains the features used for the database from the acelerometer and gyroscope 
	features<-features.txt

	- Activities contains the list of activities performed when the measurements were executed
	activities<- activity_labels.txt

	- Subject_test has the test data from the volunteer test subjects
	subject_test <- test/subject_test.txt

	- rec_test contains the recorded features
	rec_test <- test/x.txt

	- rect_test2 contains the activities labels
	rec_test2 <- test/y.txt

	- Train data of the volunteers
	subject_train <- test/subject_train.txt

	- Recorded features train information
	x_train <- test/X_train.txt

	- Train activities labels 
	y_train <- test/y_train.txt

3. Merge the train and test data

	- Create X by merging the x_train and rec_test
	- Create Y merging the y_train and rec_test2  
	- Create Subject merging subject_train and subject_test
	- Create Merged_Data merging Subject and Y and X

4. Extract the measurements on the mean and STD for each measurement
TydyData is created by selecting only the subject, code and measurements on the mean and STD for each measurement.

Change the label names on the data set for more appropiate ones

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

5. Create FinalData sumarizing TidyData taking the means of each variable for each activity and each subject.

6. Save FinalData as FinalData.txt.