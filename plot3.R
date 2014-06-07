## Create Plot 3: Sub metering vs time

library(data.table)
rawdat<-fread("household_power_consumption.txt", header=TRUE,sep=";")[Date=="1/2/2007"|Date=="2/2/2007",]
dat<-as.data.frame(rawdat)
dat$Time<-paste(dat$Date, dat$Time)
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")
dat$Time<-strptime(dat$Time, format="%d/%m/%Y %H:%M:%S")
dat[,3:8]<-lapply(dat[,3:8],as.numeric)

png("plot3.png", width=480, height=480, units="px")
with(dat, plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(dat, points(Time, Sub_metering_2, type="l",col="red"))
with(dat, points(Time, Sub_metering_3, type="l",col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
