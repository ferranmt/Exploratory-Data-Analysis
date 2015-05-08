#First, we set the working directory where we have the file saved:
setwd("C:/Users/ftorrent/Desktop/Data Science Track1/Coursera/Exploratory Data Analysis/Assignment 1")

#We load the data in a data.frame. We have to make sure that there is a header
#(names of the colums), that it gets separated by ; and that the ? values are reported as missing values.
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",  na.strings="?")

#We convert the time and hour data to datetime style. We save the result in another dataframe:
times<-NULL
times<-cbind(day=strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S"), data[,3:9])

#Now, we take the rows that we need (from 1/2/2007 to 2/2/2007):
finaldata <- subset(times, day >= "2007-02-01" & day < "2007-02-03")

##PLOT 1

#First, we generate the histogram of frecuency from the variable Global_active_power:
hist(finaldata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency", freq=TRUE)

#Finally, we save the histogram in a png file:
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()