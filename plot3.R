# The code below reads in the data and subsets for the two days of interest

HouseholdPowerData <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";")
SelectedHouseholdPowerData <- HouseholdPowerData[(HouseholdPowerData$Date=="1/2/2007" | HouseholdPowerData$Date=="2/2/2007"),]

# This code constructs Plot 3

Sub_metering_1 <- as.vector(SelectedHouseholdPowerData[,7])
Sub_metering_1 <- as.numeric(Sub_metering_1)

Sub_metering_2 <- as.vector(SelectedHouseholdPowerData[,8])
Sub_metering_2 <- as.numeric(Sub_metering_2)

Sub_metering_3 <- as.vector(SelectedHouseholdPowerData[,9])
Sub_metering_3 <- as.numeric(Sub_metering_3)

png(file="plot3.png")
plot3 <- plot(Sub_metering_1, type="l",xaxt='n',ann=FALSE)
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
axis(side=1,at=c(1,length(Sub_metering_1)/2,length(Sub_metering_1)),labels=c("Thu","Fri","Sat"))
mtext(side=2,text="Energy sub metering",line=2.5)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1,1)
       ,lwd=c(2.5,2.5,2.5)
       ,col=c("black","red","blue")
)
dev.off()