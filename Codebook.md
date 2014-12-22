# Codebook

## Initial data set variables
For more specific details on the raw data set see [README.txt](./data/UCI HAR Dataset/README.txt).
### [features.txt](./data/UCI HAR Dataset/features.txt): List of all features.
'data.frame': 561 obs. of  2 variables:

| Column Name       | Column Type          | Example values                                     |
|-------------------|----------------------|----------------------------------------------------|
| featureIdentifier | int                  | 1 2 3 4 5 6 7 8 9 10 ...                           |
| featureName       | chr                  | "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" ...        |

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

### [activity_labels.txt](./data/UCI HAR Dataset/activity_labels.txt): Links the class labels with their activity name.
'data.frame': 6 obs. of  2 variables:

| Column Name        | Column Type | Example values                                                                  |
|--------------------|-------------|---------------------------------------------------------------------------------|
| activityIdentifier | int         | 1 2 3 4 5 6                                                                     |
| activityName       | chr         | "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING" "LAYING" |

### [train/X_train.txt](./data/UCI HAR Dataset/train/X_train.txt): Training set.
'data.frame': 7352 obs. of  561 variables:

| Column Name | Column Type | Example values                              |
|-------------|-------------|---------------------------------------------|
| V1          | int         | 0.289 0.278 0.28 0.279 0.277 ...            |
| V2          | int         | -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ... |
| ...         | int         | ...                                         |

### [train/y_train.txt](./data/UCI HAR Dataset/train/y_train.txt): Training labels.
'data.frame': 7352 obs. of  1 variable:

| Column Name        | Column Type | Example values          |
|--------------------|-------------|-------------------------|
| activityIdentifier | int         | 5 5 5 5 5 5 5 5 5 5 ... |

### [train/subject_train.txt](./data/UCI HAR Dataset/train/subject_train.txt): Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
'data.frame': 7352 obs. of  1 variable:

| Column Name | Column Type | Example values          |
|-------------|-------------|-------------------------|
| V1          | int         | 1 1 1 1 1 1 1 1 1 1 ... |

### [test/X_test.txt](./data/UCI HAR Dataset/test/X_test.txt): Test set.
'data.frame': 2947 obs. of  561 variables:

| Column Name | Column Type | Example values                              |
|-------------|-------------|---------------------------------------------|
| V1          | int         | 0.257 0.286 0.275 0.27 0.275 ...            |
| V2          | int         | -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ... |
| ...         | int         | ...                                         |

### [test/y_test.txt](./data/UCI HAR Dataset/test/y_test.txt): Test labels.
'data.frame': 2947 obs. of  1 variable:

| Column Name        | Column Type | Example values          |
|--------------------|-------------|-------------------------|
| activityIdentifier | int         | 5 5 5 5 5 5 5 5 5 5 ... |

### [test/subject_test.txt](./data/UCI HAR Dataset/test/subject_test.txt): Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
'data.frame': 2947 obs. of  1 variable:

| Column Name | Column Type | Example values          |
|-------------|-------------|-------------------------|
| V1          | int         | 2 2 2 2 2 2 2 2 2 2 ... |


## Data processing

1. Merge the subjects, features and labels for both the training and test sets.
2. Filter out features to have only the measurements on the mean and standard deviation for each measurement.
3. Replace activity identifiers with descriptive activity names.
4. Update column names to provide representative names.
5. Computes the average of each variable for each activity and each subject.

## Tidy data set variables
'data.frame': 180 obs. of  88 variables:

| Column Name                             | Column Type | Example values                                   |
|-----------------------------------------|-------------|--------------------------------------------------|
| activityname                            | chr         | "LAYING" "LAYING" "LAYING" "LAYING" ...          |
| subjectidentifier                       | int         | 1 2 3 4 5 6 7 8 9 10 ...                         |
| tbodyaccmeanxaverage                    | num         | 0.222 0.281 0.276 0.264 0.278 ...                |
| tbodyaccmeanyaverage                    | num         | -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...        |
| tbodyaccmeanzaverage                    | num         | -0.113 -0.107 -0.101 -0.111 -0.108 ...           |
| tbodyaccstdxaverage                     | num         | -0.928 -0.974 -0.983 -0.954 -0.966 ...           |
| tbodyaccstdyaverage                     | num         | -0.837 -0.98 -0.962 -0.942 -0.969 ...            |
| tbodyaccstdzaverage                     | num         | -0.826 -0.984 -0.964 -0.963 -0.969 ...           |
| tgravityaccmeanxaverage                 | num         | -0.249 -0.51 -0.242 -0.421 -0.483 ...            |
| tgravityaccmeanyaverage                 | num         | 0.706 0.753 0.837 0.915 0.955 ...                |
| tgravityaccmeanzaverage                 | num         | 0.446 0.647 0.489 0.342 0.264 ...                |
| tgravityaccstdxaverage                  | num         | -0.897 -0.959 -0.983 -0.921 -0.946 ...           |
| tgravityaccstdyaverage                  | num         | -0.908 -0.988 -0.981 -0.97 -0.986 ...            |
| tgravityaccstdzaverage                  | num         | -0.852 -0.984 -0.965 -0.976 -0.977 ...           |
| tbodyaccjerkmeanxaverage                | num         | 0.0811 0.0826 0.077 0.0934 0.0848 ...            |
| tbodyaccjerkmeanyaverage                | num         | 0.00384 0.01225 0.0138 0.00693 0.00747 ...       |
| tbodyaccjerkmeanzaverage                | num         | 0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...   |
| tbodyaccjerkstdxaverage                 | num         | -0.958 -0.986 -0.981 -0.978 -0.983 ...           |
| tbodyaccjerkstdyaverage                 | num         | -0.924 -0.983 -0.969 -0.942 -0.965 ...           |
| tbodyaccjerkstdzaverage                 | num         | -0.955 -0.988 -0.982 -0.979 -0.985 ...           |
| tbodygyromeanxaverage                   | num         | -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ... |
| tbodygyromeanyaverage                   | num         | -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...       |
| tbodygyromeanzaverage                   | num         | 0.149 0.145 0.138 0.17 0.16 ...                  |
| tbodygyrostdxaverage                    | num         | -0.874 -0.988 -0.975 -0.973 -0.979 ...           |
| tbodygyrostdyaverage                    | num         | -0.951 -0.982 -0.977 -0.961 -0.977 ...           |
| tbodygyrostdzaverage                    | num         | -0.908 -0.96 -0.964 -0.962 -0.961 ...            |
| tbodygyrojerkmeanxaverage               | num         | -0.107 -0.102 -0.1 -0.105 -0.102 ...             |
| tbodygyrojerkmeanyaverage               | num         | -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...       |
| tbodygyrojerkmeanzaverage               | num         | -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...      |
| tbodygyrojerkstdxaverage                | num         | -0.919 -0.993 -0.98 -0.975 -0.983 ...            |
| tbodygyrojerkstdyaverage                | num         | -0.968 -0.99 -0.987 -0.987 -0.984 ...            |
| tbodygyrojerkstdzaverage                | num         | -0.958 -0.988 -0.983 -0.984 -0.99 ...            |
| tbodyaccmagmeanaverage                  | num         | -0.842 -0.977 -0.973 -0.955 -0.967 ...           |
| tbodyaccmagstdaverage                   | num         | -0.795 -0.973 -0.964 -0.931 -0.959 ...           |
| tgravityaccmagmeanaverage               | num         | -0.842 -0.977 -0.973 -0.955 -0.967 ...           |
| tgravityaccmagstdaverage                | num         | -0.795 -0.973 -0.964 -0.931 -0.959 ...           |
| tbodyaccjerkmagmeanaverage              | num         | -0.954 -0.988 -0.979 -0.97 -0.98 ...             |
| tbodyaccjerkmagstdaverage               | num         | -0.928 -0.986 -0.976 -0.961 -0.977 ...           |
| tbodygyromagmeanaverage                 | num         | -0.875 -0.95 -0.952 -0.93 -0.947 ...             |
| tbodygyromagstdaverage                  | num         | -0.819 -0.961 -0.954 -0.947 -0.958 ...           |
| tbodygyrojerkmagmeanaverage             | num         | -0.963 -0.992 -0.987 -0.985 -0.986 ...           |
| tbodygyrojerkmagstdaverage              | num         | -0.936 -0.99 -0.983 -0.983 -0.984 ...            |
| fbodyaccmeanxaverage                    | num         | -0.939 -0.977 -0.981 -0.959 -0.969 ...           |
| fbodyaccmeanyaverage                    | num         | -0.867 -0.98 -0.961 -0.939 -0.965 ...            |
| fbodyaccmeanzaverage                    | num         | -0.883 -0.984 -0.968 -0.968 -0.977 ...           |
| fbodyaccstdxaverage                     | num         | -0.924 -0.973 -0.984 -0.952 -0.965 ...           |
| fbodyaccstdyaverage                     | num         | -0.834 -0.981 -0.964 -0.946 -0.973 ...           |
| fbodyaccstdzaverage                     | num         | -0.813 -0.985 -0.963 -0.962 -0.966 ...           |
| fbodyaccmeanfreqxaverage                | num         | -0.159 -0.146 -0.074 -0.274 -0.136 ...           |
| fbodyaccmeanfreqyaverage                | num         | 0.0975 0.2573 0.2385 0.3662 0.4665 ...           |
| fbodyaccmeanfreqzaverage                | num         | 0.0894 0.4025 0.217 0.2013 0.1323 ...            |
| fbodyaccjerkmeanxaverage                | num         | -0.957 -0.986 -0.981 -0.979 -0.983 ...           |
| fbodyaccjerkmeanyaverage                | num         | -0.922 -0.983 -0.969 -0.944 -0.965 ...           |
| fbodyaccjerkmeanzaverage                | num         | -0.948 -0.986 -0.979 -0.975 -0.983 ...           |
| fbodyaccjerkstdxaverage                 | num         | -0.964 -0.987 -0.983 -0.98 -0.986 ...            |
| fbodyaccjerkstdyaverage                 | num         | -0.932 -0.985 -0.971 -0.944 -0.966 ...           |
| fbodyaccjerkstdzaverage                 | num         | -0.961 -0.989 -0.984 -0.98 -0.986 ...            |
| fbodyaccjerkmeanfreqxaverage            | num         | 0.132 0.16 0.176 0.182 0.24 ...                  |
| fbodyaccjerkmeanfreqyaverage            | num         | 0.0245 0.1212 -0.0132 0.0987 0.1957 ...          |
| fbodyaccjerkmeanfreqzaverage            | num         | 0.0244 0.1906 0.0448 0.077 0.0917 ...            |
| fbodygyromeanxaverage                   | num         | -0.85 -0.986 -0.97 -0.967 -0.976 ...             |
| fbodygyromeanyaverage                   | num         | -0.952 -0.983 -0.978 -0.972 -0.978 ...           |
| fbodygyromeanzaverage                   | num         | -0.909 -0.963 -0.962 -0.961 -0.963 ...           |
| fbodygyrostdxaverage                    | num         | -0.882 -0.989 -0.976 -0.975 -0.981 ...           |
| fbodygyrostdyaverage                    | num         | -0.951 -0.982 -0.977 -0.956 -0.977 ...           |
| fbodygyrostdzaverage                    | num         | -0.917 -0.963 -0.967 -0.966 -0.963 ...           |
| fbodygyromeanfreqxaverage               | num         | -0.00355 0.10261 -0.08222 -0.06609 -0.02272 ...  |
| fbodygyromeanfreqyaverage               | num         | -0.0915 0.0423 -0.0267 -0.5269 0.0681 ...        |
| fbodygyromeanfreqzaverage               | num         | 0.0105 0.0553 0.1477 0.1529 0.0414 ...           |
| fbodyaccmagmeanaverage                  | num         | -0.862 -0.975 -0.966 -0.939 -0.962 ...           |
| fbodyaccmagstdaverage                   | num         | -0.798 -0.975 -0.968 -0.937 -0.963 ...           |
| fbodyaccmagmeanfreqaverage              | num         | 0.0864 0.2663 0.237 0.2417 0.292 ...             |
| fbodybodyaccjerkmagmeanaverage          | num         | -0.933 -0.985 -0.976 -0.962 -0.977 ...           |
| fbodybodyaccjerkmagstdaverage           | num         | -0.922 -0.985 -0.975 -0.958 -0.976 ...           |
| fbodybodyaccjerkmagmeanfreqaverage      | num         | 0.266 0.342 0.239 0.274 0.197 ...                |
| fbodybodygyromagmeanaverage             | num         | -0.862 -0.972 -0.965 -0.962 -0.968 ...           |
| fbodybodygyromagstdaverage              | num         | -0.824 -0.961 -0.955 -0.947 -0.959 ...           |
| fbodybodygyromagmeanfreqaverage         | num         | -0.1398 0.0186 -0.0229 -0.2599 0.1024 ...        |
| fbodybodygyrojerkmagmeanaverage         | num         | -0.942 -0.99 -0.984 -0.984 -0.985 ...            |
| fbodybodygyrojerkmagstdaverage          | num         | -0.933 -0.989 -0.983 -0.983 -0.983 ...           |
| fbodybodygyrojerkmagmeanfreqaverage     | num         | 0.1765 0.2648 0.1107 0.2029 0.0247 ...           |
| angletbodyaccmeangravityaverage         | num         | 0.02137 0.00579 0.0179 -0.00236 0.02121 ...      |
| angletbodyaccjerkmeangravitymeanaverage | num         | 0.00306 -0.00636 0.01665 -0.0155 0.05536 ...     |
| angletbodygyromeangravitymeanaverage    | num         | -0.00167 0.06529 0.04559 0.00713 -0.00581 ...    |
| angletbodygyrojerkmeangravitymeanaverage| num         | 0.0844 -0.0294 0.0317 0.0367 -0.0344 ...         |
| anglexgravitymeanaverage                | num         | 0.427 0.617 0.424 0.553 0.599 ...                |
| angleygravitymeanaverage                | num         | -0.52 -0.52 -0.63 -0.763 -0.825 ...              |
| anglezgravitymeanaverage                | num         | -0.352 -0.479 -0.346 -0.23 -0.168 ...            |
