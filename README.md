# Getting and Cleaning Data - Course Project

## Details
As part of the [Coursera and Johns Hopkins University Data Science specialization](https://www.coursera.org/specialization/jhudatascience/1/overview) - Getting and Cleaning Data course this addresses the requirement to deliver the suggested course project. This repository uses the [UCI Human Activity Recognition Using Smartphones data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to retrieve, clean and create a tidy data set which has the characteristics defined in its correpsonding [Codebook](./Codebook.md).

The script does the following:

1. Merges the subjects, features and labels for both the training and test sets.
2. Filters out features to have only the measurements on the mean and standard deviation for each measurement.
3. Replaces activity identifiers with descriptive activity names.
4. Updates column names to provide representative names.
5. Computes the average of each variable for each activity and each subject.
6. Writes the tidy data set without row names (to read make sure you do `d <- read.table("data/tidy.txt", stringsAsFactors = F, header = T)`)

## Usage
By default, the [script](./run_analysis.R) reads the extracted data set located within the [data/UCI HAR Dataset](./data/UCI HAR Dataset) directory and performs the corresponding cleaning and creation of the [tidy data set](./data/tidy.txt).
The script automatcially installs any package dependencies and loads them whenever needed.

```
rscript run_analysis.R
```

### Script options
```
Usage: run_analysis.R [-[-resource|r] <character>] [-[-out|o] <character>] [-[-verbose|v]] [-[-help|h]]
    -r|--resource    local path or url to the data set (optional)
    -o|--out         output filename. If empty string "" it prints to console (optional)
    -v|--verbose     print out verbose information during analysis (optional)
    -h|--help        this help
```

Download, extract, perform analysis while providing verbose information and write the tidy data set to `./data.txt`
```
rscript run_analysis.R -v -r "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" -o "./data.txt"
```

Extract, perform analysis and write the tidy data set to the console
```
rscript run_analysis.R -r "data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" -o ""
```

Perform analysis on local directory and and write the tidy data set to `./data/tidy.txt`
```
rscript run_analysis.R -r data/UCI\ HAR\ Dataset/
```

### Notes:
* This script has currently only been tested on Mac OS X.
