#Read all of the data from the file
data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Select data for two required dates
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

png("plot1.png",width = 480,height = 480) #create png file (Graphics Device)
#Make histogram plot
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col = "red")
dev.off() #close png file