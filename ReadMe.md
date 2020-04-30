---
title: "ReadMe"
author: "jbh"
date: "April 29, 2020"
output: html_document
---

# Critical background information

The dataset contains observations taken from wearable technology (accelerometer and gyroscope in a cell phone) recorded while 30 human subjects performed six distinct physical activities.

# Getting and Cleaning Data project ReadMe

This document accompanies my submission for Week 4, Getting and Cleaning Data, of the Johns Hopkins University Data Science Certification Coursera course. 

This code repository contains the following files:
* ReadMe.md - this document
* run_analysis.r - R code file; from download to output 
* CodeBook.md - a guide to the datasets output by the .r file
* long_data.csv - the first output file - a merged, tidy data set
* tidy_summarized_data.csv - the second output file; a summary of long_data.csv

## What you need:
* A computer with R installed
* An active internet connection

## What the program does:
1. Downloads a zipped data file from a given url.
2. Unzips this file, which includes the following:
  + README.txt describing the experiment and data
  + Two "feature" files that describe and name the data fields
  + A list of six activities subjects conducted (e.g., WALKING)
  + Two directories - train and test
  + In each directory, three files subj_, x_, and y_ and another folder containing the raw data called "Inertial Signals"
3. Merges the train and test files (in that order) of similar names, i.e., subj_train.txt and subj_test.txt.
4. Combines these into a single data frame containing the subject id ("subject"), the activity type (from the y_file), and the 561 different feature measurements listed in features.txt.  Per the assignment instructions, only variable names with "mean()" and "std()" are retained from these features, leaving 66 variables.
5. Transforms the activity from integer to a string to make it explicitly a categorical variable.
6. Adds a varible "orig_order" to maintain the sequence in which the lines of data were obtained.  This is important as some of the data represents time series.
7. Creates a subsequence of "orig_order" for each group of subject and activity.
8. Transforms the data to long format, adding "measure" and "value", where "measure" contains the former column names (66 features), and "value" contains the numeric values.
9. Outputs the above file to "long_data.csv"
10. Summarizes the data in "long_data.csv", providing the mean of each measure (feature) by subject and activity.
11. Outputs "tidy_summarized_data.csv"

# Recommended:

- Read "features_info.txt" for additional information about the original experiement and data set.
- See CodeBook.md for additional information on the newly produced data sets.

# *The code does not clean up behind itself!*

Clean up your files when no longer needed!
