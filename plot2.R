# The code below reads in the data and subsets for the two days of interest

HouseholdPowerData <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";")
SelectedHouseholdPowerData <- HouseholdPowerData[(HouseholdPowerData$Date=="1/2/2007" | HouseholdPowerData$Date=="2/2/2007"),]

# This code constructs Plot 2, a time-series plot of Global Active Power readings across 1-2 February 2007

SelectedHouseholdPowerData <- HouseholdPowerData[(HouseholdPowerData$Date=="1/2/2007" | HouseholdPowerData$Date=="2/2/2007"),]
bars <- as.vector(SelectedHouseholdPowerData[,3])
bars <- as.numeric(bars)

png(file="plot2.png")
plot2 <- plot(bars, type="l",xaxt='n',ann=FALSE)
axis(side=1,at=c(1,length(bars)/2,length(bars)),labels=c("Thu","Fri","Sat"))
mtext(side=2,text="Global Active Power (kilowatts)",line=2.5)
dev.off()