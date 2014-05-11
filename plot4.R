allData <- read.csv("household_power_consumption.txt", 
                    header=TRUE,sep=";",na.strings = "?")
# convert the datatypes
allData$Time = strptime(paste(allData$Date,allData$Time),format="%d/%m/%Y %H:%M:%S")
allData$Date = as.Date(allData$Date,format='%d/%m/%Y')

#subset 2 days data
Feb1Data <- subset(allData,allData$Date >= as.Date('01/02/2007',format='%d/%m/%Y')
                   & allData$Date <= as.Date('02/02/2007',format='%d/%m/%Y'))
#create 4 plots
par(mfrow=c(2,2))
#plot 1
plot(Feb1Data$Time, Feb1Data$Global_active_power,type='l',ylab="Global Active Power",xlab="")
#plot 2
plot(Feb1Data$Time,Feb1Data$Voltage,type='l',ylab='Voltage',xlab='datetime')
# plot 3
plot(Feb1Data$Time,Feb1Data$Sub_metering_1, type='n',ylab="Energy sub metering",xlab="")
with(Feb1Data,lines(Time,Sub_metering_1, type='l',col = 'black'))
with(Feb1Data,lines(Time,Sub_metering_2, type='l',col = 'red'))
with(Feb1Data,lines(Time,Sub_metering_3, type='l',col = 'blue'))
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.3, pch=1, pt.cex = 1)

# plot 4
plot(Feb1Data$Time, Feb1Data$Global_reactive_power,type='l',xlab="datetime",ylab='Global_reactive_power')

dev.copy(png,'Plot4.png')
dev.off()