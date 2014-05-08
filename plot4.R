# common routine to load the data
source("load_data.R")

png(filename="plot4.png", width=480, height=480, bg="transparent")
# two rows, two columns, fill by row
par(mfrow=c(2,2))

#trying to make this more general
# could just have done: labels=c("Thu", "Fri", "Sat")
labels = strftime(seq(as.Date(ss$dt[1]), by=1, length=3), "%a")
# tick every day = 24 hours/day * 60 seconds/minute
ticks = seq(from=1, by=24*60, length=3)

#common background
background = "transparent"
#plot1
plot(ss$Global_active_power, xlab="", 
     ylab="Global Active Power", type='l', xaxt="n")
axis(side=1, at=ticks, lab=labels)

#plot2
plot(ss$Voltage, type="l", col="black", 
     xlab="datetime", ylab="Voltage", xaxt="n")
axis(side=1, at=ticks, lab=labels)

#plot3
plot(ss$Sub_metering_1, type="l", col="black", 
     xaxt="n", xlab="", ylab="Energy sub metering")
points(ss$Sub_metering_2, type="l", col="red")
points(ss$Sub_metering_3, type="l", col="blue")
axis(side=1, at=ticks, lab=labels)
# no border around legend: bty="n"
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")

#plot4
plot(ss$Global_reactive_power, type="l", col="black", bg=background,
     xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(side=1, at=ticks, lab=labels)

dev.off()

# common routine to load the data
source("load_data.R")

png(filename="plot2.png", width=480, height=480)

plot(ss$Global_active_power, bg="transparent",
     xlab="", ylab="Global Active Power (kilowatts)", 
     type='l', xaxt="n")

#trying to make this more general
# could just have done: labels=c("Thu", "Fri", "Sat")
labels = strftime(seq(as.Date(ss$dt[1]), by=1, length=3), "%a")
# tick every day = 24 hours/day * 60 seconds/minute
ticks = seq(from=1, by=24*60, length=3)
axis(side=1, at=ticks, lab=labels)

dev.off()

