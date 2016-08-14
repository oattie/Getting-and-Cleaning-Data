#Read me
Please read the myoutput.txt file with a command below.
read.table("./myoutput.txt", header=TRUE, sep="")

I have small amount of time to finish exercise so please bear with me that if
the code looks ugly and messy.

The run_analysis comprises of four functions. The main function is main()
which invokes other functions to work properly.

First I download and unzip the file with in the main function.

Then the main will automatically call two functions in order to merge train 
and test dataset and at the same time the program will try to rename the columns.

After that the program will merge train and test dataset.

Then the program will try to extract the mean and std variables and and assign to
the two new datasets.

Then the program will seprate the subject and label to another dataset and try to
give a proper description to each activity.

Later, it will combine altogether.

Finally the program will write the output.
