epcAll=read.table('household_power_consumption.txt',header=TRUE,sep=";", as.is=TRUE)
epc = subset(epcAll, epcAll$Date=="1/2/2007" | epcAll$Date=="2/2/2007")
epc$Sub_metering_1 = as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 = as.numeric(epc$Sub_metering_2)

Sys.setlocale(category = "LC_TIME", locale = "C")
epc$Date.Time = strptime(paste(epc$Date, epc$Time), format='%d/%m/%Y %H:%M:%S')

png(filename = "plot3.png")
plot(epc$Date.Time, epc$Sub_metering_1, 
     type="l", 
     xlab="", ylab="Energy sub metering")
lines(epc$Date.Time, epc$Sub_metering_2, 
      type="l", col="red")
lines(epc$Date.Time, epc$Sub_metering_3, 
      type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
