if (!("getopt" %in% rownames(installed.packages())) ) { install.packages("getopt") }
if (!("httr" %in% rownames(installed.packages())) ) { install.packages("httr") }
if (!("tools" %in% rownames(installed.packages())) ) { install.packages("tools") }
if (!("utils" %in% rownames(installed.packages())) ) { install.packages("utils") }
if (!("downloader" %in% rownames(installed.packages())) ) { install.packages("downloader") }
if (!("plyr" %in% rownames(installed.packages())) ) { install.packages("plyr") }

library(getopt)
library(httr)
library(tools)
library(utils)
library(downloader)
library(plyr)

## Retrieve the current script path
args <- commandArgs(trailingOnly = F)
scriptPath <- dirname(sub("--file=", "", args[grep("--file", args)]))

## Set default global values
dataDirectory <- file.path(scriptPath, "data")
verbose <- F

parseArguments <- function () {
    spec <- matrix(c(
        "resource"  , "r", 1, "character", "local path or url to the data set (optional)",
        "out"       , "o", 1, "character", "output filename. If empty string \"\" it prints to console (optional)",
        "verbose"   , "v", 0, "logical"  , "print out verbose information during analysis (optional)",
        "help"      , "h", 0, "logical"  , "this help"
    ),
    ncol = 5,
    byrow = T)
    
    ## Read arguments and validate required
    opt <- getopt(spec)
    if (!is.null(opt$help)) {
        cat(paste(getopt(spec, usage = T),"\n"))
        opt <- NULL
    }
    
    ## Initialize optional values
    if (is.null(opt$resource)) { opt$resource <- file.path(dataDirectory, "UCI HAR Dataset") }
    if (is.null(opt$out)) { opt$out <- file.path(dataDirectory, "tidy.txt") }
    if (!is.null(opt$verbose)) { verbose <<- opt$verbose }
    opt
}

setupResource <- function (resource) {
    setupDataDirectory()
    path <- downloadDataSetIfUrl(resource)
    path <- extractDataSetIfCompressed(path)
    files <- list.files(path = path, recursive = T)
    files <- vapply(files, function (file) { file.path(path, file) }, FUN.VALUE = character(1))
    files
}

setupDataDirectory <- function () {
    if (!file.exists(dataDirectory)) {
        if (verbose) { message("Creating data directory '", dataDirectory, "'") }
        dir.create(dataDirectory, showWarnings = F)
    }
}

downloadDataSetIfUrl <- function (resource) {
    url <- parse_url(resource)
    path <- resource
    if (!is.null(url$scheme)) {
        path <- file.path(dataDirectory, basename(url$path))
        if (verbose) { message("Downloading '", resource, "' to '", path,"'") }
        download(resource,  path, mode = "wb")
    }
    
    path
}

extractDataSetIfCompressed <- function (dataSetPath) {
    path <- NULL
    if (file.exists(dataSetPath)) {
        fileExtension <- tolower(file_ext(dataSetPath))
        if (fileExtension == "zip") {
            if (verbose) { message("Extracting '", dataSetPath, "' to '", dataDirectory, "'")}
            files <- unzip(dataSetPath, exdir = dataDirectory)
            path <- dataDirectory
        } else if (fileExtension == "") {
            if (file.info(dataSetPath)$isdir) { path <- dataSetPath }
            else { stop("Resource '", dataSetPath, "' is not a directory") }
        } else { stop("Unable to handle file extension for  '", dataSetPath, "'") }
    } else { stop("Resource '", dataSetPath, "' does not exist") }
    
    path
}

findFileInFiles <- function (fileName, files) {
    matching <- grepl(paste0("/", fileName, "$"), files)
    matchingFiles <- sum(matching)
    if (matchingFiles != 1) { stop("Found ", matchingFiles, " '", fileName, "' files") }
    files[matching]
}

readDataSet <- function (type, files) {
    subjectsFileName <- paste0("subject_", type, ".txt")
    subjectsFilePath <- findFileInFiles(subjectsFileName, files)
    
    labelsFileName <- paste0("y_", type, ".txt")
    labelsFilePath <- findFileInFiles(labelsFileName, files)
    
    featuresFileName <- paste0("X_", type, ".txt")
    featuresFilePath <- findFileInFiles(featuresFileName, files)
    
    if (verbose) { message("Reading subjects file: '", subjectsFilePath, "'") }
    subjects <- read.table(subjectsFilePath)
    
    if (verbose) { message("Reading labels file: '", labelsFilePath, "'") }
    labels <- read.table(labelsFilePath)
    
    if (verbose) { message("Reading features file: '", featuresFilePath, "'") }
    features <- read.table(featuresFilePath)

    if (verbose) { message("Merging '", type, "' data") }
    dataSet <- cbind(subjects, labels, features)
}

readTrainDataSet <- function (files) {
    train <- readDataSet("train", files)
    train
}

readTestDataSet <- function (files) {
    test <- readDataSet("test", files)
    test
}

readActivityLabels <- function (files) {
    activityLabelsPath <- findFileInFiles("activity_labels.txt", files)
    if (verbose) { message("Reading activity labels '", activityLabelsPath, "'") }
    activityLabels <- read.table(activityLabelsPath, col.names = c("activityIdentifier", "activityName"))
    activityLabels
}

readFeatureNames <- function (files) {
    featureNamesPath <- findFileInFiles("features.txt", files)
    if (verbose) { message("Reading feature names '", featureNamesPath, "'") }
    featureNames <- read.table(featureNamesPath, col.names = c("featureIdentifier", "featureName"))
    featureNames
}

mergeDataSets <- function (files) {
    train <- readTrainDataSet(files)
    test <- readTestDataSet(files)
    
    if (verbose) { message("Merging train and test data") }
    dataSet <- rbind(train, test)

    featureNames <- as.character(readFeatureNames(files)[, 2])
    colnames(dataSet) <- c("subjectIdentifier", "labelIdentifier", featureNames)
    dataSet
}

filterFeatureColumns <- function (dataSet) {
    columnNames <- colnames(dataSet)
    featureNames <- columnNames[3:length(columnNames)]
    
    ## Remove feature columns which are not mean or std()
    if (verbose) { message("Filtering feature columns that do not contain mean or std() in name") }
    pattern <- "(mean|std\\(\\))"
    validFeatures <- grepl(pattern, featureNames, ignore.case = T)
    dataSet <- dataSet[, c(c(T, T), validFeatures)]
    dataSet
}

replaceActivityIdentifiersWithNames <- function (dataSet, files) {
    activityLabels <- readActivityLabels(files)
    
    if (verbose) { message("Replacing activity identifiers with names") }
    mergedDataSet <- merge(dataSet, activityLabels, by.x = "labelIdentifier", by.y = "activityIdentifier", all = T)
    mergedDataSet <- mergedDataSet[, !(names(mergedDataSet) %in% c("activityIdentifier", "labelIdentifier"))]
    mergedDataSet
}

createTidyDataSet <- function (dataSet) {
    if (verbose) { message("Creating the tidy data set with the average of each variable for each activity and each subject") }
    tidyDataSet <- ddply(dataSet, .(activityName, subjectIdentifier), numcolwise(mean))
    
    ## Rename the column feature names to make them readable and reflect the current value
    columnNames <- tolower(colnames(tidyDataSet))
    normalizedFeatureNames <- gsub("(mean\\(\\))", "mean", columnNames[3:length(columnNames)])
    normalizedFeatureNames <- gsub("(std\\(\\))", "std", normalizedFeatureNames)
    normalizedFeatureNames <- gsub("(\\(|\\)|-|,|_)", "", normalizedFeatureNames)
    
    normalizedFeatureNames <- vapply(normalizedFeatureNames, function (name) { paste0(name, "average") }, FUN.VALUE = character(1))
    colnames(tidyDataSet) <- c(columnNames[1:2], normalizedFeatureNames)
    tidyDataSet
}

main <- function () {
    opt <- parseArguments()
    if (!is.null(opt)) {
        files <- setupResource(opt$resource)
        dataSet <- mergeDataSets(files)
        dataSet <- filterFeatureColumns(dataSet)
        dataSet <- replaceActivityIdentifiersWithNames(dataSet, files)
        tidyDataSet <- createTidyDataSet(dataSet)
        write.table(tidyDataSet, file = opt$out, row.names = F)
    }
    
    quit(status = 0)
}

main()
