---
title: "Review_README"
---

Per the forum entry

https://class.coursera.org/exdata-005/forum/thread?thread_id=45

we have the option to include a fifth R script to load the data and filter the dates selected, where the rest of the R scripts are just to produce the plots.

For this project, "prepdata.R" is used to load the power consumption data from "household_power_consumption.txt", filter for the dates required and then save the data subset to "filtered_data.txt".  All of the plot scripts then read this file to obtain the data used for plotting.

The benefit is far faster execution since the 133 MB original file only needs to be manipulated once.  Executing "prepdata.R" takes 19.3 seconds so having the plot scripts work only with the subset saved a lot of time when developing and troubleshooting the scripts.