## Create Plot 4: Four plots

library(data.table)
rawdat<-fread("household_power_consumption.txt", header=TRUE,sep=";")[Date=="1/2/2007"|Date=="2/2/2007",]
dat<-as.data.frame(rawdat)
dat$Time<-paste(dat$Date, dat$Time)
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")
dat$Time<-strptime(dat$Time, format="%d/%m/%Y %H:%M:%S")
dat[,3:8]<-lapply(dat[,3:8],as.numeric)

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
with(dat,{
      plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") # plot 1
      
      plot(Time, Voltage, type="l", xlab="datetime") # plot 2
      
      plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") # plot 3
      points(Time, Sub_metering_2, type="l",col="red")
      points(Time, Sub_metering_3, type="l",col="blue")
      legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      
      plot(Time, Global_reactive_power, type="l", xlab="datetime")
      
})

dev.off()
