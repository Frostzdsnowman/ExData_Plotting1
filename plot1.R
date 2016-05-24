# The code below reads in the data and subsets for the two days of interest

HouseholdPowerData <- read.csv2("household_power_consumption.txt", header = TRUE, sep = ";")
SelectedHouseholdPowerData <- HouseholdPowerData[(HouseholdPowerData$Date=="1/2/2007" | HouseholdPowerData$Date=="2/2/2007"),]

# This code constructs Plot 1, a histogram of Global Active Power readings across 1-2 February 2007

bars <- as.vector(SelectedHouseholdPowerData[,3])
bars <- as.numeric(bars)

png(file="plot1.png")
hist(bars, main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")
dev.off()
