---
title: "CodeBook"
author: "jbh"
date: "April 29, 2020"
output: html_document
---

# Critical background information

The dataset contains observations taken from wearable technology (accelerometer and gyroscope in a cell phone) recorded while 30 human subjects performed six distinct physical activities.

# Overview

This CodeBook documents the two newly created datasets as part of this project. Some supplementary information may be found within the downloaded dataset after unzipping the file.  This document assumes access to that file.

This project uses two datasets in comma separated value (csv) files.  The files are long_data.csv and tidy_summarized_data.csv.

# Common variables

Many variables (column names) are common to both files:

### subject:

This variable is categorical, and uses the integers 1 to 30 as anonymous identification codes for the human subjects who volunteered for the underlying experiment that generated the data.

### activity:

This variable is categorical, and contains six physical activities the subjects may have been conducting at the time the observations were recorded.  These activites are:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### measure:

This variable is categorical.  It contains the names of 66 different observed or calculated measures or "features" (as listed in features.txt in the downloaded zip file). These measures follow a naming convention built up from the following codes:

1. Data type
- t  - time series 
- f  - frequency
2. Component
- Body
- Gravity
3. Data source
- Acc - accelerometer
- Gyro - gyroscope
4. Statistical type
- mean() - the arithmetic mean or average
- std() - the standard deviation
5. Directional component in three dimensional space (Optional)
- X - primary axis
- Y - secondary axis
- Z - tertiary axix
6. Optional terms
- Jerk - the physical term for the rate of change of acceleration
- Mag - the magnitude (size or length) [of a vector]

### orig_order:

This variable is ordinal, ranges from 1 to 10299, and simply represents the original order, based on the row in the file, when joining the downloaded files in the sequence of "_train.txt" then "_test.txt" with identical prefixes on the file names.

This variable serves to preserve the time series nature of the data, though explicit time stamps are not present.  See features_info.txt and the url for more information on the timing of observations.

### subj_order:

This variable is ordinal, ranges from 1 to 409, and follows the ordering of orig_order, but within subject and activity groups. For example, subject 1, while walking, has observations numbered from 1 to n in this variable, based on the value of orig_order.


# 