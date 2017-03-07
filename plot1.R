## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2007-02-01 to 2007-02-02
## 3. generate a histogram of global active power(kilowatts)
## Assumes household_power_consumption.txt file is located in the working directory

## read data
powerconsumption <- read.table("/Users/khadija/Desktop/ Exploratory Data Analysis/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")

## Subsetting the data
subsetPower<- subset(powerconsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(subsetPower$Date), subsetPower$Time)
subsetPower$Datetime <- as.POSIXct(datetime)

#calling the basic plot function
hist((as.numeric(as.character(subsetPower$Global_active_power))),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

