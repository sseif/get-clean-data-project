Human Activity Recognition Using Smartphones Data set - A processed version

#####Experiment description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#####Original data
Each record consists of:

1. A 561-feature vector with time and frequency domain variables. 

2. Its activity label. 

3. An identifier of the subject who carried out the experiment.

#####Processing
The original data was processed as follows:

1. The training 561-feature vectors were extended by that of the test vectors.

2. The subject IDs of the training data set were extended by that of the test data set.

3. The activity labels of the training data set were extended by that of the test data set.

4. All the of the data frames in 1, 2 & 3 were column bind to form an intermediate data frame.

5. Only the mean and the standard deviation variables were extracted from the newly formed 561-feature vector.

6. The activity labels were replaced by their more descriptive strings, for example: 1 is replaced by 'WALKING'.

7. Finally, the processed data set was created by getting the average of each variable in the 561-feature vector for each activity and each subject.

#####Processed data
Each record consists of:

1. The average values of the mean and the standard deviation measurements of the 561-feature vector in the original data. 

2. Its activity label. 

3. An identifier of the subject who carried out the experiment.

#####Variables

######subject_id
* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
The ID of the subject undergoing the experiment.

* Variable type

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Integer

* Allowable values

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
1:30

######activity
* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
The description of the activity performed in the experiment.

* Variable type

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Character

* Allowable values

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
["WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "LAYING", "STANDING"]

######Mean(...)
* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'Mean()' is used to indicate the mean value of variable between the braces.

* Variable type

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Numeric

###### ...-XYZ
* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

###### ...-mean())

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'-mean()' is used to denote the mean value of the variable before '-'.

###### ...-std())

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'std()' is used to denote the standard deviation of the variable before '-'.

######t...
* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
't...' prefix is used to denote a time domain variable.

######f...
* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'f...' prefix is used to denote a frequency domain variable.

###### ..BodyAcc-...

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'BodyAcc' is used to denote a body acceleration signal.

###### ..GravityAcc-...

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'GravityAcc' is used to denote a gravity acceleration signal.

###### ..Gyro-...

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'Gyro' is used to denote a gyroscope signal.

###### ..Jerk-...

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'Jerk' is used to denote a Jerk signal.

###### ..Mag-...

* Variable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
'Mag' is used to indicate that the magnitude of the three-dimensional signals were calculated using the Euclidean norm.