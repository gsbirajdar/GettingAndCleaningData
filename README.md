=======================================================
Script to summarize the Human Activity Recognition Experiment data from
Smartlab - Non Linear Complex Systems Laboratory,DITEN - Università
degli Studi di Genova.
=======================================================
Ganesh Birajdar,
Dharamitra – An Eco-Technology Resource Centre for Sustainable Development
Dattatrey Apartments, Alodi  Marg, Nalwadi,
WARDHA- 442001 (India)
gsbirajdar516@gmail.com
=======================================================
This script has been written to summarize and present in tidy form the
data that was taken from one of the Human Activity Recognition experiment by
Smartlab - Non Linear Complex Systems Laboratory. The details of this
experiment can be found on following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Original dataset can be downloaded from following link:
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
=======================================================
The details of the variables, the data, and the transformations or work that you performed 
to clean up the data are given in the accompanying file named 'Codebook.md' available in same repo
from which this README file is downloaded.
The details in 'Codebook.md' are given in distinct sections, including:
DETAILS OF THE DATA
WHAT ARE THE COLUMNS/VARIABLES IN SUMMERIZED (present) DATASET?
WHAT ARE THE COLUMNS IN ORIGINAL DATASET?
WHAT TRANSFORMATIONS ARE PERFORMED ON ORIGINAL DATA TO SUMMERIZE IT?
=======================================================
DESCRIPTION OF SCRIPT/HOW IT WORKS

1. The function in script assumes that your working directory contains folder named'UCI HAR Dataset' 
that is downlaoded from following URL and unzipped in your working directory
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

2. EVERY comment in script explains the codes that FOLLOW the comment and not the ones that PRECEDE it.

3. This function loads few heavy files, so it is recommonded to remove if there are any objects
that are loaded into R but are not being used

4. The script first loads the traing and test data set in available in directory 'UCI HAR Dataset',
it then slices these data sets to select columns corresponding only to the mean and standard deviation
values, and then it merges the these two datasets.

5. After merging two datasets the average of each variable for each activity and each subject is calculated,
and assigned to an object 'averagebySubAct'

6. In the end activities and variables are appropriately labelled using descriptive names and data is written
to a text file using 'write.table' command.

7. After running the script, use a command something like following to look into the tidy data
created by this script:
##data <- read.table("Human_Act_Rec_Data_Summary.txt", colClasses = "character", header = TRUE)

