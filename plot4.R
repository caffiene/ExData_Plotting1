# plot4.R
#
# Purpose:  Creates four plots showing data over over 01-02
# February 2007 and saves the plots to "plot4.png".  The plots are
#  - global active power
#  - voltage
#  - energy sub-metering 1, 2, and 3
#  - global reactive power
#The dataset used is a subset of the "individual household 
# electric power consumption data set" provided by the course and 
# is prepared by the script "prepdata.R".  The plot is saved to the
# current working directory.
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

plotdata$Global_reactive_power <- 
  as.numeric(plotdata$Global_reactive_power)

plotdata$Voltage <- 
  as.numeric(plotdata$Voltage)

plotdata$Sub_metering_1 <- as.numeric(plotdata$Sub_metering_1)
plotdata$Sub_metering_2 <- as.numeric(plotdata$Sub_metering_2)
plotdata$Sub_metering_3 <- as.numeric(plotdata$Sub_metering_3)

# Create the png file
png(filename = 'plot4.png', width = 480, height = 480, 
    units = 'px')

# 2 x 2 array of plots
par(mfrow = c(2,2))

# Create the global active power plot
plot(plotdata$Date,plotdata$Global_active_power,
     type ="l",
     ylab="Global Active Power",
     xlab="")

# Create the voltage plot
plot(plotdata$Date,plotdata$Voltage,
     type ="l",
     ylab="Voltage",
     xlab="datetime")

# Create the energy sub-metering 1, 2, and 3 plot
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
       col = c("black","red","blue"),
       cex = 0.9,
       box.lwd = 0)

# Create the global reactive power plot
plot(plotdata$Date,plotdata$Global_reactive_power,
     type ="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()