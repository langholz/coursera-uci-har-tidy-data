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
| activityName                            | chr         | "LAYING" "LAYING" "LAYING" "LAYING" ...          |
| subjectIdentifier                       | int         | 1 2 3 4 5 6 7 8 9 10 ...                         |
| tBodyAccMeanXAverage                    | num         | 0.222 0.281 0.276 0.264 0.278 ...                |
| tBodyAccMeanYAverage                    | num         | -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...        |
| tBodyAccMeanZAverage                    | num         | -0.113 -0.107 -0.101 -0.111 -0.108 ...           |
| tBodyAccStdXAverage                     | num         | -0.928 -0.974 -0.983 -0.954 -0.966 ...           |
| tBodyAccStdYAverage                     | num         | -0.837 -0.98 -0.962 -0.942 -0.969 ...            |
| tBodyAccStdZAverage                     | num         | -0.826 -0.984 -0.964 -0.963 -0.969 ...           |
| tGravityAccMeanXAverage                 | num         | -0.249 -0.51 -0.242 -0.421 -0.483 ...            |
| tGravityAccMeanYAverage                 | num         | 0.706 0.753 0.837 0.915 0.955 ...                |
| tGravityAccMeanZAverage                 | num         | 0.446 0.647 0.489 0.342 0.264 ...                |
| tGravityAccStdXAverage                  | num         | -0.897 -0.959 -0.983 -0.921 -0.946 ...           |
| tGravityAccStdYAverage                  | num         | -0.908 -0.988 -0.981 -0.97 -0.986 ...            |
| tGravityAccStdZAverage                  | num         | -0.852 -0.984 -0.965 -0.976 -0.977 ...           |
| tBodyAccJerkMeanXAverage                | num         | 0.0811 0.0826 0.077 0.0934 0.0848 ...            |
| tBodyAccJerkMeanYAverage                | num         | 0.00384 0.01225 0.0138 0.00693 0.00747 ...       |
| tBodyAccJerkMeanZAverage                | num         | 0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...   |
| tBodyAccJerkStdXAverage                 | num         | -0.958 -0.986 -0.981 -0.978 -0.983 ...           |
| tBodyAccJerkStdYAverage                 | num         | -0.924 -0.983 -0.969 -0.942 -0.965 ...           |
| tBodyAccJerkStdZAverage                 | num         | -0.955 -0.988 -0.982 -0.979 -0.985 ...           |
| tBodyGyroMeanXAverage                   | num         | -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ... |
| tBodyGyroMeanYAverage                   | num         | -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...       |
| tBodyGyroMeanZAverage                   | num         | 0.149 0.145 0.138 0.17 0.16 ...                  |
| tBodyGyroStdXAverage                    | num         | -0.874 -0.988 -0.975 -0.973 -0.979 ...           |
| tBodyGyroStdYAverage                    | num         | -0.951 -0.982 -0.977 -0.961 -0.977 ...           |
| tBodyGyroStdZAverage                    | num         | -0.908 -0.96 -0.964 -0.962 -0.961 ...            |
| tBodyGyroJerkMeanXAverage               | num         | -0.107 -0.102 -0.1 -0.105 -0.102 ...             |
| tBodyGyroJerkMeanYAverage               | num         | -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...       |
| tBodyGyroJerkMeanZAverage               | num         | -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...      |
| tBodyGyroJerkStdXAverage                | num         | -0.919 -0.993 -0.98 -0.975 -0.983 ...            |
| tBodyGyroJerkStdYAverage                | num         | -0.968 -0.99 -0.987 -0.987 -0.984 ...            |
| tBodyGyroJerkStdZAverage                | num         | -0.958 -0.988 -0.983 -0.984 -0.99 ...            |
| tBodyAccMagMeanAverage                  | num         | -0.842 -0.977 -0.973 -0.955 -0.967 ...           |
| tBodyAccMagStdAverage                   | num         | -0.795 -0.973 -0.964 -0.931 -0.959 ...           |
| tGravityAccMagMeanAverage               | num         | -0.842 -0.977 -0.973 -0.955 -0.967 ...           |
| tGravityAccMagStdAverage                | num         | -0.795 -0.973 -0.964 -0.931 -0.959 ...           |
| tBodyAccJerkMagMeanAverage              | num         | -0.954 -0.988 -0.979 -0.97 -0.98 ...             |
| tBodyAccJerkMagStdAverage               | num         | -0.928 -0.986 -0.976 -0.961 -0.977 ...           |
| tBodyGyroMagMeanAverage                 | num         | -0.875 -0.95 -0.952 -0.93 -0.947 ...             |
| tBodyGyroMagStdAverage                  | num         | -0.819 -0.961 -0.954 -0.947 -0.958 ...           |
| tBodyGyroJerkMagMeanAverage             | num         | -0.963 -0.992 -0.987 -0.985 -0.986 ...           |
| tBodyGyroJerkMagStdAverage              | num         | -0.936 -0.99 -0.983 -0.983 -0.984 ...            |
| fBodyAccMeanXAverage                    | num         | -0.939 -0.977 -0.981 -0.959 -0.969 ...           |
| fBodyAccMeanYAverage                    | num         | -0.867 -0.98 -0.961 -0.939 -0.965 ...            |
| fBodyAccMeanZAverage                    | num         | -0.883 -0.984 -0.968 -0.968 -0.977 ...           |
| fBodyAccStdXAverage                     | num         | -0.924 -0.973 -0.984 -0.952 -0.965 ...           |
| fBodyAccStdYAverage                     | num         | -0.834 -0.981 -0.964 -0.946 -0.973 ...           |
| fBodyAccStdZAverage                     | num         | -0.813 -0.985 -0.963 -0.962 -0.966 ...           |
| fBodyAccmeanFreqXAverage                | num         | -0.159 -0.146 -0.074 -0.274 -0.136 ...           |
| fBodyAccmeanFreqYAverage                | num         | 0.0975 0.2573 0.2385 0.3662 0.4665 ...           |
| fBodyAccmeanFreqZAverage                | num         | 0.0894 0.4025 0.217 0.2013 0.1323 ...            |
| fBodyAccJerkMeanXAverage                | num         | -0.957 -0.986 -0.981 -0.979 -0.983 ...           |
| fBodyAccJerkMeanYAverage                | num         | -0.922 -0.983 -0.969 -0.944 -0.965 ...           |
| fBodyAccJerkMeanZAverage                | num         | -0.948 -0.986 -0.979 -0.975 -0.983 ...           |
| fBodyAccJerkStdXAverage                 | num         | -0.964 -0.987 -0.983 -0.98 -0.986 ...            |
| fBodyAccJerkStdYAverage                 | num         | -0.932 -0.985 -0.971 -0.944 -0.966 ...           |
| fBodyAccJerkStdZAverage                 | num         | -0.961 -0.989 -0.984 -0.98 -0.986 ...            |
| fBodyAccJerkmeanFreqXAverage            | num         | 0.132 0.16 0.176 0.182 0.24 ...                  |
| fBodyAccJerkmeanFreqYAverage            | num         | 0.0245 0.1212 -0.0132 0.0987 0.1957 ...          |
| fBodyAccJerkmeanFreqZAverage            | num         | 0.0244 0.1906 0.0448 0.077 0.0917 ...            |
| fBodyGyroMeanXAverage                   | num         | -0.85 -0.986 -0.97 -0.967 -0.976 ...             |
| fBodyGyroMeanYAverage                   | num         | -0.952 -0.983 -0.978 -0.972 -0.978 ...           |
| fBodyGyroMeanZAverage                   | num         | -0.909 -0.963 -0.962 -0.961 -0.963 ...           |
| fBodyGyroStdXAverage                    | num         | -0.882 -0.989 -0.976 -0.975 -0.981 ...           |
| fBodyGyroStdYAverage                    | num         | -0.951 -0.982 -0.977 -0.956 -0.977 ...           |
| fBodyGyroStdZAverage                    | num         | -0.917 -0.963 -0.967 -0.966 -0.963 ...           |
| fBodyGyromeanFreqXAverage               | num         | -0.00355 0.10261 -0.08222 -0.06609 -0.02272 ...  |
| fBodyGyromeanFreqYAverage               | num         | -0.0915 0.0423 -0.0267 -0.5269 0.0681 ...        |
| fBodyGyromeanFreqZAverage               | num         | 0.0105 0.0553 0.1477 0.1529 0.0414 ...           |
| fBodyAccMagMeanAverage                  | num         | -0.862 -0.975 -0.966 -0.939 -0.962 ...           |
| fBodyAccMagStdAverage                   | num         | -0.798 -0.975 -0.968 -0.937 -0.963 ...           |
| fBodyAccMagmeanFreqAverage              | num         | 0.0864 0.2663 0.237 0.2417 0.292 ...             |
| fBodyBodyAccJerkMagMeanAverage          | num         | -0.933 -0.985 -0.976 -0.962 -0.977 ...           |
| fBodyBodyAccJerkMagStdAverage           | num         | -0.922 -0.985 -0.975 -0.958 -0.976 ...           |
| fBodyBodyAccJerkMagmeanFreqAverage      | num         | 0.266 0.342 0.239 0.274 0.197 ...                |
| fBodyBodyGyroMagMeanAverage             | num         | -0.862 -0.972 -0.965 -0.962 -0.968 ...           |
| fBodyBodyGyroMagStdAverage              | num         | -0.824 -0.961 -0.955 -0.947 -0.959 ...           |
| fBodyBodyGyroMagmeanFreqAverage         | num         | -0.1398 0.0186 -0.0229 -0.2599 0.1024 ...        |
| fBodyBodyGyroJerkMagMeanAverage         | num         | -0.942 -0.99 -0.984 -0.984 -0.985 ...            |
| fBodyBodyGyroJerkMagStdAverage          | num         | -0.933 -0.989 -0.983 -0.983 -0.983 ...           |
| fBodyBodyGyroJerkMagmeanFreqAverage     | num         | 0.1765 0.2648 0.1107 0.2029 0.0247 ...           |
| angletBodyAccMeangravityAverage         | num         | 0.02137 0.00579 0.0179 -0.00236 0.02121 ...      |
| angletBodyAccJerkMeangravityMeanAverage | num         | 0.00306 -0.00636 0.01665 -0.0155 0.05536 ...     |
| angletBodyGyroMeangravityMeanAverage    | num         | -0.00167 0.06529 0.04559 0.00713 -0.00581 ...    |
| angletBodyGyroJerkMeangravityMeanAverage| num         | 0.0844 -0.0294 0.0317 0.0367 -0.0344 ...         |
| angleXgravityMeanAverage                | num         | 0.427 0.617 0.424 0.553 0.599 ...                |
| angleYgravityMeanAverage                | num         | -0.52 -0.52 -0.63 -0.763 -0.825 ...              |
| angleZgravityMeanAverage                | num         | -0.352 -0.479 -0.346 -0.23 -0.168 ...            |


