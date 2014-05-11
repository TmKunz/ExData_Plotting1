epcAll=read.table('household_power_consumption.txt',header=TRUE,sep=";", as.is=TRUE)
epc = subset(epcAll, epcAll$Date=="1/2/2007" | epcAll$Date=="2/2/2007")
epc$Sub_metering_1 = as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 = as.numeric(epc$Sub_metering_2)
epc$Voltage = as.numeric(epc$Voltage)

Sys.setlocale(category = "LC_TIME", locale = "C")
epc$Date.Time = strptime(paste(epc$Date, epc$Time), format='%d/%m/%Y %H:%M:%S')

png(filename = "plot4.png")
par(mfrow = c(2,2))
with(epc, {
  plot(Date.Time, Global_active_power, type="l", 
       xlab="", ylab="Global Active Power")
  plot(Date.Time, Voltage, type="l", 
       xlab="datetime", ylab="Voltage")
  plot(Date.Time, Sub_metering_1, 
       type="l", 
       xlab="", ylab="Energy sub metering")
    lines(Date.Time, Sub_metering_2, 
          type="l", col="red")
    lines(Date.Time, Sub_metering_3, 
          type="l", col="blue")
    legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Date.Time, Global_reactive_power, type="l", xlab="datetime")  
})
dev.off()