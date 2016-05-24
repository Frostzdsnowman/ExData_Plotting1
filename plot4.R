
# The code below reads in the data and subsets for the two days of interest

HouseholdPowerData <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";")
SelectedHouseholdPowerData <- HouseholdPowerData[(HouseholdPowerData$Date=="1/2/2007" | HouseholdPowerData$Date=="2/2/2007"),]

# Code used to prepare plot 2 (top left of panel)

bars <- as.vector(SelectedHouseholdPowerData[,3])
bars <- as.numeric(bars)

# Code used to prepare plot 3 (bottom left of panel)

Sub_metering_1 <- as.vector(SelectedHouseholdPowerData[,7])
Sub_metering_1 <- as.numeric(Sub_metering_1)

Sub_metering_2 <- as.vector(SelectedHouseholdPowerData[,8])
Sub_metering_2 <- as.numeric(Sub_metering_2)

Sub_metering_3 <- as.vector(SelectedHouseholdPowerData[,9])
Sub_metering_3 <- as.numeric(Sub_metering_3)

# Code used to prepare plot in top right of panel

Voltage <- as.vector(SelectedHouseholdPowerData[,5])
Voltage <- as.numeric(Voltage)

# Code used to prepare plot in bottom right of panel

ReactPower <- as.vector(SelectedHouseholdPowerData[,4])
ReactPower <- as.numeric(ReactPower)

# Code below sets the graphic device and format

png(file="plot4.png")

par(mfrow=c(2,2))

# Panel 1 - topleft

plot(bars, type="l",xaxt='n',ann=FALSE)
axis(side=1,at=c(1,length(bars)/2,length(bars)),labels=c("Thu","Fri","Sat"),cex=0.8)
mtext(side=2,text="Global Active Power",line=2.5,cex=0.8)

# Panel 2 - topright

plot(Voltage, type="l",xaxt='n',ann=FALSE,yaxt='n')
axis(side=1,at=c(1,length(Voltage)/2,length(Voltage)),labels=c("Thu","Fri","Sat"))
mtext(side=1,text="datetime",line=2.5,cex=0.8)
axis(side=2,at=c(234,236,238,240,242,244,246),labels=c("234","","238","","242","","246"))
mtext(side=2,text="Voltage",line=2.5,cex=0.8)

# Panel 3 - bottomleft

plot(Sub_metering_1, type="l",xaxt='n',ann=FALSE)
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
axis(side=1,at=c(1,length(Sub_metering_1)/2,length(Sub_metering_1)),labels=c("Thu","Fri","Sat"),cex=0.8)
mtext(side=2,text="Energy sub metering",line=2.5,cex=0.8)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,bty="n"
       ,lty=c(1,1,1)
       ,lwd=c(2.5,2.5,2.5)
       ,col=c("black","red","blue")
       ,cex=0.8
    
)

# Panel 4 - bottomright

plot(ReactPower, type="l",xaxt='n',ann=FALSE,yaxt='n')
axis(side=1,at=c(1,length(ReactPower)/2,length(ReactPower)),labels=c("Thu","Fri","Sat"),cex=0.8)
mtext(side=1,text="datetime",line=2.5,cex=0.8)
axis(side=2,at=seq(0,0.5,0.1),labels=c("0.0","0.1","0.2","0.3","0.4","0.5"),cex=0.8)
mtext(side=2,text="Global_reactive_power",line=2.5,cex=0.8)

dev.off()





