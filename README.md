---
title: "Getting and Cleaning Data Course Project"
author: "Kirill Romanov"
date: "20/11/2016"
output:
  html_document:
    keep_md: yes
---

## Project Description
-The purpose of this project is to  merge, clean and transform data set which consists of different raw files. 
-These files contain data about Human activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) collected by smartphone (Samsung Galaxy S II). 
-The goal is to prepare one file with tidy data that can be used for later analysis

##Notes
- Only vaiables containing mean() & std() are used.
- Requires the data.table & reshape2 packages.

Constructed using the following:

platform       x86_64-w64-mingw32
arch           x86_64
os             mingw32
system         x86_64, mingw3
status
major          3
minor          3.1
year           2016
month          06
day            21
svn rev        70800
language       R
version.string R version 3.3.1 (2016-06-21)

##How to get tudy data

Please run run_analysis.R

##Output

File tdata.txt
