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

##PLOT3
#As before,We set the days so the data is shown as days of the week:
format(finaldata$day, format="%a")

# We create the graph of frequency of energy sub metering 1 vs days of the week.
plot(x=finaldata$day, y=finaldata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

#Now, we have to add sub_metering_2 and sub_metering_3, so we use the command lines():
lines(x=finaldata$day, y=finaldata$Sub_metering_2, type="l", col="red")
lines(x=finaldata$day, y=finaldata$Sub_metering_3, type="l", col="blue")

# We have to add the legend:
legend("topright", lty=c(1,1,1), lwd=c(1.5,1.5, 1.5), col=c("black", "blue", "red"), legend=c("Sub metering_1", "Sub metering_2", "Sub metering_3"))

# Finally, We save the file in a png as plot3.png:
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()