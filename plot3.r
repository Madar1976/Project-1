# Part 1. Reading in data and converting some variables

setwd("D:/")

# I downloaded data from coursera web page and saved it in my working directory
# below command reads the  data and assigns it a name "data1"

data1<-read.table("household_power_consumption.txt",sep=";",header=T)

# I check below the number of observations and structure of variables

nrow(data1)
str(data1)

# according to instructions, we only need data from 2007-02-01 to 2007-02-02
# variable "Date" is read into R as "factor", therefore, I do the following:
# first I convert "Date" from factor to date format, and then subset the part of data
# that I need

data1$Date1<-as.Date(data1$Date,"%d/%m/%Y")

data2<-subset(data1,Date1==as.Date("2007-02-01") | Date1==as.Date("2007-02-02"))

***********************************************************************************
  # Part 3. Plot of weekdays vs sub metering
  
  # first I create weekdays variable corresponding to Date
  
  data2$weekday <-strptime(paste(data2$Date, data2$Time), "%d/%m/%Y%H:%M:%S")

# Submetering 1 and 2 are factors. Therefore, I convert them to numeric

data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))

plot(data2$weekday,data2$Sub_metering_1,type="n",xlab="",
       ylab="Energy sub metering")
lines(data2$weekday,data2$Sub_metering_1,type="l")
lines(data2$weekday,data2$Sub_metering_2,type="l",col="red")
lines(data2$weekday,data2$Sub_metering_3,type="l",col="blue")

legend("topright",pch="-",col=c("black","red","blue"),
      legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),ncol=1.2,cex=0.8)

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
***********************************************************************************
  
  
 