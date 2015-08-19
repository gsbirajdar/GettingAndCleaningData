##This is the function to process data contained in zip file at following web location
##"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##and convert into a tidy dataset as asked for 'Course Project assignment' of getdata-031 on
##Coursera

##PLEASE REMEMBER, this function assumes that your working directory contains folder named
##'UCI HAR Dataset' that is downlaoded from above URL and unzipped in your working directory

##EVERY comment explains the codes that FOLLOW the comment and not the ones that PRECEDE  

##This function loads few heavy files, so it is recommonded to remove if there are any objects
##that are loaded into R but are not being used
run_analysis <- function(){
        ##Following code subsets training data to select columns only
        ##corresponsing to mean and SD values
        ##First load training dataset
        traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
        ##Replace column names using descriptive variable names given in features.txt file
        featurenames <- read.table("./UCI HAR Dataset/features.txt")
        featurenames <- as.character(featurenames[,2])
        colnames(traindata) <- featurenames
        ## Get the index of columns that correspond only to mean and SD values
        meansdcolindex <- grep("mean|std*", featurenames)
        ##Subset 'traindata' by selecting columns that correspond only to mean and SD values
        traindataslice <- traindata[,meansdcolindex]
        
                ##Add subject and activity index to data frame as first two columns
                sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
                act_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
                traindataslice <- cbind(act_train, sub_train, traindataslice)
                colnames(traindataslice)[1:2] <- c("activities", "subjects")
                ##Following command is to remove the object 'traindata' which is no more required
                ##and occupying large space
                rm(list = "traindata")
        
        ##Follow same steps to subset test data as it is done for training data
        ##Notice that here colnames are only added to use them for subsetting data
        ##only to include columns with mean and SD.. These column names will then automatically
        ##removed while merging test and traindata using 'rbind' function
        testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
        ##Slice the testdata to select columns only corresponding to mean and SD values
        featurenames <- read.table("./UCI HAR Dataset/features.txt")
        featurenames <- as.character(featurenames[,2])
        colnames(testdata) <- featurenames
        meansdcolindex <- grep("mean|std*", featurenames)
        testdataslice <- testdata[,meansdcolindex]
                ##Add subject and activity index to dataframe
                sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
                act_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
                testdataslice <- cbind(act_test, sub_test, testdataslice)
                colnames(testdataslice)[1:2] <- c("activities", "subjects")
                ##Remove object 'testdata' from the workspace
                rm(list = "testdata")
        
        ## Now following code merges train and test data
        combdata <- rbind(traindataslice, testdataslice)
        
        ##Following code gets the average of each variable for each 
        ##activity and each subject as specified in step 5 of assignment
        averagebySubAct <- sapply(split(combdata[,3:81], list(combdata$activities,combdata$subjects)), colMeans)
        averagebySubAct <- round(averagebySubAct, digits = 8)
        ##The resulting matrix actually gives variables in rows rather than columns, to
        ##follow tidy data principle, following command is to transpose this matrix so
        ##that variables are in columns
        averagebySubAct <- t(averagebySubAct)
        
        ##Following commands appropriately label the activities and variables
        ##First colnames are modified to indicate that now the values are average over original
        ##variables
        colnames(averagebySubAct) <- paste("averageof_", colnames(averagebySubAct))
        ##Now following commands add first two columns with descriptive activity name
        ##subject number
        ##Following code is to get corresponding activity and subject numbers by splitting
        ##rownames created by above command
        actsublist <- unlist(strsplit(rownames(averagebySubAct), "[.]"))
        actsublist <- as.numeric(actsublist)
        actsublist <- matrix(actsublist, ncol = 2, byrow = T)
        ##Following commands replace activity numbers by descriptive activity names
        activities <- actsublist[,1]
        activity.names <- read.table("./UCI HAR Dataset/activity_labels.txt")
        activity.names <- as.character(activity.names[,2])
        activities <- activity.names[activities]
        subjects <- actsublist[,2]
        ##Now following command adds these corresponding activity and subject numbers as
        ##first two columns of tidy data
        averagebySubAct <- cbind(activities, subjects, averagebySubAct)
        ##name these newly added columns
        colnames(averagebySubAct)[1:2] <- c("activities", "subjects")
        ##Now write the tidy data set to file
        write.table(averagebySubAct, file = "Human_Act_Rec_Data_Summary.txt", row.names = FALSE)
        ##Now to look into the data you can load it using a command something like:
        ##data <- read.table("Human_Act_Rec_Data_Summary.txt", colClasses = "character", header = TRUE)
}