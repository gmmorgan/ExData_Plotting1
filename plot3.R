# common routine to load the data
source("load_data.R")

png(filename="plot3.png", width=480, height=480, bg="transparent")

plot(ss$Sub_metering_1, type="l", col="black", xaxt="n", 
     xlab="", ylab="Energy sub metering")
points(ss$Sub_metering_2, type="l", col="red")
points(ss$Sub_metering_3, type="l", col="blue")


#trying to make this more general
# could just have done: labels=c("Thu", "Fri", "Sat")
labels = strftime(seq(as.Date(ss$dt[1]), by=1, length=3), "%a")
# tick every day = 24 hours/day * 60 seconds/minute
ticks = seq(from=1, by=24*60, length=3)
axis(side=1, at=ticks, lab=labels)

# probably a better way of doing this
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

dev.off()

