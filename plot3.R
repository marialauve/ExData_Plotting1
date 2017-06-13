# Course 4, Week 1
# Peer-graded Assignment: Course Project 1

# Note: in order to run this program, the data described below must be
# saved to your working directory.

# Dataset: Electric Power Consumption

# Description: Measurements of electric power consumption in one household
# with a one-minute sampling rate over a period of almost 4 years. Different
# electrical quantities and some sub-metering values are available.

# The contents of the data are further described here:
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

# Loading the data
datain <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Keep data from 2017-02-01 and 2017-02-02 only.
powerdata <- datain[datain$Date=="1/2/2007" | datain$Date=="2/2/2007",]

# Convert the Date and Time variables to Date/Time classes using strptime() and as.Date() functions.
datetime_tmp <- paste(powerdata$Date, powerdata$Time)
datetime <- strptime(datetime_tmp,"%d/%m/%Y %H:%M:%S")
powerdata2 <- data.frame(powerdata,datetime)

# plot3.png : line graphs of sub metering v. Date/Time for Sub-meters 1, 2, 3
with(powerdata2, plot(datetime, Sub_metering_1, type="o", pch=NA_integer_, ylab="Energy sub metering"))
with(powerdata2, points(datetime, Sub_metering_2, type="o", pch=NA_integer_, col="red"))
with(powerdata2, points(datetime, Sub_metering_3, type="o", pch=NA_integer_, col="blue"))
legend("topright", legend=c("Sub_metering_1",
    "Sub_metering_2", "Sub_metering_3"), col=c("black","blue","red"), lty=c(1,1,1))
dev.copy(png, file="plot3.png")
dev.off()