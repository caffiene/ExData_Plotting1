# plot3.R
#
# Purpose:  Plots energy sub-metering 1, 2, and 3 over 01-02
# February 2007 and saves the plot to "plot3.png".  The dataset
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
plotdata$Sub_metering_1 <- as.numeric(plotdata$Sub_metering_1)
plotdata$Sub_metering_2 <- as.numeric(plotdata$Sub_metering_2)
plotdata$Sub_metering_3 <- as.numeric(plotdata$Sub_metering_3)

# Create the png file
png(filename = 'plot3.png', width = 480, height = 480, 
    units = 'px')

# Create the plot
plot(plotdata$Date,plotdata$Sub_metering_1,
     type ="l",
     ylab="Energy sub metering",
     xlab="")

points(plotdata$Date,plotdata$Sub_metering_2,
       type="l",
       col="red")

points(plotdata$Date,plotdata$Sub_metering_3,
       type="l",
       col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), lwd = c(1,1,1),
       col = c("black","red","blue"))

dev.off()