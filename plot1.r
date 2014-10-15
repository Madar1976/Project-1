# Part 1. Reading in data and converting some variables

setwd("D:/")
setwd("D:/Coursera")

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
# Part 2. Plotting Histogram of "Global Active Power (kilowatts)"
  
  # Global_active_power is factor, so I convert it to numeric first
                                                  
data2$Global_active_power2<-as.numeric(as.character(data2$Global_active_power))

hist(data2$Global_active_power2,col="red",main="Global Active Power",
                 xlab="Global Active Power (kilowatts)") 

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

***********************************************************************************

 




