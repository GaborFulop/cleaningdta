the R file does the following:

0. loads the csv files
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  checks the length of the 1st row (i.e we know the the second dimension of the matrix)
  creates an empty data frame
  and fills the data frame with the means
  finally merges the means to the cleaned data set

