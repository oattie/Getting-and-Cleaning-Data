#ReadMe

##Please read the myoutput.txt file with a command below.
* `read.table("./myoutput.txt", header=TRUE, sep="")`

##Introduction
* Environment of the script: Windows 7 x64
* Working directory: `./Coursera/`
* Script file: `run_analysis.R`
* The Samsung data was saved in `./Coursera/`

## Functionality
The run_analysis comprises of four functions. The main function is main()
which invokes other functions to work properly.

* Download Sumsung data as a zip file to `working directory`
* Unzip the file into `working directory`
* Clip all the data together and rename the column properly
* Write the output to txt file inside `wokring directory`

First I download and unzip the file with in the main function.

Then the main will automatically call two functions in order to merge train 
and test dataset and at the same time the program will try to rename the columns.

After that the program will merge train and test dataset.

Then the program will try to extract the mean and std variables and and assign to
the two new datasets.

Then the program will seprate the subject and label to another dataset and try to
give a proper description to each activity.

Later, it will combine altogether.

Then, it will average each subject, activity and variable to a new dataset.

Finally the program will write the output.