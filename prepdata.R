# prepdata.R
#
# Purpose:  Opens the "individual household electric power
# consumption data set" provided by the course and subsets only
# observations occuring on 01-02 February 2007.  The data subset
# is saved to a text file for use by the plotting scripts.  Using
# this script to subset the data once makes executing the plotting
# scripts more efficient.  The subset data is saved as
# "filtered_data.txt" in the current working directory.
#
# Assumption:  The power consumption data has been unzipped to
# the current working directory and is named
# "household_power_consumption.txt"

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "household_power_consumption.zip", method = "curl")

unzip("household_power_consumption.zip")

# Read the entire data set
powerdata <- read.table("household_power_consumption.txt", 
                        sep = ";", header = T,
                        colClasses = "character")

# Select only the data from 01-02 February 2007
powerdata <- subset(powerdata, Date == "1/2/2007" | 
                      Date == "2/2/2007")

write.table(powerdata, file = "filtered_data.txt", sep="\t")
