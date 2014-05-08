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

