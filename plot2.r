# Part 1. Reading in data and converting some variables

setwd("D:/")

# I downloaded data from coursera web page and saved it in my working directory
# below commands reads the  data and assigns it a name "data1"

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
  # Part 2. Plot of weekdays vs Global Active Power (kilowatts)
  
  # first I create weekdays variable corresponding to Date
  
  data2$weekday <-strptime(paste(data2$Date, data2$Time), "%d/%m/%Y%H:%M:%S")

# Global_active_power is factor, so I convert it to numeric first

data2$Global_active_power2<-as.numeric(as.character(data2$Global_active_power))
plot(data2$weekday,data2$Global_active_power2,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(data2$weekday,data2$Global_active_power2,type="l")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
***********************************************************************************
  
 