#Code Book
This document describes the codes and variables inside `run_analysis.R`

## The functions inside the script.

* `mergeTrainData` - To merge and rename column of `train` data.
* `mergeTestData` - To merge and rename column of `test` data.
* `mergeTestTrain` - To merge train and test dataset together.
* `main` - To take the input, to aslo transform the data by invoking functions above and produce the output.
 
## Variables
* xTrain contains the train dataset
* xSubjectTrain contains the subject of the train dataset.
* yLabelTrain contains the activity.
* features contains all of the features.
* xTest contains the test dataset.
* xSubjectTest contains the subject of test dataset.
* yLabelTest basically the duplication of yLabelTrain. I did in this way because it is easy to read.
* TrainDataSet contains the train dataset after all merging.
* TestDataSet contains the test dataset after all merging.
* data contains both train and test dataset.
* extractedMean contains only extracted `mean()` columns from `data` framework 
* extractedSTD contains only extracted `std()` columns from `data` framwork
* prepareData contains extracted subject and activity column
* desActivities contains extracted activity for getting ready to transform them into descriptive column.
* newData contains the data after finding the average of each subject, acvitiy and vairable.
