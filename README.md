README
================

The script is divided into 9 phases that will be consolidated the train
and test data and making different steps to make data tidy:

First Phase (Column names): call the column names In this initial part,
I will set the column names using the feature.txt making a vector and
setting in featnam.

Second Phase(Activity names): Call activity names Finalized the first
phase. I set the activity names using activity\_label.txt putting in a
vector and setting in actnames.

Third Phase(Test Data): Call the first set of data and put the column
names / set the y and subject test data. - In this phase, I will call
the test data using X\_test.txt in an expression call xtest - set the
column names of xtest with the vector featnam - call test/y\_test.txt in
setting in ytest and subject\_test.txt in stest and rename the column
name of y with idact and subject\_Test with subject.

Fourth Phase (Train Data): Call the second set of data and put the
column names / set the y and subject train data - In this phase, I will
call the train data using X\_train.txt in an expression call xtrain -
set the column names of xtrain with the vector featnam - call
y\_train.txt in setting in ytrain and subject\_train.txt in strain and
rename the column name of y with idact and subject\_Test with subject.

Fifth Phase (Get data together): Consolidate test and train data. -
First, use cbind to aggregate the subject and idact data. This new data
will call - datatest - datatrain - Use rbind to make a union the
datatest and datatrain, set in dataset

Sixth Phase(Extract measurements on the mean and std / descriptive
activity names): - I subset the columns that have in the final mean()
and str() with grep. - Merge dataset with actnames (the vector have the
names of the activities) - rename the column of the name of activities
to activity\_name

Seven Phase (Appropriately labels the data): - To have a better
descriptive labels eliminate the \_ and () of the column names

eighth Phase (Second independent Tidy Data): - Using group by (activity
and subject) apply summarize\_each get the mean of all the columns

ninth Phase (Create tidydata.txt): - Create a file with write.table
