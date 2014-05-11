allData <- read.csv("household_power_consumption.txt", 
                    header=TRUE,sep=";",na.strings = "?")
# convert the datatypes
allData$Time = strptime(paste(allData$Date,allData$Time),format="%d/%m/%Y %H:%M:%S")
allData$Date = as.Date(allData$Date,format='%d/%m/%Y')

#subset 2 days data
Feb1Data <- subset(allData,allData$Date >= as.Date('01/02/2007',format='%d/%m/%Y')
                   & allData$Date <= as.Date('02/02/2007',format='%d/%m/%Y'))

plot(Feb1Data$Time, Feb1Data$Global_active_power,type='l',ylab="Global Active Power (Kilowatts)",xlab="")

dev.copy(png,'Plot2.png')
dev.off()