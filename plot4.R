#Read all of the data from the file
data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Select data for two required dates
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#Correct format of Time column
data$Time=paste(data$Date,data$Time)
data$Time=strptime(data$Time,format = "%d/%m/%Y %H:%M:%S")

png("plot4.png",width = 480,height = 480) #create png file (Graphics Device)
#Create 2*2 places for plot (two rows and two columns)
par(mfrow = c(2,2))
#Make the first plot in first place
plot(data$Time, data$Global_active_power,type="l",ylab = "Global Active Power",xlab = "")
#Make the second plot in second place
with(data,plot(Time, Voltage,type="l",xlab = "datetime"))
#Make the third plot in third place
plot(data$Time, data$Sub_metering_1 ,type="l",ylab = "Energy sub metering",xlab = "")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
# Add legend to the third plot. it does not have border
legend("topright",bty="n", lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Make the fourth plot in fouth place
with(data,plot(Time, Global_reactive_power,type="l",xlab = "datetime"))
dev.off() #close the png file