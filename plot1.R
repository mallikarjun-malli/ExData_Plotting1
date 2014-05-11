# read complete data from the text file
allData <- read.csv("household_power_consumption.txt", 
                    header=TRUE,sep=";",na.strings = "?")
# convert the datatypes
allData$Time = strptime(paste(allData$Date,allData$Time),format="%d/%m/%Y %H:%M:%S")
allData$Date = as.Date(allData$Date,format='%d/%m/%Y')

#subset 2 days data
Feb1Data <- subset(allData,allData$Date >= as.Date('01/02/2007',format='%d/%m/%Y')
                   & allData$Date <= as.Date('02/02/2007',format='%d/%m/%Y'))
#plot the Histogram
hist(Feb1Data$Global_active_power,main="Global Active Power",
				xlab="Global Active Power (Kilowatts)",col="red")
#export the plot to PNG
dev.copy(png,'Plot1.png')
dev.off()