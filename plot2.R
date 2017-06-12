#getwd(Step 1
#set working directory to the location where the UCI HAR Dataset was unzipped
setwd('C:/Users/mural/Documents/DataScience/');

## Read full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      +                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"');
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Read subset of the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting date fields
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="");

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()