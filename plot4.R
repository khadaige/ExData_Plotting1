## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
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

#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetPower, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red', type = "l")
        lines(Sub_metering_3~Datetime,col='Blue', type = "l")
        legend("topright",  col=c("black", "red", "blue"), lty=2, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Reactive Power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
