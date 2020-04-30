####################
#
# This file documents the JHU "Getting and Cleaning Data" project,
# including downloading, wrangling, and tidying the data.
#
####################
library(dplyr)
library(tidyr)

# Get the data set (download, unzip)
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
destfile <- "uci_har_dataset.zip"
method <- "curl"
download.file(url, destfile = destfile, method = method)
unzip(destfile)

# rename directory
file.rename("UCI HAR Dataset", "dataset")

# change working directory
setwd("./dataset")

act_labels <- read.table("activity_labels.txt", stringsAsFactors = T, 
                         row.names = 1)
colnames(act_labels) <- "activity"

features <- read.table("features.txt", stringsAsFactors = T, 
                       row.names = 1)
colnames(features) <- "feature"

# Merge train and test files, by type, and add column names
subj_trn <- read.table("./train/subject_train.txt")
subj_tst <- read.table("./test/subject_test.txt")
subj <- rbind(subj_trn, subj_tst)
colnames(subj) <- "subject"

y_trn <- read.table("./train/y_train.txt")
y_tst <- read.table("./test/y_test.txt")
y <- rbind(y_trn, y_tst)
colnames(y) <- "activity"

x_trn <- read.table("./train/X_train.txt")
x_tst <- read.table("./test/X_test.txt")
x <- rbind(x_trn, x_tst)
colnames(x) <- features$feature

# retain only columns with mean and standard deviation
x <- x[,grepl("mean[()]+|std",colnames(x))]

# preserve order of observations, for use as a later time index
orig_order <- as.numeric(rownames(y))

# combine files into one table
tds <- cbind(subj, y, orig_order, x)

# convert activity from integer to factor
old_activity <- tds$activity
activity <- sapply(old_activity, function(x){act_labels$activity[x]})
tds$activity <- activity

# create variable to preserve order of observations by subject
tds <- tds %>% 
  group_by(subject) %>%
  mutate(subj_order = dense_rank(orig_order)) %>%
  ungroup()
tds <- tds %>%
  select(subject, activity, orig_order, subj_order, everything())

# tidy up the data to put all values in one column, tagged by measurement type
long_tds <- tds %>%
  pivot_longer(cols = 5:70, names_to = "measure", values_to = "value")

# output the data set to a local file
write.csv(long_tds, "./long_data.csv", row.names = FALSE)

# summarize the data from above, 
# showing the average of each measure, by subject and activity
summary_tds <- long_tds %>%
  group_by(subject, activity, measure) %>%
  summarize(average_value = mean(value))

# write summarized data table to a local file
write.csv(summary_tds, "tidy_summarized_data.csv", row.names = FALSE)