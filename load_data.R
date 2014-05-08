# first row contains the column headings
# nrow is a hack to speed things up as we don't need all the data
data = read.table("household_power_consumption.txt", sep=';', header=TRUE, colClasses=c("character","character",rep("numeric",7)), na.strings='?', nrow=200000)

# now get a subset of the data for 1.2.2007 and 2/2/2007
# when you have a problem and solve it with regular expressions, you now have two problems
# allowed for the possibility of leading zeros
ss=subset(data, regexpr("^0?(1|2)/0?2/2007", data$Date)>0)

# manufacture a datetime column in the data
ss$dt = strptime(paste(ss$Date,ss$Time), format="%d/%m/%Y %H:%M:%S")



