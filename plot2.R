# plot2.R
#
# Purpose:  Plots global active power over 01-02
# February 2007 and saves the plot to "plot2.png".  The dataset
# used is a subset of the "individual household electric power
# consumption data set" provided by the course and is prepared by
# the script "prepdata.R".  The plot is saved to the current 
# working directory.
#
# Assumption: "prepdata.R" has already been run and
# "filtered_data.txt" exists in the current working directory.

# Open the power consumption data subset
plotdata <- read.table("filtered_data.txt",sep="\t",
                       colClasses = "character")

# Convert data-time to POSIX format
plotdata$Date <- strptime(paste(plotdata$Date,plotdata$Time), 
                          "%d/%m/%Y %H:%M:%S")

# Change the data from character to numeric
plotdata$Global_active_power <- 
  as.numeric(plotdata$Global_active_power)

# Create the png file
png(filename = 'plot2.png', width = 480, height = 480, 
    units = 'px')

# Create the plot
plot(plotdata$Date,plotdata$Global_active_power,
     type ="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()