## Create Plot 2: Global Active Power vs time

library(data.table)
rawdat<-fread("household_power_consumption.txt", header=TRUE,sep=";")[Date=="1/2/2007"|Date=="2/2/2007",]
dat<-as.data.frame(rawdat)
dat$Time<-paste(dat$Date, dat$Time)
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")
dat$Time<-strptime(dat$Time, format="%d/%m/%Y %H:%M:%S")
dat[,3:8]<-lapply(dat[,3:8],as.numeric)

png("plot2.png", width=480, height=480, units="px")
plot(dat$Time, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
