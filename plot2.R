epcAll=read.table('household_power_consumption.txt',header=TRUE,sep=";", as.is=TRUE)
epc = subset(epcAll, epcAll$Date=="1/2/2007" | epcAll$Date=="2/2/2007")

Sys.setlocale(category = "LC_TIME", locale = "C")
epc$Date.Time = strptime(paste(epc$Date, epc$Time), format='%d/%m/%Y %H:%M:%S')

png(filename = "plot2.png")
plot(epc$Date.Time, epc$Global_active_power, 
     type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()