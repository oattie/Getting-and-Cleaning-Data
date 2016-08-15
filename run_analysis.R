## This function is to merge all relavant data for the train dataset.
mergeTrainData <- function(xSubjectTrain, yLabelTrain, xTrain, features){
	#Lebel the column before merging
	names(xSubjectTrain) <- "subject"
	names(yLabelTrain) <- "label"
	names(xTrain) <- features$V2
	names(xTrain) <- tolower(names(xTrain))

	trainDataSet <- cbind(xSubjectTrain, yLabelTrain, xTrain)
	trainDataSet
}

## This function is to merge all relavant data for the test dataset.
mergeTestData <- function(xSubjectTest, yLabelTest, xTest, features){
	#Lebel the column before merging
	names(xSubjectTest) <- "subject"
	names(yLabelTest) <- "label"
	names(xTest) <- features$V2
	names(xTest) <- tolower(names(xTest))

	testDataSet <- cbind(xSubjectTest, yLabelTest, xTest)
	testDataSet
}

## this function is to merge test and train dataset
mergeTestTrain <- function(trainDataSet, testDataSet){
	data <- rbind(trainDataSet, testDataSet)
	data
}

main <- function(){
	#Download and unzip all of the files.
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest="./Coursera/data.zip", method="auto")
	unzip("./Coursera/data.zip", exdir="./Coursera")	

	## Load train dataset to dataframe.
	xTrain <- read.table("./Coursera/UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
	
	## Load subject of train dataset to dataframe.
	xSubjectTrain <- read.table("./Coursera/UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
	
	## Load train label to dataframe.
	yLabelTrain <- read.table("./Coursera/UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
	
	## Load features to dataframe.
	features <- read.table("./Coursera/UCI HAR Dataset/features.txt", header=FALSE, sep="")

	## Load activities to dataframe.
	activities <- read.table("./Coursera/UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")

	## Load test dataset to dataframe.
	xTest <- read.table("./Coursera/UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")

	## Load subject of test dataset to dataframe.
	xSubjectTest <- read.table("./Coursera/UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")

	## Load test label to dataframe.
	yLabelTest <- read.table("./Coursera/UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")

	trainDataSet <- mergeTrainData(xSubjectTrain, yLabelTrain, xTrain, features)
	testDataSet <- mergeTestData(xSubjectTest, yLabelTest, xTest, features)
	
	data <- mergeTestTrain(trainDataSet, testDataSet)

	extractedMean <- data[,grep("mean.)|meanf.",names(data))]
	extractedSTD <- data[,grep("std.)",names(data))]
	
	## Get the subject and label.
	prepareData <- data[,1:2]
	
	## Separate the activity
	desActivities <- data[,2]

	## try to give a proper description to each activity.
	desActivities <- sapply(desActivities, function(x){ 
		if(x==1){
			activities[1,2]	
		}else if(x==2){
			activities[2,2]	
		}else if(x==3){
			activities[3,2]
		}else if(x==4){
			 activities[4,2]
		}else if(x==5){
			activities[5,2]
		}else if(x==6){
			activities[6,2]
		}
	})
	## Merge the activity to the dataset.
	prepareData[,2] <- desActivities 	
	
	## Combind the extracted mean and std with the new data.
	prepareData <- cbind(prepareData, extractedMean, extractedSTD)
	
	## Find the average of each subject, activity and variable
	newData <- aggregate(x=prepareData[,3:81],by=list(prepareData$subject, prepareData$label), FUN=mean)
	
	## rename the first and second column back to subject and activity	
	names(newData)[1] = "subject"
	names(newData)[2] = "activity"

	## Write the output.
	write.table(newData, "./Coursera/myoutput.txt", row.names=FALSE)
}