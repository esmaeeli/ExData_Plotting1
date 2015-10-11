#Read all of the data from the file
data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Select data for two required dates
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#Correct format of Time column
data$Time=paste(data$Date,data$Time)
data$Time=strptime(data$Time,format = "%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480,height = 480) #create png file (Graphics Device)
#make plot, use line instead of point
plot(data$Time, data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off() # close png file