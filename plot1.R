epcAll=read.table('household_power_consumption.txt',header=TRUE,sep=";", as.is=TRUE)
epc = subset(epcAll, epcAll$Date=="1/2/2007" | epcAll$Date=="2/2/2007")

png(filename = "plot1.png")
hist(as.numeric(epc$Global_active_power),
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)")
dev.off()