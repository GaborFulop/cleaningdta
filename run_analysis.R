# 1. Merge the training and test dataset.
  # reading the training data
 traindta <- read.table("X_train.txt")
 trainlabel <- read.table("y_train.txt")
 trainsubject <- read.table("subject_train.txt") 
  # reading test data
 testdta <- read.table("X_test.txt")
 testlabel <- read.table("y_test.txt")  
 testsubject <- read.table("subject_test.txt")
  # merging with rbind
 mergedta <- rbind(traindta, testdta)
 mergelabel <- rbind(trainlabel, testlabel)
 mergesubject <- rbind(trainsubject, testsubject)
 
 # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  # reading the features
 features <- read.table("features.txt")
 meanstdev <- grep("mean\\(\\)|std\\(\\)", features[, 2])
  # adding the features to the merged table
 mergedta <- mergedta[, meanstdev]
 
 # 3. Uses descriptive activity names to name the activities in the data set
  # reading the activity_labels
 activity <- read.table("activity_labels.txt")
 activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
  # naming the activities
 substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
 substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
 activitylabel <- activity[mergelabel[, 1], 2]
 mergelabel[, 1] <- activitylabel
 #names(mergelabel) <- "activity"
 
 # 4. Appropriately labels the data set with descriptive activity names. 
  # labelling
 names(mergesubject) <- "subject"
 cleaneddta <- cbind(mergesubject, mergelabel, mergedta)
  # printing out the first data set
 write.table(cleaneddta, "merged_data.txt")
 
 # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  #preparing a data frame for the means 
 frow<-mergedta[1,]
 a<-length(frow)
 meandta<- data.frame(matrix(NA, nrow=1, ncol=a))
 colnames(meandta)<-colnames(mergedta)
  # filling the data frame with the means
 for (i in 1:a){
 	b<-mean(mergedta[,i])
 	meandta[i]<- b}
  # writing out the second data set
 finaldta<- rbind(mergedta,meandta)
 write.table(finaldta, "findata_with_means.txt", row.name=FALSE) 
