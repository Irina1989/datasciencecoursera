---
title: "README"
author: "Irina"
date: "22. November 2015"
output: html_document
---

A brief explanation on what the run_analysis.R file does:

The script assumes that the data is in the same directory (with sub directories /test and /train).

First, the subject, activity and measurements for these 
for both test and train data are loaded.

Next, the coding of activities 1-6 is changed to 
labels provided in the activity_labels file.

The columns of subject and activities are then named accordingly for better understanding.

Then, the labels of the features are extracted and filtered on labels only containing "mean" or "std".
The measurement files (x_data) are then filtered by these columns only.

In a next step, subject, activity and measurements for both test and train data are binded together and finally merged to one complete data set.

As a final step, a tidy data set is computed 
by taking the average for all subjects and activities of all measurements and is saved as tidy_data.txt.
