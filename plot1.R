# plot1.R
#
# Purpose:  Plots a histogram of global active power on 01-02
# February 2007 and saves the plot to "plot1.png".  The dataset
# used is a subset of the "individual household electric power
# consumption data set" provided by the course and is prepared by
# the script "prepdata.R".  The histogram is saved to the current 
# working directory.
#
# Assumption: "prepdata.R" has already been run and
# "filtered_data.txt" exists in the current working directory.

# Open the power consumption data subset
plotdata <- read.table("filtered_data.txt",sep="\t",
                       colClasses = "character")

# Change the data from character to numeric
plotdata$Global_active_power <- 
  as.numeric(plotdata$Global_active_power)

# Create the png file
png(filename = 'plot1.png', width = 480, height = 480, 
    units = 'px')

# Create the histogram
hist(plotdata$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()