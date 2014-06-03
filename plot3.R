##
## Exploratory Data Analysis Class Project 1
## plot3
#
# read the data from the file 
# note: copy the "household_power_consumptioin.txt" file to working directory
#
map<-read.table("household_power_consumption.txt",header=T,sep=";")
head(map)

#
# create datetime field with Date and Time
#
map$datetime <- strptime( paste(as.character(map$Date),as.character(map$Time)), "%d/%m/%Y %H:%M:%S")

#
# get the subset of the data for Feb 01, 2007 and Feb 02, 2007
#
map2 <- subset(map,as.Date(as.character(map$Date), "%d/%m/%Y") %in% as.Date(as.character(c("2007-02-01","2007-02-02"))))

#
# convert all the numeric fields into numerics
#
map2$Global_active_power = as.numeric(as.character(map2$Global_active_power))
map2$Global_reactive_power = as.numeric(as.character(map2$Global_reactive_power))
map2$Voltage = as.numeric(as.character(map2$Voltage))
map2$Sub_metering_1 = as.numeric(as.character(map2$Sub_metering_1))
map2$Sub_metering_2 = as.numeric(as.character(map2$Sub_metering_2))
map2$Sub_metering_3 = as.numeric(as.character(map2$Sub_metering_3))

#
# set the graphics device to png file
# set the graphics device for 1 plot
# plot the data
# set the device back to screen
#
png(file="plot3.png")
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(map2$datetime,map2$Sub_metering_1,type="l", col = "black", xlab = "", ylab = "Energy sub metering")
points(map2$datetime,map2$Sub_metering_2, type="l", col = "red")
points(map2$datetime,map2$Sub_metering_3, type="l", col = "blue")
legend("topright", pch = 151, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()





