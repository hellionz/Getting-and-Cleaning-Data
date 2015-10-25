

require(plyr)##checks if you have plyr, and loads plyr if you don't
setwd("./UCI HAR Dataset")##sets data directory as working directory

##Part 1.Merges the training and the test sets to create one data set.
#A.Read files into R

##First, the test data
Featurestestdf <- read.table("./test/X_test.txt")
Activitytestdf <- read.table("./test/y_test.txt")
Subjecttestdf <- read.table("./test/subject_test.txt")

## Then the training data
Featurestraindf <- read.table("./train/X_train.txt")
Activitytraindf <- read.table("./train/y_train.txt")
Subjecttraindf <- read.table("./train/subject_train.txt")

##Merge Activity Data, train onto test
Activitycolumn <- rbind.data.frame(Activitytraindf,Activitytestdf)

##Merge Features Data, train onto test
Featurescolumn <- rbind.data.frame(Featurestraindf,Featurestestdf)

##Merge Subject Data, train onto test
Subjectcolumn <-rbind.data.frame(Subjecttraindf, Subjecttestdf)

##Set Variable Names
names(Activitycolumn)<- c("activity")
FeaturescolumnNames <- read.table("./features.txt",head=FALSE)
names(Featurescolumn)<- FeaturescolumnNames[,2]
names(Subjectcolumn)<-c("subject")

##Merge Columns into one DF
mergeddf <- cbind(Featurescolumn,Subjectcolumn,Activitycolumn)

##Part 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

subFeaturescolumnNames<-FeaturescolumnNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturescolumnNames$V2)]
selectedNames<-c(as.character(subFeaturescolumnNames), "subject", "activity" )
submergeddf<-subset(mergeddf,select=selectedNames)


##Part 3. Uses descriptive activity names to name the activities in the data set

##This isn't very"R", but it's simple and easy, and better yet uses the base system.
##The labels are based off the "activitylabels.txt" file.
mergeddf$activity[mergeddf$activity == 1] <- "WALKING"
mergeddf$activity[mergeddf$activity == 2] <- "WALKING_UPSTAIRS"
mergeddf$activity[mergeddf$activity == 3] <- "WALKING_DOWNSTAIRS"
mergeddf$activity[mergeddf$activity == 4] <- "SITTING"
mergeddf$activity[mergeddf$activity == 5] <- "STANDING"
mergeddf$activity[mergeddf$activity == 6] <- "LAYING"

##Part 4. Appropriately labels the data set with descriptive variable names. 
##changes each feature to its long form name
names(mergeddf)<-gsub("^t", "time", names(mergeddf))
names(mergeddf)<-gsub("^f", "frequency", names(mergeddf))
names(mergeddf)<-gsub("Acc", "Accelerometer", names(mergeddf))
names(mergeddf)<-gsub("Gyro", "Gyroscope", names(mergeddf))
names(mergeddf)<-gsub("Mag", "Magnitude", names(mergeddf))
names(mergeddf)<-gsub("BodyBody", "Body", names(mergeddf))

##Part 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
library(plyr);
mergeddf2<-aggregate(. ~subject + activity, mergeddf, mean)
mergeddf2<-mergeddf2[order(mergeddf2$subject,mergeddf2$activity),]
write.table(mergeddf2, file = "tidydata.txt",row.name=FALSE)


