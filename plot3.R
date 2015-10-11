#Read all of the data from the file
data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Select data for two required dates
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#Correct format of Time column
data$Time=paste(data$Date,data$Time)
data$Time=strptime(data$Time,format = "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480,height = 480) #create png file (Graphics Device)
#Make plot + Sub_metering_1
plot(data$Time, data$Sub_metering_1 ,type="l",ylab = "Energy sub metering",xlab = "")
#Add Sub_metering_2 to the plot
lines(data$Time,data$Sub_metering_2,col="red")
#Add Sub_metering_3 to the plot
lines(data$Time,data$Sub_metering_3,col="blue")
#Add legend to the plot
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() #close png file